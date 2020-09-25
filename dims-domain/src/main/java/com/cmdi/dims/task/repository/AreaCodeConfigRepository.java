package com.cmdi.dims.task.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cmdi.dims.task.entity.AreaCodeConfig;

public interface AreaCodeConfigRepository extends JpaRepository<AreaCodeConfig, String> {
    //查询省级
    List<AreaCodeConfig> findByRegionTypeOrderByCode(Integer regionType);
    //查询市级
    List<AreaCodeConfig> findByProvinceCodeAndRegionTypeOrderByCode(String provinceCode, Integer regionType);
    //查询县级
    List<AreaCodeConfig> findByPrefectureCodeAndRegionTypeOrderByCode(String prefectureCode, Integer regionType);

    AreaCodeConfig findByCodeOrderByRegionTypeDesc(String region);
    AreaCodeConfig findByCode(String code);

}
