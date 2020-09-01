package com.cmdi.dims.index.entity;

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
@Table(name = "dims_idx_rule")
@EntityListeners(AuditingEntityListener.class)
public class Rule {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long ruleId;

    @Column(name = "name")
    private String name;

    @Column(name = "code")
    private String code;

    @Column(name = "index_id")
    private Long indexId;

    @Column(name = "attributetype_id")
    private Long attributeTypeId;

    @Column(name = "type")
    private Integer type;

    @Column(name = "rulememo")
    private String ruleMemo;

    @Column(name = "dictionaryname")
    private String dictionaryName;

    @Column(name = "ratelen")
    private Integer rateLen;

    @Column(name = "datefrom")
    private Date dateFrom;

    @Column(name = "dateto")
    private Date dateTo;

    @Column(name = "timefrom")
    private Date timeFrom;

    @Column(name = "timeto")
    private Date timeTo;

    @Column(name = "stringregex")
    private String stringRegex;

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
