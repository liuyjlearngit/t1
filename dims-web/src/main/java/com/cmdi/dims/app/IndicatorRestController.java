package com.cmdi.dims.app;

import com.cmdi.dims.app.dto.ResponseDto;
import com.cmdi.dims.app.dto.TaskItemIndexListDto;
import com.cmdi.dims.common.util.UrlUtil;
import com.cmdi.dims.index.entity.Index;
import com.cmdi.dims.index.repository.IndexRepository;
import com.cmdi.dims.task.TaskStatusEnum;
import com.cmdi.dims.task.entity.Task;
import com.cmdi.dims.task.entity.TaskItemIndex;
import com.cmdi.dims.task.repository.TaskItemIndexRepository;
import com.cmdi.dims.task.repository.TaskRepository;
import com.cmdi.dims.util.TaskItemIndexExportUtil;
import lombok.extern.slf4j.Slf4j;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.io.ByteArrayOutputStream;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Slf4j
@RestController
@RequestMapping("/app/v1/indicator")
public class IndicatorRestController {

    @Autowired
    IndexRepository indexRepository;

    @Autowired
    TaskItemIndexRepository taskItemIndexRepository;

    @Autowired
    TaskRepository taskRepository;

    @GetMapping(value = "/data/export", produces = "application/vnd.ms-excel")
    public ResponseEntity<byte[]> dataExport(
            @RequestParam(value = "indexId", required = false) Long indexId,
            @RequestParam(value = "taskId", required = false) Long taskId) {

        byte[] result = null;
        String filename = null;
        try {
            TaskItemIndexListDto dto = findTaskItemIndex(indexId, taskId);
            Workbook workbook = TaskItemIndexExportUtil.export(dto.getTaskItemIndices());
            ByteArrayOutputStream os = new ByteArrayOutputStream();
            workbook.write(os);
            result = os.toByteArray();
            filename = TaskItemIndexExportUtil.filename(dto);
        } catch (Exception e) {
            log.error(e.getMessage(), e);
            result = String.valueOf("导出报错！" + e.getMessage()).getBytes();
            filename = "导出错误.txt";
        }
        return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + UrlUtil.urlEncode(filename) + "\"")
                .body(result);
    }

    @GetMapping(value = "/data")
    public ResponseDto<List<TaskItemIndex>> data(
            @RequestParam(value = "indexId", required = false) Long indexId,
            @RequestParam(value = "taskId", required = false) Long taskId
    ) {


        TaskItemIndexListDto dto = findTaskItemIndex(indexId, taskId);
        return ResponseDto.success(dto.getTaskItemIndices(), Long.valueOf(dto.getTaskItemIndices().size()), dto.getTaskItemIndices().size());
    }

    private TaskItemIndexListDto findTaskItemIndex(Long indexId, Long taskId) {
        TaskItemIndexListDto dto = new TaskItemIndexListDto();
        Set<Long> indexIds = new HashSet<>();
        boolean needQuery = true;
        if (null != indexId) {
            Index index = indexRepository.findById(indexId).orElse(null);
            dto.setIndex(index);
            indexIds.add(indexId);
        }
        List<String> indexCodes = new ArrayList<>();
        if (indexIds.size() > 0) {
            List<Index> indices = indexRepository.findAllById(indexIds);
            if (null != indices && indices.size() > 0) {
                indices.forEach(index -> {
                    indexCodes.add(index.getCode());
                });
            }
        }
        Long currentTaskId;
        if (null == taskId) {
            List<Task> tasks = taskRepository.findByStatusOrderByTaskIdDesc(TaskStatusEnum.successStatus().getValue(), PageRequest.of(0, 1));
            if (null != tasks && tasks.size() > 0) {
                currentTaskId = tasks.get(0).getTaskId();
                dto.setTask(tasks.get(0));
            } else {
                currentTaskId = null;
            }
        } else {
            currentTaskId = taskId;
            dto.setTask(taskRepository.findById(taskId).orElse(null));
        }
        if (null == currentTaskId || !needQuery) {
            dto.setTaskItemIndices(Collections.emptyList());
        } else {
            List<TaskItemIndex> pagedIndex = taskItemIndexRepository.findAll((Root<TaskItemIndex> root, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) -> {
                List<Predicate> predicates = new ArrayList<>();
                if (indexCodes.size() > 0) {
                    predicates.add(root.get("code").in(indexCodes));
                }
                predicates.add(criteriaBuilder.equal(root.get("regionType"), 1));
                predicates.add(criteriaBuilder.equal(root.get("taskCode"), dto.getTask().getCode()));
                return criteriaBuilder.and(predicates.toArray(new Predicate[predicates.size()]));
            }, new Sort(Sort.Direction.ASC, "code"));
            dto.setTaskItemIndices(pagedIndex);
        }
        return dto;
    }
}
