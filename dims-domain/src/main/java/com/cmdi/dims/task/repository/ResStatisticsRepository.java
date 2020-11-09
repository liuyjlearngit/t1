package com.cmdi.dims.task.repository;

import com.cmdi.dims.task.entity.ResStatistics;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface ResStatisticsRepository extends JpaRepository<ResStatistics, Long>, JpaSpecificationExecutor<ResStatistics> {

    List<ResStatistics> findByTaskCode(String taskCode);

    List<ResStatistics> findByTaskCodeInAndResName(List<String> taskCodes,String name);

    List<ResStatistics> findByTaskCodeIn(List<String> taskCodes);

    List<ResStatistics> findByTaskCodeInAndProvinceAndResNameAndResType(List<String> taskCodes,String province,String resname,String restype);

    List<ResStatistics> findByTaskCodeAndProvinceAndResNameAndResType(String taskCodes,String province,String resname,String restype);

    List<ResStatistics> findByTaskCodeInAndProvinceCodeInAndSpecialityName(List<String> taskcodes,List<String> ProvinceCodes,String SpecialityNames);
}
