package com.cmdi.dims.domain.util;

import com.cmdi.dims.sdk.model.AttributeType;
import com.cmdi.dims.sdk.model.MetadataDto;

import java.util.Objects;

public class DataUtil {

    public static String insertDataStatement(MetadataDto metadata) {
        StringBuilder insertStatement = new StringBuilder();
        insertStatement.append("INSERT INTO ").append(metadata.getEntityType().getExtensionTable()).append("(");
        boolean first = true;
        for (AttributeType attributeType : metadata.getAttributeTypes()) {
            if (first) {
                first = false;
            } else {
                insertStatement.append(", ");
            }
            insertStatement.append(attributeType.getColumnName());
        }
        insertStatement.append(") VALUES (");
        first = true;
        for (AttributeType attributeType : metadata.getAttributeTypes()) {
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

    public static String countErrorDataStatement(MetadataDto metadata) {
        return "SELECT COUNT(1) FROM " + metadata.getEntityType().getExtensionTable() + " WHERE DIMS_COL_RESULT IS NOT NULL";
    }

    public static String selectErrorDataStatement(MetadataDto metadata) {
        StringBuilder insertStatement = new StringBuilder();
        insertStatement.append("SELECT ");
        for (AttributeType attributeType : metadata.getAttributeTypes()) {
            insertStatement.append(attributeType.getColumnName());
            insertStatement.append(", ");
        }
        insertStatement.append("DIMS_COL_RESULT, DIMS_COL_RTNAME FROM ")
                .append(metadata.getEntityType().getExtensionTable())
                .append(" WHERE DIMS_COL_RESULT IS NOT NULL");
        if (metadata.getAttributeTypes().stream().anyMatch(at -> Objects.equals(at.getColumnName(), "INT_ID"))) {
            insertStatement.append(" ORDER BY INT_ID");
        }
        insertStatement.append(" LIMIT :LIMIT OFFSET :OFFSET");
        return insertStatement.toString();
    }
    public static String selectAllDataStatement(MetadataDto metadata) {
        StringBuilder insertStatement = new StringBuilder();
        insertStatement.append("SELECT ");
        for (AttributeType attributeType : metadata.getAttributeTypes()) {
            insertStatement.append(attributeType.getColumnName());
            insertStatement.append(", ");
        }
        insertStatement.append("DIMS_COL_RESULT, DIMS_COL_RTNAME FROM ")
                .append(metadata.getEntityType().getExtensionTable());
               // .append(" WHERE DIMS_COL_RESULT IS NOT NULL");
        if (metadata.getAttributeTypes().stream().anyMatch(at -> Objects.equals(at.getColumnName(), "INT_ID"))) {
            insertStatement.append(" ORDER BY INT_ID");
        }
        insertStatement.append(" LIMIT :LIMIT OFFSET :OFFSET");
        return insertStatement.toString();
    }
}
