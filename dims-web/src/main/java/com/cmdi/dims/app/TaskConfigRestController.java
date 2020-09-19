package com.cmdi.dims.app;

import com.cmdi.dims.app.dto.DictDto;
import com.cmdi.dims.app.dto.ResponseDto;
import com.cmdi.dims.app.dto.TaskConfigDto;
import com.cmdi.dims.facade.TaskFacade;
import com.cmdi.dims.meta.repostitory.EntityTypeRepository;
import com.cmdi.dims.task.entity.AreaCodeConfig;
import com.cmdi.dims.task.entity.TaskConfig;
import com.cmdi.dims.task.repository.AreaCodeConfigRepository;
import com.cmdi.dims.task.repository.TaskConfigRepository;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang3.ArrayUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Slf4j
@RestController
@RequestMapping("/app/v1/taskconfig")
public class TaskConfigRestController {

    @Autowired
    private TaskConfigRepository taskConfigRepository;
    @Autowired
    private EntityTypeRepository entityTypeRepository;
    @Autowired
    private AreaCodeConfigRepository areaCodeConfigRepository;
    @Autowired
    TaskFacade taskFacade;

    @GetMapping(value = "/configs")
    public ResponseDto<List<DictDto>> configs() {
        List<TaskConfig> configs = taskConfigRepository.findAll();
        List<DictDto> dicts = configs.stream().map(c -> new DictDto(c.getName(), String.valueOf(c.getTaskConfigId()))).collect(Collectors.toList());
        return ResponseDto.success(dicts);
    }

    @GetMapping(value = "/speciality")
    public ResponseDto<List<DictDto>> speciality() {
        List<String> specialities = entityTypeRepository.findSpecialityNames();
        List<DictDto> dicts = specialities.stream().map(s -> new DictDto(s, s)).collect(Collectors.toList());
        return ResponseDto.success(dicts);
    }

    @GetMapping(value = "/province")
    public ResponseDto<List<DictDto>> province() {
        List<AreaCodeConfig> configs = areaCodeConfigRepository.findByRegionTypeOrderByCode(1);
        List<DictDto> dicts = configs.stream().map(c -> new DictDto(c.getName(), c.getCode())).collect(Collectors.toList());
        return ResponseDto.success(dicts);
    }

    @GetMapping(value = "/prefecture")
    public ResponseDto<List<DictDto>> prefecture(@RequestParam("provincecode") String provincecode) {
        List<AreaCodeConfig> configs = areaCodeConfigRepository.findByProvinceCodeAndRegionTypeOrderByCode(provincecode,2);
        List<DictDto> dicts = configs.stream().map(c -> new DictDto(c.getName(), c.getCode())).collect(Collectors.toList());
        return ResponseDto.success(dicts);
    }
    @GetMapping(value = "/county")
    public ResponseDto<List<DictDto>> county(@RequestParam("prefecturecode")String prefecturecode) {
        List<AreaCodeConfig> configs = areaCodeConfigRepository.findByPrefectureCodeAndRegionTypeOrderByCode(prefecturecode,3);
        List<DictDto> dicts = configs.stream().map(c -> new DictDto(c.getName(), c.getCode())).collect(Collectors.toList());
        return ResponseDto.success(dicts);
    }
    @GetMapping
    public ResponseDto<List<TaskConfig>> taskConfigs(
            @RequestParam(value = "taskConfigId", required = false) Long taskConfigId,
            @RequestParam(value = "name", required = false) String name,
            @RequestParam(value = "start", defaultValue = "0") Integer start,
            @RequestParam(value = "limit", defaultValue = "100") Integer limit
    ) {
        Integer size = null != limit ? limit : 20;
        Integer page = null != start ? start / size : 0;

        Page<TaskConfig> configs = taskConfigRepository.findAll((Root<TaskConfig> root, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) -> {
            List<Predicate> predicates = new ArrayList<>();
            if (null != taskConfigId) {
                predicates.add(criteriaBuilder.equal(root.get("taskConfigId"), taskConfigId));
            }
            if (StringUtils.isNotEmpty(name)) {
                predicates.add(criteriaBuilder.like(root.get("name"), "%" + name + "%"));
            }
            return criteriaBuilder.and(predicates.toArray(new Predicate[0]));
        }, PageRequest.of(page, size, Sort.Direction.DESC, "taskConfigId"));

        return ResponseDto.success(configs.getContent(), configs.getTotalElements(), configs.getNumberOfElements());
    }

    @PostMapping
    public ResponseDto<TaskConfig> saveTaskConfig(
            TaskConfigDto taskConfigDto
    ) {
        TaskConfig taskConfig;
        if (null != taskConfigDto.getTaskConfigId()) {
            taskConfig = taskConfigRepository.findById(taskConfigDto.getTaskConfigId())
                    .orElseThrow(() -> new IllegalArgumentException("任务配置ID=" + taskConfigDto.getTaskConfigId() + "不存在"));
        } else {
            taskConfig = new TaskConfig();
            taskConfig.setVersion(1L);
        }
        BeanUtils.copyProperties(taskConfigDto, taskConfig);
        TaskConfig saved = taskConfigRepository.save(taskConfig);
        return ResponseDto.success(saved);
    }


    @DeleteMapping(value = "/{taskConfigId}")
    public ResponseDto<Void> deleteTaskConfig(
            @PathVariable("taskConfigId") Long taskConfigId
    ) {
        Assert.notNull(taskConfigId, "not null");
        TaskConfig fileLocation = taskConfigRepository.findById(taskConfigId).orElseThrow(() -> new IllegalArgumentException("任务配置ID=" + taskConfigId + "不存在"));
        taskConfigRepository.delete(fileLocation);
        return ResponseDto.success();
    }

    @PostMapping(value = "/{taskConfigId}/createtask")
    public ResponseDto<Void> createTask(
            @PathVariable("taskConfigId") Long taskConfigId
    ) throws Exception {
        taskFacade.startTask(taskConfigId);
        return ResponseDto.success();
    }

    @PostMapping(value = "/batchexecutetask")
    public ResponseDto<Void> batchExecuteTask(
            @RequestParam("taskConfigIds") String taskConfigIds
    ) {
        List<String> messages = new ArrayList<>();
        List<Long> ids = asLongList(taskConfigIds);
        if (CollectionUtils.isNotEmpty(ids)) {
            for (Long id : ids) {
                try {
                    taskFacade.startTask(id);
                } catch (Exception e) {
                    log.error(e.getMessage(), e);
                    messages.add(e.getMessage());
                }
            }
        }
        if (CollectionUtils.isNotEmpty(messages)) {
            throw new RuntimeException(StringUtils.join(messages, "\n"));
        }
        return ResponseDto.success();
    }


    private static List<Long> asLongList(String value) {
        String[] sections = StringUtils.split(value, ",");
        if (ArrayUtils.isNotEmpty(sections)) {
            List<Long> result = new ArrayList<>();
            for (String section : sections) {
                result.add(Long.valueOf(section));
            }
            return result;
        }
        return null;
    }
}
