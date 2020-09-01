package com.cmdi.dims.index.service;

import java.util.List;

import com.cmdi.dims.index.entity.Folder;

public interface FolderService {

    Folder createFolder(Folder parent, String name);

    Folder renameFolder(Folder folder, String newName);

    void deleteFolder(Folder folder, boolean cascade);

    Folder findByFolderId(Long folderId);

    List<Folder> findByParentFolderId(Long parentFolderId);
}
