package com.cmdi.dims.task.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import com.cmdi.dims.task.entity.TaskItemIndex;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface TaskItemIndexRepository extends JpaRepository<TaskItemIndex, Long>, JpaSpecificationExecutor<TaskItemIndex> {

    List<TaskItemIndex> findByTaskCodeOrderByTaskItemIndexId(String taskCode);

    List<TaskItemIndex> findByTaskCodeInAndCodeInAndRegionType(List<String> taskCodes, List<String> codes, Integer regionType);
    @Query(value = "SELECT b.indexValue FROM TaskItemIndex b WHERE b.taskCode=:code AND b.regionType='1' AND b.code=:codes ")
    Double findByAll(@Param("code") String code,@Param("codes") String codes);

    @Query(value = "SELECT b.indexValue FROM TaskItemIndex b WHERE b.taskCode=:code and b.prefectureCode=:procode AND b.regionType='2' AND b.code=:codes ")
    Double findByAlltow(@Param("code") String code,@Param("procode") String procode,@Param("codes") String codes);

    @Query(value = "SELECT b.indexValue FROM TaskItemIndex b WHERE b.taskCode=:code and b.countyCode=:procode AND b.regionType='3' AND b.code=:codes ")
    Double findByAllfor(@Param("code") String code,@Param("procode") String procode,@Param("codes") String codes);

    @Query(value = "SELECT sum(b.indexValue) FROM TaskItemIndex b WHERE b.taskCode in(:code) AND b.regionType='1' AND b.code=:codes ")
    Double findByone(@Param("code") List<String> code,@Param("codes") String codes);

    @Query(value = "SELECT sum(b.indexValue) FROM TaskItemIndex b WHERE b.taskCode in(:code)  AND b.regionType='1' AND b.code=:codes ")
    Double findByonetow(@Param("code") List<String> code,@Param("codes") String codes);

    @Query(value = "SELECT sum(b.indexValue) FROM TaskItemIndex b WHERE b.taskCode in(:code) and b.prefectureCode=:procode AND b.regionType='2' AND b.code=:codes ")
    Double findByonefor(@Param("code") List<String> code,@Param("procode") String procode,@Param("codes") String codes);

    List<TaskItemIndex> findByTaskCodeInAndCodeInAndPrefectureCodeAndRegionType(List<String> taskCodes, List<String> codes, String prefecutreCode, Integer regionType);

    List<TaskItemIndex> findByTaskCodeInAndCodeInAndCountyCodeAndRegionType(List<String> taskCodes, List<String> codes, String countyCode, Integer regionType);

    List<TaskItemIndex> findByTaskCodeInAndRegionType(List<String> taskCodes, Integer regionType);

    List<TaskItemIndex> findByTaskCodeInAndProvinceCodeAndRegionType(List<String> taskCodes,String procode, Integer regionType);

    List<TaskItemIndex> findByTaskCodeInAndPrefectureCodeAndRegionType(List<String> taskCodes, String prefecutreCode, Integer regionType);

    List<TaskItemIndex> findByTaskCodeInAndCountyCodeAndRegionType(List<String> taskCodes, String countyCode, Integer regionType);
}
