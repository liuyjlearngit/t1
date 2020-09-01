package com.cmdi.dims.app;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import com.cmdi.dims.index.entity.Index;
import com.cmdi.dims.index.repository.IndexRepository;
import com.cmdi.dims.meta.entity.EntityType;
import com.cmdi.dims.meta.repostitory.EntityTypeRepository;
import com.cmdi.dims.task.TaskStatusEnum;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang3.BooleanUtils;
import org.apache.commons.lang3.RandomUtils;
import org.apache.commons.lang3.StringUtils;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.google.common.collect.Lists;

import io.jsonwebtoken.lang.Assert;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import lombok.extern.slf4j.Slf4j;
import com.cmdi.dims.app.dto.EntityColumnDto;
import com.cmdi.dims.app.dto.EntityRecordDto;
import com.cmdi.dims.app.dto.IndexColumnDto;
import com.cmdi.dims.app.dto.IndexItemDetailDto;
import com.cmdi.dims.app.dto.IndexRecordDto;
import com.cmdi.dims.app.dto.RegionItemDto;
import com.cmdi.dims.app.dto.RegionSpecialityIndexItemDto;
import com.cmdi.dims.app.dto.ResponseDto;
import com.cmdi.dims.app.dto.SpecialityItemDto;
import com.cmdi.dims.app.dto.StatisticResultDto;
import com.cmdi.dims.task.entity.AreaCodeConfig;
import com.cmdi.dims.task.entity.Task;
import com.cmdi.dims.task.entity.TaskItemBusiness;
import com.cmdi.dims.task.entity.TaskItemIndex;
import com.cmdi.dims.task.entity.TaskLatest;
import com.cmdi.dims.task.repository.AreaCodeConfigRepository;
import com.cmdi.dims.task.repository.TaskItemBusinessRepository;
import com.cmdi.dims.task.repository.TaskItemIndexRepository;
import com.cmdi.dims.task.repository.TaskLatestRepository;
import com.cmdi.dims.task.repository.TaskRepository;

@Api(tags = "统计信息API")
@Slf4j
@RestController
@RequestMapping("/app/v1/statistic")
public class StatisticRestController {

    @Autowired
    private EntityTypeRepository entityTypeRepository;
    @Autowired
    private IndexRepository indexRepository;
    @Autowired
    private AreaCodeConfigRepository areaCodeConfigRepository;
    @Autowired
    private TaskLatestRepository taskLatestRepository;
    @Autowired
    private TaskItemIndexRepository taskItemIndexRepository;
    @Autowired
    private TaskItemBusinessRepository taskItemBusinessRepository;
    @Autowired
    private TaskRepository taskRepository;

    @ApiOperation("首屏统计信息用户地图按省份展示和按专业列表展示")
    @GetMapping("/global")
    public ResponseDto<StatisticResultDto> global(
            @ApiParam("区域信息，当全国的时候保持为空，当具体部署到省份的时候传具体省份的值")
            @RequestParam(value = "region", required = false) String region,
            @ApiParam("是否采用Mock数据")
            @RequestParam(value = "mock", required = false) Boolean mock) {
        if (BooleanUtils.isTrue(mock)) {
            return ResponseDto.success(loadGlobalMock(region));
        }
        return ResponseDto.success(loadGlobal(region));
    }

    private StatisticResultDto loadGlobalMock(String region) {
        List<AreaCodeConfig> configs = loadRegion(region);

        StatisticResultDto statistic = new StatisticResultDto();
        statistic.setRegions(buildRegionItems(configs));
        List<String> specialities = entityTypeRepository.findSpecialityNames();

        List<SpecialityItemDto> specialityItemDtos = specialities.stream().map(s -> {
            SpecialityItemDto item = new SpecialityItemDto();
            item.setSpeciality(s);
            item.setSpecialityName(s);
            item.setValue(random());
            item.setRegions(buildRegionItems(configs));
            return item;
        }).collect(Collectors.toList());
        statistic.setSpecialities(specialityItemDtos);
        return statistic;
    }


    //查询各级别行政区域的各专业整体指标
    private List<TaskItemIndex> findLatest(AreaCodeConfig config, List<String> indexCodes) {
        List<String> taskCodes;
        if (null == config) {
            //当是全国时，则查找出所有的核查任务
            taskCodes = taskLatestRepository.findAll().stream()
                    .map(TaskLatest::getTaskCode).collect(Collectors.toList());
            //查出所有省份各专业的整体指标
            return taskItemIndexRepository.findByTaskCodeInAndCodeInAndRegionType(taskCodes, indexCodes, 1);
        } else if (config.getRegionType() == 1) {
            //当为省级级别时，查询各地市各专业的整体指标
            taskCodes = taskLatestRepository.findByProvince(config.getCode()).stream()
                    .map(TaskLatest::getTaskCode).collect(Collectors.toList());
            List<TaskItemIndex> result = taskItemIndexRepository.findByTaskCodeInAndCodeInAndRegionType(taskCodes, indexCodes, 2);
            return result.stream().map(t -> {
                if (StringUtils.isEmpty(t.getPrefectureCode())) {
                    t.setPrefectureCode("000000");
                }
                return t;
            }).collect(Collectors.toList());
        } else if (config.getRegionType() == 2) {
            //当为市级级别时，查询各区县各专业的整体指标
            taskCodes = taskLatestRepository.findByProvince(config.getProvinceCode()).stream()
                    .map(TaskLatest::getTaskCode).collect(Collectors.toList());
            List<TaskItemIndex> result = taskItemIndexRepository.findByTaskCodeInAndCodeInAndPrefectureCodeAndRegionType(taskCodes, indexCodes, config.getCode(), 3);
            return result.stream().map(t -> {
                if (StringUtils.isEmpty(t.getCountyCode())) {
                    t.setCountyCode("000000");
                }
                return t;
            }).collect(Collectors.toList());

        } else {
            return Collections.emptyList();
        }

    }

