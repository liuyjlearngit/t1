package com.cmdi.dims.app;

import com.cmdi.dims.app.dto.*;
import com.cmdi.dims.jdbctemple.entity.ErrorData;
import com.cmdi.dims.jdbctemple.entity.ResStatisticsHeadquarters;
import com.cmdi.dims.jdbctemple.service.ResStatisticsService;
import com.cmdi.dims.jdbctemple.service.impl.ErrorDataServiceImpl;
import com.cmdi.dims.task.entity.AreaCodeConfig;
import com.cmdi.dims.task.repository.AreaCodeConfigRepository;
import com.cmdi.dims.util.ExcelUtils;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.BooleanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.*;
import java.util.stream.Collectors;

@Slf4j
@RestController
@RequestMapping("/app/v2/auth")
public class HeadquartersHealingController {

    @Autowired
    private AreaCodeConfigRepository areaCodeConfigRepository;
    @Autowired
    ResStatisticsService resStatisticsRepository;

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

    public List<String> getSpeciality(){
        List<String> strings = new ArrayList<>();
        strings.add("东北大区");
        strings.add("华北大区");
        strings.add("西北大区");
        strings.add("西南大区");
        strings.add("华东北大区");
        strings.add("华东南大区");
        strings.add("华中大区");
        strings.add("华南大区");
        return strings;
    }
    public List<String> getSpecialityAll(){
       String STR= "吉林,江苏,山东,河北,北京,天津,山西,内蒙古,黑龙江,安徽,辽宁,浙江,上海,福建,江西,西藏,河南,湖北,湖南,海南,广西,广东,贵州,云南,陕西,甘肃,宁夏,青海,新疆,四川,重庆,";
        String[] split = STR.split(",");
        ArrayList<String> strings = new ArrayList<>();
        for (int i=0;i<split.length;i++){
            strings.add(split[i]);
       }
        return strings;
    }

    @ApiOperation("省端自维资源概览")
    @GetMapping("/statistical")
    public ResponseDto<List<ProfessionalDot>> statistical (
            @ApiParam("是否采用Mock数据")
            @RequestParam(value = "mock", required = false) Boolean mock) {
        if (BooleanUtils.isTrue(mock)) {
            //return ResponseDto.success(loadMojarMock(region));
        }
        return ResponseDto.success(statisticals());
    }

    //四舍五入
    public Integer avarage(Integer substring){
        BigDecimal b   =   new BigDecimal(substring);
        Integer   f1   =   b.setScale(4,   BigDecimal.ROUND_HALF_UP).intValue();
        return f1;
    }

