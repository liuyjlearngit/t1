package com.cmdi.dims.app;


import cn.hutool.core.lang.Assert;
import com.cmdi.dims.app.dto.*;
import com.cmdi.dims.index.repository.IndexRepository;
import com.cmdi.dims.jdbctemple.entity.ChkresultProvince;
import com.cmdi.dims.jdbctemple.entity.ChkresultStaticsProvinceRule;
import com.cmdi.dims.jdbctemple.entity.ErrorData;
import com.cmdi.dims.jdbctemple.entity.MetricCityResult;
import com.cmdi.dims.jdbctemple.service.impl.*;
import com.cmdi.dims.task.entity.AreaCodeConfig;
import com.cmdi.dims.task.repository.AreaCodeConfigRepository;
import com.cmdi.dims.util.ExcelUtils;
import com.cmdi.dims.util.ExportExcelUtils;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.BooleanUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.text.Collator;
import java.text.NumberFormat;
import java.text.ParseException;
import java.util.*;
import java.util.stream.Collectors;

@Slf4j
@RestController
@RequestMapping("/app/v2/auth")
public class ChkresultProvinceController {

    @Autowired
    ChkresultProvinceServiceImpl chkresultProvinceRepository;
    @Autowired
    chkresultStaticsProvinceRuleServiceImpl chkresultStaticsProvinceRuleService;
    @Autowired
    MetricCityResultServiceImpl metricCityResultService;
    @Autowired
    VrmsProblemServiceImpl vrmsProblemService;
    @Autowired
    ErrorDataServiceImpl errorDataService;
    @Value("${filter.li")
    List<String> filterlist;

    @Autowired
    private AreaCodeConfigRepository areaCodeConfigRepository;
    @Autowired
    private IndexRepository indexRepository;

    private HashMap<String,String> map=new HashMap<>();
//    @Autowired
//    ChkresultporviceImp chkresultporviceImp;

    public Map<String,String> getSpeciality(){
        Map<String,String> strings = new HashMap<>();
        strings.put("230000","东北大区");
        strings.put("130000","华北大区");
        strings.put("610000","西北大区");
        strings.put("510000","西南大区");
        strings.put("320000","华东北大区");
        strings.put("330000","华东南大区");
        strings.put("410000","华中大区");
        strings.put("440000","华南大区");
        return strings;
    }

    public HashMap<String,String> getSpecialitys(){
        HashMap<String,String> strings = new HashMap<>();
        strings.put("黑龙江","230000");
        strings.put("河北","130000");
        strings.put("陕西","610000");
        strings.put("四川","510000");
        strings.put("江苏","320000");
        strings.put("浙江","330000");
        strings.put("河南","410000");
        strings.put("广东","440000");
        return strings;
    }

        public List<AreaCodeConfig> getspecat(){
            List<AreaCodeConfig> byRegionTypeOrderByCode = areaCodeConfigRepository.findByRegionTypeOrderByCode(1);
            ArrayList<AreaCodeConfig> areaCodeConfigs = new ArrayList<>();
            Comparator comparator = Collator.getInstance(Locale.CHINA);
            Collections.sort(byRegionTypeOrderByCode, (u1, u2) -> {
                return comparator.compare(u1.getName(), u2.getName());
            });
            for (AreaCodeConfig areaCodeConfig:byRegionTypeOrderByCode) {
                String code = areaCodeConfig.getCode();
                if (code.equals("710000")||code.equals("810000")||code.equals("820000")){
                    areaCodeConfigs.add(areaCodeConfig);
                }
            }
            byRegionTypeOrderByCode.removeAll(areaCodeConfigs);
            return byRegionTypeOrderByCode;
        }

    //获取所有地区编码
    public HashMap<String, String> Regions(){
        List<AreaCodeConfig> byRegionTypeOrderByCode = getspecat();
        LinkedHashMap<String, String> stringStringHashMap = new LinkedHashMap<>();
        for (AreaCodeConfig region:byRegionTypeOrderByCode) {
            String name = region.getName().substring(region.getName().length()-1);
            if (name.equals("省")){
                region.setName(region.getName().substring(0,region.getName().length()-1));
            }
            stringStringHashMap.put(region.getName(),region.getCode());
            map.put(region.getCode(),region.getName());
        }
        return stringStringHashMap;
    }
    //四舍五入
    public Double avarage(Double substring){
        BigDecimal b   =   new BigDecimal(substring);
        double   f1   =   b.setScale(4,   BigDecimal.ROUND_HALF_UP).doubleValue();
        return f1;
    }

    //四舍五入
    public Double avaragefor(Double substring){
        BigDecimal b   =   new BigDecimal(substring);
        double   f1   =   b.setScale(4,   BigDecimal.ROUND_HALF_UP).doubleValue();
        return f1;
    }

    @ApiOperation("首屏统计信息用户地图按省份展示和按专业列表展示")
    @GetMapping("/global")
    public ResponseDto<StatisticResultDto> global(
            @ApiParam("区域信息，当全国的时候保持为空，当具体部署到省份的时候传具体省份的值")
            @RequestParam(value = "region", required = false) String region) throws SQLException, ParseException {
        return ResponseDto.success(loadGlobal(region));
    }