    private List<TaskItemIndex> findLatest(AreaCodeConfig config, String speciality, List<String> indexCodes) {
        List<String> taskCodes;
        if (null == config) {
            taskCodes = taskLatestRepository.findBySpecialityName(speciality).stream()
                    .map(TaskLatest::getTaskCode).collect(Collectors.toList());
            return taskItemIndexRepository.findByTaskCodeInAndCodeInAndRegionType(taskCodes, indexCodes, 1);
        } else if (config.getRegionType() == 1) {
            taskCodes = taskLatestRepository.findByProvinceAndSpecialityName(config.getCode(), speciality).stream()
                    .map(TaskLatest::getTaskCode).collect(Collectors.toList());
            List<TaskItemIndex> result = taskItemIndexRepository.findByTaskCodeInAndCodeInAndRegionType(taskCodes, indexCodes, 2);
            return result.stream().map(t -> {
                if (StringUtils.isEmpty(t.getPrefectureCode())) {
                    t.setPrefectureCode("000000");
                }
                return t;
            }).collect(Collectors.toList());
        } else if (config.getRegionType() == 2) {
            taskCodes = taskLatestRepository.findByProvinceAndSpecialityName(config.getProvinceCode(), speciality).stream()
                    .map(TaskLatest::getTaskCode).collect(Collectors.toList());
            List<TaskItemIndex> result = taskItemIndexRepository.findByTaskCodeInAndCodeInAndPrefectureCodeAndRegionType(taskCodes, indexCodes, config.getCode(), 3);
            return result.stream().map(t -> {
                if (StringUtils.isEmpty(t.getCountyCode())) {
                    t.setCountyCode("000000");
                }
                return t;
            }).collect(Collectors.toList());
        } else {
            return Collections.emptyList();
        }
    }


    /**
     * 当config为省级时，查出省级各专业指标
     * 当config为市级时，查出该市的各专业指标
     * @param config
     * @param indexCodes
     * @return
     */
    private List<TaskItemIndex> findGlobal(AreaCodeConfig config, List<String> indexCodes) {
        if (null == config) {
            return Collections.emptyList();
        } else if (config.getRegionType() == 1) {
            List<String> taskCodes = taskLatestRepository.findByProvince(config.getCode()).stream()
                    .map(TaskLatest::getTaskCode).collect(Collectors.toList());
            return taskItemIndexRepository.findByTaskCodeInAndCodeInAndRegionType(taskCodes, indexCodes, 1);
        } else if (config.getRegionType() == 2) {
            List<String> taskCodes = taskLatestRepository.findByProvince(config.getProvinceCode()).stream()
                    .map(TaskLatest::getTaskCode).collect(Collectors.toList());
            return taskItemIndexRepository.findByTaskCodeInAndCodeInAndPrefectureCodeAndRegionType(taskCodes, indexCodes, config.getCode(), 2);
        } else {
            List<String> taskCodes = taskLatestRepository.findByProvince(config.getProvinceCode()).stream()
                    .map(TaskLatest::getTaskCode).collect(Collectors.toList());
            return taskItemIndexRepository.findByTaskCodeInAndCodeInAndCountyCodeAndRegionType(taskCodes, indexCodes, config.getCode(), 3);
        }
    }





    private StatisticResultDto loadGlobal(String region) {
        final AreaCodeConfig config;
        if (StringUtils.isNotEmpty(region)) {
            config = areaCodeConfigRepository.findByCode(region);
            Assert.notNull(config, "没有找到对应的区域");
        } else {
            config = null;
        }
        //如果region区域编码为空时，加载各省区域编码；
        //region区域编码为省级编码时，加载各地市区域编码
        //region区域编码为市编码时，加载各区县区域编码
        List<AreaCodeConfig> configs = loadRegion(region);
        //创建前台呈现的VO
        StatisticResultDto statistic = new StatisticResultDto();
        //模糊查询各专业的指标编码并且是有效的
        List<Index> indices = indexRepository.findByCodeEndingWithAndEnable("99999", true);
        //得到专业名称和专业整体指标的编码
        Map<String, String> indexSpeciality = indices.stream().collect(Collectors.toMap(Index::getCode, Index::getSpecialityName));
        //获取Map中的编码list
        List<String> indexCodes = indices.stream()
                .map(Index::getCode).collect(Collectors.toList());
        //查询各级别行政区域的各专业整体指标 ,当为全国时，则查询出各省各专业的整体指标，当为省级级别时，查询各地市各专业的整体指标
        List<TaskItemIndex> taskItemIndices = findLatest(config, indexCodes);
        Map<String, List<TaskItemIndex>> provinceIndices;
        List<TaskItemIndex> globle = taskItemIndices;

        if (null == config) {
            //各省份的各专业的整体指标
            provinceIndices = taskItemIndices.stream().collect(Collectors.groupingBy(TaskItemIndex::getProvinceCode));
        } else if (config.getRegionType() == 1) {
            //该省份下各地市的各专业指标
            provinceIndices = taskItemIndices.stream().collect(Collectors.groupingBy(TaskItemIndex::getPrefectureCode));
            //当config为省级时，查出省级各专业指标
            globle = findGlobal(config, indexCodes);
        } else if (config.getRegionType() == 2) {
            //该地市下各区县的各专业指标
            provinceIndices = taskItemIndices.stream().collect(Collectors.groupingBy(TaskItemIndex::getCountyCode));
            //当config为市级时，查出该市的各专业指标
            globle = findGlobal(config, indexCodes);
        } else {
            provinceIndices = Collections.emptyMap();
            globle = Collections.emptyList();
        }
        //全国界面下的各省份指标;省份下的各地市指标;地市下的各区县指标;
        statistic.setRegions(buildRegionItems(configs, provinceIndices));
        if (CollectionUtils.isNotEmpty(globle)) {
            //算出各专业指标的平均值
            statistic.setTotalValue(globle.stream().mapToDouble(TaskItemIndex::getIndexValue).average().orElse(0.0D));
        } else {
            statistic.setTotalValue(0.0D);
        }
        //获取所有的专业名称
        List<String> specialities = entityTypeRepository.findSpecialityNames();
        //一个为
        Map<String, List<TaskItemIndex>> specialityIndices = taskItemIndices.stream().collect(Collectors.groupingBy(t -> indexSpeciality.get(t.getCode())));
        Map<String, List<TaskItemIndex>> globleSpecialityIndices = globle.stream().collect(Collectors.groupingBy(t -> indexSpeciality.get(t.getCode())));

        List<SpecialityItemDto> specialityItemDtos = specialities.stream().map(s -> {
            SpecialityItemDto item = new SpecialityItemDto();
            item.setSpeciality(s);
            item.setSpecialityName(s);
            List<TaskItemIndex> globleIndicesOfSpeciality = globleSpecialityIndices.getOrDefault(s, Collections.emptyList());
            if (CollectionUtils.isNotEmpty(globleIndicesOfSpeciality)) {
                item.setValue(globleIndicesOfSpeciality.stream().mapToDouble(TaskItemIndex::getIndexValue).average().orElse(0.0D));
            } else {
                item.setValue(0.0D);
            }
            List<TaskItemIndex> indicesOfSpeciality = specialityIndices.getOrDefault(s, Collections.emptyList());
            Map<String, List<TaskItemIndex>> provinceIndicesOfSpeciality;
            if (null == config) {
                provinceIndicesOfSpeciality = indicesOfSpeciality.stream().collect(Collectors.groupingBy(TaskItemIndex::getProvinceCode));
            } else if (config.getRegionType() == 1) {
                provinceIndicesOfSpeciality = indicesOfSpeciality.stream().collect(Collectors.groupingBy(TaskItemIndex::getPrefectureCode));
            } else if (config.getRegionType() == 2) {
                provinceIndicesOfSpeciality = indicesOfSpeciality.stream().collect(Collectors.groupingBy(TaskItemIndex::getCountyCode));
            } else {
                provinceIndicesOfSpeciality = Collections.emptyMap();
            }
            item.setRegions(buildRegionItems(configs, provinceIndicesOfSpeciality));
            return item;
        }).collect(Collectors.toList());
        statistic.setSpecialities(specialityItemDtos);
        return statistic;
    }


