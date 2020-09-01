package com.cmdi.dims.task.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cmdi.dims.task.entity.TaskLatest;

public interface TaskLatestRepository extends JpaRepository<TaskLatest, Long> {

    List<TaskLatest> findByProvinceAndSpecialityName(String province, String specialityName);

    List<TaskLatest> findBySpecialityName(String specialityName);

    List<TaskLatest> findByProvince(String province);
}
