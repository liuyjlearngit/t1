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
@Table(name = "dims_idx_indexcarrier")
@EntityListeners(AuditingEntityListener.class)
public class IndexCarrier {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long indexCarrierId;

    @Column(name = "parentindex_id")
    private Long parentIndexId;

    @Column(name = "childindex_id")
    private Long childIndexId;

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
