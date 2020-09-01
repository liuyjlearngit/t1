package com.cmdi.dims.app.dto;

import lombok.Data;

@Data
public class FolderNavNodeDto {

    private Long folderId;

    private Long parentFolderId;

    private String name;
}
