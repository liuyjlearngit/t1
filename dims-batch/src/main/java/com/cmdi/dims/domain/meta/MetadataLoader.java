package com.cmdi.dims.domain.meta;

import com.cmdi.dims.domain.meta.dto.AttributeType;
import com.cmdi.dims.domain.meta.dto.EntityType;
import com.cmdi.dims.domain.meta.dto.Index;
import com.cmdi.dims.domain.meta.dto.MetadataDto;
import org.apache.commons.collections4.CollectionUtils;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.util.Assert;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class MetadataLoader {

    private NamedParameterJdbcTemplate namedParameterJdbcTemplate;

    public MetadataLoader(NamedParameterJdbcTemplate namedParameterJdbcTemplate) {
        this.namedParameterJdbcTemplate = namedParameterJdbcTemplate;
    }

    public MetadataDto loadMetadata(String code) {
        EntityType entityType = findEntityTypeByCode(code);
        Assert.notNull(entityType, "entity type not exists");
        List<AttributeType> attributeTypes = findAttributeTypeByEntityTypeId(entityType.getId());
        Assert.notEmpty(attributeTypes, "attribute type is empty !");
        MetadataDto metadataDto = new MetadataDto();
        metadataDto.setEntityType(entityType);
        metadataDto.setAttributeTypes(attributeTypes);
        return metadataDto;
    }

    public List<EntityType> loadEntityType() {
        return findAllEntityType();
    }

    public List<Index> loadIndex(String speciality) {
        return findIndexBySpeciality(speciality);
    }

    private List<Index> findIndexBySpeciality(String speciality) {
        Map<String, Object> parameters = new HashMap<>();
        parameters.put("specialityName", speciality);
        String statement = "SELECT id, name, code, orderby, type, procname, priority, memo, ruledesc  FROM dims_idx_index WHERE specialityname=:specialityName AND isenable=1 ORDER BY priority, code";
        return namedParameterJdbcTemplate.query(statement, parameters, IndexMapper.INSTANCE);
    }

    private List<EntityType> findAllEntityType() {
        String statement = "SELECT id, name, code, specialityname, coretable, extensiontable, extensionattr, extensionvalue FROM dims_mm_entitytype";
        return namedParameterJdbcTemplate.query(statement, EntityTypeMapper.INSTANCE);
    }

    private EntityType findEntityTypeByCode(String code) {
        Map<String, Object> parameters = new HashMap<>();
        parameters.put("code", code);
        String statement = "SELECT id, name, code, specialityname, coretable, extensiontable, extensionattr, extensionvalue FROM dims_mm_entitytype WHERE code=:code";
        List<EntityType> entityTypes = namedParameterJdbcTemplate.query(statement, parameters, EntityTypeMapper.INSTANCE);
        return CollectionUtils.isNotEmpty(entityTypes) ? entityTypes.get(0) : null;
    }

    private List<AttributeType> findAttributeTypeByEntityTypeId(Long entityTypeId) {
        Map<String, Object> parameters = new HashMap<>();
        parameters.put("entityTypeId", entityTypeId);
        String statement = "select name, code, columnname, datatype from dims_mm_attributetype where entitytype_id=:entityTypeId";
        return namedParameterJdbcTemplate.query(statement, parameters, AttributeTypeMapper.INSTANCE);
    }

    public static class IndexMapper implements RowMapper<Index> {

        private static final IndexMapper INSTANCE = new IndexMapper();

        @Override
        public Index mapRow(ResultSet rs, int rowNum) throws SQLException {
            Index index = new Index();
            index.setId(rs.getLong("id"));
            index.setName(rs.getString("name"));
            index.setCode(rs.getString("code"));
            index.setOrderBy(rs.getInt("orderby"));
            index.setPriority(rs.getInt("priority"));
            index.setProcName(rs.getString("procname"));
            index.setRuleDesc(rs.getString("ruledesc"));
            index.setType(rs.getInt("type"));
            return index;
        }
    }

    public static class AttributeTypeMapper implements RowMapper<AttributeType> {

        private static final AttributeTypeMapper INSTANCE = new AttributeTypeMapper();

        @Override
        public AttributeType mapRow(ResultSet rs, int rowNum) throws SQLException {
            AttributeType attributeType = new AttributeType();
            attributeType.setName(rs.getString("name"));
            attributeType.setCode(rs.getString("code"));
            attributeType.setColumnName(rs.getString("columnname"));
            attributeType.setDataType(rs.getString("datatype"));
            return attributeType;
        }
    }

    public static class EntityTypeMapper implements RowMapper<EntityType> {

        private static final EntityTypeMapper INSTANCE = new EntityTypeMapper();

        @Override
        public EntityType mapRow(ResultSet rs, int rowNum) throws SQLException {
            EntityType entityType = new EntityType();
            entityType.setId(rs.getLong("id"));
            entityType.setName(rs.getString("name"));
            entityType.setCode(rs.getString("code"));
            entityType.setSpecialityName(rs.getString("specialityname"));
            entityType.setCoreTable(rs.getString("coretable"));
            entityType.setExtensionTable(rs.getString("extensiontable"));
            entityType.setExtensionAttr(rs.getString("extensionattr"));
            entityType.setExtensionValue(rs.getString("extensionvalue"));
            return entityType;
        }
    }
}
