package com.cmdi.dims.test.entity;

import lombok.Data;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;

@Data
@Entity
@Table(name = "omc")
@EntityListeners(AuditingEntityListener.class)
public class OMC {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "int_id")
    private Long int_id;

    @Column(name = "zh_lable")
    private String zh_lable;

    @Column(name = "vendor_id")
    private String vendor_id;

    @Column(name = "ip_addr")
    private String ip_addr;

    @Column(name = "province_id")
    private String province_id;

    @Column(name = "city_id")
    private String city_id;

    @Column(name = "county_id")
    private String county_id;

    @Column(name = "dims_col_result")
    private String dims_col_result;

    @Column(name = "dims_col_rtname")
    private String dims_col_rtname;
}
