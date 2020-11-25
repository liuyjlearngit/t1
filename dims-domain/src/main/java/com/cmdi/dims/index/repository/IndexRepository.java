package com.cmdi.dims.index.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import com.cmdi.dims.index.entity.Index;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface IndexRepository extends JpaRepository<Index, Long>, JpaSpecificationExecutor<Index> {

    List<Index> findByTypeAndEnableOrderByCode(Integer type, Boolean enable);
    List<Index> findByCodeInAndSpecialityNameIn(List<String> indexCodes, List<String> speciality);
    List<Index> findBySpecialityNameAndEnable(String specialityName, Boolean enable);


    List<Index> findByCodeEndingWithAndEnable(String codeEnd, Boolean enable);

    List<Index> findByCodeEndingWithAndSpecialityNameAndEnable(String codeEnd, String specialityName, Boolean enable);
    @Query(value = "SELECT a.code FROM Index a WHERE a.ordinal=:orde AND a.specialityName=:spe")
    String findbyne(@Param("orde") Integer orde, @Param("spe") String spe);

    List<Index> findByIndexIdInOrderByCode(List<Long> id);
    Index findByCode(String code);
}
