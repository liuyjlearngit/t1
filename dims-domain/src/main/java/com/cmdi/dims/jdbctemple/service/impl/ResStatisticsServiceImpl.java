package com.cmdi.dims.jdbctemple.service.impl;

import com.cmdi.dims.jdbctemple.entity.ResStatisticsHeadquarters;
import com.cmdi.dims.jdbctemple.service.ResStatisticsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class ResStatisticsServiceImpl implements ResStatisticsService {

    @Autowired
    @Qualifier("secondJdbcTemplate")
    protected JdbcTemplate secondJdbcTemplate;

    @Override
    public List<ResStatisticsHeadquarters> findByRegionTypeAndTaskCode(String rname, String name) {
        String sql="SELECT * FROM dims_tm_res_statistics_zb WHERE collectiondate=(SELECT \"max\"(collectiondate) FROM dims_tm_res_statistics_zb)  AND specialityname=? and resname=?";
        List<ResStatisticsHeadquarters> query = secondJdbcTemplate.query(sql, new BeanPropertyRowMapper<>(ResStatisticsHeadquarters.class),name,rname);
        return query;
    }

    @Override
    public List<ResStatisticsHeadquarters> findByRegionTypeAndTaskCodeInAndResName(String name) {
        String sql="SELECT * FROM dims_tm_res_statistics_zb WHERE collectiondate=(SELECT \"max\"(collectiondate) FROM dims_tm_res_statistics_zb)  AND specialityname=?";
        List<ResStatisticsHeadquarters> query = secondJdbcTemplate.query(sql, new BeanPropertyRowMapper<>(ResStatisticsHeadquarters.class),name);
        return query;
    }

    @Override
    public List<ResStatisticsHeadquarters> findByRegionTypeAndTaskCodeIn() {
        String sql="SELECT * FROM dims_tm_res_statistics_zb WHERE collectiondate=(SELECT \"max\"(collectiondate) FROM dims_tm_res_statistics_zb)";
        List<ResStatisticsHeadquarters> query = secondJdbcTemplate.query(sql, new BeanPropertyRowMapper<>(ResStatisticsHeadquarters.class));
        return query;
    }

    @Override
    public List<ResStatisticsHeadquarters> findSplityAll(String specialityname) {
        String sql="SELECT resname,restype,unit FROM dims_tm_res_statistics_zb WHERE specialityname=? GROUP BY resname,restype,unit";
        List<ResStatisticsHeadquarters> query = secondJdbcTemplate.query(sql, new BeanPropertyRowMapper<>(ResStatisticsHeadquarters.class),specialityname);
        return query;
    }

    @Override
    public List<ResStatisticsHeadquarters> findSplityAllsql(String name) {
        String sql="SELECT restype,\"sum\"(amount) amount FROM dims_tm_res_statistics_zb WHERE specialityname in ('NFV','5GC') AND resname=? GROUP BY resname,restype";
        List<ResStatisticsHeadquarters> query = secondJdbcTemplate.query(sql, new BeanPropertyRowMapper<>(ResStatisticsHeadquarters.class),name);
        return query;
    }

    @Override
    public List<ResStatisticsHeadquarters> findSplityAllsqlong(String specialityname,String name) {
        String sql="SELECT restype,\"sum\"(amount) amount FROM dims_tm_res_statistics_zb WHERE specialityname=? AND resname=? GROUP BY resname,restype";
        List<ResStatisticsHeadquarters> query = secondJdbcTemplate.query(sql, new BeanPropertyRowMapper<>(ResStatisticsHeadquarters.class),specialityname,name);
        return query;
    }

    @Override
    public List<ResStatisticsHeadquarters> findAll(String specialityname, String big,String code) {
        String sql="SELECT restype,amount FROM dims_tm_res_statistics_zb WHERE specialityname=? AND resname=? AND province=?";
        List<ResStatisticsHeadquarters> query = secondJdbcTemplate.query(sql, new BeanPropertyRowMapper<>(ResStatisticsHeadquarters.class),specialityname,big,code);
        return query;
    }

    @Override
    public List<String> findSplityCode(String specialityname) {
        String sql="SELECT province FROM dims_tm_res_statistics_zb WHERE specialityname=? GROUP BY province";
        List<ResStatisticsHeadquarters> query = secondJdbcTemplate.query(sql, new BeanPropertyRowMapper<>(ResStatisticsHeadquarters.class),specialityname);
        List<String> collect = query.stream()
                .map(ResStatisticsHeadquarters::getProvince).collect(Collectors.toList());
        return collect;
    }

    @Override
    public List<String> findSplityCodetow() {
        String sql="SELECT province FROM dims_tm_res_statistics_zb WHERE specialityname in ('NFV','5GC') GROUP BY province";
        List<ResStatisticsHeadquarters> query = secondJdbcTemplate.query(sql, new BeanPropertyRowMapper<>(ResStatisticsHeadquarters.class));
        List<String> collect = query.stream()
                .map(ResStatisticsHeadquarters::getProvince).collect(Collectors.toList());
        return collect;
    }

    @Override
    public List<ResStatisticsHeadquarters> findByRegionTypeAndTaskCodeInAndProvinceCodeInAndSpecialityName(Integer type, List<String> taskcodes, List<String> ProvinceCodes, String SpecialityNames) {
        String sql="SELECT * FROM chkresult_statics_province WHERE version=?";
        List<ResStatisticsHeadquarters> query = secondJdbcTemplate.query(sql, new BeanPropertyRowMapper<>(ResStatisticsHeadquarters.class));
        return null;
    }
}
