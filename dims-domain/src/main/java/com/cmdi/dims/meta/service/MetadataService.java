package com.cmdi.dims.meta.service;

import java.util.List;
import java.util.Map;

import com.cmdi.dims.meta.entity.AttributeType;
import com.cmdi.dims.meta.entity.Dictionary;
import com.cmdi.dims.meta.entity.DictionaryType;
import com.cmdi.dims.meta.entity.EntityType;

public interface MetadataService {

    void saveDictionaries(Map<DictionaryType, List<Dictionary>> dictionaries);

    void saveMetadata(EntityType entityType, List<AttributeType> attributeTypes);

    String autoCreateTable();
}
