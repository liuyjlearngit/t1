package com.cmdi.dims.app;

import java.io.IOException;
import java.text.ParseException;
import java.util.*;
import java.util.stream.Collectors;

import com.cmdi.dims.app.dto.*;

import com.cmdi.dims.data.entity.DataStorage;
import com.cmdi.dims.data.repository.DataStorageRepository;
import com.cmdi.dims.index.entity.Index;
import com.cmdi.dims.index.entity.IndexCarrier;
import com.cmdi.dims.index.repository.IndexCarrierRepository;
import com.cmdi.dims.index.repository.IndexRepository;
import com.cmdi.dims.meta.entity.EntityType;
import com.cmdi.dims.meta.repostitory.EntityTypeRepository;
import com.cmdi.dims.task.TaskStatusEnum;

import com.cmdi.dims.util.ExcelUtils;
import com.cmdi.dims.util.ExportExcelUtils;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang3.BooleanUtils;
import org.apache.commons.lang3.RandomUtils;
import org.apache.commons.lang3.StringUtils;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.web.bind.annotation.*;

import com.google.common.collect.Lists;

import io.jsonwebtoken.lang.Assert;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import lombok.extern.slf4j.Slf4j;
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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


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
    @Autowired
    private IndexCarrierRepository indexCarrierRepository;
    @Autowired
    private DataStorageRepository dataStorageRepositors;

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
        List<String> specialities = entityTypeRepository.findSpecialityNames();//查找出所有类型

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
        if (null == config) {//全国
            taskCodes = taskLatestRepository.findBySpecialityName(speciality).stream()
                    .map(TaskLatest::getTaskCode).collect(Collectors.toList());
            return taskItemIndexRepository.findByTaskCodeInAndCodeInAndRegionType(taskCodes, indexCodes, 1);
        } else if (config.getRegionType() == 1) {//省级
            taskCodes = taskLatestRepository.findByProvinceAndSpecialityName(config.getCode(), speciality).stream()
                    .map(TaskLatest::getTaskCode).collect(Collectors.toList());
            List<TaskItemIndex> result = taskItemIndexRepository.findByTaskCodeInAndCodeInAndRegionType(taskCodes, indexCodes, 2);
            return result.stream().map(t -> {
                if (StringUtils.isEmpty(t.getPrefectureCode())) {
                    t.setPrefectureCode("000000");
                }
                return t;
            }).collect(Collectors.toList());
        } else if (config.getRegionType() == 2) {//市级
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
     *
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
        String regionName="全国";
        if (StringUtils.isNotEmpty(region)) {

            config = areaCodeConfigRepository.findByCode(region);
            regionName=config.getName();
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

        //返回 当前地址名称
        statistic.setRegionsName(regionName);
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
     *
     * @param region
     * @return
     */
    @ApiOperation("展示省份各专业或地市各专业指标值")
    @GetMapping("/regionSpecialityIndex/{region}")
    public List<TaskItemIndex> regionSpecialityIndex(@PathVariable("region") String region) {
        final AreaCodeConfig config;
        if (StringUtils.isNotEmpty(region)) {//非空
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
            globle = null;
        } else if (config.getRegionType() == 1) {
            globle = findGlobal(config, indexCodes);
        } else if (config.getRegionType() == 2) {
            globle = findGlobal(config, indexCodes);
        } else {
            globle = findGlobal(config, indexCodes);
        }

        return globle;
    }


    private List<AreaCodeConfig> loadRegion(String region) {//传递 省市县 code 返回 他的下一级数据
        List<AreaCodeConfig> configs;
        if (StringUtils.isEmpty(region)) {

            configs = areaCodeConfigRepository.findByRegionTypeOrderByCode(1);//region空  就是全国时查找省 按code排序
        } else {
            AreaCodeConfig config = areaCodeConfigRepository.findByCodeOrderByRegionTypeDesc(region);//region非空 查找 省市县 对应code的数据
            Assert.notNull("没有找到对应的区域");
            if (config.getRegionType() == 1) {//省级
                //找下属市
                configs = areaCodeConfigRepository.findByProvinceCodeAndRegionTypeOrderByCode(config.getCode(), 2);
                AreaCodeConfig all = new AreaCodeConfig();
                all.setCode("000000");
                all.setName("无地市");
                configs.add(all);
            } else {//市县级
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
        List<Index> indices99004 = indexRepository.findByCodeEndingWithAndSpecialityNameAndEnable("99004", speciality, true);
        List<Index> indices99999 = indexRepository.findByCodeEndingWithAndSpecialityNameAndEnable("99999", speciality, true);

        List<Index> indices = new ArrayList<>(indices99001);
        indices.addAll(indices99002);
        indices.addAll(indices99003);
        indices.addAll(indices99004);
        indices.addAll(indices99999);

        List<String> indexCodes = indices.stream()
                .map(Index::getCode).collect(Collectors.toList());
        List<TaskItemIndex> taskItemIndices = findLatest(config, speciality, indexCodes);

        Map<String, Map<String, List<TaskItemIndex>>> regionIndices;
        if (null == config) {//国家 级 取省级的数据
            regionIndices = taskItemIndices.stream()
                    .collect(Collectors.groupingBy(TaskItemIndex::getProvinceCode,
                            Collectors.collectingAndThen(Collectors.toList(), l -> l.stream().collect(Collectors.groupingBy(TaskItemIndex::getCode)))));
        } else if (config.getRegionType() == 1) {//省级 取市级的数据
            regionIndices = taskItemIndices.stream()
                    .collect(Collectors.groupingBy(TaskItemIndex::getPrefectureCode,
                            Collectors.collectingAndThen(Collectors.toList(), l -> l.stream().collect(Collectors.groupingBy(TaskItemIndex::getCode)))));
        } else if (config.getRegionType() == 2) {//市级取县级的数据
            regionIndices = taskItemIndices.stream()
                    .collect(Collectors.groupingBy(TaskItemIndex::getCountyCode,
                            Collectors.collectingAndThen(Collectors.toList(), l -> l.stream().collect(Collectors.groupingBy(TaskItemIndex::getCode)))));
        } else {
            regionIndices = Collections.emptyMap();
        }


        List<AreaCodeConfig> configs = loadRegion(region);
        List<RegionSpecialityIndexItemDto> result = new ArrayList<>();
        for (AreaCodeConfig currentConfig : configs) {
            Map<String, List<TaskItemIndex>> indexIndices = regionIndices.get(currentConfig.getCode());//循环判断 当前 地址的下一级 是否有符合 (查找的是 符合前台的选中的地区 的专业 的所有指标的 下一级 地区的所有数据)
            if (CollectionUtils.isNotEmpty(indices99001)) {//判断 当前 地址是否有这个指标  然后判断他的下一级是否有这个指标
                double value = 0.0D;
                if (null != indexIndices) {//当前 地址的下一级是否有这个指标
                    List<TaskItemIndex> indicesOfIndex = indexIndices.get(indices99001.get(0).getCode());
                    if (CollectionUtils.isNotEmpty(indicesOfIndex)) {
                        int size = indicesOfIndex.size();
                        if (size>0){
                            value = indicesOfIndex.stream().mapToDouble(TaskItemIndex::getIndexValue).average().orElse(0.0D);//有 符合条件的数据就取他的 指标
                        }//有 符合条件的数据就取他的 指标
                    }
                }
                result.add(RegionSpecialityIndexItemDto.builder()//存储数据
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
                        int size = indicesOfIndex.size();
                        if (size>0){
                            value = indicesOfIndex.stream().mapToDouble(TaskItemIndex::getIndexValue).average().orElse(0.0D);//有 符合条件的数据就取他的 指标
                        }
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
                        int size = indicesOfIndex.size();
                        if (size>0){
                            value = indicesOfIndex.stream().mapToDouble(TaskItemIndex::getIndexValue).average().orElse(0.0D);//有 符合条件的数据就取他的 指标
                        }
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
            if (CollectionUtils.isNotEmpty(indices99004)) {
                double value = 0.0D;
                if (null != indexIndices) {
                    List<TaskItemIndex> indicesOfIndex = indexIndices.get(indices99004.get(0).getCode());
                    if (CollectionUtils.isNotEmpty(indicesOfIndex)) {
                        int size = indicesOfIndex.size();
                        if (size>0){
                            value = indicesOfIndex.stream().mapToDouble(TaskItemIndex::getIndexValue).average().orElse(0.0D);//有 符合条件的数据就取他的 指标
                        }
                    }
                }
                result.add(RegionSpecialityIndexItemDto.builder()
                        .region(currentConfig.getCode())
                        .regionName(currentConfig.getName())
                        .speciality(speciality)
                        .specialityName(speciality)
                        .indexCode(indices99004.get(0).getCode())
                        .indexName(indices99004.get(0).getName())
                        .value(value)
                        .build());

            }
            if (CollectionUtils.isNotEmpty(indices99999)) {
                double value = 0.0D;
                if (null != indexIndices) {
                    List<TaskItemIndex> indicesOfIndex = indexIndices.get(indices99999.get(0).getCode());
                    if (CollectionUtils.isNotEmpty(indicesOfIndex)) {
                        int size = indicesOfIndex.size();
                        if (size>0){
                            value = indicesOfIndex.stream().mapToDouble(TaskItemIndex::getIndexValue).average().orElse(0.0D);//有 符合条件的数据就取他的 指标
                        }
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
//        查找 专业的整体指标
        List<Index> indices = indexRepository.findByCodeEndingWithAndEnable("99999", true);
        List<String> indexCodes = indices.stream()
                .map(Index::getCode).collect(Collectors.toList());
        Map<String, Index> specialityIndexMap = indices.stream().collect(Collectors.toMap(Index::getSpecialityName, v -> v));
//取 省级code
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
        Map<String, List<TaskItemIndex>> indexIndices = taskItemIndices.stream().collect(Collectors.groupingBy(TaskItemIndex::getCode));//该 地址的 整体指标数据

        for (String speciality : specialities) {
            Index index = specialityIndexMap.get(speciality);
            double value = 0.0D;
            if (null != index) {
                List<TaskItemIndex> indicesOfIndex = indexIndices.get(index.getCode());//符合条件的整体指标数据
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
//        List<Index> indices99004 = indexRepository.findByCodeEndingWithAndSpecialityNameAndEnable("99004", speciality, true);
        List<Index> indices99999 = indexRepository.findByCodeEndingWithAndSpecialityNameAndEnable("99999", speciality, true);

        List<Index> indices = new ArrayList<>(indices99001);
        indices.addAll(indices99002);
        indices.addAll(indices99003);
//        indices.addAll(indices99004);
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

        Map<String, List<TaskItemIndex>> indexIndices = taskItemIndices.stream()//查找的是 当前前台的地址 的专业的 当前省市县级别的数据
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
//        if (CollectionUtils.isNotEmpty(indices99004)) {
//            double value = 0.0D;
//            if (null != indexIndices) {
//                List<TaskItemIndex> indicesOfIndex = indexIndices.get(indices99004.get(0).getCode());
//                if (CollectionUtils.isNotEmpty(indicesOfIndex)) {
//                    value = indicesOfIndex.get(0).getIndexValue();
//                }
//            }
//            result.add(RegionSpecialityIndexItemDto.builder()
//                    .region(config.getCode())
//                    .regionName(config.getName())
//                    .speciality(speciality)
//                    .specialityName(speciality)
//                    .indexCode(indices99004.get(0).getCode())
//                    .indexName(indices99004.get(0).getName())
//                    .value(value)
//                    .build());
//
//        }
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
                        .code(e.getCode())//null != businessMap.get(e.getCode()) &&
                        .amount(null != businessMap.get(e.getCode()) &&null != businessMap.get(e.getCode()).getAmount() ? businessMap.get(e.getCode()).getAmount() : 0L)
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
                .amout(null != taskItemIndexMap.get(e.getCode()) && null != taskItemIndexMap.get(e.getCode()).getAmount() ? taskItemIndexMap.get(e.getCode()).getAmount() : 0.0D)
                .error(null != taskItemIndexMap.get(e.getCode()) && null != taskItemIndexMap.get(e.getCode()).getErrorAmount() ? taskItemIndexMap.get(e.getCode()).getErrorAmount() : 0.0D)
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
        AreaCodeConfig config = areaCodeConfigRepository.findByCode(region);//找到相应的 省市县
        Assert.notNull(config, "没有找到对应区域");
        String targetRegion = config.getRegionType() == 1 ? region : config.getProvinceCode();//取 省
        List<Task> tasks = taskRepository.findByProvinceAndSpecialityNameAndStatusOrderByCollectionDateDescTaskIdDesc(targetRegion, speciality, TaskStatusEnum.successStatus().getValue(), PageRequest.of(0, 3));//查找历史 这个省 的这个专业的 最近的3条数据
        List<Index> indices = indexRepository.findBySpecialityNameAndEnable(speciality, true);//所以该专业的指标
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

    //开始
    @ApiOperation("首屏统计省市县各个专业的指标数据")
    @GetMapping("/global/mojar")
    public ResponseDto<List<SpecificationsDto>> mojar(
            @ApiParam("区域信息，当全国的时候保持为空，当具体部署到省份的时候传具体省份的值")
            @RequestParam(value = "region", required = false) String region,
            @ApiParam("是否采用Mock数据")
            @RequestParam(value = "mock", required = false) Boolean mock) {
        if (BooleanUtils.isTrue(mock)) {
            //return ResponseDto.success(loadMojarMock(region));
        }
        return ResponseDto.success(loadMojar(region));
    }

    //首屏统计各个专业的指标数据  业务
    private List<SpecificationsDto> loadMojar(String region) {
        //判断是否是  全国
        final AreaCodeConfig config;
        if (StringUtils.isNotEmpty(region)) {
            config = areaCodeConfigRepository.findByCode(region);
            Assert.notNull(config, "没有找到对应的区域");
        } else {
            config = null;
        }

        List<String> specialityNames = entityTypeRepository.findSpecialityNames();//所有专业名

        List<SpecificationsDto> result = new ArrayList<>();//

        //如果region区域编码为空时，加载各省区域编码；
        //region区域编码为省级编码时，加载各地市区域编码
        //region区域编码为市编码时，加载各区县区域编码


        List<String> taskCodes = null;
        if (config!=null){
            String targetRegion = config.getRegionType() == 1 ? region : config.getProvinceCode();
            taskCodes = taskLatestRepository.findByProvince(targetRegion).stream()
                    .map(TaskLatest::getTaskCode).collect(Collectors.toList());//所有包含的省份
        }


        for (String specialityname:specialityNames) {//所有专业名
            if (config==null){//全国
                List<String> taskCodeAll = taskLatestRepository.findAll().stream()
                        .map(TaskLatest::getTaskCode).collect(Collectors.toList());//全国所有 审核的 taskcode

                HashMap<String, Double> indexCodes = getIndexCodes(specialityname, taskCodeAll, 1,"");

                returnSpecificationsDto(specialityname,indexCodes,result);
            }else if (config.getRegionType()==1){
                String code = config.getCode();
                HashMap<String, Double> indexCodes = getIndexCodes(specialityname, taskCodes, 1,"");

                returnSpecificationsDto(specialityname,indexCodes,result);
            }else if (config.getRegionType()==2){
                String code = config.getCode();
                HashMap<String, Double> indexCodes = getIndexCodes(specialityname, taskCodes, 2,code);

                returnSpecificationsDto(specialityname,indexCodes,result);
            }else {
                String code = config.getCode();
                HashMap<String, Double> indexCodes = getIndexCodes(specialityname, taskCodes, 3,code);

                returnSpecificationsDto(specialityname,indexCodes,result);
            }
        }
        return result;
    }

    public boolean returnSpecificationsDto(String specialityname, HashMap<String, Double> indexCodes, List<SpecificationsDto> result){
        if (indexCodes.get("v99001")==null){
            return result.add(SpecificationsDto.builder()
                    .speciality(specialityname)
                    .specialityName(specialityname)
                    .totalValue(indexCodes.get("v99999"))
                    .normativityValue(indexCodes.get("v99002"))
                    .associationValue(indexCodes.get("v99003"))
                    .complianceValue(indexCodes.get("v99004"))
                    .build());
        }else if (indexCodes.get("v99002")==null){
            return result.add(SpecificationsDto.builder()
                    .speciality(specialityname)
                    .specialityName(specialityname)
                    .totalValue(indexCodes.get("v99999"))
                    .integrityValue(indexCodes.get("v99001"))
                    .associationValue(indexCodes.get("v99003"))
                    .complianceValue(indexCodes.get("v99004"))
                    .build());
        }else if (indexCodes.get("v99003")==null){
            return result.add(SpecificationsDto.builder()
                    .speciality(specialityname)
                    .specialityName(specialityname)
                    .totalValue(indexCodes.get("v99999"))
                    .integrityValue(indexCodes.get("v99001"))
                    .normativityValue(indexCodes.get("v99002"))
                    .complianceValue(indexCodes.get("v99004"))
                    .build());
        }else if (indexCodes.get("v99004")==null){
            return result.add(SpecificationsDto.builder()
                    .speciality(specialityname)
                    .specialityName(specialityname)
                    .totalValue(indexCodes.get("v99999"))//
                    .integrityValue(indexCodes.get("v99001"))//
                    .normativityValue(indexCodes.get("v99002"))
                    .associationValue(indexCodes.get("v99003"))
                    .build());
        }
        return result.add(SpecificationsDto.builder()
                .speciality(specialityname)
                .specialityName(specialityname)
                .totalValue(indexCodes.get("v99999"))
                .integrityValue(indexCodes.get("v99001"))
                .normativityValue(indexCodes.get("v99002"))
                .associationValue(indexCodes.get("v99003"))
                .complianceValue(indexCodes.get("v99004"))
                .build());
    }

    public HashMap<String, Double> getIndexCodes(String specialityname,List<String> taskCodeAll,Integer type,String code){
        List<Index> indices99002 = indexRepository.findByCodeEndingWithAndSpecialityNameAndEnable("99002", specialityname, true);
        List<Index> indices99001 = indexRepository.findByCodeEndingWithAndSpecialityNameAndEnable("99001", specialityname, true);
        List<Index> indices99003 = indexRepository.findByCodeEndingWithAndSpecialityNameAndEnable("99003", specialityname, true);
        List<Index> indices99004 = indexRepository.findByCodeEndingWithAndSpecialityNameAndEnable("99004", specialityname, true);
        List<Index> indices99999 = indexRepository.findByCodeEndingWithAndSpecialityNameAndEnable("99999", specialityname, true);

        List<String> indice99002 = indices99002.stream()
                .map(Index::getCode).collect(Collectors.toList());

        List<String> indice99001 = indices99001.stream()
                .map(Index::getCode).collect(Collectors.toList());

        List<String> indice99003 = indices99003.stream()
                .map(Index::getCode).collect(Collectors.toList());

        List<String> indice99004 = indices99004.stream()
                .map(Index::getCode).collect(Collectors.toList());

        List<String> indice99999 = indices99999.stream()
                .map(Index::getCode).collect(Collectors.toList());

        List<TaskItemIndex> indice99001s ;
        List<TaskItemIndex> indice99002s;
        List<TaskItemIndex> indice99003s;
        List<TaskItemIndex> indice99004s;
        List<TaskItemIndex> indice99999s;

        if (type==1){//全国
            indice99001s = taskItemIndexRepository.findByTaskCodeInAndCodeInAndRegionType(taskCodeAll, indice99001, type);//全国所有省的 99001数据
            indice99002s = taskItemIndexRepository.findByTaskCodeInAndCodeInAndRegionType(taskCodeAll, indice99002, type);//全国所有省的 99001数据
            indice99003s = taskItemIndexRepository.findByTaskCodeInAndCodeInAndRegionType(taskCodeAll, indice99003, type);//全国所有省的 99001数据
            indice99004s = taskItemIndexRepository.findByTaskCodeInAndCodeInAndRegionType(taskCodeAll, indice99004, type);//全国所有省的 99001数据
            indice99999s = taskItemIndexRepository.findByTaskCodeInAndCodeInAndRegionType(taskCodeAll, indice99999, type);//全国所有省的 99001数据
        }else if (type==2){
            indice99001s = taskItemIndexRepository.findByTaskCodeInAndCodeInAndPrefectureCodeAndRegionType(taskCodeAll, indice99001,code, type);//全国所有省的 99001数据
            indice99002s = taskItemIndexRepository.findByTaskCodeInAndCodeInAndPrefectureCodeAndRegionType(taskCodeAll, indice99002,code, type);//全国所有省的 99001数据
            indice99003s = taskItemIndexRepository.findByTaskCodeInAndCodeInAndPrefectureCodeAndRegionType(taskCodeAll, indice99003,code, type);//全国所有省的 99001数据
            indice99004s = taskItemIndexRepository.findByTaskCodeInAndCodeInAndPrefectureCodeAndRegionType(taskCodeAll, indice99004,code, type);//全国所有省的 99001数据
            indice99999s = taskItemIndexRepository.findByTaskCodeInAndCodeInAndPrefectureCodeAndRegionType(taskCodeAll, indice99999,code, type);
        }else {
            indice99001s = taskItemIndexRepository.findByTaskCodeInAndCodeInAndCountyCodeAndRegionType(taskCodeAll, indice99001,code, type);//全国所有省的 99001数据
            indice99002s = taskItemIndexRepository.findByTaskCodeInAndCodeInAndCountyCodeAndRegionType(taskCodeAll, indice99002,code, type);//全国所有省的 99001数据
            indice99003s = taskItemIndexRepository.findByTaskCodeInAndCodeInAndCountyCodeAndRegionType(taskCodeAll, indice99003,code, type);//全国所有省的 99001数据
            indice99004s = taskItemIndexRepository.findByTaskCodeInAndCodeInAndCountyCodeAndRegionType(taskCodeAll, indice99004,code, type);//全国所有省的 99001数据
            indice99999s = taskItemIndexRepository.findByTaskCodeInAndCodeInAndCountyCodeAndRegionType(taskCodeAll, indice99999,code, type);
        }

        double v99001 = indice99001s.stream().mapToDouble(TaskItemIndex::getIndexValue).average().orElse(0.0D);
        double v99002 = indice99002s.stream().mapToDouble(TaskItemIndex::getIndexValue).average().orElse(0.0D);
        double v99003 = indice99003s.stream().mapToDouble(TaskItemIndex::getIndexValue).average().orElse(0.0D);
        double v99004 = indice99004s.stream().mapToDouble(TaskItemIndex::getIndexValue).average().orElse(0.0D);
        double v99999 = indice99999s.stream().mapToDouble(TaskItemIndex::getIndexValue).average().orElse(0.0D);

        HashMap<String, Double> doubleHashMap = new HashMap<>();


        doubleHashMap.put("v99001",indice99001.size()>0?v99001:null);
        doubleHashMap.put("v99002",indice99002.size()>0?v99002:null);
        doubleHashMap.put("v99003",indice99003.size()>0?v99003:null);
        doubleHashMap.put("v99004",indice99004.size()>0?v99004:null);
        doubleHashMap.put("v99999",v99999);

        return doubleHashMap;
    }

    @ApiOperation("按类型统计核查")
    @GetMapping("/history/index/checktype/{region}/{speciality}")
    public ResponseDto<List<PointerTypes>> checktype(
            @ApiParam("区域")
            @PathVariable("region") String region,
            @ApiParam("专业")
            @PathVariable("speciality") String speciality,
            @ApiParam("是否采用Mock数据")
            @RequestParam(value = "mock", required = false) Boolean mock) {
        if (BooleanUtils.isTrue(mock)) {
//            return ResponseDto.success(doLoadHistoryIndexMock(region, speciality));
        }
        return ResponseDto.success(checktypes(region, speciality));
    }

    private List<PointerTypes> checktypes(String region, String speciality) {
        List<Index> indices = indexRepository.findBySpecialityNameAndEnable(speciality, true);//dims_idx_index表 按  SpecialityName和 isenable 查找
        AreaCodeConfig config = areaCodeConfigRepository.findByCode(region);//dims_tm_areacodeconfig 表 按省 来查找
        Assert.notNull(config, "没有找到对应区域");
        String targetRegion = config.getRegionType() == 1 ? region : config.getProvinceCode();//确定 省
        List<TaskLatest> taskLatests = taskLatestRepository.findByProvinceAndSpecialityName(targetRegion, speciality);//按 省 和 专业来查找 表 dims_tm_task_latest
        List<String> taskCodes = taskLatests.stream().map(TaskLatest::getTaskCode).collect(Collectors.toList());//取 TaskCode 存入数组

        List<Index> indices99001 = indexRepository.findByCodeEndingWithAndSpecialityNameAndEnable("99001", speciality, true);
        List<Index> indices99002 = indexRepository.findByCodeEndingWithAndSpecialityNameAndEnable("99002", speciality, true);
        List<Index> indices99003 = indexRepository.findByCodeEndingWithAndSpecialityNameAndEnable("99003", speciality, true);
        List<Index> indices99004 = indexRepository.findByCodeEndingWithAndSpecialityNameAndEnable("99004", speciality, true);

        if (indices99001.size()>0){
            List<Long> carrier99001 = indexCarrierRepository.findByParentIndexId(indices99001.get(0).getIndexId()).stream()
                    .map(IndexCarrier::getChildIndexId).collect(Collectors.toList());
            carrier99001.add(indices99001.get(0).getIndexId());



            indices99001 = indexRepository.findByIndexIdIn(carrier99001);

        }
        if (indices99002.size()>0){
            List<Long> carrier99002 = indexCarrierRepository.findByParentIndexId(indices99002.get(0).getIndexId()).stream()
                    .map(IndexCarrier::getChildIndexId).collect(Collectors.toList());
            carrier99002.add(indices99002.get(0).getIndexId());

            indices99002 = indexRepository.findByIndexIdIn(carrier99002);

        }
        if (indices99003.size()>0){
            List<Long> carrier99003 = indexCarrierRepository.findByParentIndexId(indices99003.get(0).getIndexId()).stream()
                    .map(IndexCarrier::getChildIndexId).collect(Collectors.toList());
            carrier99003.add(indices99003.get(0).getIndexId());

            indices99003 = indexRepository.findByIndexIdIn(carrier99003);

        }
        if (indices99004.size()>0){
            List<Long> carrier99004 =
                    indexCarrierRepository.findByParentIndexId(indices99004.get(0).getIndexId()).stream()
                    .map(IndexCarrier::getChildIndexId).collect(Collectors.toList());
            carrier99004.add(indices99004.get(0).getIndexId());
            indices99004 = indexRepository.findByIndexIdIn(carrier99004);
        }



        List<TaskItemIndex> taskItemIndices;
        if (config.getRegionType() == 1) {
            taskItemIndices = taskItemIndexRepository.findByTaskCodeInAndRegionType(taskCodes, config.getRegionType());//查找 dims_tm_taskitem_index表 省级的 taskCodes字段
        } else if (config.getRegionType() == 2) {
            taskItemIndices = taskItemIndexRepository.findByTaskCodeInAndPrefectureCodeAndRegionType(taskCodes, config.getCode(), config.getRegionType());
        } else if (config.getRegionType() == 3) {
            taskItemIndices = taskItemIndexRepository.findByTaskCodeInAndCountyCodeAndRegionType(taskCodes, config.getCode(), config.getRegionType());
        } else {
            taskItemIndices = Collections.emptyList();
        }
        Map<String, List<TaskItemIndex>> indexIndices = taskItemIndices.stream().collect(Collectors.groupingBy(TaskItemIndex::getCode));//把所有数据的 键值对存储
        List<IndexItemDetailDto> result = new ArrayList<>();
        List<IndexItemDetailDto> result2 = new ArrayList<>();
        List<IndexItemDetailDto> result3 = new ArrayList<>();
        List<IndexItemDetailDto> result4 = new ArrayList<>();
        List<PointerType> pointerType = new ArrayList<>();
        List<PointerTypes> pointerTypes = new ArrayList<>();

        for (Index index : indices99001) {

            List<TaskItemIndex> indicesOfIndex = indexIndices.get(index.getCode());//99001
            if (CollectionUtils.isNotEmpty(indicesOfIndex)) {
                for (TaskItemIndex task:indicesOfIndex) {
                    result.add(IndexItemDetailDto.builder()//非空判断存入数值
                            .indexName(index.getName())
                            .indexCode(index.getCode())
                            .totalAmount(null != task && null != task.getAmount() ? task.getAmount() : 0L)
                            .errorAmount(null != task && null != task.getErrorAmount() ? task.getErrorAmount() : 0L)
                            .value(null != task && null != task.getIndexValue() ? task.getIndexValue() : 0.0D).build());
                }

            }

        }
        if (result.size()>0){
            pointerType.add(PointerType.builder().indType("完整性").indexItemDetailDto(result).build());

        }


        for (Index index : indices99002) {
            List<TaskItemIndex> indicesOfIndex = indexIndices.get(index.getCode());//99001
            TaskItemIndex value = null;
            if (CollectionUtils.isNotEmpty(indicesOfIndex)) {
                for (TaskItemIndex task:indicesOfIndex) {
                    result2.add(IndexItemDetailDto.builder()//非空判断存入数值
                            .indexName(index.getName())
                            .indexCode(index.getCode())
                            .totalAmount(null != task && null != task.getAmount() ? task.getAmount() : 0L)
                            .errorAmount(null != task && null != task.getErrorAmount() ? task.getErrorAmount() : 0L)
                            .value(null != task && null != task.getIndexValue() ? task.getIndexValue() : 0.0D).build());
                }

            }
        }
        if (result2.size()>0){
            pointerType.add(PointerType.builder().indType("规范性").indexItemDetailDto(result2).build());

        }


        for (Index index : indices99003) {
            List<TaskItemIndex> indicesOfIndex = indexIndices.get(index.getCode());//99001
            TaskItemIndex value = null;
            if (CollectionUtils.isNotEmpty(indicesOfIndex)) {
                for (TaskItemIndex task:indicesOfIndex) {
                    result3.add(IndexItemDetailDto.builder()//非空判断存入数值
                            .indexName(index.getName())
                            .indexCode(index.getCode())
                            .totalAmount(null != task && null != task.getAmount() ? task.getAmount() : 0L)
                            .errorAmount(null != task && null != task.getErrorAmount() ? task.getErrorAmount() : 0L)
                            .value(null != task && null != task.getIndexValue() ? task.getIndexValue() : 0.0D).build());
                }

            }
        }
        if (result3.size()>0){
            pointerType.add(PointerType.builder().indType("关联性").indexItemDetailDto(result3).build());

        }


        for (Index index : indices99004) {
            List<TaskItemIndex> indicesOfIndex = indexIndices.get(index.getCode());//99001
            TaskItemIndex value = null;
            if (CollectionUtils.isNotEmpty(indicesOfIndex)) {
                for (TaskItemIndex task:indicesOfIndex) {
                    result4.add(IndexItemDetailDto.builder()//非空判断存入数值
                            .indexName(index.getName())
                            .indexCode(index.getCode())
                            .totalAmount(null != task && null != task.getAmount() ? task.getAmount() : 0L)
                            .errorAmount(null != task && null != task.getErrorAmount() ? task.getErrorAmount() : 0L)
                            .value(null != task && null != task.getIndexValue() ? task.getIndexValue() : 0.0D).build());
                }

            }
        }
        if (result4.size()>0){
            pointerType.add(PointerType.builder().indType("合规性").indexItemDetailDto(result4).build());

        }

        pointerTypes.add(PointerTypes.builder().specialityType(speciality).specialityValue(pointerType).build());

        return pointerTypes;//返回前台
    }

    @ApiOperation("按类型统计核查数据excel")
    @PostMapping ("/history/indexs/exportdown/{speciality}")
    public void exportdown(
            HttpServletResponse response,
            @ApiParam("区域信息，当全国的时候保持为空，当具体部署到省份的时候传具体省份的值")
            @RequestParam(value = "region", required = false) String region,
            @ApiParam("专业")
            @PathVariable("speciality") List<String> speciality,
            @ApiParam("是否采用Mock数据")
            @RequestParam(value = "mock", required = false) Boolean mock)throws Exception {

//
        if (BooleanUtils.isTrue(mock)) {
//            return ResponseDto.success(doLoadHistoryIndexMock(region, speciality));
        }

        System.out.println(region);

        String exportdowns = exportdowns(response, region, speciality);
//        ExcelDowns excelDowns = new ExcelDowns();
//        excelDowns.exportExcel();
    }

    public String exportdowns(HttpServletResponse response, String region, List<String> speciality) throws Exception {


        //当前级别的数据
        List<SpecificationsDto> specificationsDtos = loadMojar(region);
        Map<String, SpecificationsDto> collect3=new HashMap<>();
        for (SpecificationsDto specs:specificationsDtos) {
            collect3.put(specs.getSpeciality(),specs);

        }


        String site=null;//要传递
        if ("".equals(region)||region==null){
            site="";
        }else {
            site = areaCodeConfigRepository.findByCode(region).getName();
        }

        List<DownExcel> regionSpecialityIndexItemDtos=new ArrayList<>();//下一级数据
        HashMap<String, SpecificationsDto> specialitytypes = new HashMap<>();//当前专业当前地址的 综合数据

        for (String specialitys:speciality) {
            regionSpecialityIndexItemDtos.addAll(doLoadSpecialitys(specialitys, region));
            specialitytypes.put(specialitys,collect3.get(specialitys));
        }

        Map<String, List<DownExcel>> collect2 = regionSpecialityIndexItemDtos.stream().collect(Collectors.groupingBy(DownExcel::getRegionName));


//        RegionSpecialityIndexItemDto regionSpecialityIndexItemDto = regionSpecialityIndexItemDtos.get(0);
//        for (RegionSpecialityIndexItemDto regionss:regionSpecialityIndexItemDtos) {
//
//        }

        //查询  传递的专业都有什么指标
        List<Index> indices99001 = indexRepository.findByCodeEndingWithAndEnable("99001", true);
        List<Index> indices99002 = indexRepository.findByCodeEndingWithAndEnable("99002", true);
        List<Index> indices99003 = indexRepository.findByCodeEndingWithAndEnable("99003", true);
        List<Index> indices99004 = indexRepository.findByCodeEndingWithAndEnable("99004", true);
        List<Index> indices99999 = indexRepository.findByCodeEndingWithAndEnable("99999", true);

        List<Index> indices = new ArrayList<>(indices99001);
        indices.addAll(indices99002);
        indices.addAll(indices99003);
        indices.addAll(indices99004);
        indices.addAll(indices99999);

        List<String> indexCodes = indices.stream()
                .map(Index::getCode).collect(Collectors.toList());
        List<Index> byCodeInAndSpecialityNameIn = indexRepository.findByCodeInAndSpecialityNameIn(indexCodes, speciality);


        List<String> collect = byCodeInAndSpecialityNameIn.stream()//有多少个 指标
                .map(Index::getCode).collect(Collectors.toList());

        Map<String, List<Index>> collect1 = byCodeInAndSpecialityNameIn.stream().collect(Collectors.groupingBy(Index::getSpecialityName));
        ArrayList<String> types = new ArrayList<>();//第三行数据
        for (Map.Entry<String, List<Index>> colle:collect1.entrySet()){
            List<Index> value = colle.getValue();
            String[] str=new String[5];;

            for (Index indexs:value) {
                String substring = indexs.getCode().substring(indexs.getCode().length() - 5, indexs.getCode().length());
                if (substring.equals("99001")){
                    str[0]="完整性";
                }else if (substring.equals("99002")){
                    str[1]="规范性";
                }else if (substring.equals("99003")){
                    str[2]="关联性";
                }else if (substring.equals("99004")){
                    str[3]="业务合规性";
                }else if (substring.equals("99999")){
                    str[4]="整体性";
                }
            }
            for (int i=0;i<5;i++){
                if (str[i]!=null){
                    types.add(str[i]);
                }
            }


        }

      return ExportExcelUtils.exportExcel(response, speciality, collect, collect1, collect2, site, specialitytypes, types);
    }


//生成 excel 调用查找方法  0.0.0 表示没有 这个属性  null表示 该值为空
    private List<DownExcel> doLoadSpecialitys(String speciality, String region) {
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
    List<Index> indices99004 = indexRepository.findByCodeEndingWithAndSpecialityNameAndEnable("99004", speciality, true);
    List<Index> indices99999 = indexRepository.findByCodeEndingWithAndSpecialityNameAndEnable("99999", speciality, true);

    List<Index> indices = new ArrayList<>(indices99001);
    indices.addAll(indices99002);
    indices.addAll(indices99003);
    indices.addAll(indices99004);
    indices.addAll(indices99999);

    List<String> indexCodes = indices.stream()
            .map(Index::getCode).collect(Collectors.toList());
    List<TaskItemIndex> taskItemIndices = findLatest(config, speciality, indexCodes);

    Map<String, Map<String, List<TaskItemIndex>>> regionIndices;
    if (null == config) {//国家 级 取省级的数据
        regionIndices = taskItemIndices.stream()
                .collect(Collectors.groupingBy(TaskItemIndex::getProvinceCode,
                        Collectors.collectingAndThen(Collectors.toList(), l -> l.stream().collect(Collectors.groupingBy(TaskItemIndex::getCode)))));
    } else if (config.getRegionType() == 1) {//省级 取市级的数据
        regionIndices = taskItemIndices.stream()
                .collect(Collectors.groupingBy(TaskItemIndex::getPrefectureCode,
                        Collectors.collectingAndThen(Collectors.toList(), l -> l.stream().collect(Collectors.groupingBy(TaskItemIndex::getCode)))));
    } else if (config.getRegionType() == 2) {//市级取县级的数据
        regionIndices = taskItemIndices.stream()
                .collect(Collectors.groupingBy(TaskItemIndex::getCountyCode,
                        Collectors.collectingAndThen(Collectors.toList(), l -> l.stream().collect(Collectors.groupingBy(TaskItemIndex::getCode)))));
    } else {
        regionIndices = Collections.emptyMap();
    }


    List<AreaCodeConfig> configs = loadRegion(region);
    List<DownExcel> result = new ArrayList<>();
    List<SpecificationsDto> specificationsDtos = new ArrayList<>();

        int i=0;
        for (AreaCodeConfig currentConfig : configs) {
            Double s9001 = null;
            Double s9002 = null;
            Double s9003 = null;
            Double s9004  = null;
            Double s9005 = null;
        Map<String, List<TaskItemIndex>> indexIndices = regionIndices.get(currentConfig.getCode());//循环判断 当前 地址的下一级 是否有符合 (查找的是 符合前台的选中的地区 的专业 的所有指标的 下一级 地区的所有数据)
        if (CollectionUtils.isNotEmpty(indices99001)) {//判断 当前 地址是否有这个指标  然后判断他的下一级是否有这个指标
            double value = 0D;
            String flag=null;
            if (null != indexIndices) {//当前 地址的下一级是否有这个指标
                List<TaskItemIndex> indicesOfIndex = indexIndices.get(indices99001.get(0).getCode());
                if (CollectionUtils.isNotEmpty(indicesOfIndex)) {
                    flag="1";
                    int size = indicesOfIndex.size();
                    if (size>0){
                        s9001 = indicesOfIndex.stream().mapToDouble(TaskItemIndex::getIndexValue).average().orElse(0.0D);//有 符合条件的数据就取他的 指标
                    }

                }
            }
//            flagExcel(result,currentConfig,speciality,indices99001,flag,value);

        }else{
            s9001=Double.valueOf("999");//表示没有这个  属性
        }
        if (CollectionUtils.isNotEmpty(indices99002)) {
            double value = 0D;
            String flag=null;
            if (null != indexIndices) {
                List<TaskItemIndex> indicesOfIndex = indexIndices.get(indices99002.get(0).getCode());
                if (CollectionUtils.isNotEmpty(indicesOfIndex)) {
                    flag="1";
                    int size = indicesOfIndex.size();
                    if (size>0){
                        s9002 = indicesOfIndex.stream().mapToDouble(TaskItemIndex::getIndexValue).average().orElse(0.0D);//有 符合条件的数据就取他的 指标
                    }
                }
            }
//            flagExcel(result,currentConfig,speciality,indices99002,flag,value);

        }else {
            s9002=Double.valueOf("999");//表示没有这个  属性
        }
        if (CollectionUtils.isNotEmpty(indices99003)) {
            double value = 0D;
            String flag=null;
            if (null != indexIndices) {
                List<TaskItemIndex> indicesOfIndex = indexIndices.get(indices99003.get(0).getCode());
                if (CollectionUtils.isNotEmpty(indicesOfIndex)) {
                    flag="1";
                    int size = indicesOfIndex.size();
                    if (size>0){
                        s9003 = indicesOfIndex.stream().mapToDouble(TaskItemIndex::getIndexValue).average().orElse(0.0D);//有 符合条件的数据就取他的 指标
                    }
                }
            }
//            flagExcel(result,currentConfig,speciality,indices99003,flag,value);

        }else{
            s9002=Double.valueOf("999");//表示没有这个  属性
        }
        if (CollectionUtils.isNotEmpty(indices99004)) {
            double value = 0D;
            String flag=null;
            if (null != indexIndices) {
                List<TaskItemIndex> indicesOfIndex = indexIndices.get(indices99004.get(0).getCode());
                if (CollectionUtils.isNotEmpty(indicesOfIndex)) {
                    flag="1";
                    int size = indicesOfIndex.size();
                    if (size>0){
                        s9004 = indicesOfIndex.stream().mapToDouble(TaskItemIndex::getIndexValue).average().orElse(0.0D);//有 符合条件的数据就取他的 指标
                    }
                }
            }
//            flagExcel(result,currentConfig,speciality,indices99004,flag,value);

        }else{
            s9004=Double.valueOf("999");//表示没有这个  属性
        }
        if (CollectionUtils.isNotEmpty(indices99999)) {
            double value = 0D;
            String flag=null;
            if (null != indexIndices) {
                List<TaskItemIndex> indicesOfIndex = indexIndices.get(indices99999.get(0).getCode());
                if (CollectionUtils.isNotEmpty(indicesOfIndex)) {
                    flag="1";
                    int size = indicesOfIndex.size();
                    if (size>0){
                        s9005 = indicesOfIndex.stream().mapToDouble(TaskItemIndex::getIndexValue).average().orElse(0.0D);//有 符合条件的数据就取他的 指标
                    }
                }
            }
//            flagExcel(result,currentConfig,speciality,indices99999,flag,value);

        }else{
            s9005=Double.valueOf("999");//表示没有这个  属性
        }
            specificationsDtos.add(SpecificationsDto.builder().speciality(speciality)
                    .specialityName(speciality)
                    .totalValue(s9005)
                    .associationValue(s9003)
                    .complianceValue(s9004)
                    .integrityValue(s9001)
                    .normativityValue(s9002).build());

        result.add(DownExcel.builder()
                .region(currentConfig.getCode())
                .regionName(currentConfig.getName())
                .specificationsDtos(specificationsDtos.get(i))
                .build());
        i++;
    }
    return result;
    }

    private void flagExcel(List<RegionSpecialityIndexItemDto> result, AreaCodeConfig currentConfig, String speciality, List<Index> indices99001,String flag,double value) {
        if (flag!=null){//非空 有值
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
    }

    @ApiOperation("错误数据下载excel")
    @PostMapping ("/statistics/exceldown/{speciality}/{region}")
    public void exceldown (
            @ApiParam("专业")
            @PathVariable("speciality") String speciality,
            @ApiParam("地址code")
            @PathVariable("region") String region,
            HttpServletRequest request,
            HttpServletResponse response,
            @ApiParam("是否采用Mock数据")
            @RequestParam(value = "mock", required = false) Boolean mock) throws IOException, ParseException {
        if (BooleanUtils.isTrue(mock)) {
            //return ResponseDto.success(loadMojarMock(region));
        }
//        exceldowns(speciality,request,response);
//        System.out.println(speciality);
        errordata(request,response,speciality,region);
    }

    private void errordata(HttpServletRequest request,HttpServletResponse response,String speciality, String region) throws IOException, ParseException {
        List<TaskLatest> bySpecialityName = taskLatestRepository.findByProvinceAndSpecialityName(region,speciality);//最新的数据
        List<String> taskcodes = bySpecialityName.stream()//所有的taskcode 符合专业 和 地址的最新数据
                .map(TaskLatest::getTaskCode).collect(Collectors.toList());

        String[] stringsName={"时间","专业","对象","问题数据","不满足规则","问题详情"};//第一行

        List<DataStorage> byTaskCodeIn = dataStorageRepositors.findByTaskCodeIn(taskcodes);
        Map<String, List<DataStorage>>
                collect = byTaskCodeIn
                .stream().collect(Collectors.groupingBy(DataStorage::getTableName));//取到数据按 对象划分
        if (collect.size()==0){
            collect.put(speciality,new ArrayList<DataStorage>());
        }
        ExcelUtils.exportExcels(request,response,collect,stringsName);

    }
}
