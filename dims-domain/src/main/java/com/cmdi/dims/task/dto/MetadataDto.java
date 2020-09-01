package com.cmdi.dims.task.dto;

import java.util.List;
import java.util.Map;

import lombok.Data;
import com.cmdi.dims.meta.entity.AttributeType;
import com.cmdi.dims.meta.entity.EntityType;

@Data
public class MetadataDto {

    private EntityType entityType;

    private List<AttributeType> attributeTypes;

    private Map<String, Integer> attributeMaxLength;

    public String insertDataStatement() {
        StringBuilder insertStatement = new StringBuilder();
        insertStatement.append("INSERT INTO ").append(entityType.getExtensionTable()).append("(");
        boolean first = true;
        for (AttributeType attributeType : attributeTypes) {
            if (first) {
                first = false;
            } else {
                insertStatement.append(", ");
            }
            insertStatement.append(attributeType.getColumnName());
        }
        insertStatement.append(") VALUES (");
        first = true;
        for (AttributeType attributeType : attributeTypes) {
            if (first) {
                first = false;
            } else {
                insertStatement.append(", ");
            }
            insertStatement.append(":").append(attributeType.getColumnName().toUpperCase());
        }
        insertStatement.append(")");
        return insertStatement.toString();
    }

    public static String cleanDataStatement(String table) {
        return "TRUNCATE TABLE " + table;
    }
}
