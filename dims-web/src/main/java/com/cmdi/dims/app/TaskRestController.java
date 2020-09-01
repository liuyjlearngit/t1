package com.cmdi.dims.app;

import java.io.ByteArrayOutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import com.cmdi.dims.app.dto.ResponseDto;
import com.cmdi.dims.common.util.DateFormatUtil;
import com.cmdi.dims.common.util.ExcelUtil;
import com.cmdi.dims.common.util.UrlUtil;
import com.cmdi.dims.task.TaskStatusEnum;
import com.cmdi.dims.task.serivce.TaskService;
import com.cmdi.dims.util.TaskResultExportUtil;
import org.apache.commons.compress.archivers.ArchiveOutputStream;
import org.apache.commons.compress.archivers.ArchiveStreamFactory;
import org.apache.commons.compress.archivers.zip.ZipArchiveEntry;
import org.apache.commons.lang.BooleanUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.slf4j.Slf4j;
import com.cmdi.dims.task.entity.Task;
import com.cmdi.dims.task.entity.TaskItemBusiness;
import com.cmdi.dims.task.entity.TaskItemFile;
import com.cmdi.dims.task.entity.TaskItemIndex;
import com.cmdi.dims.task.entity.TaskLatest;
import com.cmdi.dims.task.repository.TaskItemBusinessRepository;
import com.cmdi.dims.task.repository.TaskItemFileRepository;
import com.cmdi.dims.task.repository.TaskItemIndexRepository;
import com.cmdi.dims.task.repository.TaskLatestRepository;
import com.cmdi.dims.task.repository.TaskRepository;

@Slf4j
@RestController
@RequestMapping("/app/v1/task")
public class TaskRestController {

    @Autowired
    TaskRepository taskRepository;
    @Autowired
    TaskItemFileRepository taskItemFileRepository;
    @Autowired
    TaskItemBusinessRepository taskItemBusinessRepository;
    @Autowired
    TaskItemIndexRepository taskItemIndexRepository;
    @Autowired
    TaskService taskService;
    @Autowired
    TaskLatestRepository taskLatestRepository;

    @GetMapping()
    public ResponseDto<List<Task>> tasks(
            @RequestParam(value = "name") String name,
            @RequestParam(value = "latest") Boolean latest,
            @RequestParam(value = "status") Integer status,
            @RequestParam(value = "start", defaultValue = "0") Integer start,
            @RequestParam(value = "limit", defaultValue = "50") Integer limit
    ) {
        Integer size = null != limit ? limit : 50;
        Integer page = null != start ? start / size : 0;

        Page<Task> taskPage = taskRepository.findAll((Root<Task> root, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) -> {
            List<Predicate> predicates = new ArrayList<>();
            if (BooleanUtils.isTrue(latest)) {
                List<TaskLatest> taskLatests = taskLatestRepository.findAll();
                List<String> codes = taskLatests.stream().map(TaskLatest::getTaskCode).collect(Collectors.toList());
                predicates.add(root.get("code").in(codes));
            }
            if (org.apache.commons.lang3.StringUtils.isNotEmpty(name)) {
                predicates.add(criteriaBuilder.like(root.get("name"), "%" + name + "%"));
            }
            if (null != status) {
                predicates.add(criteriaBuilder.equal(root.get("status"), status));
            }
            return criteriaBuilder.and(predicates.toArray(new Predicate[0]));
        }, PageRequest.of(page, size, Sort.Direction.DESC, "taskId"));

        return ResponseDto.success(taskPage.getContent(), taskPage.getTotalElements(), taskPage.getNumberOfElements());
    }

    @GetMapping("/latest/{size}")
    public ResponseDto<List<Task>> latest(
            @PathVariable("size") Integer size
    ) {
        List<Task> tasks = taskRepository.findByStatusOrderByTaskIdDesc(TaskStatusEnum.successStatus().getValue(), PageRequest.of(0, size));
        return ResponseDto.success(tasks, Long.valueOf(tasks.size()), tasks.size());
    }

