package com.cmdi.dims.task.dto;

import lombok.Data;

@Data
public class TaskItemFileAggregationDto {

    private String taskCode;
    private Long totalFileSize;
    private Long totalCosts;
    private Long totalRecordNum;
    private Long successRecordNum;
}
