package com.cmdi.dims.app;

import java.util.List;
import java.util.stream.Collectors;

import com.cmdi.dims.app.dto.DictDto;
import com.cmdi.dims.app.dto.ResponseDto;
import com.cmdi.dims.index.entity.Index;
import com.cmdi.dims.index.repository.IndexRepository;
import com.cmdi.dims.meta.entity.EntityType;
import com.cmdi.dims.meta.repostitory.EntityTypeRepository;
import com.cmdi.dims.task.entity.AreaCodeConfig;
import com.cmdi.dims.task.repository.AreaCodeConfigRepository;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import lombok.extern.slf4j.Slf4j;

@Api(tags = "字典信息API")
@Slf4j
@RestController
@RequestMapping("/app/v1/dict")
public class DictRestController {

    @Autowired
    private EntityTypeRepository entityTypeRepository;

    @Autowired
    private AreaCodeConfigRepository areaCodeConfigRepository;

    @Autowired
    private IndexRepository indexRepository;

    @ApiOperation("获取专业列表")
    @GetMapping(value = "/speciality")
    public ResponseDto<List<DictDto>> speciality() {
        List<String> specialities = entityTypeRepository.findSpecialityNames();
        List<DictDto> dicts = specialities.stream().map(s -> new DictDto(s, s)).collect(Collectors.toList());
        return ResponseDto.success(dicts);
    }

    @ApiOperation("获取区域字典信息，当region参数为空的时候获取省份列表，当region不为空的时候，根据region获取region下的地市信息")
    @GetMapping(value = "/region")
    public ResponseDto<List<DictDto>> region(
            @ApiParam("省份编码，如果获取省份列表，请保持为空")
            @RequestParam(value = "region", required = false) String region) {
        List<AreaCodeConfig> configs;
        if (StringUtils.isEmpty(region)) {
            configs = areaCodeConfigRepository.findByRegionTypeOrderByCode(1);
        } else {
            configs = areaCodeConfigRepository.findByProvinceCodeAndRegionTypeOrderByCode(region, 2);
        }
        List<DictDto> dicts = configs.stream().map(c -> new DictDto(c.getName(), c.getCode())).collect(Collectors.toList());
        return ResponseDto.success(dicts);
    }

    @ApiOperation("获取专业下实体类型")
    @GetMapping(value = "/{speciality}/entity")
    public ResponseDto<List<DictDto>> entity(
            @ApiParam("专业")
            @PathVariable("speciality") String speciality) {
        List<EntityType> entityTypes = entityTypeRepository.findBySpecialityNameOrderByCode(speciality);
        List<DictDto> dicts = entityTypes.stream().map(e -> new DictDto(e.getName(), e.getCode())).collect(Collectors.toList());
        return ResponseDto.success(dicts);
    }

    @ApiOperation("获取专业下指标定义")
    @GetMapping(value = "/{speciality}/index")
    public ResponseDto<List<DictDto>> index(
            @ApiParam("专业")
            @PathVariable("speciality") String speciality) {

        List<Index> indices = indexRepository.findBySpecialityNameAndEnable(speciality, true);
        List<DictDto> dicts = indices.stream().map(e -> new DictDto(e.getName(), e.getCode())).collect(Collectors.toList());
        return ResponseDto.success(dicts);
    }
}
