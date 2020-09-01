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

import lombok.Data;

@Data
@Entity
@Table(name = "dims_tm_filevalidation")
@EntityListeners(AuditingEntityListener.class)
public class FileValidation {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "filevalidation_id")
    private Long fileValidationId;

    @Column(name = "filelocation_id")
    private Long fileLocationId;

    @Column(name = "taskconfig_id")
    private Long taskConfigId;

    @Column(name = "desttable")
    private String destTable;

    @Column(name = "entityname")
    private String entityName;

    @Column(name = "csvfile")
    private String csvFile;

    @Column(name = "validationresult")
    private String validationResult;

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
}
