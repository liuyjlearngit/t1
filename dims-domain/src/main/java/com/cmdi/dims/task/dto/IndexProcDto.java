package com.cmdi.dims.task.dto;

import lombok.Builder;
import lombok.Data;
import lombok.ToString;

@Data
@ToString
@Builder
public class IndexProcDto {

    private int indexId;
    private String indexCode;
    private String indexName;
    private int indexType;
    private String procName;
}
