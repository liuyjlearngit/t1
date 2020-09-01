package com.cmdi.dims.index.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cmdi.dims.index.entity.Rule;

public interface RuleRepository extends JpaRepository<Rule, Long> {
}
