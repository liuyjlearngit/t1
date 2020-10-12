package com.cmdi.dims.data.repository;

import com.cmdi.dims.data.entity.DataStorage;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface DataStorageRepository extends JpaRepository<DataStorage, Long> {
    List<DataStorage> findByTaskCodeIn(List<String> codes);
    List<DataStorage> findByTaskCodeInAndPrefectureCode(List<String> codes,String prefect);
    List<DataStorage> findByTaskCodeInAndCountyCode(List<String> codes,String count);

}
