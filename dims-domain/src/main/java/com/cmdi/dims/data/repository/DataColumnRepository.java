package com.cmdi.dims.data.repository;

import com.cmdi.dims.data.entity.DataColumn;
import org.springframework.data.jpa.repository.JpaRepository;

import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author Administrator
 */
@Repository
public interface DataColumnRepository extends JpaRepository<DataColumn, Long> {


    /**
     *  根据核查任务编码、专业名称、表名称查询出表名的表头
     * @param taskCode
     * @param specialityName
     * @param tableName
     * @return
     */
    List<DataColumn> findByTaskCodeAndSpecialityNameAndTableName(String taskCode,String specialityName,String tableName);

}
