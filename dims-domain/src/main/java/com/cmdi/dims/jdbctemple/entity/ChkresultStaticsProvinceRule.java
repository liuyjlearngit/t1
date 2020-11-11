package com.cmdi.dims.jdbctemple.entity;

import lombok.Data;

import javax.persistence.Column;

@Data
public class ChkresultStaticsProvinceRule {

    @Column(name = "province_name")
    private String provinceName;
    @Column(name = "major")
    private String major;
    @Column(name = "check_type")
    private String checkType;
    @Column(name = "rule_no_org")
    private String ruleNoOrg;
    @Column(name = "rule_name")
    private String ruleName;
    @Column(name = "rule_desc")
    private String ruleDesc;
    @Column(name = "check_object")
    private String checkObject;
    @Column(name = "checked_tables")
    private String checkedTables;
    @Column(name = "cmpsign")
    private String cmpsign;
    @Column(name = "baselimit")
    private String baselimit;
    @Column(name = "passrate")
    private String passrate;
    @Column(name = "passresult")
    private String passresult;
    @Column(name = "error_num")
    private Integer errorNum;
    @Column(name = "passed_num")
    private Integer passedNum;
    @Column(name = "passed_record_num")
    private Integer passedRecordNum;
    @Column(name = "total_num")
    private Integer totalNum;
    @Column(name = "total_record_num")
    private Integer totalRecordNum;
    @Column(name = "version")
    private String version;
}
