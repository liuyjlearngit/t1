package com.cmdi.dims.task.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import com.cmdi.dims.task.entity.TaskItemIndex;

public interface TaskItemIndexRepository extends JpaRepository<TaskItemIndex, Long>, JpaSpecificationExecutor<TaskItemIndex> {

    List<TaskItemIndex> findByTaskCodeOrderByTaskItemIndexId(String taskCode);

    List<TaskItemIndex> findByTaskCodeInAndCodeInAndRegionType(List<String> taskCodes, List<String> codes, Integer regionType);

    List<TaskItemIndex> findByTaskCodeInAndCodeInAndPrefectureCodeAndRegionType(List<String> taskCodes, List<String> codes, String prefecutreCode, Integer regionType);

    List<TaskItemIndex> findByTaskCodeInAndCodeInAndCountyCodeAndRegionType(List<String> taskCodes, List<String> codes, String countyCode, Integer regionType);

    List<TaskItemIndex> findByTaskCodeInAndRegionType(List<String> taskCodes, Integer regionType);

    List<TaskItemIndex> findByTaskCodeInAndProvinceCodeAndRegionType(List<String> taskCodes,String procode, Integer regionType);

    List<TaskItemIndex> findByTaskCodeInAndPrefectureCodeAndRegionType(List<String> taskCodes, String prefecutreCode, Integer regionType);

    List<TaskItemIndex> findByTaskCodeInAndCountyCodeAndRegionType(List<String> taskCodes, String countyCode, Integer regionType);
}
