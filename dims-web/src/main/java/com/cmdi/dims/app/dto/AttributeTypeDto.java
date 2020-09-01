package com.cmdi.dims.app.dto;

import lombok.Data;

@Data
public class AttributeTypeDto {

    private Long attributeTypeId;

    private String name;

    private String code;

    private Long entityTypeId;

    private String columnName;

    private String dateType;

    private Long dictionaryTypeId;

    private String dictionaryTypeName;

    private String dictionaryTypeCode;

    private String tableName;

    private String memo;
}
