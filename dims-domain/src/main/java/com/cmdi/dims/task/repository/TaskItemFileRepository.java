package com.cmdi.dims.task.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cmdi.dims.task.entity.TaskItemFile;

public interface TaskItemFileRepository extends JpaRepository<TaskItemFile, Long> {

    List<TaskItemFile> findByTaskCodeOrderByTaskItemFileId(String taskId);

    List<TaskItemFile> findByTaskCodeAndCode(String taskCode, String code);
}
