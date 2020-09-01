package com.cmdi.dims.app;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import com.cmdi.dims.app.dto.FileLocationDto;
import com.cmdi.dims.app.dto.ResponseDto;
import com.cmdi.dims.common.util.DefaultFtpSessionFactory;
import com.cmdi.dims.task.entity.FileLocation;
import com.cmdi.dims.task.repository.FileLocationRepository;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/app/v1/filelocation")
public class FileConfigRestController {

    @Autowired
    private FileLocationRepository fileLocationRepository;

    @GetMapping
    public ResponseDto<List<FileLocation>> fileLocations(
            @RequestParam(value = "fileLocationId", required = false) Long fileLocationId,
            @RequestParam(value = "name", required = false) String name,
            @RequestParam(value = "start", defaultValue = "0") Integer start,
            @RequestParam(value = "limit", defaultValue = "100") Integer limit
    ) {
        Integer size = null != limit ? limit : 20;
        Integer page = null != start ? start / size : 0;

        Page<FileLocation> locations = fileLocationRepository.findAll((Root<FileLocation> root, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) -> {
            List<Predicate> predicates = new ArrayList<>();
            if (null != fileLocationId) {
                predicates.add(criteriaBuilder.equal(root.get("fileLocationId"), fileLocationId));
            }
            if (StringUtils.isNotEmpty(name)) {
                predicates.add(criteriaBuilder.like(root.get("name"), "%" + name + "%"));
            }
            return criteriaBuilder.and(predicates.toArray(new Predicate[0]));
        }, PageRequest.of(page, size, Sort.Direction.DESC, "fileLocationId"));

        return ResponseDto.success(locations.getContent(), locations.getTotalElements(), locations.getNumberOfElements());
    }

    @PostMapping
    public ResponseDto<FileLocation> saveFileLocation(
            FileLocationDto fileLocationDto
    ) {
        FileLocation fileLocation;
        if (null != fileLocationDto.getFileLocationId()) {
            fileLocation = fileLocationRepository.findById(fileLocationDto.getFileLocationId())
                    .orElseThrow(() -> new IllegalArgumentException("FTP配置ID=" + fileLocationDto.getFileLocationId() + "不存在"));
        } else {
            fileLocation = new FileLocation();
        }
        BeanUtils.copyProperties(fileLocationDto, fileLocation);
        FileLocation saved = fileLocationRepository.save(fileLocation);
        return ResponseDto.success(saved);
    }


    @DeleteMapping(value = "/{fileLocationId}")
    public ResponseDto<Void> deleteFileLocation(
            @PathVariable("fileLocationId") Long fileLocationId
    ) {
        Assert.notNull(fileLocationId, "not null");
        FileLocation fileLocation = fileLocationRepository.findById(fileLocationId).orElseThrow(() -> new IllegalArgumentException("FTP配置ID=" + fileLocationId + "不存在"));
        fileLocationRepository.delete(fileLocation);
        return ResponseDto.success();
    }

    @PostMapping(value = "/{fileLocationId}/test")
    public ResponseDto<String[]> testFileLocation(
            @PathVariable("fileLocationId") Long fileLocationId
    ) {
        Assert.notNull(fileLocationId, "not null");
        FileLocation fileLocation = fileLocationRepository.findById(fileLocationId).orElseThrow(() -> new IllegalArgumentException("FTP配置ID=" + fileLocationId + "不存在"));
        Assert.notNull(fileLocation, "not null");
        String[] names = null;
        if ("FTP".equalsIgnoreCase(fileLocation.getSchema())) {
            try {
                DefaultFtpSessionFactory factory = new DefaultFtpSessionFactory();
                factory.setHost(StringUtils.isNotEmpty(fileLocation.getHost()) ? fileLocation.getHost() : "localhost");
                factory.setPort(null != fileLocation.getPort() ? fileLocation.getPort() : 21);
                factory.setUsername(fileLocation.getUsername());
                factory.setPassword(fileLocation.getPassword());
                factory.setControlEncoding(StringUtils.isNotEmpty(fileLocation.getEncoding()) ? fileLocation.getEncoding() : "UTF-8");

                names = factory.getSession().listNames(StringUtils.isNotEmpty(fileLocation.getPath()) ? fileLocation.getPath() : "/");
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        }
        return ResponseDto.success(names);
    }

}
