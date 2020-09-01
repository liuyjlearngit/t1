package com.cmdi.dims.index.repository;

import java.util.List;
import java.util.Set;

import com.cmdi.dims.index.entity.FolderIndex;
import org.springframework.data.jpa.repository.JpaRepository;

public interface FolderIndexRepository extends JpaRepository<FolderIndex, Long> {

    List<FolderIndex> findByFolderId(Long folderId);

    List<FolderIndex> findByFolderIdIn(Set<Long> folderIds);

    List<FolderIndex> findByFolderIdAndIndexIdIn(Long folderId, List<Long> indexIds);
}
