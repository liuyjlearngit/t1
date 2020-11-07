package com.cmdi.dims.index.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import com.cmdi.dims.index.entity.Index;

public interface IndexRepository extends JpaRepository<Index, Long>, JpaSpecificationExecutor<Index> {

    List<Index> findByTypeAndEnableOrderByCode(Integer type, Boolean enable);
    List<Index> findByCodeInAndSpecialityNameIn(List<String> indexCodes, List<String> speciality);
    List<Index> findBySpecialityNameAndEnable(String specialityName, Boolean enable);

    List<Index> findByCodeEndingWithAndEnable(String codeEnd, Boolean enable);

    List<Index> findByCodeEndingWithAndSpecialityNameAndEnable(String codeEnd, String specialityName, Boolean enable);

    List<Index> findByIndexIdInOrderByCode(List<Long> id);
    Index findByCode(String code);
}
