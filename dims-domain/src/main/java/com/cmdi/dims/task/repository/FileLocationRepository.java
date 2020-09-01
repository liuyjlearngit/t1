package com.cmdi.dims.task.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import com.cmdi.dims.task.entity.FileLocation;

public interface FileLocationRepository extends JpaRepository<FileLocation, Long>, JpaSpecificationExecutor<FileLocation> {

    List<FileLocation> findByProvinceAndSpecialityNameIn(String province, List<String> specialities);
}