    /**
     * zk查询省份各专业指标
     * @param region
     * @return
     */
    @ApiOperation("展示省份各专业或地市各专业指标值")
    @GetMapping("/regionSpecialityIndex/{region}")
    public List<TaskItemIndex> regionSpecialityIndex(@PathVariable("region") String region) {
        final AreaCodeConfig config;
        if (StringUtils.isNotEmpty(region)) {
            config = areaCodeConfigRepository.findByCode(region);
            Assert.notNull(config, "没有找到对应的区域");
        } else {
            config = null;
        }
        //如果region区域编码为空时，加载各省区域编码；
        //region区域编码为省级编码时，加载各地市区域编码
        //region区域编码为市编码时，加载各区县区域编码
        List<AreaCodeConfig> configs = loadRegion(region);
        //创建前台呈现的VO
        StatisticResultDto statistic = new StatisticResultDto();
        //模糊查询各专业的指标编码并且是有效的
        List<Index> indices = indexRepository.findByCodeEndingWithAndEnable("99999", true);
        //得到专业名称和专业整体指标的编码
        Map<String, String> indexSpeciality = indices.stream().collect(Collectors.toMap(Index::getCode, Index::getSpecialityName));
        //获取Map中的编码list
        List<String> indexCodes = indices.stream()
                .map(Index::getCode).collect(Collectors.toList());
        List<TaskItemIndex> globle;
        if (null == config) {
            globle=null;
        } else if (config.getRegionType() == 1) {
            globle = findGlobal(config, indexCodes);
        } else if (config.getRegionType() == 2) {
            globle = findGlobal(config, indexCodes);
        } else {
            globle = findGlobal(config, indexCodes);
        }

        return globle;
    }


    private List<AreaCodeConfig> loadRegion(String region) {
        List<AreaCodeConfig> configs;
        if (StringUtils.isEmpty(region)) {
            configs = areaCodeConfigRepository.findByRegionTypeOrderByCode(1);
        } else {
            AreaCodeConfig config = areaCodeConfigRepository.findByCode(region);
            Assert.notNull("没有找到对应的区域");
            if (config.getRegionType() == 1) {
                //找下属市
                configs = areaCodeConfigRepository.findByProvinceCodeAndRegionTypeOrderByCode(config.getCode(), 2);
                AreaCodeConfig all = new AreaCodeConfig();
                all.setCode("000000");
                all.setName("无地市");
                configs.add(all);
            } else {
                //找下属区县
                configs = areaCodeConfigRepository.findByPrefectureCodeAndRegionTypeOrderByCode(config.getCode(), 3);
                AreaCodeConfig all = new AreaCodeConfig();
                all.setCode("000000");
                all.setName("无区县");
                configs.add(all);
            }

        }
        return configs;
    }

    private List<RegionItemDto> buildRegionItems(List<AreaCodeConfig> configs) {
        return configs.stream().map(c -> {
            RegionItemDto regionItem = new RegionItemDto();
            regionItem.setRegion(c.getCode());
            regionItem.setRegionName(c.getName());
            regionItem.setValue(random());
            return regionItem;
        }).sorted(Comparator.comparing(RegionItemDto::getValue).reversed()).collect(Collectors.toList());
    }
    //全国界面下的各省份指标;省份下的各地市指标;地市下的各区县指标;
    private List<RegionItemDto> buildRegionItems(List<AreaCodeConfig> configs, Map<String, List<TaskItemIndex>> provinceIndices) {
        return configs.stream().map(c -> {
            RegionItemDto regionItem = new RegionItemDto();
            regionItem.setRegion(c.getCode());
            regionItem.setRegionName(c.getName());
            List<TaskItemIndex> indicesOfProvince = provinceIndices.get(c.getCode());
            if (CollectionUtils.isNotEmpty(indicesOfProvince)) {
                regionItem.setValue(indicesOfProvince.stream().mapToDouble(TaskItemIndex::getIndexValue).average().orElse(0.0D));
            } else {
                regionItem.setValue(0.0D);
            }
            return regionItem;
        }).sorted(Comparator.comparing(RegionItemDto::getValue).reversed()).collect(Collectors.toList());
    }

