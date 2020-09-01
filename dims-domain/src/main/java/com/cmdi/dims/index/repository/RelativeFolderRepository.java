package com.cmdi.dims.index.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cmdi.dims.index.entity.RelativeFolder;

public interface RelativeFolderRepository extends JpaRepository<RelativeFolder, Long> {

    List<RelativeFolder> findByCurrentFolderIdOrderByRelativePath(Long currentFolderId);

    List<RelativeFolder> findByWorkFolderIdOrderByRelativePath(Long workFolderId);
}