    @GetMapping(value = "/{taskId}/result/export", produces = "application/vnd.ms-excel")
    public ResponseEntity<byte[]> dataExport(
            @PathVariable("taskId") Long taskId
    ) {
        byte[] result = null;
        String filename = null;
        try {
            Task task = taskRepository.findById(taskId)
                    .orElseThrow(() -> new IllegalArgumentException("任务ID=" + taskId + "不存在"));
            List<TaskItemFile> taskItemFiles = taskItemFileRepository.findByTaskCodeOrderByTaskItemFileId(task.getCode());
            List<TaskItemBusiness> taskItemBusinesses = taskItemBusinessRepository.findByTaskCodeOrderByTaskItemBusinessIdAsc(task.getCode());
            List<TaskItemIndex> taskItemIndices = taskItemIndexRepository.findByTaskCodeOrderByTaskItemIndexId(task.getCode());
            Workbook workbook = TaskResultExportUtil.export(taskItemFiles, taskItemBusinesses, taskItemIndices);
            ByteArrayOutputStream os = new ByteArrayOutputStream();
            workbook.write(os);
            result = os.toByteArray();
            filename = task.getName() + "-核查结果-" + DateFormatUtil.toDatatimeNumberString(new Date()) + "." + ExcelUtil.XLSX;
        } catch (Exception e) {
            log.error(e.getMessage(), e);
            result = String.valueOf("导出报错！" + e.getMessage()).getBytes();
            filename = "导出错误.txt";
        }
        return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + UrlUtil.urlEncode(filename) + "\"")
                .body(result);
    }

    @GetMapping(value = "/result/export", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
    public ResponseEntity<byte[]> dataExport(
            @RequestParam("taskIds") String taskIds
    ) {
        byte[] result = null;
        String filename = null;
        try {
            String[] taskIdArray = StringUtils.split(taskIds, ",");

            try (ByteArrayOutputStream os = new ByteArrayOutputStream();
                 ArchiveOutputStream zipOs = new ArchiveStreamFactory().createArchiveOutputStream(ArchiveStreamFactory.ZIP, os);
            ) {
                for (String taskIdStr : taskIdArray) {
                    Long taskId = Long.valueOf(taskIdStr);
                    Task task = taskRepository.findById(taskId)
                            .orElseThrow(() -> new IllegalArgumentException("任务ID=" + taskId + "不存在"));
                    List<TaskItemFile> taskItemFiles = taskItemFileRepository.findByTaskCodeOrderByTaskItemFileId(task.getCode());
                    List<TaskItemBusiness> taskItemBusinesses = taskItemBusinessRepository.findByTaskCodeOrderByTaskItemBusinessIdAsc(task.getCode());
                    List<TaskItemIndex> taskItemIndices = taskItemIndexRepository.findByTaskCodeOrderByTaskItemIndexId(task.getCode());
                    zipOs.putArchiveEntry(new ZipArchiveEntry(task.getName() + "-核查结果." + ExcelUtil.XLSX));
                    try (ByteArrayOutputStream wos = new ByteArrayOutputStream();
                         Workbook workbook = TaskResultExportUtil.export(taskItemFiles, taskItemBusinesses, taskItemIndices)) {
                        workbook.write(wos);
                        zipOs.write(wos.toByteArray());
                    }
                    zipOs.closeArchiveEntry();
                }
                zipOs.finish();
                result = os.toByteArray();
                filename = "核查结果-" + DateFormatUtil.toDatatimeNumberString(new Date()) + ".zip";
            }
        } catch (Exception e) {
            log.error(e.getMessage(), e);
            result = String.valueOf("导出报错！" + e.getMessage()).getBytes();
            filename = "导出错误.txt";
        }
        return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + UrlUtil.urlEncode(filename) + "\"")
                .body(result);
    }
}