    private List<ProfessionalDot> statisticals() {
        //判断是否是  全国


        Map<String, List<ResStatisticsHeadquarters>> collect = resStatisticsRepository.findByRegionTypeAndTaskCodeIn().stream().collect(Collectors.groupingBy(ResStatisticsHeadquarters::getSpecialityName));
        List<String> strname=new ArrayList<>();
        for (Map.Entry<String, List<ResStatisticsHeadquarters>> colle:collect.entrySet()){
            strname.add(colle.getKey());
        }//所有专业名
        ArrayList<ProfessionalDot> professionalDots = new ArrayList<>();

        for (String speciality:strname) {//循环专业
            List<ResStatisticsHeadquarters> allnums = new ArrayList<>();

            if (speciality.equals("网络云")){
                allnums=resStatisticsRepository.findByWLY();
            }else {
                allnums = resStatisticsRepository.findByRegionTypeAndTaskCodeInAndResName(speciality);
            }
            Map<String, List<ResStatisticsHeadquarters>> resnames = allnums.stream().collect(Collectors.groupingBy(ResStatisticsHeadquarters::getResName));//resname分组
            TreeMap<String, List<ResStatisticsHeadquarters>> stringListTreeMap = new TreeMap<>();
            stringListTreeMap.putAll(resnames);
            ArrayList<ResourcesDto> resourcesDtos = null;

            ArrayList<List<ResourcesDto>> lists=null;
            ArrayList<List<ResourcesDetailsDto>> threes = new ArrayList<>();

            resourcesDtos = new ArrayList<>();
            lists = new ArrayList<>();
            String units="";

            for (Map.Entry<String, List<ResStatisticsHeadquarters>> colle:stringListTreeMap.entrySet()){

                List<ResStatisticsHeadquarters> value = colle.getValue();

                Double i=0.0;
                for (ResStatisticsHeadquarters restatis:value) {//第二轮
                    i+=restatis.getAmount();
                    if (restatis.getResType()==null){
                        restatis.setResType("");
                    }
                }


                Map<String, List<ResStatisticsHeadquarters>> restypes = value.stream().collect(Collectors.groupingBy(ResStatisticsHeadquarters::getResType));

                ArrayList<ResourcesDetailsDto> resourcesDetailsDtos = new ArrayList<>();
                for (Map.Entry<String, List<ResStatisticsHeadquarters>> colles:restypes.entrySet()){

                    List<ResStatisticsHeadquarters> value1 = colles.getValue();
                    Double j=0.0;
                    String nuit=null;
                    for (ResStatisticsHeadquarters resta:value1) {//第三轮
                        j+=resta.getAmount();
                        nuit=resta.getUnit();

                    }
                    if (value1==null){

                    }else {
                        if (colles.getKey().equals("")){///

                        }else {///
                            String jtow=j+"";
                            resourcesDetailsDtos.add(ResourcesDetailsDto.builder()
                                    .name(colles.getKey())
                                    .num(jtow)
                                    .unit(nuit)
                                    .build());
                            units=nuit;
                        }
                    }

                }

                if (value==null){//第二轮

                }else {
                    Double j=0.0;
                    ArrayList<ResourcesDetailsDto> resourcesDetailsDtostow = new ArrayList<>();
                    for (ResourcesDetailsDto resourcesDetailsDto:resourcesDetailsDtos) {
                        j++;
                        resourcesDetailsDtostow.add(resourcesDetailsDto);
                        if (j==4){
                            threes.add(resourcesDetailsDtostow);
                            resourcesDetailsDtostow=new ArrayList<>();
                            j=0.0;
                        }
                    }
                    if (resourcesDetailsDtostow.size()<4&&resourcesDetailsDtostow.size()>0){
                        threes.add(resourcesDetailsDtostow);
                    }

                    if (i==0){///

                    }else {
                        String jtow=i+"";

                        resourcesDtos.add(ResourcesDto.builder()
                                .resourcesName(colle.getKey())
                                .allValue(jtow)
                                .allUnit(units)
                                .numsn(threes)
                                .build());
                        threes=new ArrayList<>();
                    }

                    threes=new ArrayList<>();

                }
            }
//第一轮
            ArrayList<ResourcesDto> resourcesDto=new ArrayList<>();
            Double i=0.0;
            for (ResourcesDto res:resourcesDtos) {
                i++;
                resourcesDto.add(res);
                if (i==8){
                    lists.add(resourcesDto);
                    i=0.0;
                    resourcesDto=new ArrayList<>();
                }
            }
            if(resourcesDto!=null&&resourcesDto.size()<8&&resourcesDto.size()>0){
                lists.add(resourcesDto);
            }
                if(lists.size()==0){

                }else {
                    professionalDots.add(ProfessionalDot.builder()
                            .speciality(speciality)
                            .specialityName(speciality)
                            .resourcesDtos(lists)
                            .build());
                }

        }
        return professionalDots;
    }

    @ApiOperation("省端自维资源柱状图")
    @GetMapping("/graphical/statistics/{speciality}/{resname}")
    public ResponseDto<List<RegionItemDto>> graphical (
            @ApiParam("专业")
            @PathVariable("speciality") String speciality,
            @ApiParam("资源对象")
            @PathVariable("resname") String resname,
            @ApiParam("是否采用Mock数据")
            @RequestParam(value = "mock", required = false) Boolean mock) {
        if (BooleanUtils.isTrue(mock)) {
            //return ResponseDto.success(loadMojarMock(region));
        }
        return ResponseDto.success(graphicals(speciality,resname));
    }

