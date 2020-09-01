package com.cmdi.dims.service.vo;


import java.util.Map;

import org.apache.commons.collections4.MapUtils;

public class FileLocationVo {

    private Map<String, Object> data;

    public FileLocationVo(Map<String, Object> data) {
        this.data = data;
    }

    public String getHost() {
        return MapUtils.getString(data, "host");
    }

    public Integer getPort() {
        return MapUtils.getInteger(data, "port");
    }

    public String getUsername() {
        return MapUtils.getString(data, "username");
    }

    public String getPassword() {
        return MapUtils.getString(data, "password");
    }

    public String getEncoding() {
        return MapUtils.getString(data, "encoding");
    }

    public String getPath() {
        return MapUtils.getString(data, "path");
    }

    public String getFileEncoding() {
        return MapUtils.getString(data, "file_encoding");
    }

    public String getFileDelimiter() {
        return MapUtils.getString(data, "file_delimiter");
    }
}
