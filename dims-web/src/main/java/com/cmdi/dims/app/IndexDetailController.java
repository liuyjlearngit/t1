package com.cmdi.dims.app;

import com.cmdi.dims.app.dto.IndexDto;
import com.cmdi.dims.app.dto.ResponseDto;
import com.cmdi.dims.index.entity.Index;
import com.cmdi.dims.index.repository.IndexRepository;
import com.cmdi.dims.meta.entity.EntityType;
import com.cmdi.dims.meta.repostitory.EntityTypeRepository;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.*;

@RestController
@RequestMapping("/app/v1/index/detail")
public class IndexDetailController {

    @Autowired
    IndexRepository indexRepository;

    @Autowired
    EntityTypeRepository entityTypeRepository;

    @GetMapping()
    public ResponseDto<IndexDto> indexDetail(
            @RequestParam(value = "code") String code
    ) {
        Index index = indexRepository.findByCode(code);

        IndexDto indexDto = new IndexDto();
        if(index!=null){
            Set<Long> entityTypeIds = new HashSet<>();
            entityTypeIds.add(index.getEntityTypeId());
            Map<Long, EntityType> entityTypeMap = new HashMap<>();
            if (entityTypeIds.size() > 0) {
                List<EntityType> entityTypes = entityTypeRepository.findAllById(entityTypeIds);
                if (null != entityTypes) {
                    entityTypes.forEach(entityType -> entityTypeMap.put(entityType.getEntityTypeId(), entityType));
                }
            }
            BeanUtils.copyProperties(index, indexDto);
            EntityType entityType = entityTypeMap.get(index.getEntityTypeId());
            if (null != entityType) {
                indexDto.setEntityTypeName(entityType.getName());
            }
        }

        return ResponseDto.success(indexDto);
    }
}
