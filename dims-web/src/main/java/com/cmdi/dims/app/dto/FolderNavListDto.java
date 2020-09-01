package com.cmdi.dims.app.dto;

import java.util.List;

import lombok.Data;

@Data
public class FolderNavListDto {

    private List<FolderNavNodeDto> folders;

    private List<FolderNavIndexDto> indices;
}
