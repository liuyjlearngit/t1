package com.cmdi.dims.app;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import com.cmdi.dims.app.dto.IndexDto;
import com.cmdi.dims.app.dto.IndexQueryDto;
import com.cmdi.dims.app.dto.ResponseDto;
import com.cmdi.dims.index.entity.Index;
import com.cmdi.dims.index.repository.IndexRepository;
import com.cmdi.dims.meta.entity.EntityType;
import com.cmdi.dims.meta.repostitory.EntityTypeRepository;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/app/v1/index")
public class IndexRestController {

    @Autowired
    IndexRepository indexRepository;

    @Autowired
    EntityTypeRepository entityTypeRepository;

    @RequestMapping(method = RequestMethod.GET)
    public ResponseDto<List<IndexDto>> indexes(
            IndexQueryDto query,
            @RequestParam(value = "start", defaultValue = "0") Integer start,
            @RequestParam(value = "limit", defaultValue = "50") Integer limit
    ) {

        Integer size = null != limit ? limit : 50;
        Integer page = null != start ? start / size : 0;

        Page<Index> pagedIndex = indexRepository.findAll((Root<Index> root, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) -> {
            List<Predicate> predicates = new ArrayList<>();
            if (null != query.getIndexId()) {
                predicates.add(criteriaBuilder.equal(root.get("indexId"), query.getIndexId()));
            }
            if (StringUtils.isNotEmpty(query.getName())) {
                predicates.add(criteriaBuilder.like(root.get("name"), "%" + query.getName() + "%"));
            }
            if (StringUtils.isNotEmpty(query.getCode())) {
                predicates.add(criteriaBuilder.like(root.get("code"), "%" + query.getCode() + "%"));
            }
            if (StringUtils.isNotEmpty(query.getSpecialityName())) {
                predicates.add(criteriaBuilder.equal(root.get("specialityName"), query.getSpecialityName()));
            }
            return criteriaBuilder.and(predicates.toArray(new Predicate[0]));
        }, PageRequest.of(page, size, Sort.Direction.DESC, "indexId"));

        List<IndexDto> result = new ArrayList<>();
        long total = 0;
        int count = 0;
        if (null != pagedIndex && null != pagedIndex.getContent()) {
            total = pagedIndex.getTotalElements();
            count = pagedIndex.getNumberOfElements();

            List<Index> indexes = pagedIndex.getContent();

            Set<Long> entityTypeIds = new HashSet<>();
            indexes.forEach(index -> {
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
            indexes.forEach(index -> {
                IndexDto indexDto = new IndexDto();
                BeanUtils.copyProperties(index, indexDto);
                EntityType entityType = entityTypeMap.get(index.getEntityTypeId());
                if (null != entityType) {
                    indexDto.setEntityTypeName(entityType.getName());
                }
                result.add(indexDto);
            });
        }

        return ResponseDto.success(result, total, count);
    }
}
