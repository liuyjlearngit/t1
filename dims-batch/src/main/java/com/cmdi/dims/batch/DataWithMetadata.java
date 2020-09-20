package com.cmdi.dims.batch;

import java.util.List;
import java.util.Map;

import com.cmdi.dims.domain.meta.dto.MetadataDto;
import lombok.Data;

@Data
public class DataWithMetadata {

    private Long index;

    private MetadataDto metadata;

    private List<Map<String, Object>> parameters;

}
