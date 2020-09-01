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
@Table(schema = "information_schema", name = "tables")
@IdClass(DatabaseTable.DatabaseTableKey.class)
public class DatabaseTable {

    @Id
    @Column(name = "table_schema", insertable = false)
    private String tableSchema;

    @Id
    @Column(name = "table_name", insertable = false)
    private String tableName;

    @Column(name = "table_type", insertable = false)
    private String tableType;


    @Data
    public static class DatabaseTableKey implements Serializable {

        private String tableSchema;

        private String tableName;
    }
}
