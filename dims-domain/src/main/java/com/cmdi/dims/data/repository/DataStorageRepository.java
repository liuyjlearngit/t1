package com.cmdi.dims.data.repository;

import com.cmdi.dims.data.entity.DataStorage;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface DataStorageRepository extends JpaRepository<DataStorage, Long> {
    List<DataStorage> findByTaskCodeIn(List<String> codes);
}
