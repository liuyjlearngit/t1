package com.cmdi.dims.app;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.cmdi.dims.app.dto.IndexDto;
import com.cmdi.dims.app.dto.ResponseDto;
import com.cmdi.dims.index.entity.Folder;
import com.cmdi.dims.index.entity.FolderIndex;
import com.cmdi.dims.index.entity.Index;
import com.cmdi.dims.index.repository.FolderIndexRepository;
import com.cmdi.dims.index.repository.IndexRepository;
import com.cmdi.dims.index.service.FolderService;
import com.cmdi.dims.meta.entity.EntityType;
import com.cmdi.dims.meta.repostitory.EntityTypeRepository;
import org.apache.commons.lang3.BooleanUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/app/v1/folder")
public class IndexFolderRestController {

    @Autowired
    FolderService folderService;
    @Autowired
    FolderIndexRepository folderIndexRepository;
    @Autowired
    IndexRepository indexRepository;
    @Autowired
    EntityTypeRepository entityTypeRepository;

    @GetMapping
    public ResponseDto<List<Folder>> folders(
            @RequestParam(value = "parentFolderId", required = false) Long parentFolderId
    ) {
        List<Folder> children = folderService.findByParentFolderId(parentFolderId);
        return ResponseDto.success(children);
    }


    @PostMapping
    public ResponseDto<Folder> create(
            @RequestParam(value = "parentFolderId", required = false) Long parentFolderId,
            @RequestParam("name") String name
    ) {
        Folder parent = null;
        if (null != parentFolderId) {
            parent = folderService.findByFolderId(parentFolderId);
            Assert.notNull(parent, "所选父目录不存在");
        }
        Assert.hasText(name, "目录名不能为空");
        Folder currentFolder = folderService.createFolder(parent, name);
        return ResponseDto.success(currentFolder);
    }

    @PostMapping(value = "/{folderId}/rename")
    public ResponseDto<Folder> rename(
            @PathVariable(value = "folderId") Long folderId,
            @RequestParam("newName") String newName
    ) {
        Folder folder = folderService.findByFolderId(folderId);
        Assert.notNull(folder, "当前目录不存在");
        Assert.hasText(newName, "新目录名不能为空");
        Folder currentFolder = folderService.renameFolder(folder, newName);
        return ResponseDto.success(currentFolder);
    }

    @DeleteMapping(value = "/{folderId}")
    public ResponseDto<Void> delete(
            @PathVariable(value = "folderId") Long folderId,
            @RequestParam(value = "cascade", required = false) Boolean cascade
    ) {
        Folder folder = folderService.findByFolderId(folderId);
        Assert.notNull(folder, "当前目录不存在");
        folderService.deleteFolder(folder, BooleanUtils.isTrue(cascade));
        return ResponseDto.success();
    }

    @PostMapping(value = "/{folderId}/index")
    public ResponseDto<Void> createFolderIndices(
            @PathVariable(value = "folderId") Long folderId,
            @RequestParam(value = "indexIds") String indexIdsStr
    ) {
        Assert.hasText(indexIdsStr, "请选择");
        String[] splitedIds = StringUtils.split(indexIdsStr, ",");
        List<Long> indexIds = new ArrayList<>();
        for (String splitedId : splitedIds) {
            indexIds.add(Long.valueOf(splitedId));
        }
        List<Index> indices = indexRepository.findAllById(indexIds);
        Assert.notEmpty(indices, "请选择");
        Folder folder = folderService.findByFolderId(folderId);
        Assert.notNull(folder, "请选择");

        List<FolderIndex> folderIndices = new ArrayList<>();
        indices.forEach(index -> {
            FolderIndex folderIndex = new FolderIndex();
            folderIndex.setFolderId(folder.getFolderId());
            folderIndex.setIndexId(index.getIndexId());
            folderIndices.add(folderIndex);
        });
        folderIndexRepository.saveAll(folderIndices);
        return ResponseDto.success();
    }

    @DeleteMapping(value = "/{folderId}/index")
    public ResponseDto<Void> deleteFolderIndices(
            @PathVariable(value = "folderId") Long folderId,
            @RequestParam(value = "indexIds") String indexIdsStr
    ) {
        Assert.hasText(indexIdsStr, "请选择");
        String[] splitedIds = StringUtils.split(indexIdsStr, ",");
        List<Long> indexIds = new ArrayList<>();
        for (String splitedId : splitedIds) {
            indexIds.add(Long.valueOf(splitedId));
        }
        List<Index> indices = indexRepository.findAllById(indexIds);
        Assert.notEmpty(indices, "请选择");
        Folder folder = folderService.findByFolderId(folderId);
        Assert.notNull(folder, "请选择");

        List<FolderIndex> folderIndices = folderIndexRepository.findByFolderIdAndIndexIdIn(folderId, indexIds);
        if (null != folderIndices && folderIndices.size() > 0) {
            folderIndexRepository.deleteAll(folderIndices);
        }
        return ResponseDto.success();
    }

    @GetMapping(value = "/index")
    public ResponseDto<List<IndexDto>> folderIndices(
            @RequestParam(value = "folderId") Long folderId
    ) {
        List<FolderIndex> folderIndices = folderIndexRepository.findByFolderId(folderId);
        List<Index> indices = null;
        if (null != folderIndices && folderIndices.size() > 0) {
            Set<Long> indexIds = new HashSet<>();
            folderIndices.forEach(folderIndex -> indexIds.add(folderIndex.getIndexId()));
            indices = indexRepository.findAllById(indexIds);
        }
        List<IndexDto> result = new ArrayList<>();
        if (null != indices) {

            Set<Long> entityTypeIds = new HashSet<>();
            indices.forEach(index -> {
                if (null != index.getEntityTypeId()) {
                    entityTypeIds.add(index.getEntityTypeId());
                }
            });
            Map<Long, EntityType> entityTypeMap = new HashMap<>();
            if (entityTypeIds.size() > 0) {
                List<EntityType> entityTypes = entityTypeRepository.findAllById(entityTypeIds);
                if (null != entityTypes) {
                    entityTypes.forEach(entityType -> entityTypeMap.put(entityType.getEntityTypeId(), entityType));
                }
            }
            indices.forEach(index -> {
                IndexDto indexDto = new IndexDto();
                BeanUtils.copyProperties(index, indexDto);
                EntityType entityType = entityTypeMap.get(index.getEntityTypeId());
                if (null != entityType) {
                    indexDto.setEntityTypeName(entityType.getName());
                }
                result.add(indexDto);
            });
        }

        return ResponseDto.success(result);
    }
}
