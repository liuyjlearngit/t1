package com.cmdi.dims.task.repository;

import com.cmdi.dims.task.entity.ResStatistics;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.List;

public interface ResStatisticsRepository extends JpaRepository<ResStatistics, Long>, JpaSpecificationExecutor<ResStatistics> {

    List<ResStatistics> findByTaskCode(String taskCode);

}
