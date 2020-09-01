package com.cmdi.dims.data.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

/**
 * CREATE TABLE "dims_data_storage" (
 * "id" int8 NOT NULL PRIMARY KEY defAULT nextval('seq_dims_data_storage'),
 * "task_code" varchar(255) NOT NULL,
 * "data_key" varchar(255) NOT NULL,
 * "speciality_name" varchar(20) NOT NULL,
 * "table_name" varchar(64) NOT NULL,
 * "data" text NOT NULL,
 * "created_at" timestamp(6) NOT NULL
 * )
 * ;
 */
@Data
@Entity
@Table(name = "dims_data_storage")
public class DataStorage {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;
    @Column(name = "task_code")
    private String taskCode;
    @Column(name = "data_key")
    private String dataKey;
    @Column(name = "speciality_name")
    private String specialityName;
    @Column(name = "table_name")
    private String tableName;
    @Column(name = "data")
    private String data;
    @Column(name = "created_at")
    private String createdAt;
}
