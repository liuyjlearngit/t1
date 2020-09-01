package com.cmdi.dims.meta.repostitory;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.cmdi.dims.meta.entity.EntityType;

public interface EntityTypeRepository extends JpaRepository<EntityType, Long> {

    @Query("SELECT e FROM EntityType e WHERE e.coreTable IS NULL ORDER BY e.extensionTable")
    List<EntityType> findMetaEntityType();

    @Query("SELECT e FROM EntityType e WHERE e.coreTable=:coreTable ORDER BY e.extensionTable")
    List<EntityType> findEntityType(@Param("coreTable") String coreTable);

    @Query("SELECT e FROM EntityType e WHERE e.code=:extensionTable")
    EntityType findMetaEntityType(@Param("extensionTable") String extensionTable);

    EntityType findByCodeAndSpecialityName(String code, String specialityName);

    @Query("SELECT DISTINCT e.specialityName FROM EntityType e")
    List<String> findSpecialityNames();

    List<EntityType> findBySpecialityNameOrderByCode(String speciality);
}
