package com.cmdi.dims.jdbctemple.service;

import com.cmdi.dims.jdbctemple.entity.MetricCityResult;

import java.sql.SQLException;
import java.util.List;

public interface MetricCityResultService {
    String findByversionMax() throws SQLException;

    List<MetricCityResult> findByVersionAndCodeAndSpeciality(String version,String code,String speciality);

    List<MetricCityResult> findByCodeAndSpeciality(String version,String code,String speciality);

    List<String> findByversion();

    MetricCityResult findByRuleno(String ruleno);
}
