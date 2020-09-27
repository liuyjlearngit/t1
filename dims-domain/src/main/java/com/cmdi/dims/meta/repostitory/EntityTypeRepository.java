package com.cmdi.dims.meta.repostitory;

import com.cmdi.dims.meta.entity.EntityType;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface EntityTypeRepository extends JpaRepository<EntityType, Long> {

    @Query("SELECT DISTINCT e.specialityName FROM EntityType e")
    List<String> findSpecialityNames();

    List<EntityType> findBySpecialityNameOrderByCode(String speciality);

    List<EntityType> findBySpecialityName(String SpecialityName);
}
