package com.cmdi.dims.jdbctemple.service;

import com.cmdi.dims.jdbctemple.entity.ChkresultStaticsProvinceRule;

import java.sql.SQLException;
import java.util.List;

public interface chkresultStaticsProvinceRuleService {
    String findByversionMax() throws SQLException;
    List<ChkresultStaticsProvinceRule> findByVersionAndCodeAndSpeciality(String version, String code, String speciality);

    List<ChkresultStaticsProvinceRule> findByCodeAndSpeciality(String code,String speciality);
}
