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
@Table(name = "dims_tm_filelocation")
@EntityListeners(AuditingEntityListener.class)
public class FileLocation {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "filelocation_id")
    private Long fileLocationId;

    @Column(name = "name")
    private String name;

    @Column(name = "host")
    private String host;

    @Column(name = "port")
    private Integer port;

    @Column(name = "schema")
    private String schema;

    @Column(name = "encoding")
    private String encoding;

    @Column(name = "path")
    private String path;

    @Column(name = "username")
    private String username;

    @Column(name = "password")
    private String password;

    @Column(name = "province")
    private String province;

    @Column(name = "specialityname")
    private String specialityName;

    @Column(name = "file_encoding")
    private String fileEncoding;

    @Column(name = "file_delimiter")
    private String fileDelimiter;

    @Column(name = "lastcollectiondate")
    private Date lastCollectionDate;

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
