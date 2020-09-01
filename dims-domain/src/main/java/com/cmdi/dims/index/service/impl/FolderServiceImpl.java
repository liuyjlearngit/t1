package com.cmdi.dims.index.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import com.cmdi.dims.index.entity.Folder;
import com.cmdi.dims.index.entity.FolderIndex;
import com.cmdi.dims.index.entity.RelativeFolder;
import com.cmdi.dims.index.repository.FolderIndexRepository;
import com.cmdi.dims.index.repository.FolderRepository;
import com.cmdi.dims.index.repository.RelativeFolderRepository;
import com.cmdi.dims.index.service.FolderService;

@Service
public class FolderServiceImpl implements FolderService {

    @Autowired
    FolderRepository folderRepository;
    @Autowired
    RelativeFolderRepository relativeFolderRepository;
    @Autowired
    FolderIndexRepository folderIndexRepository;

    @Transactional
    @Override
    public Folder createFolder(Folder parent, String name) {

        Folder exists = folderRepository.findByParentFolderIdAndName(null != parent ? parent.getFolderId() : null, name);
        Assert.isNull(exists, "在当前目录内已经存在名称");

        Folder folder = new Folder();
        folder.setName(name);
        List<RelativeFolder> parentRelativeFolders = null;
        if (null != parent) {
            folder.setParentFolderId(parent.getFolderId());
            parentRelativeFolders = relativeFolderRepository.findByCurrentFolderIdOrderByRelativePath(parent.getFolderId());
        }
        Folder currentFolder = folderRepository.save(folder);
        List<RelativeFolder> currentRelativeFolders = new ArrayList<>();
        if (null != parentRelativeFolders) {
            parentRelativeFolders.forEach(relativeFolder -> {
                RelativeFolder newRelativeFolder = new RelativeFolder();
                newRelativeFolder.setCurrentFolderId(currentFolder.getFolderId());
                newRelativeFolder.setWorkFolderId(relativeFolder.getWorkFolderId());
                newRelativeFolder.setRelativePath(relativeFolder.getRelativePath() + "/" + currentFolder.getName());
                currentRelativeFolders.add(newRelativeFolder);
            });
        }
        RelativeFolder selfRelativeFolder = new RelativeFolder();
        selfRelativeFolder.setCurrentFolderId(currentFolder.getFolderId());
        selfRelativeFolder.setWorkFolderId(currentFolder.getFolderId());
        selfRelativeFolder.setRelativePath("");
        currentRelativeFolders.add(selfRelativeFolder);
        relativeFolderRepository.saveAll(currentRelativeFolders);

        return currentFolder;
    }

    @Transactional
    @Override
    public Folder renameFolder(Folder folder, String newName) {
        Folder exists = folderRepository.findByParentFolderIdAndName(folder.getParentFolderId(), newName);
        Assert.isNull(exists, "在当前目录内已经存在名称");
        String oldName = folder.getName();
        folder.setName(newName);
        Folder currentFolder = folderRepository.save(folder);

        List<RelativeFolder> currentRelativeFolders = relativeFolderRepository.findByCurrentFolderIdOrderByRelativePath(currentFolder.getFolderId());
        List<RelativeFolder> updatedRelativeFolders = new ArrayList<>();
        if (null != currentRelativeFolders) {
            currentRelativeFolders.forEach(relativeFolder -> {
                if (!relativeFolder.getCurrentFolderId().equals(currentFolder.getFolderId())) {
                    String[] sections = StringUtils.split(relativeFolder.getRelativePath(), "/");
                    if (sections[sections.length - 1].equals(oldName)) {
                        sections[sections.length - 1] = newName;
                        relativeFolder.setRelativePath(StringUtils.join(sections, "/"));
                        updatedRelativeFolders.add(relativeFolder);
                    }
                }
            });
        }
        if (updatedRelativeFolders.size() > 0) {
            relativeFolderRepository.saveAll(updatedRelativeFolders);
        }
        return currentFolder;
    }

    @Transactional
    @Override
    public void deleteFolder(Folder folder, boolean cascade) {
        if (!cascade) {
            List<Folder> children = folderRepository.findByParentFolderIdOrderByName(folder.getFolderId());
            Assert.state(null == children || children.size() == 0, "当前目录存在子目录");
        }
        List<RelativeFolder> currentRelativeFolders = relativeFolderRepository.findByWorkFolderIdOrderByRelativePath(folder.getFolderId());
        currentRelativeFolders.forEach(relativeFolder -> doDeleteCurrentFolder(relativeFolder.getCurrentFolderId()));
    }

    @Override
    public Folder findByFolderId(Long folderId) {
        return folderRepository.findById(folderId).orElse(null);
    }

    @Override
    public List<Folder> findByParentFolderId(Long parentFolderId) {
        return folderRepository.findByParentFolderIdOrderByName(parentFolderId);
    }

    private void doDeleteCurrentFolder(Long folderId) {
        List<FolderIndex> folderIndices = folderIndexRepository.findByFolderId(folderId);
        if (null != folderIndices && folderIndices.size() > 0) {
            folderIndexRepository.deleteAll(folderIndices);
        }
        List<RelativeFolder> currentRelativeFolders = relativeFolderRepository.findByCurrentFolderIdOrderByRelativePath(folderId);
        if (null != currentRelativeFolders && currentRelativeFolders.size() > 0) {
            relativeFolderRepository.deleteAll(currentRelativeFolders);
        }
        folderRepository.deleteById(folderId);
    }
}
