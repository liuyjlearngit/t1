package com.cmdi.dims.data.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

/**
 * CREATE TABLE "dims_data_column" (
 * "id" int8 NOT NULL PRIMARY KEY defAULT nextval('seq_dims_data_column'),
 * "speciality_name" varchar(20) NOT NULL,
 * "table_name" varchar(64) NOT NULL,
 * "columns" text NOT NULL,
 * "task_code" varchar(255) NOT NULL,
 * "created_at" timestamp(6)
 * )
 * ;
 */
@Data
@Entity
@Table(name = "dims_data_column")
public class DataColumn {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;
    @Column(name = "speciality_name")
    private String specialityName;
    @Column(name = "table_name")
    private String tableName;
    @Column(name = "columns")
    private String columns;
    @Column(name = "task_code")
    private String taskCode;
    @Column(name = "created_at")
    private Date createdAt;
}
