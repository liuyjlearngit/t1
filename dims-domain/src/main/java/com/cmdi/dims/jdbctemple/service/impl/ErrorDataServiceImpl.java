package com.cmdi.dims.jdbctemple.service.impl;

import com.cmdi.dims.jdbctemple.entity.ErrorData;
import com.cmdi.dims.jdbctemple.service.ErrorDataService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ErrorDataServiceImpl implements ErrorDataService {

    @Autowired
    @Qualifier("secondJdbcTemplate")
    protected JdbcTemplate secondJdbcTemplate;

    @Override
    public List<ErrorData> findErrorData(String areacode) {
        String sql="select a.rule_no,string_agg(a.rule_tag_name,';') as rule_tag_name,string_agg(b.description,';') as rule_desc,string_agg(a.province,';') as province,string_agg(a.city,';') as city,string_agg(a.county,';') as county,a.int_id,string_agg(a.zh_label,';') as zh_label,string_agg(b.check_object||' : '||a.problem_desc||' (核查字段是：'||b.check_field||')',';') as problem_desc,count(*) as num from vrms_problem a,qualitis_specialrule b where version = (select max(version) from vrms_problem) and a.rule_no = b.sequence and a.rule_tag_name = '资源完整性核查' and a.rule_no LIKE 'transi-1%' AND a.province in("+areacode+") group by a.int_id,a.rule_no";
        List<ErrorData> query = secondJdbcTemplate.query(sql, new BeanPropertyRowMapper<>(ErrorData.class));
        return query;
    }

    @Override
    public List<ErrorData> findErrorDataCode(String name,String areacode, String specil) {
        String sql="select a.rule_no,string_agg(a.rule_tag_name,';') as rule_tag_name,string_agg(b.description,';') as rule_desc,string_agg(a.province,';') as province,string_agg(a.city,';') as city,string_agg(a.county,';') as county,a.int_id,string_agg(a.zh_label,';') as zh_label,string_agg(b.check_object||' : '||a.problem_desc||' (核查字段是：'||b.check_field||')',';') as problem_desc,count(*) as num from vrms_problem a,qualitis_specialrule b where version = (select max(version) from vrms_problem) and a.rule_no = b.sequence and a.rule_tag_name = ?  and a.rule_no LIKE '"+specil+"%' AND a.province=? group by a.int_id,a.rule_no";
        List<ErrorData> query = secondJdbcTemplate.query(sql, new BeanPropertyRowMapper<>(ErrorData.class),name,areacode);
        return query;
    }

    @Override
    public List<ErrorData> findErrorDataCodecity(String name, String areacode, String specil) {
        String sql="select a.rule_no,string_agg(a.rule_tag_name,';') as rule_tag_name,string_agg(b.description,';') as rule_desc,string_agg(a.province,';') as province,string_agg(a.city,';') as city,string_agg(a.county,';') as county,a.int_id,string_agg(a.zh_label,';') as zh_label,string_agg(b.check_object||' : '||a.problem_desc||' (核查字段是：'||b.check_field||')',';') as problem_desc,count(*) as num from vrms_problem a,qualitis_specialrule b where version = (select max(version) from vrms_problem) and a.rule_no = b.sequence and a.rule_tag_name = ?  and a.rule_no LIKE '"+specil+"%' AND a.province=? group by a.int_id,a.rule_no";
        List<ErrorData> query = secondJdbcTemplate.query(sql, new BeanPropertyRowMapper<>(ErrorData.class),name,areacode);
        return query;
    }

    @Override
    public List<ErrorData> findErrorDataCodecento(String name, String areacode, String specil) {
        String sql="select a.rule_no,string_agg(a.rule_tag_name,';') as rule_tag_name,string_agg(b.description,';') as rule_desc,string_agg(a.province,';') as province,string_agg(a.city,';') as city,string_agg(a.county,';') as county,a.int_id,string_agg(a.zh_label,';') as zh_label,string_agg(b.check_object||' : '||a.problem_desc||' (核查字段是：'||b.check_field||')',';') as problem_desc,count(*) as num from vrms_problem a,qualitis_specialrule b where version = (select max(version) from vrms_problem) and a.rule_no = b.sequence and a.rule_tag_name = ?  and a.rule_no LIKE '"+specil+"%' AND a.province=? group by a.int_id,a.rule_no";
        List<ErrorData> query = secondJdbcTemplate.query(sql, new BeanPropertyRowMapper<>(ErrorData.class),name,areacode);
        return query;
    }
}
