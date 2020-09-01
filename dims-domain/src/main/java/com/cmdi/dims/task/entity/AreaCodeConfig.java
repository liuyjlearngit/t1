package com.cmdi.dims.task.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Data
@Entity
@Table(name = "dims_tm_areacodeconfig")
public class AreaCodeConfig {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "code")
    private String code;

    @Column(name = "name")
    private String name;

    @Column(name = "regiontype")
    private Integer regionType;

    @Column(name = "provincecode")
    private String provinceCode;

    @Column(name = "prefecturecode")
    private String prefectureCode;
}
