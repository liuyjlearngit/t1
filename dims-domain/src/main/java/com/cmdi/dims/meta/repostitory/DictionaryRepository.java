package com.cmdi.dims.meta.repostitory;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cmdi.dims.meta.entity.Dictionary;

public interface DictionaryRepository extends JpaRepository<Dictionary, Long> {

    List<Dictionary> findByDictionaryTypeId(Long dictionaryTypeId);
}