    private Double random() {
        return RandomUtils.nextInt(0, 101) / 100D;
    }

    @ApiOperation("首屏点击专业的时候，按当前专业的省份展示统计结果")
    @GetMapping("/speciality/{speciality}")
    public ResponseDto<List<RegionSpecialityIndexItemDto>> speciality(
            @ApiParam("专业")
            @PathVariable("speciality") String speciality,
            @ApiParam("区域信息，当全国的时候保持为空，当具体部署到省份的时候传具体省份的值")
            @RequestParam(value = "region", required = false) String region,
            @ApiParam("是否采用Mock数据")
            @RequestParam(value = "mock", required = false) Boolean mock) {

        if (BooleanUtils.isTrue(mock)) {
            return ResponseDto.success(doLoadSpecialityMock(speciality, region));
        }

        return ResponseDto.success(doLoadSpeciality(speciality, region));
    }

    private List<RegionSpecialityIndexItemDto> doLoadSpeciality(String speciality, String region) {
        final AreaCodeConfig config;
        if (StringUtils.isNotEmpty(region)) {
            config = areaCodeConfigRepository.findByCode(region);
            Assert.notNull(config, "没有找到对应区域");
        } else {
            config = null;
        }
        List<Index> indices99001 = indexRepository.findByCodeEndingWithAndSpecialityNameAndEnable("99001", speciality, true);
        List<Index> indices99002 = indexRepository.findByCodeEndingWithAndSpecialityNameAndEnable("99002", speciality, true);
        List<Index> indices99003 = indexRepository.findByCodeEndingWithAndSpecialityNameAndEnable("99003", speciality, true);
        List<Index> indices99999 = indexRepository.findByCodeEndingWithAndSpecialityNameAndEnable("99999", speciality, true);

        List<Index> indices = new ArrayList<>(indices99001);
        indices.addAll(indices99002);
        indices.addAll(indices99003);
        indices.addAll(indices99999);

        List<String> indexCodes = indices.stream()
                .map(Index::getCode).collect(Collectors.toList());
        List<TaskItemIndex> taskItemIndices = findLatest(config, speciality, indexCodes);

        Map<String, Map<String, List<TaskItemIndex>>> regionIndices;
        if (null == config) {
            regionIndices = taskItemIndices.stream()
                    .collect(Collectors.groupingBy(TaskItemIndex::getProvinceCode,
                            Collectors.collectingAndThen(Collectors.toList(), l -> l.stream().collect(Collectors.groupingBy(TaskItemIndex::getCode)))));
        } else if (config.getRegionType() == 1) {
            regionIndices = taskItemIndices.stream()
                    .collect(Collectors.groupingBy(TaskItemIndex::getPrefectureCode,
                            Collectors.collectingAndThen(Collectors.toList(), l -> l.stream().collect(Collectors.groupingBy(TaskItemIndex::getCode)))));
        } else if (config.getRegionType() == 2) {
            regionIndices = taskItemIndices.stream()
                    .collect(Collectors.groupingBy(TaskItemIndex::getCountyCode,
                            Collectors.collectingAndThen(Collectors.toList(), l -> l.stream().collect(Collectors.groupingBy(TaskItemIndex::getCode)))));
        } else {
            regionIndices = Collections.emptyMap();
        }


        List<AreaCodeConfig> configs = loadRegion(region);
        List<RegionSpecialityIndexItemDto> result = new ArrayList<>();
        for (AreaCodeConfig currentConfig : configs) {
            Map<String, List<TaskItemIndex>> indexIndices = regionIndices.get(currentConfig.getCode());
            if (CollectionUtils.isNotEmpty(indices99001)) {
                double value = 0.0D;
                if (null != indexIndices) {
                    List<TaskItemIndex> indicesOfIndex = indexIndices.get(indices99001.get(0).getCode());
                    if (CollectionUtils.isNotEmpty(indicesOfIndex)) {
                        value = indicesOfIndex.get(0).getIndexValue();
                    }
                }
                result.add(RegionSpecialityIndexItemDto.builder()
                        .region(currentConfig.getCode())
                        .regionName(currentConfig.getName())
                        .speciality(speciality)
                        .specialityName(speciality)
                        .indexCode(indices99001.get(0).getCode())
                        .indexName(indices99001.get(0).getName())
                        .value(value)
                        .build());

            }
            if (CollectionUtils.isNotEmpty(indices99002)) {
                double value = 0.0D;
                if (null != indexIndices) {
                    List<TaskItemIndex> indicesOfIndex = indexIndices.get(indices99002.get(0).getCode());
                    if (CollectionUtils.isNotEmpty(indicesOfIndex)) {
                        value = indicesOfIndex.get(0).getIndexValue();
                    }
                }
                result.add(RegionSpecialityIndexItemDto.builder()
                        .region(currentConfig.getCode())
                        .regionName(currentConfig.getName())
                        .speciality(speciality)
                        .specialityName(speciality)
                        .indexCode(indices99002.get(0).getCode())
                        .indexName(indices99002.get(0).getName())
                        .value(value)
                        .build());

            }
            if (CollectionUtils.isNotEmpty(indices99003)) {
                double value = 0.0D;
                if (null != indexIndices) {
                    List<TaskItemIndex> indicesOfIndex = indexIndices.get(indices99003.get(0).getCode());
                    if (CollectionUtils.isNotEmpty(indicesOfIndex)) {
                        value = indicesOfIndex.get(0).getIndexValue();
                    }
                }
                result.add(RegionSpecialityIndexItemDto.builder()
                        .region(currentConfig.getCode())
                        .regionName(currentConfig.getName())
                        .speciality(speciality)
                        .specialityName(speciality)
                        .indexCode(indices99003.get(0).getCode())
                        .indexName(indices99003.get(0).getName())
                        .value(value)
                        .build());

            }
            if (CollectionUtils.isNotEmpty(indices99999)) {
                double value = 0.0D;
                if (null != indexIndices) {
                    List<TaskItemIndex> indicesOfIndex = indexIndices.get(indices99999.get(0).getCode());
                    if (CollectionUtils.isNotEmpty(indicesOfIndex)) {
                        value = indicesOfIndex.get(0).getIndexValue();
                    }
                }
                result.add(RegionSpecialityIndexItemDto.builder()
                        .region(currentConfig.getCode())
                        .regionName(currentConfig.getName())
                        .speciality(speciality)
                        .specialityName(speciality)
                        .indexCode(indices99999.get(0).getCode())
                        .indexName(indices99999.get(0).getName())
                        .value(value)
                        .build());

            }
        }
        return result;
    }

