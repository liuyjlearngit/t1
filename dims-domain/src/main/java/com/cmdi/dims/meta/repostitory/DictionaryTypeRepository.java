package com.cmdi.dims.meta.repostitory;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cmdi.dims.meta.entity.DictionaryType;

public interface DictionaryTypeRepository extends JpaRepository<DictionaryType, Long> {

    DictionaryType findByCode(String code);
}
