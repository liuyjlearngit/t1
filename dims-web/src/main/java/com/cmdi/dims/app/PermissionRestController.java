package com.cmdi.dims.app;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import com.cmdi.dims.app.dto.ResponseDto;
import com.cmdi.dims.system.entity.Permission;
import com.cmdi.dims.system.repository.PermissionRepository;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/app/v1/permission")
public class PermissionRestController {

    @Autowired
    PermissionRepository permissionRepository;

    @GetMapping
    public ResponseDto<List<Permission>> permission(
            @RequestParam("name") String name,
            @RequestParam("code") String code,
            @RequestParam(value = "start", defaultValue = "0") Integer start,
            @RequestParam(value = "limit", defaultValue = "20") Integer limit) {

        Integer size = null != limit ? limit : 20;
        Integer page = null != start ? start / size : 0;

        Page<Permission> permissions = permissionRepository.findAll((Root<Permission> root, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) -> {
            List<Predicate> predicates = new ArrayList<>();
            if (StringUtils.isNotEmpty(name)) {
                predicates.add(criteriaBuilder.like(root.get("name"), "%" + name + "%"));
            }
            if (StringUtils.isNotEmpty(code)) {
                predicates.add(criteriaBuilder.like(root.get("code"), "%" + code + "%"));
            }
            return criteriaBuilder.and(predicates.toArray(new Predicate[0]));
        }, PageRequest.of(page, size, Sort.Direction.DESC, "permissionId"));

        return ResponseDto.success(permissions.getContent(), permissions.getTotalElements(), permissions.getNumberOfElements());
    }
}