    private List<RegionItemDto> graphicals(String speciality, String resname) {

        //所有 当前 taskcode
        List<ResStatisticsHeadquarters> byTaskCodeIn = new ArrayList<>();

            byTaskCodeIn = resStatisticsRepository.findByRegionTypeAndTaskCode(resname,speciality);

        ArrayList<RegionItemDto> regionItemDtos = new ArrayList<>();

        //所有地址
        List<AreaCodeConfig> byRegionTypeOrderByCode = areaCodeConfigRepository.findByRegionTypeOrderByCode(1);
        List<String> name =new ArrayList<>();
        if (speciality.equals("网络云")){
           name = getSpeciality();
        }else {
            name = getSpecialityAll();
        }

        //按 地址分割
        Map<String, List<ResStatisticsHeadquarters>> collect = new HashMap<>();
        List<ResStatisticsHeadquarters> resStatistics = new ArrayList<>();
        for (String strname:name) {
            collect.put(strname,resStatistics);
        }
        Map<String, List<ResStatisticsHeadquarters>> collect1 = byTaskCodeIn.stream().collect(Collectors.groupingBy(ResStatisticsHeadquarters::getProvince));
        if(speciality.equals("5GC")||speciality.equals("NFV")){
            List<String> strings = getSpeciality();
            for (String string:strings) {
                collect1.remove(string);
            }
        }
        collect.putAll(collect1);
        HashMap<String,Double> doubleStringHashMap = new HashMap<>();
        for (Map.Entry<String, List<ResStatisticsHeadquarters>> colles:collect.entrySet()){
            Double amount = 0.0;
            for (ResStatisticsHeadquarters restaistice:colles.getValue()) {
                amount+= restaistice.getAmount();
            }
            doubleStringHashMap.put(colles.getKey(),amount);
        }
        //这里将map.entrySet()转换成list
        List<Map.Entry<String,Double>> list = new ArrayList<Map.Entry<String,Double>>(doubleStringHashMap.entrySet());
        //然后通过比较器来实现排序
        Collections.sort(list,new Comparator<Map.Entry<String, Double>>() {
            @Override
            public int compare(Map.Entry<String, Double> o1, Map.Entry<String, Double> o2) {
                return o2.getValue().compareTo(o1.getValue());
            }
        });
        for (Map.Entry<String,Double> ma:list) {
            RegionItemDto regionItemDto = new RegionItemDto();
            regionItemDto.setRegion(ma.getKey());
            regionItemDto.setRegionName(ma.getKey());
            regionItemDto.setValue(Double.valueOf(ma.getValue()));
            regionItemDto.setVName(resname);
            regionItemDtos.add(regionItemDto);
        }
        return regionItemDtos;
    }

    @ApiOperation("省端自维资源下载excel")
    @PostMapping ("/statistics/exceldown/{speciality}")
    public void exceldown (
            @ApiParam("专业")
            @PathVariable("speciality") List<String> speciality,
            HttpServletRequest request,
            HttpServletResponse response,
            @ApiParam("是否采用Mock数据")
            @RequestParam(value = "mock", required = false) Boolean mock) throws IOException {
        if (BooleanUtils.isTrue(mock)) {
            //return ResponseDto.success(loadMojarMock(region));
        }
        exceldowns(speciality,request,response);
        System.out.println(speciality);
    }

    private void exceldowns(List<String> speciality, HttpServletRequest request, HttpServletResponse response) throws IOException {
        ArrayList<ExcelDownData> list = new ArrayList<>();

        for (String specia:speciality) {
            ExcelDownData excelDownData = excelData(specia);
            ExcelDownData excelDownData1 = new ExcelDownData();
            if (excelDownData==null){
                excelDownData1.setSpeciality(specia);//这个是空的地址用的
                list.add(excelDownData1);
            }else {
                list.add(excelDownData);
            }

        }
        Map<String, List<ExcelDownData>> collect = list.stream().collect(Collectors.groupingBy(ExcelDownData::getSpeciality));
        ExcelUtils.exportExcel(request,response,speciality,collect);
    }

