package com.cmdi.dims.task.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cmdi.dims.task.entity.TaskLock;

public interface TaskLockRepository extends JpaRepository<TaskLock, Long> {

    List<TaskLock> findByProvinceAndSpecialityName(String province, String specialityName);
}
