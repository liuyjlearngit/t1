package com.cmdi.dims.jdbctemple.service;

import com.cmdi.dims.jdbctemple.entity.ResDataDto;
import com.cmdi.dims.jdbctemple.entity.ResStatisticsHeadquarters;

import java.util.List;

public interface ResStatisticsService {
    List<ResStatisticsHeadquarters> findByRegionTypeAndTaskCode(String type, String taskCode);

    List<ResStatisticsHeadquarters> findByRegionTypeAndTaskCodeInAndResName(String name);

    List<ResStatisticsHeadquarters> findByRegionTypeAndTaskCodeIn();

    List<ResStatisticsHeadquarters> findSplityAll(String specialityname);

    List<ResStatisticsHeadquarters> findSplityAllsql(String specialityname,String name);
    List<ResStatisticsHeadquarters> findSplityAllsqlong(String specialityname,String name);

    List<ResStatisticsHeadquarters> findAll(String specialityname,String big,String code);

    List<ResStatisticsHeadquarters> getData(String specialityname);

    List<String> findSplityCode(String specialityname);
    List<String> findSplityCodetow();

    List<String> getSpecail();
    List<ResStatisticsHeadquarters> findData(String speciality);
    List<ResStatisticsHeadquarters> findDatas(String speciality);
    String findDataOne(String speciality,String key);
    List<ResStatisticsHeadquarters> findByWLY();

    List<ResStatisticsHeadquarters> findBySpeali(String spe, List<String> spePage);

    List<String> findBigName(String zy);
    List<String> findData(String zy,String specali);
    List<Integer> findone(String zy);
    List<String> findall(String zy);
}
