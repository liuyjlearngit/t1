package com.cmdi.dims.domain.meta.dto;

import lombok.Data;

@Data
public class EntityType {

    private Long id;

    private String name;

    private String code;

    private String specialityName;

    private String coreTable;

    private String extensionTable;

    private String extensionAttr;

    private String extensionValue;
}
