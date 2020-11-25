package com.cmdi.dims.jdbctemple.service.impl;

import com.cmdi.dims.jdbctemple.entity.MetricCityResult;
import com.cmdi.dims.jdbctemple.service.MetricCityResultService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class MetricCityResultServiceImpl implements MetricCityResultService {
    @Autowired
    @Qualifier("secondJdbcTemplate")
    protected JdbcTemplate secondJdbcTemplate;

    @Override
    public String findByversionMax() throws SQLException {
        String sql="SELECT  max (e.version) FROM metric_city_result e";
        String s = secondJdbcTemplate.queryForObject(sql, String.class);
        return s;
    }

    @Override
    public List<MetricCityResult> findByVersionAndCodeAndSpeciality(String version, String code, String speciality) {
        String str="'";
        String strs=str+version+str;
        String sql="SELECT * FROM metric_city_result WHERE \"version\"="+strs+" AND rule_no=? AND related_major=?";
        List<MetricCityResult> query = secondJdbcTemplate.query(sql, new BeanPropertyRowMapper<>(MetricCityResult.class),code,speciality);
        return query;
    }

    @Override
    public List<MetricCityResult> findByCodeAndSpeciality(String version,String code, String speciality) {
        String str="'";
        String strs=str+version+str;
        String sql="SELECT * FROM metric_city_result WHERE version="+strs+" AND area_code=? AND related_major=?";
        List<MetricCityResult> query = secondJdbcTemplate.query(sql, new BeanPropertyRowMapper<>(MetricCityResult.class),code,speciality);
        return query;
    }

    @Override
    public List<String> findByversion() {
        String sql="SELECT m.VERSION FROM metric_city_result m GROUP BY m.VERSION ORDER BY m.VERSION DESC LIMIT 5";
        List<String> query = secondJdbcTemplate.query(sql, new BeanPropertyRowMapper<>(MetricCityResult.class)).stream()
                .map(MetricCityResult::getVersion).collect(Collectors.toList());
        return query;
    }

    @Override
    public MetricCityResult findByRuleno(String ruleno) {
        String sql="SELECT * FROM metric_city_result WHERE rule_no=?";
        List<MetricCityResult> query = secondJdbcTemplate.query(sql, new BeanPropertyRowMapper<>(MetricCityResult.class),ruleno);
        MetricCityResult metricCityResult = null;
        if (query.size()>0){
             metricCityResult = query.get(0);
        }
        return metricCityResult;
    }
}
