package com.cmdi.dims.jdbctemple.entity;

import lombok.Data;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;

@Data
@EntityListeners(AuditingEntityListener.class)
public class MetricCityResult {

    @Column(name = "id")
    private String id;
    @Column(name = "area_code")
    private String areaCode;
    @Column(name = "area_name")
    private String areaName;
    @Column(name = "check_object")
    private String checkObject;
    @Column(name = "checked_tables")
    private String checkedTables;
    @Column(name = "create_time")
    private String createTime;
    @Column(name = "data_source_id")
    private String dataSourceId;
    @Column(name = "detail_sql_result_num")
    private String detailSqlResultNum;
    @Column(name = "empty_tables")
    private String emptyTables;
    @Column(name = "end_time")
    private String endTime;
    @Column(name = "has_empty_table")
    private String hasEmptyTable;
    @Column(name = "is_pass")
    private String isPass;
    @Column(name = "job_id")
    private String jobId;
    @Column(name = "job_instance_id")
    private String jobInstanceId;
    @Column(name = "problem_desc")
    private String problemDesc;
    @Column(name = "province")
    private String province;
    @Column(name = "province_code")
    private String provinceCode;
    @Column(name = "ratio")
    private String ratio;
    @Column(name = "related_major")
    private String relatedMajor;
    @Column(name = "result")
    private String result;
    @Column(name = "rule_desc")
    private String ruleDesc;
    @Column(name = "rule_id")
    private String ruleId;
    @Column(name = "rule_name")
    private String ruleName;
    @Column(name = "rule_no")
    private String ruleNo;
    @Column(name = "rule_tag")
    private String ruleTag;
    @Column(name = "rule_tag_name")
    private String ruleTagName;
    @Column(name = "sql_detail_text")
    private String sqlDetailText;
    @Column(name = "sql_fail_reason")
    private String sqlFailReason;
    @Column(name = "sql_statistic_text")
    private String sqlStatisticText;
    @Column(name = "start_time")
    private String startTime;
    @Column(name = "verification_desc")
    private String verificationDesc;
    @Column(name = "verification_field")
    private String verificationField;
    @Column(name = "verification_table")
    private String verificationTable;
    @Column(name = "verification_target")
    private String verificationTarget;
    @Column(name = "recheck_state")
    private String recheckState;
    @Column(name = "version")
    private String version;
}
