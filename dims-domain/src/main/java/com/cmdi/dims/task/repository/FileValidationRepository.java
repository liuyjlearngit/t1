package com.cmdi.dims.task.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cmdi.dims.task.entity.FileValidation;

public interface FileValidationRepository extends JpaRepository<FileValidation, Long> {

    List<FileValidation> findByTaskConfigIdOrderByDestTable(Long taskConfigId);

    List<FileValidation> findByTaskConfigIdInOrderByTaskConfigId(List<Long> taskConfigIds);
}
