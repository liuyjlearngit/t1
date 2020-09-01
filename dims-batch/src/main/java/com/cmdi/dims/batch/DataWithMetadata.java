package com.cmdi.dims.batch;

import java.util.List;
import java.util.Map;

import lombok.Data;
import com.cmdi.dims.sdk.model.MetadataDto;

@Data
public class DataWithMetadata {

    private Long index;

    private MetadataDto metadata;

    private List<Map<String, Object>> parameters;

}
