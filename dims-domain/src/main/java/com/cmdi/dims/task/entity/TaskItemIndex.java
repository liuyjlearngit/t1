package com.cmdi.dims.task.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedBy;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
@Entity
@Table(name = "dims_tm_taskitem_index")
@EntityListeners(AuditingEntityListener.class)
public class TaskItemIndex {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long taskItemIndexId;

    @Column(name = "name")
    private String name;

    @Column(name = "code")
    private String code;

    @Column(name = "taskcode")
    private String taskCode;

    @Column(name = "index_id")
    private Long indexId;

    @JsonFormat(pattern = "yyyy-MM-dd")
    @Column(name = "collectiondate")
    private Date collectionDate;

    @Column(name = "province")
    private String province;

    @Column(name = "prefecture")
    private String prefecture;

    @Column(name = "county")
    private String county;

    @Column(name = "provincecode")
    private String provinceCode;

    @Column(name = "prefecturecode")
    private String prefectureCode;

    @Column(name = "countycode")
    private String countyCode;

    @Column(name = "regiontype")
    private Integer regionType;

    @Column(name = "amount")
    private Integer amount;

    @Column(name = "erroramount")
    private Integer errorAmount;

    @Column(name = "indexvalue")
    private Double indexValue;

    @Column(name = "version")
    private Long version;

    @CreatedDate
    @Column(name = "createdate")
    private Date createdAt;

    @CreatedBy
    @Column(name = "creator")
    private String createdBy;

    @LastModifiedDate
    @Column(name = "updatedate")
    private Date updatedAt;

    @LastModifiedBy
    @Column(name = "updater")
    private String updatedBy;

    @Column(name = "memo")
    private String memo;
}