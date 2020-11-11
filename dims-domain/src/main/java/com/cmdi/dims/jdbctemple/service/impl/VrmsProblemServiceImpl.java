package com.cmdi.dims.jdbctemple.service.impl;

import com.cmdi.dims.jdbctemple.entity.VrmsProblem;
import com.cmdi.dims.jdbctemple.service.VrmsProblemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.SimpleFormatter;

@Service
public class VrmsProblemServiceImpl implements VrmsProblemService {
    @Autowired
    @Qualifier("secondJdbcTemplate")
    protected JdbcTemplate secondJdbcTemplate;

    @Override
    public String findByversionMax() throws SQLException, ParseException {
        String sql="SELECT max(v.version) FROM vrms_problem v";
        String s = secondJdbcTemplate.queryForObject(sql, String.class);
        String substring = s.substring(0, 10);

        return substring;
    }

    @Override
    public List<VrmsProblem> findByVersionAndCodeAndSpeciality(String version, String code, String speciality) {
        String str="'";
        String strs=str+version+"%"+str;
        String sql="SELECT * FROM vrms_problem WHERE version LIKE "+strs+" AND province=? AND related_major=?";
        List<VrmsProblem> query = secondJdbcTemplate.query(sql, new BeanPropertyRowMapper<>(VrmsProblem.class),code,speciality);
        return query;
    }
}
