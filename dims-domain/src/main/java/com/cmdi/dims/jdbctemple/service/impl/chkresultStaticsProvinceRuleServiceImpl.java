package com.cmdi.dims.jdbctemple.service.impl;

import com.cmdi.dims.jdbctemple.entity.ChkresultStaticsProvinceRule;
import com.cmdi.dims.jdbctemple.service.chkresultStaticsProvinceRuleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import java.sql.SQLException;
import java.util.List;

@Service
public class chkresultStaticsProvinceRuleServiceImpl implements chkresultStaticsProvinceRuleService {
    @Autowired
    @Qualifier("secondJdbcTemplate")
    protected JdbcTemplate secondJdbcTemplate;


    @Override
    public String findByversionMax() throws SQLException {
        String sql="SELECT  max (e.version) FROM chkresult_statics_province_rule_zb e";
        String s = secondJdbcTemplate.queryForObject(sql, String.class);
        return s;
    }

    @Override
    public List<ChkresultStaticsProvinceRule> findByVersionAndCodeAndSpeciality(String version, String code, String speciality) {
        String sql="SELECT * FROM chkresult_statics_province_rule_zb WHERE \"version\"=? AND province_name=? AND major=? ORDER BY rule_no_org";
        List<ChkresultStaticsProvinceRule> query = secondJdbcTemplate.query(sql, new BeanPropertyRowMapper<>(ChkresultStaticsProvinceRule.class), version, code, speciality);
        return query;
    }

    @Override
    public List<ChkresultStaticsProvinceRule> findByCodeAndSpeciality(String code, String speciality) {
        return null;
    }
}
