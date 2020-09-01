package com.cmdi.dims.app;

import java.math.BigDecimal;
import java.math.MathContext;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

import com.cmdi.dims.app.dto.ResponseDto;
import com.cmdi.dims.app.dto.TaskItemQueryDto;
import com.cmdi.dims.task.dto.TaskItemFileAggregationDto;
import com.cmdi.dims.task.entity.Task;
import com.cmdi.dims.task.entity.TaskItemFile;
import com.cmdi.dims.task.repository.TaskAggregationRepository;
import com.cmdi.dims.task.repository.TaskItemFileRepository;
import com.cmdi.dims.task.repository.TaskRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/app/v1/taskitemfile")
public class TaskItemFileRestController {

    @Autowired
    TaskItemFileRepository taskItemFileRepository;
    @Autowired
    TaskAggregationRepository taskAggregationRepository;
    @Autowired
    TaskRepository taskRepository;

    @GetMapping
    public ResponseDto<List<TaskItemFile>> taskItemFiles(
            TaskItemQueryDto query,
            @RequestParam(value = "start", defaultValue = "0") Integer start,
            @RequestParam(value = "limit", defaultValue = "50") Integer limit
    ) {

        Integer size = null != limit ? limit : 50;
        Integer page = null != start ? start / size : 0;

        TaskItemFile example = new TaskItemFile();
        example.setCollectionDate(query.getCollectionDate());

        Page<TaskItemFile> pagination = taskItemFileRepository.findAll(Example.of(example), PageRequest.of(page, size));
        return ResponseDto.success(pagination.getContent(), pagination.getTotalElements(), pagination.getNumberOfElements());
    }

    @GetMapping("/aggregation")
    public ResponseDto taskItemFileAggregation() {
        List<TaskItemFileAggregationDto> taskItemFileAggregations = taskAggregationRepository.findTaskItemFileAggregations();
        Map<String, Object> result = new HashMap<>();
        List<String> xAxis = new ArrayList<>();
        List<Double> totalFileSizeValues = new ArrayList<>();
        List<Long> totalCostValues = new ArrayList<>();
        List<Double> successRateValues = new ArrayList<>();
        if (null != taskItemFileAggregations) {
            Set<String> taskCodes = taskItemFileAggregations.stream().map(TaskItemFileAggregationDto::getTaskCode).collect(Collectors.toSet());
            Map<String, Task> tasks = taskRepository.findByCodeIn(taskCodes).stream().collect(Collectors.toMap(Task::getCode, v -> v, (u, v) -> u));

            for (TaskItemFileAggregationDto dto : taskItemFileAggregations) {
                xAxis.add(null != tasks.get(dto.getTaskCode()) ? tasks.get(dto.getTaskCode()).getName() : dto.getTaskCode());
                double totalFileSize = null != dto.getTotalFileSize() ? new BigDecimal(dto.getTotalFileSize() / (1024.0 * 1024.0), new MathContext(2)).doubleValue() : 0.0D;
                totalFileSizeValues.add(totalFileSize);
                long totalCosts = null != dto.getTotalCosts() ? dto.getTotalCosts().longValue() : 0L;
                totalCostValues.add(totalCosts);
                double successRate = null != dto.getTotalRecordNum() && null != dto.getSuccessRecordNum() && dto.getTotalRecordNum() > 0 ? new BigDecimal(dto.getSuccessRecordNum() / dto.getTotalRecordNum() * 1.0, new MathContext(4)).doubleValue() : 0;
                successRateValues.add(successRate * 100);
            }
        }
        result.put("xAxis", xAxis);
        result.put("totalFileSizeValues", totalFileSizeValues);
        result.put("totalCostValues", totalCostValues);
        result.put("successRateValues", successRateValues);
        return ResponseDto.success(result);
    }
}
