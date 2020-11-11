package com.cmdi.dims.jdbctemple.service;

import com.cmdi.dims.jdbctemple.entity.VrmsProblem;

import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;

public interface VrmsProblemService {

    String findByversionMax() throws SQLException, ParseException;

    List<VrmsProblem> findByVersionAndCodeAndSpeciality(String version, String code, String speciality);
}
