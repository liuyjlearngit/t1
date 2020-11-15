package com.cmdi.dims.task.repository;

import com.cmdi.dims.task.entity.ResStatistics;
import com.cmdi.dims.task.entity.ReturnData;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Map;

public interface ResStatisticsRepository extends JpaRepository<ResStatistics, Long>, JpaSpecificationExecutor<ResStatistics> {

    List<ResStatistics> findByRegionTypeAndTaskCode(Integer type,String taskCode);

    List<ResStatistics> findByResName(String name);

    List<ResStatistics> findByRegionTypeAndTaskCodeInAndResName(Integer type,List<String> taskCodes,String name);

    List<ResStatistics> findByRegionTypeAndTaskCodeIn(Integer type,List<String> taskCodes);

    @Query(value = "select b.resType,sum (b.amount) from ResStatistics b where b.regionType='1' and b.taskCode in (:inname) and b.resName=:resname  group by b.resType")
    List<Object[]> findCodeAll(@Param("inname") List<String> inname,@Param("resname") String resname);

    @Query(value = "select sum (b.amount) from ResStatistics b where b.regionType='1' and b.taskCode in (:inname) and b.resName=:resname group by b.resName")
    String findCodeAllone(@Param("inname") List<String> inname,@Param("resname") String resname);

    @Query(value = "SELECT b.resType as resType ,sum (b.amount) as amount,b.province as province FROM ResStatistics b where b.regionType='1' and b.taskCode=:taskcode and b.resName=:resname group by b.resType,b.province")
    List<Object[]> find(@Param("taskcode") String taskcode,@Param("resname") String resname);

    @Query(value = "SELECT sum (b.amount) as amount FROM ResStatistics b where b.regionType='1' and b.taskCode=:taskcode and b.resName=:resname group by b.resName")
    String findBigAll(@Param("taskcode") String taskcode,@Param("resname") String resname);

    @Query(value = "SELECT b.resName,sum (b.amount) FROM ResStatistics b where b.regionType='1' and  b.taskCode=:taskcode group by b.resName")
    List<Object[]> findtow(@Param("taskcode") String taskcode);

    @Query(value = "SELECT b.resName FROM ResStatistics b where b.regionType='1' and  b.specialityName=:specialityname group by b.resName")
    List<String> findthree(@Param("specialityname") String specialityname);

    @Query(value = "SELECT b.resType FROM ResStatistics b where b.regionType='1' and  b.specialityName=:specialityname and b.resName=:name group by b.resType")
    List<String> findforn(@Param("specialityname") String specialityname,@Param("name") String name);

    List<ResStatistics> findByTaskCodeInAndProvinceAndResNameAndResType(List<String> taskCodes,String province,String resname,String restype);

    List<ResStatistics> findByTaskCodeAndProvinceAndResNameAndResType(String taskCodes,String province,String resname,String restype);

    List<ResStatistics> findByRegionTypeAndTaskCodeInAndProvinceCodeInAndSpecialityName(Integer type,List<String> taskcodes,List<String> ProvinceCodes,String SpecialityNames);
}