    private StatisticResultDto loadGlobal(String region) throws SQLException, ParseException {
        String byversionMax1 = chkresultProvinceRepository.findByversionMax();
        String regionName="全国";
        Double alldouble=0.0;//总数据
        StatisticResultDto statisticResultDto = new StatisticResultDto();
        if (StringUtils.isNotEmpty(region)) {
            HashMap<String, String> regions = Regions();
            String s = map.get(region);
            regionName=s;
            Assert.notNull(s, "没有找到对应的区域");
            ChkresultProvince byVersionAndName = chkresultProvinceRepository.findByVersionAndName(chkresultProvinceRepository.findByversionMax(), regionName);
            if (byVersionAndName!=null){
                Double  PublicTotalRate= Double.valueOf(StringUtils.isNotEmpty(byVersionAndName.getPublicTotalRate())?byVersionAndName.getPublicTotalRate().substring(0, byVersionAndName.getPublicTotalRate().length() - 1):"0");
                PublicTotalRate+= Double.valueOf(StringUtils.isNotEmpty(byVersionAndName.getBearTotalRate())?byVersionAndName.getBearTotalRate().substring(0, byVersionAndName.getBearTotalRate().length() - 1):"0");
                PublicTotalRate+= Double.valueOf(StringUtils.isNotEmpty(byVersionAndName.getGuanxianTotalRate())?byVersionAndName.getGuanxianTotalRate().substring(0, byVersionAndName.getGuanxianTotalRate().length() - 1):"0");
                PublicTotalRate+= Double.valueOf(StringUtils.isNotEmpty(byVersionAndName.getSpaceTotalRate())?byVersionAndName.getSpaceTotalRate().substring(0, byVersionAndName.getSpaceTotalRate().length() - 1):"0");
                PublicTotalRate+= Double.valueOf(StringUtils.isNotEmpty(byVersionAndName.getWirelessTotalRate())?byVersionAndName.getWirelessTotalRate().substring(0, byVersionAndName.getWirelessTotalRate().length() - 1):"0");
                PublicTotalRate+= Double.valueOf(StringUtils.isNotEmpty(byVersionAndName.getYiganTotalRate())?byVersionAndName.getYiganTotalRate().substring(0, byVersionAndName.getYiganTotalRate().length() - 1):"0");
                double v = PublicTotalRate/ 6;
                Double avarage = avarage(v/100);
                statisticResultDto.setRegionsName(regionName);
                statisticResultDto.setTotalValue(avarage);
                List<RegionItemDto> regionItemDtos=new ArrayList<>();
                List<AreaCodeConfig> byProvinceCodeAndRegionTypeOrderByCode = loadRegion(region);
//                List<AreaCodeConfig> byProvinceCodeAndRegionTypeOrderByCode = areaCodeConfigRepository.findByProvinceCodeAndRegionTypeOrderByCode(byCode.getCode(), 2);
                for (AreaCodeConfig areaCodeConfig:byProvinceCodeAndRegionTypeOrderByCode) {
                    RegionItemDto regionItemDto = new RegionItemDto();
                    regionItemDto.setRegion(areaCodeConfig.getCode());
                    regionItemDto.setRegionName(areaCodeConfig.getName());
                    regionItemDto.setValue(0.0);
                    regionItemDtos.add(regionItemDto);
                }
                statisticResultDto.setRegions(regionItemDtos);
                statisticResultDto.setRegionsName(regionName);
            }else {
                statisticResultDto.setRegionsName(regionName);
                statisticResultDto.setTotalValue(0.0);
            }

        } else {
            String byversionMax = chkresultProvinceRepository.findByversionMax();//取最大版本(最新)
            List<ChkresultProvince> byVersion = chkresultProvinceRepository.findByVersion(byversionMax);//全国最新数据
            List<RegionItemDto> chkresultProvinceDtos = new ArrayList<>();
            HashMap<String, String> regions = Regions();
            ArrayList<DictDtos> doubles = new ArrayList<>();
            for (ChkresultProvince chkresultProvince :byVersion) {
                Double substring;
                Double substringtow = null;
                if (!StringUtils.isEmpty(chkresultProvince.getPublicTotalRate())){
                    String substring1 = chkresultProvince.getPublicTotalRate().substring(0, chkresultProvince.getPublicTotalRate().length() - 1);
                    substring = Double.valueOf(substring1);
                    substringtow=substring;
                    doubles.add(new DictDtos("",substring));
                }else {
                    substring=0.0;
                    substringtow+=substring;
                }
                if (!StringUtils.isEmpty(chkresultProvince.getSpaceTotalRate())){
                    substring = Double.valueOf(chkresultProvince.getSpaceTotalRate().substring(0, chkresultProvince.getSpaceTotalRate().length() - 1));
                    doubles.add(new DictDtos("",substring));
                    substringtow+=substring;
                }else {
                    substring=0.0;
                    substringtow+=substring;
                }
                if (!StringUtils.isEmpty(chkresultProvince.getBearTotalRate())){
                    substring = Double.valueOf(chkresultProvince.getBearTotalRate().substring(0, chkresultProvince.getBearTotalRate().length() - 1));
                    doubles.add(new DictDtos("",substring));
                    substringtow+=substring;
                }else {
                    substring=0.0;
                    substringtow+=substring;
                }
                if (!StringUtils.isEmpty(chkresultProvince.getWirelessTotalRate())){
                    substring = Double.valueOf(chkresultProvince.getWirelessTotalRate().substring(0, chkresultProvince.getWirelessTotalRate().length() - 1));
                    doubles.add(new DictDtos("",substring));
                    substringtow+=substring;
                }else {
                    substring=0.0;
                    substringtow+=substring;
                }
                if (!StringUtils.isEmpty(chkresultProvince.getGuanxianTotalRate())){
                    substring = Double.valueOf(chkresultProvince.getGuanxianTotalRate().substring(0, chkresultProvince.getGuanxianTotalRate().length() - 1));
                    doubles.add(new DictDtos("",substring));
                    substringtow+=substring;
                }else {
                    substring=0.0;
                    substringtow+=substring;
                }
                if (!StringUtils.isEmpty(chkresultProvince.getYiganTotalRate())){
                    substring = Double.valueOf(chkresultProvince.getYiganTotalRate().substring(0, chkresultProvince.getYiganTotalRate().length() - 1));
                    doubles.add(new DictDtos("",substring));
                    substringtow+=substring;
                }else {
                    substring=0.0;
                    substringtow+=substring;
                }
                substringtow=substringtow/6;
                Double avarage1 = avarage(substringtow);


                RegionItemDto regionItemDto = new RegionItemDto();
                regionItemDto.setRegion(regions.get(chkresultProvince.getProvinceName()));
                regionItemDto.setRegionName(chkresultProvince.getProvinceName());
                regionItemDto.setValue(avarage(avarage1/100));
                chkresultProvinceDtos.add(regionItemDto);
                regions.remove(chkresultProvince.getProvinceName());

                returnChkresultProvince(chkresultProvince);
            }

            for (Map.Entry<String, String> colle:regions.entrySet()){
                RegionItemDto regionItemDto = new RegionItemDto();
                regionItemDto.setRegion(colle.getValue());
                regionItemDto.setRegionName(colle.getKey());
                regionItemDto.setValue(0.0);
                chkresultProvinceDtos.add(regionItemDto);
            }
            List<RegionItemDto> newList = chkresultProvinceDtos.stream().sorted(Comparator.comparing(RegionItemDto::getValue))
                    .collect(Collectors.toList());//排序
            Collections.reverse(newList);//倒排
            Double avarage=0.0;
            if (doubles.size()>0) {
                //算出各专业指标的平均值
                avarage=(doubles.stream().mapToDouble(DictDtos::getValue).average().orElse(0.0D));
            } else {
                avarage=(0.0D);
            }

            statisticResultDto.setRegionsName(regionName);
            statisticResultDto.setTotalValue(avarage(avarage/100));
            statisticResultDto.setRegions(newList);
        }


        return statisticResultDto;
    }

