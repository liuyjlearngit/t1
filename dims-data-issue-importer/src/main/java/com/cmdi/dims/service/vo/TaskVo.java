package com.cmdi.dims.service.vo;

import java.util.Date;
import java.util.Map;

import org.apache.commons.collections4.MapUtils;

public class TaskVo {

    private Map<String, Object> data;

    public TaskVo(Map<String, Object> data) {
        this.data = data;
    }

    public String getTaskCode() {
        return MapUtils.getString(data, "code");
    }

    public Date getCollectionDate() {
        return (Date) data.get("collectionDate");
    }
}