    private List<RegionSpecialityIndexItemDto> doLoadSpecialityMock(String speciality, String region) {
        List<AreaCodeConfig> configs = loadRegion(region);
        List<RegionSpecialityIndexItemDto> result = new ArrayList<>();
        for (AreaCodeConfig config : configs) {
            result.add(RegionSpecialityIndexItemDto.builder().region(config.getCode()).regionName(config.getName()).speciality(speciality).specialityName(speciality).indexCode("99001").indexName("字段完整率").value(random()).build());
            result.add(RegionSpecialityIndexItemDto.builder().region(config.getCode()).regionName(config.getName()).speciality(speciality).specialityName(speciality).indexCode("99002").indexName("命名规范率").value(random()).build());
            result.add(RegionSpecialityIndexItemDto.builder().region(config.getCode()).regionName(config.getName()).speciality(speciality).specialityName(speciality).indexCode("99003").indexName("关联一致率").value(random()).build());
            result.add(RegionSpecialityIndexItemDto.builder().region(config.getCode()).regionName(config.getName()).speciality(speciality).specialityName(speciality).indexCode("99004").indexName("空间资源准确率").value(random()).build());
        }
        return result;
    }

    @ApiOperation("首屏点击省份的时候，按当前省份的专业展示统计结果")
    @GetMapping("/region/{region}")
    public ResponseDto<List<RegionSpecialityIndexItemDto>> province(
            @ApiParam("区域信息，部署全国的时候应该是省份，当具体部署到省份的时候传地市，可以根据点击的区域的code来")
            @PathVariable("region") String region,
            @ApiParam("是否采用Mock数据")
            @RequestParam(value = "mock", required = false) Boolean mock) {
        if (BooleanUtils.isTrue(mock)) {
            return ResponseDto.success(doLoadProvinceMock(region));
        }
        return ResponseDto.success(doLoadProvince(region));
    }

    private List<RegionSpecialityIndexItemDto> doLoadProvinceMock(String region) {
        List<String> specialities = entityTypeRepository.findSpecialityNames();
        List<RegionSpecialityIndexItemDto> result = new ArrayList<>();
        AreaCodeConfig config = areaCodeConfigRepository.findByCode(region);
        Assert.notNull(config, "没有找到对应区域");
        for (String speciality : specialities) {
            result.add(RegionSpecialityIndexItemDto.builder().region(config.getCode()).regionName(config.getName()).speciality(speciality).specialityName(speciality).indexCode("99999").indexName("综合").value(random()).build());
        }
        return result;
    }

    private List<RegionSpecialityIndexItemDto> doLoadProvince(String region) {
        List<String> specialities = entityTypeRepository.findSpecialityNames();
        List<RegionSpecialityIndexItemDto> result = new ArrayList<>();
        AreaCodeConfig config = areaCodeConfigRepository.findByCode(region);
        Assert.notNull(config, "没有找到对应的区域");

        List<Index> indices = indexRepository.findByCodeEndingWithAndEnable("99999", true);
        List<String> indexCodes = indices.stream()
                .map(Index::getCode).collect(Collectors.toList());
        Map<String, Index> specialityIndexMap = indices.stream().collect(Collectors.toMap(Index::getSpecialityName, v -> v));

        String targetRegion = config.getRegionType() == 1 ? region : config.getProvinceCode();
        List<String> taskCodes = taskLatestRepository.findByProvince(targetRegion).stream()
                .map(TaskLatest::getTaskCode).collect(Collectors.toList());
        List<TaskItemIndex> taskItemIndices;
        if (config.getRegionType() == 1) {
            taskItemIndices = taskItemIndexRepository.findByTaskCodeInAndCodeInAndRegionType(taskCodes, indexCodes, config.getRegionType());
        } else if (config.getRegionType() == 2) {
            taskItemIndices = taskItemIndexRepository.findByTaskCodeInAndCodeInAndPrefectureCodeAndRegionType(taskCodes, indexCodes, config.getCode(), config.getRegionType());
        } else if (config.getRegionType() == 3) {
            taskItemIndices = taskItemIndexRepository.findByTaskCodeInAndCodeInAndCountyCodeAndRegionType(taskCodes, indexCodes, config.getCode(), config.getRegionType());
        } else {
            taskItemIndices = Collections.emptyList();
        }
        Map<String, List<TaskItemIndex>> indexIndices = taskItemIndices.stream().collect(Collectors.groupingBy(TaskItemIndex::getCode));

        for (String speciality : specialities) {
            Index index = specialityIndexMap.get(speciality);
            double value = 0.0D;
            if (null != index) {
                List<TaskItemIndex> indicesOfIndex = indexIndices.get(index.getCode());
                if (CollectionUtils.isNotEmpty(indicesOfIndex)) {
                    value = indicesOfIndex.get(0).getIndexValue();
                }
                result.add(RegionSpecialityIndexItemDto.builder()
                        .region(config.getCode())
                        .regionName(config.getName())
                        .speciality(speciality)
                        .specialityName(speciality)
                        .indexCode(index.getCode())
                        .indexName(index.getName())
                        .value(value)
                        .build());
            }
        }
        return result;
    }

