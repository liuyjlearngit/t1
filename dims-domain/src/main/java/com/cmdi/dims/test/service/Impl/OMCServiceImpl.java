package com.cmdi.dims.test.service.Impl;

import com.cmdi.dims.test.dto.OMCDto;
import com.cmdi.dims.test.service.OMCService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OMCServiceImpl implements OMCService {
    @Autowired
    @Qualifier("secondJdbcTemplate")
    protected JdbcTemplate secondJdbcTemplate;

    @Override
    public List<OMCDto> getAllOMC() {
        String sql = "select * from omc";
        return secondJdbcTemplate.query(sql,new BeanPropertyRowMapper<>(OMCDto.class));
    }
}
