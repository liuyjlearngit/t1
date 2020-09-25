package com.cmdi.dims.index.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cmdi.dims.index.entity.IndexCarrier;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.List;

public interface IndexCarrierRepository extends JpaRepository<IndexCarrier, Long>{
    List<IndexCarrier> findByParentIndexId(Long id);
}
