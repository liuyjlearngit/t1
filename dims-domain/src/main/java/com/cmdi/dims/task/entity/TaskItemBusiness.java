package com.cmdi.dims.task.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Type;
import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedBy;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
@Entity
@Table(name = "dims_tm_taskitem_business")
@EntityListeners(AuditingEntityListener.class)
public class TaskItemBusiness {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "taskitembusiness_id")
    private Long taskItemBusinessId;

    @Column(name = "name")
    private String name;

    @Column(name = "code")
    private String code;

    @Column(name = "taskcode")
    private String taskCode;

    @JsonFormat(pattern = "yyyy-MM-dd")
    @Column(name = "collectiondate")
    private Date collectionDate;

    @Column(name = "province")
    private String province;

    @Column(name = "prefecture")
    private String prefecture;

    @Column(name = "county")
    private String county;

    @Column(name = "regiontype")
    private Integer regionType;

    @Column(name = "amount")
    private Long amount;

    @Column(name = "originamount")
    private Long originAmount;

    @Column(name = "analysiscosts")
    private Long analysisCosts;

    @Type(type = "org.hibernate.type.NumericBooleanType")
    @Column(name = "issuccessful")
    private Boolean success;

    @Column(name = "version")
    private Long version;

    @CreatedDate
    @Column(name = "created_at")
    private Date createdAt;

    @CreatedBy
    @Column(name = "created_by")
    private String createdBy;

    @LastModifiedDate
    @Column(name = "updated_at")
    private Date updatedAt;

    @LastModifiedBy
    @Column(name = "updated_by")
    private String updatedBy;

    @Column(name = "memo")
    private String memo;
}
