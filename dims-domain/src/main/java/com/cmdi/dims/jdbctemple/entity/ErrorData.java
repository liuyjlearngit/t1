package com.cmdi.dims.jdbctemple.entity;

import lombok.Data;

import javax.persistence.Column;

@Data
public class ErrorData {
    @Column(name = "rule_no")
    private String ruleNo;
    @Column(name = "rule_tag_name")
    private String ruleTagName;
    @Column(name = "rule_desc")
    private String ruleDesc;
    @Column(name = "province")
    private String province;
    @Column(name = "city")
    private String city;
    @Column(name = "county")
    private String county;
    @Column(name = "int_id")
    private String intId;
    @Column(name = "zh_label")
    private String zhLabel;
    @Column(name = "problem_desc")
    private String problemDesc;
    @Column(name = "num")
    private String num;
}
