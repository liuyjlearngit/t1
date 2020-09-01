package com.cmdi.dims.task.repository;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.cmdi.dims.task.entity.TaskPipeline;

public interface TaskPipelineRepository extends JpaRepository<TaskPipeline, Long> {

    List<TaskPipeline> findByTypeOrderByTaskPipelineIdAsc(Integer type);

    List<TaskPipeline> findByTypeOrderByTaskPipelineIdAsc(Integer type, Pageable pageable);
}
