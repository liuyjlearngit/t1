package com.cmdi.dims.system.entity;

import java.io.Serializable;
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

/**
 * @author ZhongnanLI
 * @since 2018/7/29
 */
@Data
@Entity
@Table(name = "dims_sm_user", schema = "public")
@EntityListeners(AuditingEntityListener.class)
public class User implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "user_id")
    private Long userId;

    @Column(name = "name")
    private String name;

    @Column(name = "username")
    private String username;

    @Column(name = "email")
    private String email;

    @Column(name = "mobilePhone")
    private String mobilePhone;

    @Column(name = "password")
    private String password;

    @Column(name = "remark")
    private String remark;

    @Column(name = "account_expired_at")
    private Date accountExpiredAt;

    @Column(name = "password_expired_at")
    private Date passwordExpiredAt;

    @Column(name = "locked")
    private Boolean locked;

    @Column(name = "password_initialized")
    private Boolean passwordInitialized;

    @CreatedBy
    @Column(name = "created_by")
    private String createdBy;

    @CreatedDate
    @Column(name = "created_at")
    private Date createdAt;

    @LastModifiedBy
    @Column(name = "updated_by")
    private String updatedBy;

    @LastModifiedDate
    @Column(name = "updated_at")
    private Date updatedAt;

    //区域类型
    @Column(name="regiontype")
    private Integer regionType;

    //区域编码
    @Column(name="regioncode")
    private String regionCode;
}
