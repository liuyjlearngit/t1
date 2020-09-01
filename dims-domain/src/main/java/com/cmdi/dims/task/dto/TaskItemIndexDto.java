package com.cmdi.dims.task.dto;

import java.util.Date;

import lombok.Data;

@Data
public class TaskItemIndexDto {

    private String name;

    private String code;

    private String taskCode;

    private Long indexId;

    private Date collectionDate;

    private String province;

    private String prefecture;

    private String county;

    private String provinceCode;

    private String prefectureCode;

    private String countyCode;

    private Integer regionType;

    private Integer amount;

    private Integer errorAmount;

    private Double indexValue;
}
