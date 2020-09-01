package com.cmdi.dims.system.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cmdi.dims.system.entity.Authorization;

public interface AuthorizationRepository extends JpaRepository<Authorization, Long> {

    List<Authorization> findByUserId(Long userId);
}
