package com.cmdi.dims.database.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.Table;

import lombok.Data;

@Data
@Entity
@Table(schema = "information_schema", name = "columns")
@IdClass(DatabaseColumn.DatabaseColumnKey.class)
public class DatabaseColumn {

    @Id
    @Column(name = "table_schema", insertable = false)
    private String tableSchema;

    @Id
    @Column(name = "table_name", insertable = false)
    private String tableName;

    @Id
    @Column(name = "column_name", insertable = false)
    private String columnName;

    @Column(name = "ordinal_position", insertable = false)
    private Integer ordinalPosition;

    @Column(name = "is_nullable", insertable = false)
    private String isNullable;

    @Column(name = "udt_name", insertable = false)
    private String dataType;

    @Column(name = "character_maximum_length", insertable = false)
    private Integer maxStringLength;

    @Data
    public static class DatabaseColumnKey implements Serializable {
        private String tableSchema;

        private String tableName;

        private String columnName;
    }

}
