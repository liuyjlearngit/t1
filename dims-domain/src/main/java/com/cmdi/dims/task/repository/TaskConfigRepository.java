package com.cmdi.dims.task.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import com.cmdi.dims.task.entity.TaskConfig;

public interface TaskConfigRepository extends JpaRepository<TaskConfig, Long>, JpaSpecificationExecutor<TaskConfig> {

    List<TaskConfig> findByProvinceAndSpecialityName(String province, String specialityName);
}
