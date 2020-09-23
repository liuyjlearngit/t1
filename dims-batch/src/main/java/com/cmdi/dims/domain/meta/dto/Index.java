package com.cmdi.dims.domain.meta.dto;

import lombok.Data;

@Data
public class Index {

    private Long id;

    private String name;

    private String code;

    private Integer orderBy;

    private Integer type;

    private String procName;

    private Integer priority;

    private String ruleDesc;
}