    @ApiOperation("当点击专业里面的省份的时候，按当前省份专业下不同指标来展示结果")
    @GetMapping("/region/{region}/{speciality}")
    public ResponseDto<List<RegionSpecialityIndexItemDto>> province(
            @ApiParam("区域")
            @PathVariable("region") String region,
            @ApiParam("专业")
            @PathVariable("speciality") String speciality,
            @ApiParam("是否采用Mock数据")
            @RequestParam(value = "mock", required = false) Boolean mock) {
        if (BooleanUtils.isTrue(mock)) {
            return ResponseDto.success(doLoadProvinceSpecialityMock(region, speciality));
        }
        return ResponseDto.success(doLoadProvinceSpeciality(region, speciality));
    }

    private List<RegionSpecialityIndexItemDto> doLoadProvinceSpecialityMock(String region, String speciality) {
        List<RegionSpecialityIndexItemDto> result = new ArrayList<>();
        AreaCodeConfig config = areaCodeConfigRepository.findByCode(region);
        Assert.notNull(config, "没有找到对应区域");
        result.add(RegionSpecialityIndexItemDto.builder().region(config.getCode()).regionName(config.getName()).speciality(speciality).specialityName(speciality).indexCode("99001").indexName("字段完整率").value(random()).build());
        result.add(RegionSpecialityIndexItemDto.builder().region(config.getCode()).regionName(config.getName()).speciality(speciality).specialityName(speciality).indexCode("99002").indexName("命名规范率").value(random()).build());
        result.add(RegionSpecialityIndexItemDto.builder().region(config.getCode()).regionName(config.getName()).speciality(speciality).specialityName(speciality).indexCode("99003").indexName("关联一致率").value(random()).build());
        result.add(RegionSpecialityIndexItemDto.builder().region(config.getCode()).regionName(config.getName()).speciality(speciality).specialityName(speciality).indexCode("99004").indexName("空间资源准确率").value(random()).build());
        return result;
    }

    private List<RegionSpecialityIndexItemDto> doLoadProvinceSpeciality(String region, String speciality) {
        AreaCodeConfig config = areaCodeConfigRepository.findByCode(region);
        Assert.notNull(config, "没有找到对应区域");
        List<Index> indices99001 = indexRepository.findByCodeEndingWithAndSpecialityNameAndEnable("99001", speciality, true);
        List<Index> indices99002 = indexRepository.findByCodeEndingWithAndSpecialityNameAndEnable("99002", speciality, true);
        List<Index> indices99003 = indexRepository.findByCodeEndingWithAndSpecialityNameAndEnable("99003", speciality, true);
        List<Index> indices99999 = indexRepository.findByCodeEndingWithAndSpecialityNameAndEnable("99999", speciality, true);

        List<Index> indices = new ArrayList<>(indices99001);
        indices.addAll(indices99002);
        indices.addAll(indices99003);
        indices.addAll(indices99999);

        List<String> indexCodes = indices.stream()
                .map(Index::getCode).collect(Collectors.toList());

        String targetRegion = config.getRegionType() == 1 ? region : config.getProvinceCode();
        List<String> taskCodes = taskLatestRepository.findByProvinceAndSpecialityName(targetRegion, speciality).stream()
                .map(TaskLatest::getTaskCode).collect(Collectors.toList());

        List<TaskItemIndex> taskItemIndices;
        if (config.getRegionType() == 1) {
            taskItemIndices = taskItemIndexRepository.findByTaskCodeInAndCodeInAndRegionType(taskCodes, indexCodes, config.getRegionType());
        } else if (config.getRegionType() == 2) {
            taskItemIndices = taskItemIndexRepository.findByTaskCodeInAndCodeInAndPrefectureCodeAndRegionType(taskCodes, indexCodes, config.getCode(), config.getRegionType());
        } else if (config.getRegionType() == 3) {
            taskItemIndices = taskItemIndexRepository.findByTaskCodeInAndCodeInAndCountyCodeAndRegionType(taskCodes, indexCodes, config.getCode(), config.getRegionType());
        } else {
            taskItemIndices = Collections.emptyList();
        }

        Map<String, List<TaskItemIndex>> indexIndices = taskItemIndices.stream()
                .collect(Collectors.groupingBy(TaskItemIndex::getCode));

        List<RegionSpecialityIndexItemDto> result = new ArrayList<>();
        if (CollectionUtils.isNotEmpty(indices99001)) {
            double value = 0.0D;
            if (null != indexIndices) {
                List<TaskItemIndex> indicesOfIndex = indexIndices.get(indices99001.get(0).getCode());
                if (CollectionUtils.isNotEmpty(indicesOfIndex)) {
                    value = indicesOfIndex.get(0).getIndexValue();
                }
            }
            result.add(RegionSpecialityIndexItemDto.builder()
                    .region(config.getCode())
                    .regionName(config.getName())
                    .speciality(speciality)
                    .specialityName(speciality)
                    .indexCode(indices99001.get(0).getCode())
                    .indexName(indices99001.get(0).getName())
                    .value(value)
                    .build());

        }
        if (CollectionUtils.isNotEmpty(indices99002)) {
            double value = 0.0D;
            if (null != indexIndices) {
                List<TaskItemIndex> indicesOfIndex = indexIndices.get(indices99002.get(0).getCode());
                if (CollectionUtils.isNotEmpty(indicesOfIndex)) {
                    value = indicesOfIndex.get(0).getIndexValue();
                }
            }
            result.add(RegionSpecialityIndexItemDto.builder()
                    .region(config.getCode())
                    .regionName(config.getName())
                    .speciality(speciality)
                    .specialityName(speciality)
                    .indexCode(indices99002.get(0).getCode())
                    .indexName(indices99002.get(0).getName())
                    .value(value)
                    .build());

        }
        if (CollectionUtils.isNotEmpty(indices99003)) {
            double value = 0.0D;
            if (null != indexIndices) {
                List<TaskItemIndex> indicesOfIndex = indexIndices.get(indices99003.get(0).getCode());
                if (CollectionUtils.isNotEmpty(indicesOfIndex)) {
                    value = indicesOfIndex.get(0).getIndexValue();
                }
            }
            result.add(RegionSpecialityIndexItemDto.builder()
                    .region(config.getCode())
                    .regionName(config.getName())
                    .speciality(speciality)
                    .specialityName(speciality)
                    .indexCode(indices99003.get(0).getCode())
                    .indexName(indices99003.get(0).getName())
                    .value(value)
                    .build());

        }
        if (CollectionUtils.isNotEmpty(indices99999)) {
            double value = 0.0D;
            if (null != indexIndices) {
                List<TaskItemIndex> indicesOfIndex = indexIndices.get(indices99999.get(0).getCode());
                if (CollectionUtils.isNotEmpty(indicesOfIndex)) {
                    value = indicesOfIndex.get(0).getIndexValue();
                }
            }
            result.add(RegionSpecialityIndexItemDto.builder()
                    .region(config.getCode())
                    .regionName(config.getName())
                    .speciality(speciality)
                    .specialityName(speciality)
                    .indexCode(indices99999.get(0).getCode())
                    .indexName(indices99999.get(0).getName())
                    .value(value)
                    .build());

        }
        return result;
    }

