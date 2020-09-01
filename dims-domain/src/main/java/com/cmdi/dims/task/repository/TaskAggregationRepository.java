package com.cmdi.dims.task.repository;

import java.util.List;

import com.cmdi.dims.task.dto.TaskItemFileAggregationDto;

public interface TaskAggregationRepository {

    List<TaskItemFileAggregationDto> findTaskItemFileAggregations();
}
