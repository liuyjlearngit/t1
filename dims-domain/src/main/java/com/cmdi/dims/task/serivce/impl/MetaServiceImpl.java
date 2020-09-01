package com.cmdi.dims.task.serivce.impl;

import java.util.Arrays;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import com.cmdi.dims.index.entity.Index;
import com.cmdi.dims.index.repository.IndexRepository;
import com.cmdi.dims.meta.entity.AttributeType;
import com.cmdi.dims.meta.entity.EntityType;
import com.cmdi.dims.meta.repostitory.AttributeTypeRepository;
import com.cmdi.dims.meta.repostitory.EntityTypeRepository;
import com.cmdi.dims.task.dto.FileLocationDto;
import com.cmdi.dims.task.dto.IndexProcDto;
import com.cmdi.dims.task.dto.MetadataDto;
import com.cmdi.dims.task.dto.TaskConfigDto;
import com.cmdi.dims.task.entity.FileLocation;
import com.cmdi.dims.task.entity.TaskConfig;
import com.cmdi.dims.task.repository.FileLocationRepository;
import com.cmdi.dims.task.repository.TaskConfigRepository;
import com.cmdi.dims.task.serivce.MetaService;

@Service
public class MetaServiceImpl implements MetaService {

    @Autowired
    private EntityTypeRepository entityTypeRepository;
    @Autowired
    private AttributeTypeRepository attributeTypeRepository;
    //    @Autowired
//    private DatabaseColumnRepository databaseColumnRepository;
    @Autowired
    private FileLocationRepository fileLocationRepository;
    @Autowired
    private TaskConfigRepository taskConfigRepository;
    @Autowired
    private IndexRepository indexRepository;

    @Override
    public MetadataDto loadMetadata(String tableName, String specialityName) {
        Assert.hasLength(tableName, "table name must not empty");
        EntityType entityType = entityTypeRepository.findByCodeAndSpecialityName(tableName.toUpperCase(), specialityName);
        Assert.notNull(entityType, "entity type not exists");
        List<AttributeType> attributeTypes = attributeTypeRepository.findByEntityTypeId(entityType.getEntityTypeId());
        Assert.notEmpty(attributeTypes, "attribute type is empty !");
        MetadataDto metadataDto = new MetadataDto();
        metadataDto.setEntityType(entityType);
        metadataDto.setAttributeTypes(attributeTypes);
//        List<DatabaseColumn> columns = databaseColumnRepository.findByTableSchemaAndTableNameOrderByOrdinalPosition("public", entityType.getCode().toLowerCase());
//        metadataDto.setAttributeMaxLength(columns.stream().filter(column -> null != column.getMaxStringLength()).collect(Collectors.toMap(column -> column.getColumnName().toUpperCase(), DatabaseColumn::getMaxStringLength)));
        metadataDto.setAttributeMaxLength(new HashMap<>());
        return metadataDto;
    }

    @Override
    public TaskConfigDto loadConfig(String province, String specialityName) {
        Assert.hasText(province, "please input province");
        Assert.hasText(specialityName, "please input speciality");
        List<TaskConfig> taskConfigs = taskConfigRepository.findByProvinceAndSpecialityName(province, specialityName);
        Assert.notEmpty(taskConfigs, "no task config for province:" + province + ", speciality:" + specialityName);
        TaskConfig config = taskConfigs.get(0);
        Assert.hasText(config.getIncludeSpecialities(), "no include specialities");
        String[] specialityNames = StringUtils.split(config.getIncludeSpecialities(), ",");
        List<FileLocation> fileLocations = fileLocationRepository.findByProvinceAndSpecialityNameIn(config.getProvince(), Arrays.asList(specialityNames));
        Assert.notEmpty(fileLocations, "no locations under task config province:" + province + ", speciality:" + specialityName);
        Set<String> specialities = fileLocations.stream().map(FileLocation::getSpecialityName).collect(Collectors.toSet());
        List<EntityType> entityTypes = entityTypeRepository.findAll().stream()
                .filter(e -> specialities.contains(e.getSpecialityName()))
                .collect(Collectors.toList());

        Map<String, String> tables = entityTypes.stream().collect(Collectors.toMap(EntityType::getCode, EntityType::getName));
        Assert.notEmpty(tables, "under specialities" + StringUtils.join(specialities) + " no tables");
        Map<String, String> tableSpecialityMappings = entityTypes.stream().collect(Collectors.toMap(EntityType::getCode, EntityType::getSpecialityName));

        List<FileLocationDto> locations = fileLocations.stream().map(l -> FileLocationDto.builder()
                .fileLocationId(l.getFileLocationId())
                .host(l.getHost())
                .port(l.getPort())
                .schema(l.getSchema())
                .encoding(l.getEncoding())
                .path(l.getPath())
                .password(l.getPassword())
                .username(l.getUsername())
                .specialityName(l.getSpecialityName())
                .fileDelimiter(l.getFileDelimiter())
                .fileEncoding(l.getFileEncoding())
                .build()).collect(Collectors.toList());
        return TaskConfigDto.builder()
                .taskConfigId(config.getTaskConfigId())
                .name(config.getName())
                .code(config.getCode())
                .province(config.getProvince())
                .speciality(config.getSpecialityName())
                .locations(locations)
                .tables(tables)
                .tableSpecialityMappings(tableSpecialityMappings)
                .build();
    }

    @Override
    public List<String> loadAllTables() {
        return entityTypeRepository.findAll().stream().map(EntityType::getCode).map(String::toUpperCase).collect(Collectors.toList());
    }

    @Override
    public TaskConfig findTaskConfigByTaskConfigId(Long taskConfigId) {
        return taskConfigRepository.findById(taskConfigId).orElse(null);
    }

    @Override
    public TaskConfig findTaskConfigByProvinceAndSpecialityName(String province, String specialityName) {
        List<TaskConfig> configs = taskConfigRepository.findByProvinceAndSpecialityName(province, specialityName);
        return configs.isEmpty() ? null : configs.get(0);
    }

    @Override
    public List<IndexProcDto> loadIndexProcBySpeciality(String speciality) {
        return indexRepository.findBySpecialityNameAndEnable(speciality, true)
                .parallelStream().sorted(Comparator.comparing((Index  index)->index.getCode()))
                .map(i -> IndexProcDto.builder().indexId(i.getIndexId().intValue())
                        .indexName(i.getName())
                        .indexCode(i.getCode())
                        .indexType(i.getType())
                        .procName(StringUtils.isNotEmpty(i.getProcName()) ? i.getProcName() : i.getMemo())
                        .build()
                ).collect(Collectors.toList());
    }

}
