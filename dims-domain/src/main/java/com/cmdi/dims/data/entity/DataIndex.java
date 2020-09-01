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
 * CREATE TABLE "dims_data_index" (
 * "id" int8 NOT NULL PRIMARY KEY defAULT nextval('seq_dims_data_index'),
 * "index_code" varchar(64) NOT NULL,
 * "index_name" varchar(255),
 * "province_code" varchar(20) NOT NULL,
 * "prefecture_code" varchar(20),
 * "county_code" varchar(20),
 * "created_at" timestamp(6) NOT NULL,
 * "speciality_name" varchar(20) NOT NULL,
 * "table_name" varchar(64) NOT NULL,
 * "data_key" varchar(255) NOT NULL,
 * "task_code" varchar(255) NOT NULL
 * )
 * ;
 */
@Data
@Entity
@Table(name = "dims_data_index")
public class DataIndex {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;
    @Column(name = "index_code")
    private String indexCode;
    @Column(name = "index_name")
    private String indexName;
    @Column(name = "province_code")
    private String provinceCode;
    @Column(name = "prefecture_code")
    private String prefectureCode;
    @Column(name = "county_code")
    private String countyCode;
    @Column(name = "speciality_name")
    private String specialityName;
    @Column(name = "table_name")
    private String tableName;
    @Column(name = "data_key")
    private String dataKey;
    @Column(name = "task_code")
    private String taskCode;
    @Column(name = "created_at")
    private Date createdAt;
}
