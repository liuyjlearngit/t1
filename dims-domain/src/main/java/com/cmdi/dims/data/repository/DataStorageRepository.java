package com.cmdi.dims.data.repository;

import com.cmdi.dims.data.entity.DataStorage;
import org.springframework.data.jpa.repository.JpaRepository;

public interface DataStorageRepository extends JpaRepository<DataStorage, Long> {
}
