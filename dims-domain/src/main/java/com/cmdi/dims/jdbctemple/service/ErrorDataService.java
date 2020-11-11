package com.cmdi.dims.jdbctemple.service;

import com.cmdi.dims.jdbctemple.entity.ErrorData;

import java.util.List;

public interface ErrorDataService {
    List<ErrorData> findErrorData(String areacode);

    List<ErrorData> findErrorDataCode(String name,String areacode,String specil);
    List<ErrorData> findErrorDataCodecity(String name,String areacode,String specil);
    List<ErrorData> findErrorDataCodecento(String name,String areacode,String specil);
}
