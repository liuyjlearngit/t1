package com.cmdi.dims.task.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cmdi.dims.task.entity.TaskLatest;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface TaskLatestRepository extends JpaRepository<TaskLatest, Long> {

    List<TaskLatest> findByProvinceAndSpecialityName(String province, String specialityName);

    List<TaskLatest> findBySpecialityName(String specialityName);

    List<TaskLatest> findByProvince(String province);

    @Query(value ="SELECT b.taskCode FROM TaskLatest b WHERE b.province=:pro AND b.specialityName=:spe")
    String findByAll(@Param("pro") String pro,@Param("spe") String spe);

    @Query(value ="SELECT b.taskCode FROM TaskLatest b WHERE b.province=:pro")
    List<String> findByAll(@Param("pro") String pro);

    @Query(value ="SELECT b.taskCode FROM TaskLatest b where b.specialityName=:spe")
    List<String> findBys(@Param("spe") String spe);

    List<TaskLatest> findBySpecialityNameIn(List<String> codes);
}
