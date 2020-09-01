package com.cmdi.dims.meta.service.impl;

import java.util.List;
import java.util.Map;

import com.cmdi.dims.database.repository.DatabaseColumnRepository;
import com.cmdi.dims.database.repository.DatabaseTableRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.slf4j.Slf4j;
import com.cmdi.dims.meta.entity.AttributeType;
import com.cmdi.dims.meta.entity.Dictionary;
import com.cmdi.dims.meta.entity.DictionaryType;
import com.cmdi.dims.meta.entity.EntityType;
import com.cmdi.dims.meta.repostitory.AttributeTypeRepository;
import com.cmdi.dims.meta.repostitory.DictionaryRepository;
import com.cmdi.dims.meta.repostitory.DictionaryTypeRepository;
import com.cmdi.dims.meta.repostitory.EntityTypeRepository;
import com.cmdi.dims.meta.service.MetadataService;

@Slf4j
@Service
public class MetadataServiceImpl implements MetadataService {

    @Autowired
    DictionaryTypeRepository dictionaryTypeRepository;

    @Autowired
    DictionaryRepository dictionaryRepository;

    @Autowired
    EntityTypeRepository entityTypeRepository;

    @Autowired
    AttributeTypeRepository attributeTypeRepository;

    @Autowired
    DatabaseTableRepository databaseTableRepository;

    @Autowired
    DatabaseColumnRepository databaseColumnRepository;

    @Autowired
    JdbcTemplate jdbcTemplate;

    @Transactional
    public void saveDictionaries(Map<DictionaryType, List<Dictionary>> dictionaries) {
//        if (MapUtils.isNotEmpty(dictionaries)) {
//            Set<DictionaryType> dictionaryTypes = new HashSet<>(dictionaries.keySet());
//            dictionaryTypes.forEach(dictionaryType -> {
//                DictionaryType exist = dictionaryTypeRepository.findByCode(dictionaryType.getCode());
//                if (null != exist) {
//                    dictionaryType.setDictionaryTypeId(exist.getDictionaryTypeId());
//                    dictionaryType.setVersion(exist.getVersion());
//                    dictionaryType.setCreatedAt(exist.getCreatedAt());
//                    dictionaryType.setCreatedBy(exist.getCreatedBy());
//                    dictionaryType.setUpdatedAt(exist.getUpdatedAt());
//                    dictionaryType.setUpdatedBy(exist.getUpdatedBy());
//                }
//            });
//            List<DictionaryType> savedDictionaryTypes = dictionaryTypeRepository.saveAll(dictionaryTypes);
//            Map<String, DictionaryType> savedDictionaryTypeMap = new HashMap<>();
//            savedDictionaryTypes.forEach(dictionaryType -> savedDictionaryTypeMap.put(dictionaryType.getCode(), dictionaryType));
//
//            List<Dictionary> totalDictionaries = new ArrayList<>();
//            for (Map.Entry<DictionaryType, List<Dictionary>> entry : dictionaries.entrySet()) {
//                DictionaryType dictionaryType = savedDictionaryTypeMap.get(entry.getKey().getCode());
//                List<Dictionary> dicts = entry.getValue();
//                List<Dictionary> existDicts = dictionaryRepository.findByDictionaryTypeId(dictionaryType.getDictionaryTypeId());
//                if (CollectionUtils.isNotEmpty(existDicts)) {
//                    Map<Integer, Dictionary> valueDicts = new HashMap<>();
//                    existDicts.forEach(dict -> valueDicts.put(dict.getDictKey(), dict));
//                    dicts.forEach(dict -> {
//                        Dictionary existDict = valueDicts.get(dict.getDictKey());
//                        dict.setDictionaryId(existDict.getDictionaryId());
//                        dict.setVersion(existDict.getVersion());
//                        dict.setCreatedAt(existDict.getCreatedAt());
//                        dict.setCreatedBy(existDict.getCreatedBy());
//                        dict.setUpdatedAt(existDict.getUpdatedAt());
//                        dict.setUpdatedBy(existDict.getUpdatedBy());
//                    });
//                }
//                dicts.forEach(dict -> dict.setDictionaryTypeId(dictionaryType.getDictionaryTypeId()));
//                totalDictionaries.addAll(dicts);
//            }
//            dictionaryRepository.saveAll(totalDictionaries);
//        }
    }

