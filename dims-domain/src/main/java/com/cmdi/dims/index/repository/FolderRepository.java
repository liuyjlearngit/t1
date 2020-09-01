package com.cmdi.dims.index.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cmdi.dims.index.entity.Folder;

public interface FolderRepository extends JpaRepository<Folder, Long> {

    Folder findByParentFolderIdAndName(Long parentFolderId, String name);

    List<Folder> findByParentFolderIdOrderByName(Long parentFolderId);
}
