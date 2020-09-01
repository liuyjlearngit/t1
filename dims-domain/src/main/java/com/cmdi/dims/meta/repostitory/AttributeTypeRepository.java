package com.cmdi.dims.meta.repostitory;

import java.util.List;

import com.cmdi.dims.meta.entity.AttributeType;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AttributeTypeRepository extends JpaRepository<AttributeType, Long> {

    List<AttributeType> findByEntityTypeId(Long entityTypeId);
}
