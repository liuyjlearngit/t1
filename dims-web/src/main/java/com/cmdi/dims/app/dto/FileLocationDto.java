package com.cmdi.dims.app.dto;

import lombok.Data;

@Data
public class FileLocationDto {

    private String province;

    private String specialityName;

    private Long fileLocationId;

    private String name;

    private String host;

    private Integer port;

    private String schema;

    private String encoding;

    private String path;

    private String username;

    private String password;

    private String fileEncoding;

    private String fileDelimiter;
}
