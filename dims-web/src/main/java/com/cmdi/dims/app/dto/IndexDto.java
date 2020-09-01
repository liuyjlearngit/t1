package com.cmdi.dims.app.dto;

import lombok.Data;

@Data
public class IndexDto {

    private Long indexId;

    private String name;

    private String code;

    private Long entityTypeId;

    private String entityTypeName;

    private String specialityName;

    private Integer type;

    private Boolean enable;

    private String ruleDesc;
}
