package com.cmdi.dims.app.dto;

import lombok.Data;

@Data
public class EntityTypeNodeDto {

    private Long entityTypeId;
    private String name;
    private String coreTable;
    private String extensionTable;
}
