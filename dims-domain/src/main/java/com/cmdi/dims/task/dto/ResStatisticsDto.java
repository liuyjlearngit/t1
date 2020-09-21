package com.cmdi.dims.task.dto;

import lombok.Data;

import java.util.Date;

@Data
public class ResStatisticsDto {
    private Long id;

    private Long resIndex;

    private String taskCode;

    private Date collectionDate;

    private String province;

    private String prefecture;

    private String county;

    private String provinceCode;

    private String prefectureCode;

    private String countyCode;

    private Integer regionType;

    private String specialityName;

    private Integer amount;

    private String unit;

    private String resName;

    private String resType;

    private String memo;
}
