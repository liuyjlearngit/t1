package com.cmdi.dims.task.dto;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class FileLocationDto {

    private Long fileLocationId;

    private String host;

    private Integer port;

    private String schema;

    private String encoding;

    private String path;

    private String username;

    private String password;

    private String province;

    private String specialityName;

    private String fileEncoding;

    private String fileDelimiter;
}
