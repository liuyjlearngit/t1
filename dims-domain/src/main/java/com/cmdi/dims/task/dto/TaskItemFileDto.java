package com.cmdi.dims.task.dto;

import java.util.Date;

import com.cmdi.dims.task.entity.TaskItemFile;
import org.springframework.beans.BeanUtils;

import lombok.Data;

@Data
public class TaskItemFileDto {

    private String name;

    private String code;

    private String taskCode;

    private Date collectionDate;

    private String province;

    private String destTable;

    private Long fileSize;

    private String csvFile;

    private Long csvFileSize;

    private Long fileGettingCosts;

    private Date finishTime;

    private String signature;

    private Long lineSize;

    private String fileEncoding;

    private String fileDelimiter;

    private Boolean success;

    private String failureReason;

    private String memo;

    public static TaskItemFileDto from(TaskItemFile file) {
        TaskItemFileDto dto = new TaskItemFileDto();
        BeanUtils.copyProperties(file, dto);
        return dto;
    }
}
