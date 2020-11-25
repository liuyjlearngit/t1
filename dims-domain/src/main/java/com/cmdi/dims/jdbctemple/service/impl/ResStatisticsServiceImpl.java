package com.cmdi.dims.jdbctemple.service.impl;

import com.cmdi.dims.jdbctemple.entity.ResDataDto;
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
        String sql="SELECT resname,restype,unit FROM dims_tm_res_statistics_zb WHERE specialityname=? GROUP BY resname,restype,unit ORDER BY resname";
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
    public List<ResStatisticsHeadquarters> getData(String specialityname) {
        String sql="SELECT a.resname,a.restype,a.unit FROM dims_tm_res_statistics_zb a,dims_tm_res_statistics_zb b WHERE a.specialityname=? AND b.specialityname=?  GROUP BY a.resname,a.restype,a.unit ORDER BY a.resname,a.restype='总数量'\n";
        List<ResStatisticsHeadquarters> query = secondJdbcTemplate.query(sql, new BeanPropertyRowMapper<>(ResStatisticsHeadquarters.class),specialityname,specialityname);
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
    public List<String> getSpecail() {
        String sql="SELECT specialityname FROM dims_tm_res_statistics_zb GROUP BY specialityname order by specialityname";
        List<ResStatisticsHeadquarters> query = secondJdbcTemplate.query(sql, new BeanPropertyRowMapper<>(ResStatisticsHeadquarters.class));
        List<String> collect = query.stream()
                .map(ResStatisticsHeadquarters::getSpecialityName).collect(Collectors.toList());
        return collect;
    }

    @Override
    public List<ResStatisticsHeadquarters> findData(String speciality) {
        String sql="SELECT resName,resType,sum (amount) amount,unit FROM dims_tm_res_statistics_zb WHERE specialityname=? GROUP BY resName,resType,unit";
        List<ResStatisticsHeadquarters> query = secondJdbcTemplate.query(sql, new BeanPropertyRowMapper<>(ResStatisticsHeadquarters.class), speciality);
        return query;
    }

    @Override
    public List<ResStatisticsHeadquarters> findDatas(String speciality) {
        String sql="SELECT resName,sum (amount) amount FROM dims_tm_res_statistics_zb WHERE specialityname=? GROUP BY resName";
        List<ResStatisticsHeadquarters> query = secondJdbcTemplate.query(sql, new BeanPropertyRowMapper<>(ResStatisticsHeadquarters.class), speciality);
        return query;
    }

    @Override
    public String findDataOne(String speciality, String key) {
        String sql="SELECT sum (amount) amount FROM dims_tm_res_statistics_zb WHERE specialityname=? and resName=? GROUP BY resName";
        String query = secondJdbcTemplate.queryForObject(sql, String.class,speciality,key);
        return query;
    }

    @Override
    public List<ResStatisticsHeadquarters> findByWLY() {
        String sql="SELECT * FROM dims_tm_res_statistics_zb WHERE specialityname='网络云' AND province in('东北大区','华北大区','西北大区','西南大区','华东北大区','华东南大区','华中大区','华南大区')";
        List<ResStatisticsHeadquarters> query = secondJdbcTemplate.query(sql, new BeanPropertyRowMapper<>(ResStatisticsHeadquarters.class));
        return query;
    }

    @Override
    public List<ResStatisticsHeadquarters> findBySpeali(String spe, List<String> spePage) {
        String str="";
        for (String string:spePage) {
            str+="'"+string+"',";
        }
        String substring = str.substring(0, str.length() - 1);
        String sql="SELECT resname,restype,amount,unit FROM dims_tm_res_statistics_zb WHERE specialityname=? AND resname in ("+substring+")";
        List<ResStatisticsHeadquarters> query = secondJdbcTemplate.query(sql, new BeanPropertyRowMapper<>(ResStatisticsHeadquarters.class),spe);
        return query;
    }

    @Override
    public List<String> findBigName(String zy) {
        String sql="SELECT resname FROM dims_tm_res_statistics_zb WHERE specialityname=? GROUP BY resname ORDER BY resname";
        List<ResStatisticsHeadquarters> query = secondJdbcTemplate.query(sql, new BeanPropertyRowMapper<>(ResStatisticsHeadquarters.class),zy);
        List<String> collect = query.stream()
                .map(ResStatisticsHeadquarters::getResName).collect(Collectors.toList());
        return collect;
    }

    @Override
    public List<String> findData(String zy, String specali) {
        String sql="SELECT \"sum\"(b.amount) sum FROM dims_tm_res_statistics_zb a,dims_tm_res_statistics_zb b WHERE a.specialityname=? AND b.specialityname=? AND b.province=?  GROUP BY a.resname,a.restype ORDER BY a.resname,a.restype='总数量' \n";
        List<ResStatisticsHeadquarters> query = secondJdbcTemplate.query(sql, new BeanPropertyRowMapper<>(ResStatisticsHeadquarters.class),zy,zy,specali);
        List<String> collect = query.stream()
                .map(ResStatisticsHeadquarters::getSum).collect(Collectors.toList());
        return collect;
    }

    @Override
    public List<Integer> findone(String zy) {
        String sql="SELECT \"count\"(resname) su FROM dims_tm_res_statistics_zb WHERE specialityname=? GROUP BY resname ORDER BY resname";
        List<ResStatisticsHeadquarters> query = secondJdbcTemplate.query(sql, new BeanPropertyRowMapper<>(ResStatisticsHeadquarters.class),zy);
        List<Integer> collect = query.stream()
                .map(ResStatisticsHeadquarters::getSu).collect(Collectors.toList());
        return collect;
    }

    @Override
    public List<String> findall(String zy) {
        String sql="SELECT \"sum\"(amount)  FROM dims_tm_res_statistics_zb WHERE specialityname=? GROUP BY resname,restype ORDER BY resname,restype='总数量' ";
        List<ResStatisticsHeadquarters> query = secondJdbcTemplate.query(sql, new BeanPropertyRowMapper<>(ResStatisticsHeadquarters.class),zy);
        List<String> collect = query.stream()
                .map(ResStatisticsHeadquarters::getSum).collect(Collectors.toList());
        return collect;
    }


}
