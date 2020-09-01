package com.cmdi.dims.app.dto;

import lombok.Data;

@Data
public class FolderNavIndexDto {

    private Long indexId;

    private String name;

    private String code;

    private String entityTypeId;

    private Long folderId;
}
