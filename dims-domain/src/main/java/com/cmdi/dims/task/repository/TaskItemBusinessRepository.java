package com.cmdi.dims.task.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cmdi.dims.task.entity.TaskItemBusiness;

public interface TaskItemBusinessRepository extends JpaRepository<TaskItemBusiness, Long> {

    List<TaskItemBusiness> findByTaskCodeOrderByTaskItemBusinessIdAsc(String taskCode);

    List<TaskItemBusiness> findByTaskCodeAndCode(String taskCode, String code);
}
