package com.cmdi.dims.meta.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Version;

import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedBy;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import lombok.Data;

@Data
@Entity
@Table(name = "dims_mm_entitytype")
@EntityListeners(AuditingEntityListener.class)
public class EntityType {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long entityTypeId;

    @Column(name = "name")
    private String name;

    @Column(name = "code")
    private String code;

    @Column(name = "specialityname")
    private String specialityName;

    @Column(name = "coretable")
    private String coreTable;

    @Column(name = "extensiontable")
    private String extensionTable;

    @Column(name = "extensionattr")
    private String extensionAttr;

    @Column(name = "extensionvalue")
    private String extensionValue;

    @Version
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
