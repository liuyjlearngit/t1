package com.cmdi.dims.task.repository;

import java.util.Date;
import java.util.List;
import java.util.Set;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import com.cmdi.dims.task.entity.Task;

public interface TaskRepository extends JpaRepository<Task, Long>, JpaSpecificationExecutor<Task> {

    List<Task> findByStatusOrderByTaskIdDesc(Integer status, Pageable pageable);

    List<Task> findByProvinceAndSpecialityNameAndCollectionDate(String province, String specialityName, Date collectionDate);

    List<Task> findByCodeIn(Set<String> codes);

    Task findByCode(String code);

    List<Task> findByProvinceAndSpecialityNameAndStatusOrderByCollectionDateDescTaskIdDesc(String province, String specialityName, Integer status, Pageable pageable);

    List<Task> findByProvinceAndSpecialityNameAndStatusOrderByCollectionDateDesc(String province, String specialityName, Integer status, Pageable pageable);
}
