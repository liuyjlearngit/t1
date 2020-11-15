package com.cmdi.dims.jdbctemple.service.impl;

import com.cmdi.dims.jdbctemple.entity.ChkresultProvince;
import com.cmdi.dims.jdbctemple.service.ChkresultProvinceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.stereotype.Service;

import java.sql.SQLException;
import java.util.List;
@Service
public class ChkresultProvinceServiceImpl implements ChkresultProvinceService {

    @Autowired
    @Qualifier("secondJdbcTemplate")
    protected JdbcTemplate secondJdbcTemplate;

    @Override
    public String findByversionMax() throws SQLException {
        String sql="SELECT  max (e.version) FROM chkresult_statics_province_zb e";
        String s = secondJdbcTemplate.queryForObject(sql, String.class);
        return s;
    }

    @Override
    public List<ChkresultProvince> findByVersion(String version) {
        String sql="SELECT * FROM chkresult_statics_province_zb WHERE version=?";
        List<ChkresultProvince> query = secondJdbcTemplate.query(sql, new BeanPropertyRowMapper<>(ChkresultProvince.class),version);
        return query;
    }

    @Override
    public ChkresultProvince findByVersionAndName(String version, String name) {
        String sql="SELECT * FROM chkresult_statics_province_zb WHERE version=? AND province_name=?";
        List<ChkresultProvince> query = secondJdbcTemplate.query(sql, new BeanPropertyRowMapper<>(ChkresultProvince.class),version,name);
        ChkresultProvince chkresultProvince = null;
        if (query.size()>0){
            chkresultProvince = query.get(0);
        }else {
            chkresultProvince=new ChkresultProvince();
        }
        return chkresultProvince;
    }
}
