package com.cmdi.dims.jdbctemple.service;

import com.cmdi.dims.jdbctemple.entity.ChkresultProvince;

import java.sql.SQLException;
import java.util.List;

public interface ChkresultProvinceService {
    String findByversionMax() throws SQLException;
    List<ChkresultProvince> findByVersion(String version);

    ChkresultProvince findByVersionAndName(String version,String name);
}
