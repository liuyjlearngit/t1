package com.cmdi.dims.task.dto;

import java.util.Date;

import com.cmdi.dims.task.entity.TaskItemBusiness;
import org.springframework.beans.BeanUtils;

import lombok.Data;

@Data
public class TaskItemBusinessDto {

    private String name;

    private String code;

    private String taskCode;

    private Date collectionDate;

    private String province;

    private String prefecture;

    private String county;

    private Integer regionType;

    private Long amount;

    private Long originAmount;

    private Long analysisCosts;

    private Boolean success;

    private String memo;

    public static TaskItemBusinessDto from(TaskItemBusiness business) {
        TaskItemBusinessDto dto = new TaskItemBusinessDto();
        BeanUtils.copyProperties(business, dto);
        return dto;
    }
}
