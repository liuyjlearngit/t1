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
@Table(name = "dims_tm_taskitem_file")
@EntityListeners(AuditingEntityListener.class)
public class TaskItemFile {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "taskitemfile_id")
    private Long taskItemFileId;

    @Column(name = "name")
    private String name;

    @Column(name = "code")
    private String code;

    @Column(name = "taskcode")
    private String taskCode;

    @JsonFormat(pattern = "yyyy-MM-dd")
    @Column(name = "collection")
    private Date collectionDate;

    @Column(name = "province")
    private String province;

    @Column(name = "desttable")
    private String destTable;

    @Column(name = "filesize")
    private Long fileSize;

    @Column(name = "csvfile")
    private String csvFile;

    @Column(name = "csvfilesize")
    private Long csvFileSize;

    @Column(name = "filegettingcosts")
    private Long fileGettingCosts;

    @Column(name = "finishtime")
    private Date finishTime;

    @Column(name = "signature")
    private String signature;

    @Column(name = "linesize")
    private Long lineSize;

    @Column(name = "file_encoding")
    private String fileEncoding;

    @Column(name = "file_delimiter")
    private String fileDelimiter;

    @Type(type = "org.hibernate.type.NumericBooleanType")
    @Column(name = "issuccessful")
    private Boolean success;

    @Column(name = "failurereason")
    private String failureReason;

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
