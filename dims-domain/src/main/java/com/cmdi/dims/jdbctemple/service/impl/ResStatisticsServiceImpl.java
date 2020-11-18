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
        String sql="SELECT * FROM dims_tm_res_statistics_zb WHERE   specialityname=? and resname=?";
        List<ResStatisticsHeadquarters> query = secondJdbcTemplate.query(sql, new BeanPropertyRowMapper<>(ResStatisticsHeadquarters.class),name,rname);
        return query;
    }

    @Override
    public List<ResStatisticsHeadquarters> findByRegionTypeAndTaskCodeInAndResName(String name) {
        String sql="SELECT * FROM dims_tm_res_statistics_zb WHERE  specialityname=?";
        List<ResStatisticsHeadquarters> query = secondJdbcTemplate.query(sql, new BeanPropertyRowMapper<>(ResStatisticsHeadquarters.class),name);
        return query;
    }

    @Override
    public List<ResStatisticsHeadquarters> findByRegionTypeAndTaskCodeIn() {
        String sql="SELECT * FROM dims_tm_res_statistics_zb ";
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
    public List<ResStatisticsHeadquarters> findSplityAllsql(String specialityname,String name) {
        String sql="SELECT restype,\"sum\"(amount) amount FROM dims_tm_res_statistics_zb WHERE specialityname=? AND province NOT like '%大区' AND resname=? GROUP BY resname,restype";
        List<ResStatisticsHeadquarters> query = secondJdbcTemplate.query(sql, new BeanPropertyRowMapper<>(ResStatisticsHeadquarters.class),specialityname,name);
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
        String sql="SELECT restype,amount FROM dims_tm_res_statistics_zb WHERE specialityname=? AND province=? AND resname=?";
        List<ResStatisticsHeadquarters> query = secondJdbcTemplate.query(sql, new BeanPropertyRowMapper<>(ResStatisticsHeadquarters.class),specialityname,code,big);
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
        String sql="SELECT province FROM dims_tm_res_statistics_zb WHERE specialityname='网络云' AND province in('东北大区','华北大区','西北大区','西南大区','华东北大区','华东南大区','华中大区','华南大区') GROUP BY province";
        List<ResStatisticsHeadquarters> query = secondJdbcTemplate.query(sql, new BeanPropertyRowMapper<>(ResStatisticsHeadquarters.class));
        List<String> collect = query.stream()
                .map(ResStatisticsHeadquarters::getProvince).collect(Collectors.toList());
        return collect;
    }

    @Override
    public List<ResStatisticsHeadquarters> findByWLY() {
        String sql="SELECT * FROM dims_tm_res_statistics_zb WHERE specialityname='网络云' AND province in('东北大区','华北大区','西北大区','西南大区','华东北大区','华东南大区','华中大区','华南大区')";
        List<ResStatisticsHeadquarters> query = secondJdbcTemplate.query(sql, new BeanPropertyRowMapper<>(ResStatisticsHeadquarters.class));
        return query;
    }


}