    private List<AreaCodeConfig> loadRegion(String region) {//传递 省市县 code 返回 他的下一级数据
        List<AreaCodeConfig> configs;
        if (StringUtils.isEmpty(region)) {

            configs = getspecat();//region空  就是全国时查找省 按code排序
        } else {
            AreaCodeConfig config = areaCodeConfigRepository.findByCodeOrderByRegionTypeDesc(region);//region非空 查找 省市县 对应code的数据
            io.jsonwebtoken.lang.Assert.notNull("没有找到对应的区域");
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


    @ApiOperation("指标详情首屏统计省市县各个专业的指标数据")
    @GetMapping("/global/mojar")
    public ResponseDto<List<SpecificationsDto>> mojar(
            @ApiParam("区域信息，当全国的时候保持为空，当具体部署到省份的时候传具体省份的值")
            @RequestParam(value = "region", required = false) String region) throws SQLException, ParseException {
         return ResponseDto.success(loadGlobalMojar(region));
    }
//
    public Double num(String str) throws ParseException {
        NumberFormat nf=NumberFormat.getPercentInstance();
        Number parse = nf.parse(str);
        return Double.valueOf((Double) parse);
    }

    public List<SpecificationsDto> loadGlobalMojar(String region) throws SQLException, ParseException {

        if (!StringUtils.isNotEmpty(region)) {//全国
            String byversionMax = chkresultProvinceRepository.findByversionMax();
            List<ChkresultProvince> byVersion = chkresultProvinceRepository.findByVersion(byversionMax);
            ArrayList<Double> doubles1 = new ArrayList<>();
            int ls=0;
            int [] in=new int[30];
            int iso=0;
            for (ChkresultProvince chkresultProvince :byVersion) {
                ArrayList<Double> doubles = returnChkresultProvince(chkresultProvince);
                for (int i=0;i<doubles.size();i++) {
                    if (doubles.get(i) ==0.0){
                        in[i]=in[i]+1;
                    }
                }
                if (ls==0){
                    doubles1=doubles;
                }else {
                    for (int i=0;i<doubles.size();i++){
                        doubles1.set(i,doubles1.get(i)+doubles.get(i));
                    }
                }
                ls++;
            }
            ArrayList<Double> doubles = new ArrayList<>();
            for (int i=0;i<doubles1.size();i++) {
                int i1 = byVersion.size() - in[i];
                double v = doubles1.get(i) / i1;
                if (byVersion.size()==in[i]){
                    v=0.0;
                }
                doubles.add(avaragefor(v/100));
            }
            ArrayList<SpecificationsDto> specificationsDtos = addSpecificationsDto(doubles);
            return specificationsDtos;
        }else {//省内
            String s = map.get(region);
            Assert.notNull(s, "没有找到对应的区域");
            ChkresultProvince byVersionAndName = chkresultProvinceRepository.findByVersionAndName(chkresultProvinceRepository.findByversionMax(), s);
            ArrayList<Double> doubles = returnChkresultProvince(byVersionAndName);
            ArrayList<Double> doubletow = new ArrayList<>();
            for (Double doubls :doubles) {
                doubletow.add(avaragefor(doubls/100));
            }
            ArrayList<SpecificationsDto> specificationsDtos = addSpecificationsDto(doubletow);
            return specificationsDtos;
        }
    }

    public ArrayList<SpecificationsDto> addSpecificationsDto(ArrayList<Double> doubles){
        ArrayList<SpecificationsDto> specificationsDtos = new ArrayList<>();
        specificationsDtos.add(SpecificationsDto.builder()
                .speciality("核心")
                .associationValue(doubles.get(0))
                .normativityValue(doubles.get(1))
                .complianceValue(doubles.get(2))
                .totalValue(doubles.get(3))
                .integrityValue(doubles.get(4)).build());
        specificationsDtos.add(SpecificationsDto.builder()
                .speciality("空间")
                .associationValue(doubles.get(5))
                .normativityValue(doubles.get(6))
                .complianceValue(doubles.get(7))
                .totalValue(doubles.get(8))
                .integrityValue(doubles.get(9)).build());
        specificationsDtos.add(SpecificationsDto.builder()
                .speciality("网络云")
                .associationValue(doubles.get(10))
                .normativityValue(doubles.get(11))
                .complianceValue(doubles.get(12))
                .totalValue(doubles.get(13))
                .integrityValue(doubles.get(14)).build());

                if (doubles.get(17)!=0.0){
                    specificationsDtos.add(SpecificationsDto.builder()
                            .speciality("专网")
                            .associationValue(doubles.get(15))
                            .normativityValue(doubles.get(16))
                            .complianceValue(doubles.get(17))
                            .totalValue(doubles.get(18))
                            .integrityValue(doubles.get(19)).build());
                }else {
                    specificationsDtos.add(SpecificationsDto.builder()
                            .speciality("专网")
                            .associationValue(doubles.get(15))
                            .normativityValue(doubles.get(16))
                            .totalValue(doubles.get(18))
                            .integrityValue(doubles.get(19)).build());
                }

            if (doubles.get(22)!=0.0){
                specificationsDtos.add(SpecificationsDto.builder()
                        .speciality("管线")
                        .associationValue(doubles.get(20))
                        .normativityValue(doubles.get(21))
                        .complianceValue(doubles.get(22))
                        .totalValue(doubles.get(23))
                        .integrityValue(doubles.get(24)).build());
            }else {
                specificationsDtos.add(SpecificationsDto.builder()
                        .speciality("管线")
                        .associationValue(doubles.get(20))
                        .normativityValue(doubles.get(21))
                        .totalValue(doubles.get(23))
                        .integrityValue(doubles.get(24)).build());
            }
            if (doubles.get(27)!=0.0){
                specificationsDtos.add(SpecificationsDto.builder()
                        .speciality("一干传输")
                        .associationValue(doubles.get(25))
                        .normativityValue(doubles.get(26))
                        .complianceValue(doubles.get(27))
                        .totalValue(doubles.get(28))
                        .integrityValue(doubles.get(29)).build());
            }else {
                specificationsDtos.add(SpecificationsDto.builder()
                        .speciality("一干传输")
                        .associationValue(doubles.get(25))
                        .normativityValue(doubles.get(26))
                        .totalValue(doubles.get(28))
                        .integrityValue(doubles.get(29)).build());
            }

        return specificationsDtos;
    }

    @ApiOperation("首屏点击专业的时候，按当前专业的省份展示统计结果")
    @GetMapping("/speciality/{speciality}")
    public ResponseDto<List<RegionSpecialityIndexItemDto>> speciality(
            @ApiParam("专业")
            @PathVariable("speciality") String speciality,
            @ApiParam("区域信息，当全国的时候保持为空，当具体部署到省份的时候传具体省份的值")
            @RequestParam(value = "region", required = false) String region,
            @ApiParam("是否采用Mock数据")
            @RequestParam(value = "mock", required = false) Boolean mock) throws SQLException, ParseException {


        return ResponseDto.success(doLoadSpeciality(speciality, region));
    }

    private List<RegionSpecialityIndexItemDto> doLoadSpeciality(String speciality, String region) throws SQLException, ParseException {
        if (StringUtils.isNotEmpty(region)) {
            ArrayList<DictProvinceDto> dictDtos = new ArrayList<DictProvinceDto>();

            String byversionMax = chkresultProvinceRepository.findByversionMax();
            ArrayList<RegionSpecialityIndexItemDto> regionSpecialityIndexItemDtos = new ArrayList<>();

            List<AreaCodeConfig> areaCodeConfigs = loadRegionget(region);
            Map<String, String> collect = areaCodeConfigs.stream().collect(Collectors.toMap(AreaCodeConfig::getName, AreaCodeConfig::getCode));
            for (Map.Entry<String, String> colle:collect.entrySet()) {
                ChkresultProvince byVersionAndName = chkresultProvinceRepository.findByVersionAndName(byversionMax, colle.getKey());

                ArrayList<Double> speciality1 = getSpeciality(speciality, byVersionAndName);
                Double avarage4 = avarage(speciality1.get(4)/100);
                dictDtos.add(new DictProvinceDto(colle.getValue(),colle.getKey(),avarage4));
                ArrayList<RegionSpecialityIndexItemDto> regionSpecialityIndexItemDtos1 = specialityAdd(speciality, colle.getKey(),colle.getValue(), byVersionAndName);
                for (RegionSpecialityIndexItemDto re :regionSpecialityIndexItemDtos1) {
                    regionSpecialityIndexItemDtos.add(re);
                }

            }
            List<DictProvinceDto> newList = dictDtos.stream().sorted(Comparator.comparing(DictProvinceDto::getValues))
                    .collect(Collectors.toList());//排序
            Collections.reverse(newList);//倒排
            regionSpecialityIndexItemDtos.add(RegionSpecialityIndexItemDto.builder().dictDtos((ArrayList<DictProvinceDto>) newList).build());
            return regionSpecialityIndexItemDtos;
        }else {//全国
            ArrayList<DictProvinceDto> dictDtos = new ArrayList<DictProvinceDto>();

            String byversionMax = chkresultProvinceRepository.findByversionMax();
            ArrayList<RegionSpecialityIndexItemDto> regionSpecialityIndexItemDtos = new ArrayList<>();
            HashMap<String, String> regions = null;
            if (speciality.equals("网络云")){
                regions = getSpecialitys();
            }else {
                regions = Regions();
            }
            Map<String, String> speciality2 = getSpeciality();
            for (Map.Entry<String, String> colle:regions.entrySet()) {
                ChkresultProvince byVersionAndName = chkresultProvinceRepository.findByVersionAndName(byversionMax, colle.getKey());

                ArrayList<Double> speciality1 = getSpeciality(speciality, byVersionAndName);
                Double avarage4 = avarage(speciality1.get(4)/100);
                if (speciality.equals("网络云")){
                    String s = speciality2.get(colle.getValue());
                    dictDtos.add(new DictProvinceDto(colle.getValue(),s,avarage4));
                    ArrayList<RegionSpecialityIndexItemDto> regionSpecialityIndexItemDtos1 = specialityAdd(speciality, s,colle.getValue(), byVersionAndName);
                    for (RegionSpecialityIndexItemDto re :regionSpecialityIndexItemDtos1) {
                        regionSpecialityIndexItemDtos.add(re);
                    }
                }else {
                    dictDtos.add(new DictProvinceDto(colle.getValue(),colle.getKey(),avarage4));
                    ArrayList<RegionSpecialityIndexItemDto> regionSpecialityIndexItemDtos1 = specialityAdd(speciality, colle.getKey(),colle.getValue(), byVersionAndName);
                    for (RegionSpecialityIndexItemDto re :regionSpecialityIndexItemDtos1) {
                        regionSpecialityIndexItemDtos.add(re);
                    }
                }
            }
            List<DictProvinceDto> newList = dictDtos.stream().sorted(Comparator.comparing(DictProvinceDto::getValues))
                    .collect(Collectors.toList());//排序
            Collections.reverse(newList);//倒排
            regionSpecialityIndexItemDtos.add(RegionSpecialityIndexItemDto.builder().dictDtos((ArrayList<DictProvinceDto>) newList).build());
            return regionSpecialityIndexItemDtos;
        }
    }

    public ArrayList<Double> returnChkresultProvince(ChkresultProvince chkresultProvince) throws ParseException {
        ArrayList<String> strings = new ArrayList<>();
        ArrayList<Double> doubles = new ArrayList<>();
        NumberFormat nf=NumberFormat.getPercentInstance();

        String publicGuanlianRate = !StringUtils.isNotEmpty(chkresultProvince.getPublicGuanlianRate())?"0":chkresultProvince.getPublicGuanlianRate().substring(0, chkresultProvince.getPublicGuanlianRate().length() - 1);
        String publicGuifanRate = !StringUtils.isNotEmpty(chkresultProvince.getPublicGuifanRate())?"0":chkresultProvince.getPublicGuifanRate().substring(0, chkresultProvince.getPublicGuifanRate().length() - 1);
        String publicHeguiRate = !StringUtils.isNotEmpty(chkresultProvince.getPublicHeguiRate())?"0":chkresultProvince.getPublicHeguiRate().substring(0, chkresultProvince.getPublicHeguiRate().length() - 1);
        String publicTotalRate = !StringUtils.isNotEmpty(chkresultProvince.getPublicTotalRate())?"0":chkresultProvince.getPublicTotalRate().substring(0, chkresultProvince.getPublicTotalRate().length() - 1);
        String publicWanzhengRate = !StringUtils.isNotEmpty(chkresultProvince.getPublicWanzhengRate())?"0":chkresultProvince.getPublicWanzhengRate().substring(0, chkresultProvince.getPublicWanzhengRate().length() - 1);
        strings.add(publicGuanlianRate);
        strings.add(publicGuifanRate);
        strings.add(publicHeguiRate);
        strings.add(publicTotalRate);
        strings.add(publicWanzhengRate);

        String spaceGuanlianRate = !StringUtils.isNotEmpty(chkresultProvince.getSpaceGuanlianRate())?"0":chkresultProvince.getSpaceGuanlianRate().substring(0, chkresultProvince.getSpaceGuanlianRate().length() - 1);
        String spaceGuifanRate = !StringUtils.isNotEmpty(chkresultProvince.getSpaceGuifanRate())?"0":chkresultProvince.getSpaceGuifanRate().substring(0, chkresultProvince.getSpaceGuifanRate().length() - 1);
        String spaceHeguiRate = !StringUtils.isNotEmpty(chkresultProvince.getSpaceHeguiRate())?"0":chkresultProvince.getSpaceHeguiRate().substring(0, chkresultProvince.getSpaceHeguiRate().length() - 1);
        String spaceTotalRate = !StringUtils.isNotEmpty(chkresultProvince.getSpaceTotalRate())?"0":chkresultProvince.getSpaceTotalRate().substring(0, chkresultProvince.getSpaceTotalRate().length() - 1);
        String spaceWanzhengRate = !StringUtils.isNotEmpty(chkresultProvince.getSpaceWanzhengRate())?"0":chkresultProvince.getSpaceWanzhengRate().substring(0, chkresultProvince.getSpaceWanzhengRate().length() - 1);
        strings.add(spaceGuanlianRate);
        strings.add(spaceGuifanRate);
        strings.add(spaceHeguiRate);
        strings.add(spaceTotalRate);
        strings.add(spaceWanzhengRate);

        String bearGuanlianRate = !StringUtils.isNotEmpty(chkresultProvince.getBearGuanlianRate())?"0":chkresultProvince.getBearGuanlianRate().substring(0, chkresultProvince.getBearGuanlianRate().length() - 1);
        String bearGuifanRate = !StringUtils.isNotEmpty(chkresultProvince.getBearGuifanRate())?"0":chkresultProvince.getBearGuifanRate().substring(0, chkresultProvince.getBearGuifanRate().length() - 1);;
        String bearHeguiRate = !StringUtils.isNotEmpty(chkresultProvince.getBearHeguiRate())?"0":chkresultProvince.getBearHeguiRate().substring(0, chkresultProvince.getBearHeguiRate().length() - 1);;
        String bearTotalRate = !StringUtils.isNotEmpty(chkresultProvince.getBearTotalRate())?"0":chkresultProvince.getBearTotalRate().substring(0, chkresultProvince.getBearTotalRate().length() - 1);;
        String bearWanzhengRate = !StringUtils.isNotEmpty(chkresultProvince.getBearWanzhengRate())?"0":chkresultProvince.getBearWanzhengRate().substring(0, chkresultProvince.getBearWanzhengRate().length() - 1);;

        strings.add(bearGuanlianRate);
        strings.add(bearGuifanRate);
        strings.add(bearHeguiRate);
        strings.add(bearTotalRate);
        strings.add(bearWanzhengRate);

        String wirelessGuanlianRate = !StringUtils.isNotEmpty(chkresultProvince.getWirelessGuanlianRate())?"0":chkresultProvince.getWirelessGuanlianRate().substring(0, chkresultProvince.getWirelessGuanlianRate().length() - 1);
        String wirelessGuifanRate = !StringUtils.isNotEmpty(chkresultProvince.getWirelessGuifanRate())?"0":chkresultProvince.getWirelessGuifanRate().substring(0, chkresultProvince.getWirelessGuifanRate().length() - 1);
        String wirelessHeguiRate = !StringUtils.isNotEmpty(chkresultProvince.getWirelessHeguiRate())?"0":chkresultProvince.getWirelessHeguiRate().substring(0, chkresultProvince.getWirelessHeguiRate().length() - 1);
        String wirelessTotalRate = !StringUtils.isNotEmpty(chkresultProvince.getWirelessTotalRate())?"0":chkresultProvince.getWirelessTotalRate().substring(0, chkresultProvince.getWirelessTotalRate().length() - 1);
        String wirelessWanzhengRate = !StringUtils.isNotEmpty(chkresultProvince.getWirelessWanzhengRate())?"0":chkresultProvince.getWirelessWanzhengRate().substring(0, chkresultProvince.getWirelessWanzhengRate().length() - 1);

        if (!wirelessHeguiRate.equals("0")){
            if (!wirelessHeguiRate.substring(2,wirelessHeguiRate.length()-2).equals(".")){
                wirelessHeguiRate="0";
            }
        }else {
            wirelessHeguiRate="0";
        }
        strings.add(wirelessGuanlianRate);
        strings.add(wirelessGuifanRate);
        strings.add(wirelessHeguiRate);
        strings.add(wirelessTotalRate);
        strings.add(wirelessWanzhengRate);

        String guanxianGuanlianRate = !StringUtils.isNotEmpty(chkresultProvince.getGuanxianGuanlianRate())?"0":chkresultProvince.getGuanxianGuanlianRate().substring(0, chkresultProvince.getGuanxianGuanlianRate().length() - 1);
        String guanxianGuifanRate = !StringUtils.isNotEmpty(chkresultProvince.getGuanxianGuifanRate())?"0":chkresultProvince.getGuanxianGuifanRate().substring(0, chkresultProvince.getGuanxianGuifanRate().length() - 1);
        String guanxianHeguiRate = !StringUtils.isNotEmpty(chkresultProvince.getGuanxianHeguiRate())?"0":chkresultProvince.getGuanxianHeguiRate().substring(0, chkresultProvince.getGuanxianHeguiRate().length() - 1);
        String guanxianTotalRate = !StringUtils.isNotEmpty(chkresultProvince.getGuanxianTotalRate())?"0":chkresultProvince.getGuanxianTotalRate().substring(0, chkresultProvince.getGuanxianTotalRate().length() - 1);
        String guanxianWanzhengRate = !StringUtils.isNotEmpty(chkresultProvince.getGuanxianWanzhengRate())?"0":chkresultProvince.getGuanxianWanzhengRate().substring(0, chkresultProvince.getGuanxianWanzhengRate().length() - 1);
        if (!guanxianHeguiRate.equals("0")){
            if (!guanxianHeguiRate.substring(2,guanxianHeguiRate.length()-2).equals(".")){
                guanxianHeguiRate="0";
            }
        }else {
            guanxianHeguiRate="0";
        }
        strings.add(guanxianGuanlianRate);
        strings.add(guanxianGuifanRate);
        strings.add(guanxianHeguiRate);
        strings.add(guanxianTotalRate);
        strings.add(guanxianWanzhengRate);

        String yiganGuanlianRate = !StringUtils.isNotEmpty(chkresultProvince.getYiganGuanlianRate())?"0":chkresultProvince.getYiganGuanlianRate().substring(0, chkresultProvince.getYiganGuanlianRate().length() - 1);
        String yiganGuifanRate = !StringUtils.isNotEmpty(chkresultProvince.getYiganGuifanRate())?"0":chkresultProvince.getYiganGuifanRate().substring(0, chkresultProvince.getYiganGuifanRate().length() - 1);
        String yiganHeguiRate = !StringUtils.isNotEmpty(chkresultProvince.getYiganHeguiRate())?"0":chkresultProvince.getYiganHeguiRate().substring(0, chkresultProvince.getYiganHeguiRate().length() - 1);
        String yiganTotalRate = !StringUtils.isNotEmpty(chkresultProvince.getYiganTotalRate())?"0":chkresultProvince.getYiganTotalRate().substring(0, chkresultProvince.getYiganTotalRate().length() - 1);
        String yiganWanzhengRate = !StringUtils.isNotEmpty(chkresultProvince.getYiganWanzhengRate())?"0":chkresultProvince.getYiganWanzhengRate().substring(0, chkresultProvince.getYiganWanzhengRate().length() - 1);
        if (!yiganHeguiRate.equals("0")){
            if (!yiganHeguiRate.substring(2,yiganHeguiRate.length()-2).equals(".")){
                yiganHeguiRate="0";
            }
        }else {
            yiganHeguiRate="0";
        }
        strings.add(yiganGuanlianRate);
        strings.add(yiganGuifanRate);
        strings.add(yiganHeguiRate);
        strings.add(yiganTotalRate);
        strings.add(yiganWanzhengRate);
        for (String str :strings) {
            doubles.add(Double.valueOf(str));
        }
        return doubles;
    }

    private List<AreaCodeConfig> loadRegionget(String region) {//传递 省市县 code 返回 他的下一级数据
        List<AreaCodeConfig> configs;
        if (StringUtils.isEmpty(region)) {

            configs = getspecat();//region空  就是全国时查找省 按code排序
        } else {
            AreaCodeConfig config = areaCodeConfigRepository.findByCodeOrderByRegionTypeDesc(region);//region非空 查找 省市县 对应code的数据
            io.jsonwebtoken.lang.Assert.notNull("没有找到对应的区域");
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

    public ArrayList<RegionSpecialityIndexItemDto> specialityAdd(String speciality, String name,String code, ChkresultProvince byVersionAndName) throws ParseException {
        ArrayList<RegionSpecialityIndexItemDto> regionSpecialityIndexItemDtos = new ArrayList<>();
        Boolean flag=true;
        if (speciality.equals("专网")){
            flag=false;
        }else if (speciality.equals("管线")){
            flag=false;
        }else if (speciality.equals("一干传输")){
            flag=false;
        }
        if (byVersionAndName==null){
            regionSpecialityIndexItemDtos.add(RegionSpecialityIndexItemDto.builder()
                    .region(code)
                    .regionName(name)
                    .specialityName(speciality)
                    .speciality(speciality)
                    .indexName(speciality+"完整性通过率")
                    .value(0.0).build());

            regionSpecialityIndexItemDtos.add(RegionSpecialityIndexItemDto.builder()
                    .region(code)
                    .regionName(name)
                    .specialityName(speciality)
                    .speciality(speciality)
                    .indexName(speciality+"规范性通过率")
                    .value(0.0).build());

            regionSpecialityIndexItemDtos.add(RegionSpecialityIndexItemDto.builder()
                    .region(code)
                    .regionName(name)
                    .specialityName(speciality)
                    .speciality(speciality)
                    .indexName(speciality+"关联性通过率")
                    .value(0.0).build());

            regionSpecialityIndexItemDtos.add(RegionSpecialityIndexItemDto.builder()
                    .region(code)
                    .regionName(name)
                    .specialityName(speciality)
                    .speciality(speciality)
                    .indexName(speciality+"合规性通过率")
                    .value(0.0).build());
        }else {
            ArrayList<Double> speciality1 = getSpeciality(speciality, byVersionAndName);
            Double avarage = avarage(speciality1.get(0)/100);
            Double avarage1 = avarage(speciality1.get(1)/100);
            Double avarage2 = avarage(speciality1.get(2)/100);
            Double avarage3 = avarage(speciality1.get(3)/100);
            Double avarage4 = avarage(speciality1.get(4)/100);

            regionSpecialityIndexItemDtos.add(RegionSpecialityIndexItemDto.builder()
                    .region(code)
                    .regionName(name)
                    .specialityName(speciality)
                    .speciality(speciality)
                    .indexName(speciality+"完整性通过率")
                    .value(avarage).build());



            regionSpecialityIndexItemDtos.add(RegionSpecialityIndexItemDto.builder()
                    .region(code)
                    .regionName(name)
                    .specialityName(speciality)
                    .speciality(speciality)
                    .indexName(speciality+"规范性通过率")
                    .value(avarage2).build());

            regionSpecialityIndexItemDtos.add(RegionSpecialityIndexItemDto.builder()
                    .region(code)
                    .regionName(name)
                    .specialityName(speciality)
                    .speciality(speciality)
                    .indexName(speciality+"关联性通过率")
                    .value(avarage1).build());

            if (flag==false){

            }else {
                regionSpecialityIndexItemDtos.add(RegionSpecialityIndexItemDto.builder()
                        .region(code)
                        .regionName(name)
                        .specialityName(speciality)
                        .speciality(speciality)
                        .indexName(speciality+"合规性通过率")
                        .value(avarage3).build());
            }

            regionSpecialityIndexItemDtos.add(RegionSpecialityIndexItemDto.builder()
                    .region(code)
                    .regionName(name)
                    .specialityName(speciality)
                    .speciality(speciality)
                    .indexName(speciality+"总通过率")
                    .value(avarage4).build());

        }

       return regionSpecialityIndexItemDtos;
    }

    public ArrayList<Double> getSpeciality(String speciality,ChkresultProvince byVersionAndName) throws ParseException {
        ArrayList<Double> strings = new ArrayList<>();
        ArrayList<Double> doubles = returnChkresultProvince(byVersionAndName);
        if (speciality.equals("核心")){
            strings.add(doubles.get(4));
            strings.add(doubles.get(0));
            strings.add(doubles.get(1));
            strings.add(doubles.get(2));
            strings.add(doubles.get(3));
        }else if (speciality.equals("空间")){
            strings.add(doubles.get(9));
            strings.add(doubles.get(5));
            strings.add(doubles.get(6));
            strings.add(doubles.get(7));
            strings.add(doubles.get(8));
        }else if (speciality.equals("网络云")){
            strings.add(doubles.get(14));
            strings.add(doubles.get(10));
            strings.add(doubles.get(11));
            strings.add(doubles.get(12));
            strings.add(doubles.get(13));
        }else if (speciality.equals("专网")){
            strings.add(doubles.get(19));
            strings.add(doubles.get(15));
            strings.add(doubles.get(16));
            strings.add(doubles.get(17));
            strings.add(doubles.get(18));
        }else if (speciality.equals("管线")){
            strings.add(doubles.get(24));
            strings.add(doubles.get(20));
            strings.add(doubles.get(21));
            strings.add(doubles.get(22));
            strings.add(doubles.get(23));
        }else if (speciality.equals("一干传输")){
            strings.add(doubles.get(29));
            strings.add(doubles.get(25));
            strings.add(doubles.get(26));
            strings.add(doubles.get(27));
            strings.add(doubles.get(28));
        }
        return strings;
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

        exportdowns(response, region, speciality);
//        ExcelDowns excelDowns = new ExcelDowns();
//        excelDowns.exportExcel();
    }

    private void exportdowns(HttpServletResponse response, String region, List<String> speciality) throws SQLException, IOException, ParseException {
        String byversionMax =chkresultProvinceRepository.findByversionMax();
        if (StringUtils.isNotEmpty(region)){
            List<SpecificationsDto> specificationsDtos = loadGlobalMojar(region);
            Map<String, List<SpecificationsDto>> collect = specificationsDtos.stream().collect(Collectors.groupingBy(SpecificationsDto::getSpeciality));
            ArrayList<Double> three = new ArrayList<>();
            for (String special:speciality) {
                SpecificationsDto specificationsDto = collect.get(special).get(0);
                Boolean judge = judge(special);
                if (judge){
                    three.add(specificationsDto.getTotalValue());
                    three.add(specificationsDto.getIntegrityValue());
                    three.add(specificationsDto.getNormativityValue());
                    three.add(specificationsDto.getAssociationValue());
                    three.add(specificationsDto.getComplianceValue());
                }else {
                    three.add(specificationsDto.getTotalValue());
                    three.add(specificationsDto.getIntegrityValue());
                    three.add(specificationsDto.getNormativityValue());
                    three.add(specificationsDto.getAssociationValue());
                }
            }


            HashMap<String, ArrayList<Double>> hashMap = new HashMap<>();
            HashMap<String, Object> hashMap1 = excelAdd(speciality);
            ArrayList<String> one = (ArrayList<String>) hashMap1.get("指标");
            ArrayList<Integer> num = (ArrayList<Integer>) hashMap1.get("数量");
            List<AreaCodeConfig> areaCodeConfigs = loadRegion(region);
            ArrayList<Double> doubles = new ArrayList<>();
            for (int i=0;i<one.size();i++) {
                doubles.add(0.0);

            }
            Comparator comparator = Collator.getInstance(Locale.CHINA);
            Collections.sort(areaCodeConfigs, (u1, u2) -> {
                return comparator.compare(u1.getName(), u2.getName());
            });
            for (AreaCodeConfig areaCodeConfig:areaCodeConfigs) {
                hashMap.put(areaCodeConfig.getName(),doubles);
            }
            AreaCodeConfig byCode = areaCodeConfigRepository.findByCode(region);
            String name=byCode.getName();
            ExportExcelUtils.exportExcelHead(response,one,num,hashMap,name,speciality,three);

        }else {//全国
            List<SpecificationsDto> specificationsDtos = loadGlobalMojar(region);
            Map<String, List<SpecificationsDto>> collect = specificationsDtos.stream().collect(Collectors.groupingBy(SpecificationsDto::getSpeciality));
            ArrayList<Double> three = new ArrayList<>();
            for (String special:speciality) {
                SpecificationsDto specificationsDto = collect.get(special).get(0);
                Boolean judge = judge(special);
                if (judge){
                    three.add(specificationsDto.getTotalValue());
                    three.add(specificationsDto.getIntegrityValue());
                    three.add(specificationsDto.getNormativityValue());
                    three.add(specificationsDto.getAssociationValue());
                    three.add(specificationsDto.getComplianceValue());
                }else {
                    three.add(specificationsDto.getTotalValue());
                    three.add(specificationsDto.getIntegrityValue());
                    three.add(specificationsDto.getNormativityValue());
                    three.add(specificationsDto.getAssociationValue());
                }
            }


            LinkedHashMap<String, ArrayList<Double>> hashMap = new LinkedHashMap<>();
            HashMap<String, Object> hashMap1 = excelAdd(speciality);
            ArrayList<String> one = (ArrayList<String>) hashMap1.get("指标");
            ArrayList<Integer> num = (ArrayList<Integer>) hashMap1.get("数量");
            HashMap<String, String> regions = Regions();
            for (Map.Entry<String, String> colle:regions.entrySet()) {
                ChkresultProvince byVersionAndName = chkresultProvinceRepository.findByVersionAndName(byversionMax,colle.getKey());
                ArrayList<Double> doubles = excelAddList(speciality, byVersionAndName);
                hashMap.put(colle.getKey(),doubles);
            }
            String name="";
            ExportExcelUtils.exportExcelHead(response,one,num,hashMap,name,speciality,three);
        }
    }

    private Boolean judge(String speciality) throws SQLException {
        String byversionMax = chkresultProvinceRepository.findByversionMax();
        ChkresultProvince chkresultProvince = chkresultProvinceRepository.findByVersion(byversionMax).get(0);
        String wirelessHeguiRate = chkresultProvince.getWirelessHeguiRate();
        String guanxianHeguiRate = chkresultProvince.getGuanxianHeguiRate();
        String yiganHeguiRate = chkresultProvince.getYiganHeguiRate();

            Boolean flag = true;
            if (speciality.equals("专网") && wirelessHeguiRate.equals("无相关规则")) {
                flag = false;
            } else if (speciality.equals("管线") && guanxianHeguiRate.equals("无相关规则")) {
                flag = false;
            } else if (speciality.equals("一干传输") && yiganHeguiRate.equals("无相关规则")) {
                flag = false;
            }
            return flag;
    }

    private HashMap<String, Object> excelAdd(List<String> specialitys) throws SQLException {
        HashMap<String, Object> hashMap = new HashMap<>();
        ArrayList<String> strings = new ArrayList<>();
        ArrayList<Integer> stringtow = new ArrayList<>();//数量
        String byversionMax = chkresultProvinceRepository.findByversionMax();
        ChkresultProvince chkresultProvince = chkresultProvinceRepository.findByVersion(byversionMax).get(0);
        String wirelessHeguiRate = chkresultProvince.getWirelessHeguiRate();
        String guanxianHeguiRate = chkresultProvince.getGuanxianHeguiRate();
        String yiganHeguiRate = chkresultProvince.getYiganHeguiRate();
        for (String speciality:specialitys) {
            Boolean flag=true;
            if (speciality.equals("专网")&&wirelessHeguiRate.equals("无相关规则")){
                flag=false;
            }else if (speciality.equals("管线")&&guanxianHeguiRate.equals("无相关规则")){
                flag=false;
            }else if (speciality.equals("一干传输")&&yiganHeguiRate.equals("无相关规则")){
                flag=false;
            }

            if(flag){
                strings.add("总通过率");
                strings.add("完整性通过率");
                strings.add("规范通过率");
                strings.add("关联通过率");
                strings.add("合规通过率");
                stringtow.add(5);
            }else {
                strings.add("总通过率");
                strings.add("完整性通过率");
                strings.add("规范通过率");
                strings.add("关联通过率");
                stringtow.add(4);
            }
        }
        hashMap.put("指标",strings);
        hashMap.put("数量",stringtow);
        return hashMap;
    }

    private ArrayList<Double> excelAddList(List<String> specialitys,ChkresultProvince byVersionAndName) throws SQLException, ParseException {
        ArrayList<Double> strings = new ArrayList<>();

        String byversionMax = chkresultProvinceRepository.findByversionMax();
        ChkresultProvince chkresultProvince = chkresultProvinceRepository.findByVersion(byversionMax).get(0);
        String wirelessHeguiRate = chkresultProvince.getWirelessHeguiRate();
        String guanxianHeguiRate = chkresultProvince.getGuanxianHeguiRate();
        String yiganHeguiRate = chkresultProvince.getYiganHeguiRate();
        for (String speciality:specialitys) {
            Boolean flag=true;
            ArrayList<Double> speciality1 = getSpeciality(speciality, byVersionAndName);
            if (speciality.equals("专网")&&wirelessHeguiRate.equals("无相关规则")){
                flag=false;
            }else if (speciality.equals("管线")&&guanxianHeguiRate.equals("无相关规则")){
                flag=false;
            }else if (speciality.equals("一干传输")&&yiganHeguiRate.equals("无相关规则")){
                flag=false;
            }

            if(flag){
                strings.add(speciality1.get(4));
                strings.add(speciality1.get(0));
                strings.add(speciality1.get(2));
                strings.add(speciality1.get(1));
                strings.add(speciality1.get(3));
            }else {
                strings.add(speciality1.get(4));
                strings.add(speciality1.get(0));
                strings.add(speciality1.get(2));
                strings.add(speciality1.get(1));
            }
        }
        return strings;
    }

    @ApiOperation("按类型统计核查")
    @GetMapping("/history/index/checktype/{region}/{speciality}")
    public ResponseDto<List<PointerTypes>> checktype(
            @ApiParam("区域")
            @PathVariable("region") String region,
            @ApiParam("专业")
            @PathVariable("speciality") String speciality,
            @ApiParam("是否采用Mock数据")
            @RequestParam(value = "mock", required = false) Boolean mock) throws SQLException {
        if (BooleanUtils.isTrue(mock)) {
//            return ResponseDto.success(doLoadHistoryIndexMock(region, speciality));
        }
        List<PointerTypes> checktypes = checktypes(region, speciality);
        int size = checktypes.get(0).getSpecialityValue().size();
        if (size==0){
            checktypes.get(0).setCode("400");
        }else {
            checktypes.get(0).setCode("200");
        }
        return ResponseDto.success(checktypes);
    }

    public String getSpecialityS(String speciality){
        HashMap<String, String> specialityMap = new HashMap<>();
        specialityMap.put("空间","space");
        specialityMap.put("家客","family");
        specialityMap.put("核心","core");
        specialityMap.put("网络云","netcloud");
        specialityMap.put("专网","transi");
        specialityMap.put("管线","trans");
        specialityMap.put("一干传输","yigantransi");
        return specialityMap.get(speciality);
    }

    private List<PointerTypes> checktypes(String region, String speciality) throws SQLException {
        List<PointerTypes> pointerTypes = new ArrayList<>();
        if (StringUtils.isNotEmpty(region)) {
            String s = map.get(region);
            Assert.notNull(s, "没有找到对应的区域");
            String speciality1 = getSpecialityS(speciality);
            String byversionMax = chkresultProvinceRepository.findByversionMax();
            List<ChkresultStaticsProvinceRule> byVersionAndCodeAndSpeciality = chkresultStaticsProvinceRuleService.findByVersionAndCodeAndSpeciality(byversionMax, s, speciality1);
            Map<String, List<ChkresultStaticsProvinceRule>> collect = byVersionAndCodeAndSpeciality.stream().collect(Collectors.groupingBy(ChkresultStaticsProvinceRule::getRuleName));
            Map<String, String> areacode = loadRegionget("").stream().collect(Collectors.toMap(AreaCodeConfig::getName, AreaCodeConfig::getCode));

            List<PointerType> specialityValue = new ArrayList<>();
            for (Map.Entry<String, List<ChkresultStaticsProvinceRule>> colle:collect.entrySet()){
                List<ChkresultStaticsProvinceRule> value = colle.getValue();
                List<IndexItemDto> indexItemDetailDtos = new ArrayList<>();
                for (ChkresultStaticsProvinceRule metricCityResult:value) {

                    List<MetricCityResult> byVersionAndCodeAndSpeciality1 = metricCityResultService.findByVersionAndCodeAndSpeciality(byversionMax, metricCityResult.getRuleNoOrg(), metricCityResult.getMajor());
                    MetricCityResult metricCityResult1 = byVersionAndCodeAndSpeciality1.size()>0?byVersionAndCodeAndSpeciality1.get(0):new MetricCityResult();
                    if (metricCityResult1.getId()==null){

                    }else {
                        indexItemDetailDtos.add(IndexItemDto.builder()
                                .indexCode(metricCityResult1.getRuleNo())
                                .indexName(metricCityResult1.getRuleName())
                                .totalAmount(String.valueOf(metricCityResult.getTotalNum()))
                                .errorAmount(String.valueOf(metricCityResult.getErrorNum()))
                                .value(Double.valueOf(metricCityResult.getPassedNum())).build());
                    }
                }
                if (indexItemDetailDtos.size()>0){
                    specialityValue.add(PointerType.builder()
                            .indType(colle.getKey())
                            .indexItemDtos(indexItemDetailDtos).build());
                }else {

                }

            }
            pointerTypes.add(PointerTypes.builder().specialityType(speciality).specialityValue(specialityValue).build());
        }else {
            Assert.notNull(region, "没有找到对应的区域");
        }
        return pointerTypes;
    }

    @ApiOperation("展示省份专业下最近几次核查的每个实体的量")
    @GetMapping("/history/entity/{region}/{speciality}")
    public ResponseDto<List<EntityRecordDto>> historyEntity(
            @ApiParam("区域")
            @PathVariable("region") String region,
            @ApiParam("专业")
            @PathVariable("speciality") String speciality,
            @ApiParam("是否采用Mock数据")
            @RequestParam(value = "mock", required = false) Boolean mock) throws SQLException {

        return ResponseDto.success(doLoadHistoryEntity(region, speciality));
    }

    private List<EntityRecordDto> doLoadHistoryEntity(String region, String speciality) throws SQLException {
        ArrayList<EntityRecordDto> entityRecordDtos = new ArrayList<>();
        if (StringUtils.isNotEmpty(region)) {
            String s = map.get(region);
            Assert.notNull(s, "没有找到对应的区域");
            List<String> byversion = metricCityResultService.findByversion();
            String speciality1 = getSpecialityS(speciality);

            for (String version:byversion) {
                ArrayList<EntityColumnDto> entityColumnDtos = new ArrayList<>();
                Map<String, List<MetricCityResult>> collect = metricCityResultService.findByCodeAndSpeciality(version, region, speciality1).stream().collect(Collectors.groupingBy(MetricCityResult::getRuleNo));
                Map<String, Integer> onedata = chkresultStaticsProvinceRuleService.findByVersionAndCodeAndSpeciality(version, s, speciality1).stream().collect(Collectors.toMap(ChkresultStaticsProvinceRule::getRuleNoOrg, ChkresultStaticsProvinceRule::getPassedNum));
                for (Map.Entry<String, List<MetricCityResult>> colle:collect.entrySet()){
                    if (collect.size()>0&&onedata.size()>0){
                        entityColumnDtos.add(EntityColumnDto.builder().name(colle.getValue().get(0).getCheckObject()).amount(Long.valueOf(onedata.get(colle.getKey()))).build());
                    }
                }
                List<MetricCityResult> byCodeAndSpeciality = metricCityResultService.findByCodeAndSpeciality(version, region, speciality1);
                if (entityColumnDtos.size()>0){
                    String createTime = byCodeAndSpeciality.get(0).getCreateTime();
                    Date date = new Date();
                    date.setTime(Long.valueOf(createTime));

                    entityRecordDtos.add(EntityRecordDto.builder().date(date).columns(entityColumnDtos).build());
                }

            }
        }
        return entityRecordDtos;
    }

    @ApiOperation("展示省份专业下最近几次核查的每个指标的值")
    @GetMapping("/history/index/{region}/{speciality}")
    public ResponseDto<List<IndexRecordDto>> historyIndex(
            @ApiParam("区域")
            @PathVariable("region") String region,
            @ApiParam("专业")
            @PathVariable("speciality") String speciality,
            @ApiParam("是否采用Mock数据")
            @RequestParam(value = "mock", required = false) Boolean mock) throws ParseException {

        return ResponseDto.success(doLoadHistoryIndex(region, speciality));
    }

    private List<IndexRecordDto> doLoadHistoryIndex(String region, String speciality) throws ParseException {
        ArrayList<IndexRecordDto> entityRecordDtos = new ArrayList<>();
        if (StringUtils.isNotEmpty(region)) {
            String s1 = map.get(region);
            Assert.notNull(s1, "没有找到对应的区域");
            List<String> byversion = metricCityResultService.findByversion();
            String speciality1 = getSpecialityS(speciality);

            for (String version:byversion) {
                ArrayList<IndexColumnDto> entityColumnDtos = new ArrayList<>();
                Map<String, List<MetricCityResult>> collect = metricCityResultService.findByCodeAndSpeciality(version, region, speciality1).stream().collect(Collectors.groupingBy(MetricCityResult::getRuleNo));
                Map<String, String> onedata= new HashMap<>();
                List<ChkresultStaticsProvinceRule> byVersionAndCodeAndSpeciality = chkresultStaticsProvinceRuleService.findByVersionAndCodeAndSpeciality(version, s1, speciality1);
                for (ChkresultStaticsProvinceRule value:byVersionAndCodeAndSpeciality) {
                    String passrate = value.getPassrate();
                    String ruleNoOrg = value.getRuleNoOrg();
                    if (passrate==null){
                        onedata.put(ruleNoOrg,"-");
                    }else {
                        onedata.put(ruleNoOrg,passrate);
                    }
                }
                for (Map.Entry<String, List<MetricCityResult>> colle:collect.entrySet()){
                    if (collect.size()>0&&onedata.size()>0){
                        String s ;
                        if (!onedata.get(colle.getKey()).equals("-")){
                            NumberFormat nf=NumberFormat.getPercentInstance();
                            Number m=nf.parse(onedata.get(colle.getKey()));//将百分数转换成Number类型
                             s = m.toString();
                        }else {
                            s = onedata.get(colle.getKey());
                        }

                        entityColumnDtos.add(IndexColumnDto.builder().name(colle.getValue().get(0).getRuleName()).values(s).build());
                    }
                }
                List<MetricCityResult> byCodeAndSpeciality = metricCityResultService.findByCodeAndSpeciality(version, region, speciality1);
                if (entityColumnDtos.size()>0){
                    String createTime = byCodeAndSpeciality.get(0).getCreateTime();
                    Date date = new Date();
                    date.setTime(Long.valueOf(createTime));

                    entityRecordDtos.add(IndexRecordDto.builder().date(date).columns(entityColumnDtos).build());
                }

            }
        }
        return entityRecordDtos;
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
            @RequestParam(value = "mock", required = false) Boolean mock) throws IOException, ParseException, SQLException {
        if (BooleanUtils.isTrue(mock)) {
            //return ResponseDto.success(loadMojarMock(region));
        }
//        exceldowns(speciality,request,response);
//        System.out.println(speciality);
        errordata(request,response,speciality,region);
    }

    private void errordata(HttpServletRequest request, HttpServletResponse response, String speciality, String region) throws SQLException, ParseException, IOException {
        String specialityS = getSpecialityS(speciality);
        AreaCodeConfig code = areaCodeConfigRepository.findByCode(region);
        String[] stringsName={"规则编号","规则类型","规则描述","省份","地市","区县","资源标识","资源名称","问题原因","错误数量"};//第一行
        HashMap<String, List<ErrorData>> map = new HashMap<>();
        List<ErrorData> errorData = errorDataService.findErrorDataCode("资源完整性核查",region,specialityS+"-1");
        List<ErrorData> errorDatatow = errorDataService.findErrorDataCode("资源规范性核查",region,specialityS+"-2");
        List<ErrorData> errorDatathree = errorDataService.findErrorDataCode("资源关联性核查",region,specialityS+"-3");
        List<ErrorData> errorDatafour = errorDataService.findErrorDataCode("业务合规性核查",region,specialityS+"-4");
        map.put("资源完整性核查问题明细",errorData);
        map.put("资源规范性核查问题明细",errorDatatow);
        map.put("资源关联性核查问题明细",errorDatathree);
        map.put("业务合规性核查问题明细",errorDatafour);


        ExcelUtils.exportExcelthree(request,response,map,stringsName,speciality,code.getName());
    }

    @ApiOperation("展示省份专业下最近几次核查的每个指标的值")
    @GetMapping("/detail/{code}")
    public ResponseDto<IndexDto> detail(
            @ApiParam("区域")
            @PathVariable("code") String code,
            @ApiParam("是否采用Mock数据")
            @RequestParam(value = "mock", required = false) Boolean mock) throws ParseException {

        return ResponseDto.success(indexDetail(code));
    }

    private IndexDto indexDetail(String code) {
        MetricCityResult byRuleno = metricCityResultService.findByRuleno(code);
        IndexDto indexDto = new IndexDto();
        if (byRuleno!=null){
            indexDto.setCode(byRuleno.getRuleNo());
            indexDto.setName(byRuleno.getRuleName());
            indexDto.setEntityTypeName(byRuleno.getCheckObject());
            indexDto.setSpecialityName(byRuleno.getRelatedMajor());
        }
        return indexDto;
    }
}
