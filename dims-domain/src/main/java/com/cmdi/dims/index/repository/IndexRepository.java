package com.cmdi.dims.index.repository;

import com.cmdi.dims.index.entity.Index;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.List;

public interface IndexRepository extends JpaRepository<Index, Long>, JpaSpecificationExecutor<Index> {

    List<Index> findBySpecialityNameAndEnable(String specialityName, Boolean enable);

    List<Index> findByCodeEndingWithAndEnable(String codeEnd, Boolean enable);

    List<Index> findByCodeEndingWithAndSpecialityNameAndEnable(String codeEnd, String specialityName, Boolean enable);

    Index findByCode(String code);
}