    @Override
    public void saveMetadata(EntityType entityType, List<AttributeType> attributeTypes) {
//        EntityType existEntityType = entityTypeRepository.findByCode(entityType.getCode());
//        if (null != existEntityType) {
//            entityType.setEntityTypeId(existEntityType.getEntityTypeId());
//            entityType.setVersion(existEntityType.getVersion());
//            entityType.setCreatedAt(existEntityType.getCreatedAt());
//            entityType.setCreatedBy(existEntityType.getCreatedBy());
//            entityType.setUpdatedAt(existEntityType.getUpdatedAt());
//            entityType.setUpdatedBy(existEntityType.getUpdatedBy());
//        }
//        EntityType savedEntityType = entityTypeRepository.save(entityType);
//        List<AttributeType> existAttributeTypes = attributeTypeRepository.findByEntityTypeId(savedEntityType.getEntityTypeId());
//        Map<String, AttributeType> columnAttributeTypes = new HashMap<>();
//        if (CollectionUtils.isNotEmpty(existAttributeTypes)) {
//            existAttributeTypes.forEach(attributeType -> columnAttributeTypes.put(attributeType.getColumnName(), attributeType));
//        }
//        attributeTypes.forEach(attributeType -> {
//            AttributeType exist = columnAttributeTypes.get(attributeType.getColumnName());
//            if (null != exist) {
//                attributeType.setAttributeTypeId(exist.getAttributeTypeId());
//                attributeType.setVersion(exist.getVersion());
//                attributeType.setCreatedAt(exist.getCreatedAt());
//                attributeType.setCreatedBy(exist.getCreatedBy());
//                attributeType.setUpdatedAt(exist.getUpdatedAt());
//                attributeType.setUpdatedBy(exist.getUpdatedBy());
//            }
//            attributeType.setEntityTypeId(savedEntityType.getEntityTypeId());
//        });
//        attributeTypeRepository.saveAll(attributeTypes);
    }

    public String autoCreateTable() {
//        List<EntityType> entityTypes = entityTypeRepository.findAll();
//        if (CollectionUtils.isEmpty(entityTypes)) {
//            return null;
//        }
//        List<String> statements = new ArrayList<>();
//        for (EntityType entityType : entityTypes) {
//            List<AttributeType> attributeTypes = attributeTypeRepository.findByEntityTypeId(entityType.getEntityTypeId());
//            List<String> columnDefinitions = new ArrayList<>();
//            attributeTypes.forEach(attributeType -> {
//                String columnName = attributeType.getColumnName().toLowerCase();
//                StringBuilder columnDefinition = new StringBuilder();
//                columnDefinition.append("\"").append(columnName).append("\"").append(" ");
//                if ("date".equalsIgnoreCase(attributeType.getDateType())
//                        || "timestamp".equalsIgnoreCase(attributeType.getDateType())
//                        || "time".equalsIgnoreCase(attributeType.getDateType())
//                        || "datetosecond".equalsIgnoreCase(attributeType.getDateType())) {
//                    columnDefinition.append("varchar(20)");
//                } else if ("double".equalsIgnoreCase(attributeType.getDateType())
//                        || "long".equalsIgnoreCase(attributeType.getDateType())
//                        || "interger".equalsIgnoreCase(attributeType.getDateType())
//                        || "integer".equalsIgnoreCase(attributeType.getDateType())
//                        || "number".equalsIgnoreCase(attributeType.getDateType())
//                        || "int".equalsIgnoreCase(attributeType.getDateType())) {
//                    columnDefinition.append("varchar(50)");
//                } else if (columnName.contains("note") || columnName.contains("comment") || columnName.contains("remark")) {
//                    columnDefinition.append("text");
//                } else {
//                    columnDefinition.append("text");
//                }
//                columnDefinitions.add(columnDefinition.toString());
//            });
//            StringBuilder dropTable = new StringBuilder()
//                    .append("DROP TABLE IF EXISTS ")
//                    .append(entityType.getExtensionTable().toLowerCase());
//            statements.add(dropTable.toString());
//            StringBuilder createTable = new StringBuilder()
//                    .append("CREATE TABLE ")
//                    .append(entityType.getExtensionTable().toLowerCase())
//                    .append(" (\n\t")
//                    .append(StringUtils.join(columnDefinitions, ",\n\t"))
//                    .append(",\n\t\"dims_col_result\" text")
//                    .append(",\n\t\"dims_col_rtname\" text")
//                    .append("\n)");
//            statements.add(createTable.toString());
//        }
//        StringBuilder result = new StringBuilder();
//        for (String statement : statements) {
//            System.out.println(statement + ";");
//            jdbcTemplate.execute(statement);
//            result.append(statement).append(";\n");
//        }
//        return result.toString();
        return null;
    }
}
