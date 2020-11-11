package com.cmdi.dims.jdbctemple.entity;

import lombok.Data;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;

@Data

public class VrmsProblem {

    @Column(name = "uuid")
    private String uuid;
    @Column(name = "int_id")
    private String intId;
    @Column(name = "zh_label")
    private String zhLabel;
    @Column(name = "rule_no")
    private String ruleNo;
    @Column(name = "related_major")
    private String relatedMajor;
    @Column(name = "rule_tag_name")
    private String ruleTagName;
    @Column(name = "problem_desc")
    private String problemDesc;
    @Column(name = "province")
    private String province;
    @Column(name = "city")
    private String city;
    @Column(name = "county")
    private String county;
    @Column(name = "oppsite_res_id")
    private String oppsiteResId;
    @Column(name = "oppsite_res_name")
    private String oppsiteResName;
    @Column(name = "data_source_id")
    private String dataSourceId;
    @Column(name = "version")
    private String version;
}
