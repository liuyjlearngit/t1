package com.cmdi.dims.domain.meta.dto;

import lombok.Data;

import java.util.List;
import java.util.Map;

@Data
public class MetadataDto {

    private EntityType entityType;

    private List<AttributeType> attributeTypes;

    private Map<String, Integer> attributeMaxLength;
}