    @ApiOperation("展示省份专业下具体的指标值")
    @GetMapping("/detail/{region}/{speciality}")
    public ResponseDto<List<IndexItemDetailDto>> detail(
            @ApiParam("区域")
            @PathVariable("region") String region,
            @ApiParam("专业")
            @PathVariable("speciality") String speciality,
            @ApiParam("是否采用Mock数据")
            @RequestParam(value = "mock", required = false) Boolean mock) {
        if (BooleanUtils.isTrue(mock)) {
            return ResponseDto.success(doLoadDetailMock(region, speciality));
        }
        return ResponseDto.success(doLoadDetail(region, speciality));
    }

    private List<IndexItemDetailDto> doLoadDetailMock(String region, String speciality) {
        List<Index> indices = indexRepository.findBySpecialityNameAndEnable(speciality, true);
        List<IndexItemDetailDto> result = new ArrayList<>();
        for (Index index : indices) {
            long total = RandomUtils.nextLong(1000, 10000);
            long error = RandomUtils.nextLong(total - 100, total);
            double value = 1.0D * (total - error) / total;
            result.add(IndexItemDetailDto.builder().indexName(index.getName()).indexCode(index.getCode()).totalAmount(total).errorAmount(error).value(value).build());
        }
        return result;
    }

    private List<IndexItemDetailDto> doLoadDetail(String region, String speciality) {
        List<Index> indices = indexRepository.findBySpecialityNameAndEnable(speciality, true);
        AreaCodeConfig config = areaCodeConfigRepository.findByCode(region);
        Assert.notNull(config, "没有找到对应区域");
        String targetRegion = config.getRegionType() == 1 ? region : config.getProvinceCode();
        List<TaskLatest> taskLatests = taskLatestRepository.findByProvinceAndSpecialityName(targetRegion, speciality);
        List<String> taskCodes = taskLatests.stream().map(TaskLatest::getTaskCode).collect(Collectors.toList());

        List<TaskItemIndex> taskItemIndices;
        if (config.getRegionType() == 1) {
            taskItemIndices = taskItemIndexRepository.findByTaskCodeInAndRegionType(taskCodes, config.getRegionType());
        } else if (config.getRegionType() == 2) {
            taskItemIndices = taskItemIndexRepository.findByTaskCodeInAndPrefectureCodeAndRegionType(taskCodes, config.getCode(), config.getRegionType());
        } else if (config.getRegionType() == 3) {
            taskItemIndices = taskItemIndexRepository.findByTaskCodeInAndCountyCodeAndRegionType(taskCodes, config.getCode(), config.getRegionType());
        } else {
            taskItemIndices = Collections.emptyList();
        }
        Map<String, List<TaskItemIndex>> indexIndices = taskItemIndices.stream().collect(Collectors.groupingBy(TaskItemIndex::getCode));
        List<IndexItemDetailDto> result = new ArrayList<>();
        for (Index index : indices) {
            List<TaskItemIndex> indicesOfIndex = indexIndices.get(index.getCode());
            TaskItemIndex value = null;
            if (CollectionUtils.isNotEmpty(indicesOfIndex)) {
                value = indicesOfIndex.get(0);
            }
            result.add(IndexItemDetailDto.builder()
                    .indexName(index.getName())
                    .indexCode(index.getCode())
                    .totalAmount(null != value && null != value.getAmount() ? value.getAmount() : 0L)
                    .errorAmount(null != value && null != value.getErrorAmount() ? value.getErrorAmount() : 0L)
                    .value(null != value && null != value.getIndexValue() ? value.getIndexValue() : 0.0D).build());
        }
        return result;
    }

    @ApiOperation("展示省份专业下最近几次核查的每个实体的量")
    @GetMapping("/history/entity/{region}/{speciality}")
    public ResponseDto<List<EntityRecordDto>> historyEntity(
            @ApiParam("区域")
            @PathVariable("region") String region,
            @ApiParam("专业")
            @PathVariable("speciality") String speciality,
            @ApiParam("是否采用Mock数据")
            @RequestParam(value = "mock", required = false) Boolean mock) {
        if (BooleanUtils.isTrue(mock)) {
            return ResponseDto.success(doLoadHistoryEntityMock(region, speciality));
        }
        return ResponseDto.success(doLoadHistoryEntity(region, speciality));
    }

    private List<EntityRecordDto> doLoadHistoryEntityMock(String region, String speciality) {
        List<EntityType> entityTypes = entityTypeRepository.findBySpecialityNameOrderByCode(speciality);
        DateTime current = new DateTime().withMillisOfDay(0);
        List<EntityRecordDto> result = new ArrayList<>();
        for (int i = 0; i < 3; i++) {
            result.add(EntityRecordDto.builder().date(current.minusDays(i).toDate()).columns(entityColumns(entityTypes)).build());
        }
        return result;
    }