    private ExcelDownData excelData(String speciality){
        List<ResStatisticsHeadquarters> byTaskCodeIn = new ArrayList<>();
        List<String> splityCode=new ArrayList<>();
        if (speciality.equals("网络云")){
            byTaskCodeIn = resStatisticsRepository.findSplityAll(speciality);//当前专业的 所有信息
            splityCode.addAll(resStatisticsRepository.findSplityCodetow());
        }else {
            byTaskCodeIn = resStatisticsRepository.findSplityAll(speciality);//当前专业的 所有信息
            splityCode=resStatisticsRepository.findSplityCode(speciality);//当前专业的 有哪些地址
            if(speciality.equals("5GC")||speciality.equals("NFV")){
                List<String> strings = getSpeciality();
                for (String string:strings) {
                    splityCode.remove(string);
                }
            }
        }
        Map<String, List<ResStatisticsHeadquarters>> collect = byTaskCodeIn.stream().collect(Collectors.groupingBy(ResStatisticsHeadquarters::getResName));
        HashMap<String, List<String>> stringArrayListHashMap = new HashMap<>();
        ArrayList<String> strings1 = new ArrayList<>();
        ArrayList<String> strings2 = new ArrayList<>();
        ArrayList<Integer> strings3 = new ArrayList<>();
        ArrayList<String> wei = new ArrayList<>();//单位
        wei.add("统计单位");
        for (Map.Entry<String, List<ResStatisticsHeadquarters>> colle:collect.entrySet()){
            strings1.add(colle.getKey());
            strings3.add(colle.getValue().size()+1);
            List<ResStatisticsHeadquarters> value = colle.getValue();
            ArrayList<String> strings = new ArrayList<String>();


            for (ResStatisticsHeadquarters val:value) {
                strings.add(val.getResType());
                val.setResName(val.getResType());
                wei.add(val.getUnit());
                strings2.add(val.getResName());
            }
            stringArrayListHashMap.put(colle.getKey(),strings);//所有指标
            ResStatisticsHeadquarters resStatisticsHeadquarters = new ResStatisticsHeadquarters();
            resStatisticsHeadquarters.setResName("总和");
            wei.add(value.get(0).getUnit());
            strings2.add(resStatisticsHeadquarters.getResName());
            value.add(resStatisticsHeadquarters);
        }
        //上面有了 当前专业的  第一行  第二行
        ArrayList<String> strings = new ArrayList<>();
        for (String code:splityCode) {
            String str=code;
            for (Map.Entry<String, List<String>> colle:stringArrayListHashMap.entrySet()) {
                Map<String, Double> data = getData(speciality, colle.getKey(), code);
                List<String> value = colle.getValue();
                Double sum=0.0;
                for (String val:value) {
                    Double integer = data.get(val);
                    Double i = integer == null ? 0 : integer == null ? 0 : integer;
                    str+=","+i;
                    sum+=i;
                }
                str+=","+sum;
            }
            strings.add(str);
        }

        String end="合计";
        for (Map.Entry<String, List<String>> colle:stringArrayListHashMap.entrySet()) {
            Map<String, Double> byTaskCodeIns ;
            if (speciality.equals("5GC")||speciality.equals("NFV")){
                byTaskCodeIns = resStatisticsRepository.findSplityAllsql(speciality,colle.getKey()).stream().collect(Collectors.toMap(ResStatisticsHeadquarters::getResType, ResStatisticsHeadquarters::getAmount));
            }else {
                byTaskCodeIns = resStatisticsRepository.findSplityAllsqlong(speciality,colle.getKey()).stream().collect(Collectors.toMap(ResStatisticsHeadquarters::getResType, ResStatisticsHeadquarters::getAmount));
            }
            List<String> value = colle.getValue();
            Double sum=0.0;
            for (String val:value) {
                Double integer = byTaskCodeIns.get(val);
                Double i = integer == null ? 0 : integer == null ? 0 : integer;
                end+=","+i;
                sum+=i;
            }
            end+=","+sum;
        }

        ExcelDownData excelDownData = new ExcelDownData();
        if (strings.size()==0){
            excelDownData=null;
        }else {
            excelDownData.setSpeciality(speciality);
            excelDownData.setAlldata(strings);
            excelDownData.setAllDatas(end);
            excelDownData.setOnenum(strings3);
            excelDownData.setStrings(strings1);
            excelDownData.setStringss(strings2);
            excelDownData.setWei(wei);
        }
        return excelDownData;
    }

    private Map<String, Double> getData(String speciality,String big,String code){
        List<ResStatisticsHeadquarters> byTaskCodeIn = new ArrayList<>();
            byTaskCodeIn = resStatisticsRepository.findAll(speciality,big,code);

        Map<String, Double> collect = byTaskCodeIn.stream().collect(Collectors.toMap(ResStatisticsHeadquarters::getResType, ResStatisticsHeadquarters::getAmount));
        return collect;
    }

    @ApiOperation("默认页面测试接口")
    @GetMapping ("/statistics")
    public ResponseDto<StatisticsAllData> statistics (
            @ApiParam("是否采用Mock数据")
            @RequestParam(value = "mock", required = false) Boolean mock) throws IOException {
        if (BooleanUtils.isTrue(mock)) {
            //return ResponseDto.success(loadMojarMock(region));
        }
        return ResponseDto.success(statisticsAll());
    }

    private StatisticsAllData statisticsAll() {
        List<ProfessionalDot> statisticals = statisticals();
        String speciality = null;
        String resourcesName = null;

        ArrayList<ProfessionalDot> professionalDots = new ArrayList<>();
        for (ProfessionalDot statis:statisticals) {
            if (statis.getResourcesDtos().size()>0&&statis.getResourcesDtos().get(0).size()>0){
                speciality = statis.getSpeciality();
                resourcesName = statis.getResourcesDtos().get(0).get(0).getResourcesName();
                professionalDots.add(statis);
                break;
            }
        }

        for (int i=0;i<statisticals.size();i++){
            if (!statisticals.get(i).getSpeciality().equals(speciality)){
                professionalDots.add(statisticals.get(i));
            }
        }

        List<RegionItemDto> graphicals = graphicals(speciality, resourcesName);
        StatisticsAllData statisticsAllData = new StatisticsAllData();
        statisticsAllData.setGraphicals(graphicals);
        statisticsAllData.setStatisticals(professionalDots);
        return statisticsAllData;
    }
}
