package com.cmdi.dims.app;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.cmdi.dims.app.dto.AttributeTypeDto;
import com.cmdi.dims.app.dto.EntityTypeNodeDto;
import com.cmdi.dims.app.dto.ResponseDto;
import com.cmdi.dims.meta.entity.AttributeType;
import com.cmdi.dims.meta.entity.Dictionary;
import com.cmdi.dims.meta.entity.DictionaryType;
import com.cmdi.dims.meta.entity.EntityType;
import com.cmdi.dims.meta.repostitory.AttributeTypeRepository;
import com.cmdi.dims.meta.repostitory.DictionaryRepository;
import com.cmdi.dims.meta.repostitory.DictionaryTypeRepository;
import com.cmdi.dims.meta.repostitory.EntityTypeRepository;
import com.cmdi.dims.meta.service.MetadataService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/app/v1/metadata")
public class MetadataRestController {

    @Autowired
    EntityTypeRepository entityTypeRepository;
    @Autowired
    AttributeTypeRepository attributeTypeRepository;
    @Autowired
    DictionaryTypeRepository dictionaryTypeRepository;
    @Autowired
    DictionaryRepository dictionaryRepository;
    @Autowired
    MetadataService metadataService;


    private List<EntityTypeNodeDto> convert(List<EntityType> entityTypes) {
        List<EntityTypeNodeDto> data = new ArrayList<>();
        if (null != entityTypes && entityTypes.size() > 0) {
            entityTypes.forEach(entityType -> {
                EntityTypeNodeDto node = new EntityTypeNodeDto();
                BeanUtils.copyProperties(entityType, node);
                data.add(node);
            });
        }
        return data;
    }


    @GetMapping(value = "/hierarchy")
    public ResponseDto<List<EntityTypeNodeDto>> hierarchy(
            @RequestParam(value = "entityTypeId", required = false) Long entityTypeId
    ) {

        List<EntityType> entityTypes = new ArrayList<>();
        if (null == entityTypeId) {
            entityTypes.addAll(entityTypeRepository.findMetaEntityType());
        } else {
            entityTypeRepository.findById(entityTypeId).ifPresent(entityType -> entityTypes.addAll(entityTypeRepository.findEntityType(entityType.getExtensionTable())));
        }
        List<EntityTypeNodeDto> data = convert(entityTypes);
        return ResponseDto.success(data);
    }


    @GetMapping(value = "/entitytype")
    public ResponseDto<List<EntityType>> entityType(
            @RequestParam(value = "entityTypeId", required = false) Long entityTypeId
    ) {

        EntityType example = new EntityType();
        example.setEntityTypeId(entityTypeId);
        List<EntityType> entityTypes = this.entityTypeRepository.findAll(Example.of(example));
        return ResponseDto.success(entityTypes);
    }

    @GetMapping(value = "/attributetype")
    public ResponseDto<List<AttributeTypeDto>> attributeType(
            @RequestParam("entityTypeId") Long entityTypeId
    ) {
        List<AttributeTypeDto> attributeTypes = new ArrayList<>();
        this.entityTypeRepository.findById(entityTypeId).ifPresent(entityType -> {
            if (StringUtils.isNotEmpty(entityType.getCoreTable())) {
                EntityType coreEntityType = this.entityTypeRepository.findMetaEntityType(entityType.getCoreTable());
                if (null != coreEntityType) {
                    List<AttributeType> coreAttributeTypes = this.attributeTypeRepository.findByEntityTypeId(coreEntityType.getEntityTypeId());
                    attributeTypes.addAll(wrapAttributeTypes(coreEntityType, coreAttributeTypes));
                }

            }
            List<AttributeType> extensionAttributeTypes = this.attributeTypeRepository.findByEntityTypeId(entityType.getEntityTypeId());
            attributeTypes.addAll(wrapAttributeTypes(entityType, extensionAttributeTypes));
        });
        return ResponseDto.success(attributeTypes);
    }

    private List<AttributeTypeDto> wrapAttributeTypes(EntityType entityType, List<AttributeType> attributeTypes) {
        List<AttributeTypeDto> attributeTypeDtos = new ArrayList<>();
        if (null != attributeTypes) {
            Set<Long> dictionaryTypeIds = new HashSet<>();
            attributeTypes.forEach(attributeType -> {
                if (null != attributeType.getDictionaryTypeId()) {
                    dictionaryTypeIds.add(attributeType.getDictionaryTypeId());
                }
            });
            Map<Long, DictionaryType> dictionaryTypeMap = new HashMap<>();
            if (dictionaryTypeIds.size() > 0) {
                List<DictionaryType> dictionaryTypes = this.dictionaryTypeRepository.findAllById(dictionaryTypeIds);
                if (null != dictionaryTypes) {
                    dictionaryTypes.forEach(dictionaryType -> dictionaryTypeMap.put(dictionaryType.getDictionaryTypeId(), dictionaryType));
                }
            }
            attributeTypes.forEach(attributeType -> {
                AttributeTypeDto dto = new AttributeTypeDto();
                BeanUtils.copyProperties(attributeType, dto);
                dto.setTableName(entityType.getExtensionTable());
                DictionaryType dictionaryType = dictionaryTypeMap.get(attributeType.getDictionaryTypeId());
                if (null != dictionaryType) {
                    dto.setDictionaryTypeName(dictionaryType.getName());
                    dto.setDictionaryTypeCode(dictionaryType.getCode());
                }
                attributeTypeDtos.add(dto);
            });
        }
        return attributeTypeDtos;
    }


    @GetMapping(value = "/dictionary")
    public ResponseDto<List<Dictionary>> dictionaries(
            @RequestParam("dictionaryTypeId") Long dictionaryTypeId
    ) {
        return ResponseDto.success(dictionaryRepository.findByDictionaryTypeId(dictionaryTypeId));
    }
}