    private List<EntityRecordDto> doLoadHistoryEntity(String region, String speciality) {
        AreaCodeConfig config = areaCodeConfigRepository.findByCode(region);
        Assert.notNull(config, "没有找到对应区域");
        String targetRegion = config.getRegionType() == 1 ? region : config.getProvinceCode();
        List<Task> tasks = taskRepository.findByProvinceAndSpecialityNameAndStatusOrderByCollectionDateDescTaskIdDesc(targetRegion, speciality, TaskStatusEnum.successStatus().getValue(), PageRequest.of(0, 3));
        List<EntityType> entityTypes = entityTypeRepository.findBySpecialityNameOrderByCode(speciality);
        List<EntityRecordDto> result = new ArrayList<>();
        for (Task task : tasks) {
            List<TaskItemBusiness> businesses = taskItemBusinessRepository.findByTaskCodeOrderByTaskItemBusinessIdAsc(task.getCode());
            Map<String, TaskItemBusiness> businessMap = businesses.stream().collect(Collectors.toMap(TaskItemBusiness::getCode, v -> v));
            result.add(EntityRecordDto.builder()
                    .date(task.getCollectionDate())
                    .collectDate(businesses.stream().map(TaskItemBusiness::getCollectionDate).findFirst().orElse(task.getCollectionDate()))
                    .columns(entityColumns(entityTypes, businessMap))
                    .build());
        }
        return result;
    }

    private List<EntityColumnDto> entityColumns(List<EntityType> entityTypes, Map<String, TaskItemBusiness> businessMap) {
        return entityTypes.stream()
                .map(e -> EntityColumnDto.builder()
                        .name(e.getName())
                        .code(e.getCode())
                        .amount(null != businessMap.get(e.getCode()) && null != businessMap.get(e.getCode()).getAmount() ? businessMap.get(e.getCode()).getAmount() : 0L)
                        .build())
                .collect(Collectors.toList());
    }

    private List<EntityColumnDto> entityColumns(List<EntityType> entityTypes) {
        return entityTypes.stream().map(e -> EntityColumnDto.builder().name(e.getName()).code(e.getCode()).amount(RandomUtils.nextLong(1000, 10000)).build()).collect(Collectors.toList());
    }

    private List<IndexColumnDto> indexColumns(List<Index> indices) {
        return indices.stream().map(e -> IndexColumnDto.builder().name(e.getName()).code(e.getCode()).value(random()).build()).collect(Collectors.toList());
    }

    private List<IndexColumnDto> indexColumns(List<Index> indices, Map<String, TaskItemIndex> taskItemIndexMap) {
        return indices.stream().map(e -> IndexColumnDto.builder()
                .name(e.getName())
                .code(e.getCode())
                .value(null != taskItemIndexMap.get(e.getCode()) && null != taskItemIndexMap.get(e.getCode()).getIndexValue() ? taskItemIndexMap.get(e.getCode()).getIndexValue() : 0.0D)
                .build()).collect(Collectors.toList());
    }

    @ApiOperation("展示省份专业下最近几次核查的每个指标的值")
    @GetMapping("/history/index/{region}/{speciality}")
    public ResponseDto<List<IndexRecordDto>> historyIndex(
            @ApiParam("区域")
            @PathVariable("region") String region,
            @ApiParam("专业")
            @PathVariable("speciality") String speciality,
            @ApiParam("是否采用Mock数据")
            @RequestParam(value = "mock", required = false) Boolean mock) {
        if (BooleanUtils.isTrue(mock)) {
            return ResponseDto.success(doLoadHistoryIndexMock(region, speciality));
        }
        return ResponseDto.success(doLoadHistoryIndex(region, speciality));
    }

    private List<IndexRecordDto> doLoadHistoryIndexMock(String region, String speciality) {
        List<Index> indices = indexRepository.findBySpecialityNameAndEnable(speciality, true);
        DateTime current = new DateTime().withMillisOfDay(0);
        List<IndexRecordDto> result = new ArrayList<>();
        for (int i = 0; i < 3; i++) {
            result.add(IndexRecordDto.builder().date(current.minusDays(i).toDate()).columns(indexColumns(indices)).build());
        }
        return result;
    }

    private List<IndexRecordDto> doLoadHistoryIndex(String region, String speciality) {
        AreaCodeConfig config = areaCodeConfigRepository.findByCode(region);
        Assert.notNull(config, "没有找到对应区域");
        String targetRegion = config.getRegionType() == 1 ? region : config.getProvinceCode();
        List<Task> tasks = taskRepository.findByProvinceAndSpecialityNameAndStatusOrderByCollectionDateDescTaskIdDesc(targetRegion, speciality, TaskStatusEnum.successStatus().getValue(), PageRequest.of(0, 3));
        List<Index> indices = indexRepository.findBySpecialityNameAndEnable(speciality, true);
        List<IndexRecordDto> result = new ArrayList<>();
        for (Task task : tasks) {
            List<TaskItemIndex> taskItemIndices;
            if (config.getRegionType() == 1) {
                taskItemIndices = taskItemIndexRepository.findByTaskCodeInAndRegionType(Lists.newArrayList(task.getCode()), config.getRegionType());
            } else if (config.getRegionType() == 2) {
                taskItemIndices = taskItemIndexRepository.findByTaskCodeInAndPrefectureCodeAndRegionType(Lists.newArrayList(task.getCode()), config.getCode(), config.getRegionType());
            } else if (config.getRegionType() == 3) {
                taskItemIndices = taskItemIndexRepository.findByTaskCodeInAndCountyCodeAndRegionType(Lists.newArrayList(task.getCode()), config.getCode(), config.getRegionType());
            } else {
                taskItemIndices = Collections.emptyList();
            }
            Map<String, TaskItemIndex> taskItemIndexMap = taskItemIndices.stream().collect(Collectors.toMap(TaskItemIndex::getCode, v -> v));
            result.add(IndexRecordDto.builder()
                    .date(task.getCollectionDate())
                    .collectDate(taskItemIndices.stream().map(TaskItemIndex::getCollectionDate).findFirst().orElse(task.getCollectionDate()))
                    .columns(indexColumns(indices, taskItemIndexMap)).build());
        }
        return result;
    }
}
