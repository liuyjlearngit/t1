package com.cmdi.dims.app;

import com.cmdi.dims.app.dto.*;
import com.cmdi.dims.index.repository.IndexCarrierRepository;
import com.cmdi.dims.index.repository.IndexRepository;
import com.cmdi.dims.meta.entity.EntityType;
import com.cmdi.dims.meta.repostitory.EntityTypeRepository;
import com.cmdi.dims.task.entity.AreaCodeConfig;
import com.cmdi.dims.task.entity.ResStatistics;
import com.cmdi.dims.task.entity.TaskLatest;
import com.cmdi.dims.task.repository.*;
import com.cmdi.dims.util.ExcelUtils;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.BooleanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.*;
import java.util.stream.Collectors;

@Api(tags = "资源信息API")
@Slf4j
@RestController
@RequestMapping("/app/v1/resources")
public class HeadquartersResourcesController {
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
    private ResStatisticsRepository resStatisticsRepository;

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

    private List<ProfessionalDot> statisticals() {
        //判断是否是  全国

        List<String> specialityNames = entityTypeRepository.findSpecialityNames();//所有专业名
        ArrayList<ProfessionalDot> professionalDots = new ArrayList<>();
        String name="";
        for (String speciality:specialityNames) {//循环专业
            if (speciality.equals("空间")){
                speciality=name;
            }
            if (name.equals("")){
                    name=speciality;
                    speciality="空间";
                }


                //如果是全国查找所有 省级数据
            List<String> taskcodes = taskLatestRepository.findAll().stream()
                    .map(TaskLatest::getTaskCode).collect(Collectors.toList());//全国所有审核后的数据 taskcode
            List<String> provinces = taskLatestRepository.findAll().stream()
                    .map(TaskLatest::getProvince).collect(Collectors.toList());//全国所有审核后的数据 provice

            List<EntityType> bySpecialityName = entityTypeRepository.findBySpecialityName(speciality);//当前专业有哪些类型

            List<ResStatistics> allnums = resStatisticsRepository.findByTaskCodeInAndProvinceCodeInAndSpecialityName(taskcodes, provinces, speciality);

            Map<String, List<ResStatistics>> resnames = allnums.stream().collect(Collectors.groupingBy(ResStatistics::getResName));//resname分组

            ArrayList<ResourcesDto> resourcesDtos = null;

            ArrayList<List<ResourcesDto>> lists=null;
            ArrayList<List<ResourcesDetailsDto>> threes = new ArrayList<>();

            resourcesDtos = new ArrayList<>();
            lists = new ArrayList<>();
            String units="";

            for (Map.Entry<String, List<ResStatistics>> colle:resnames.entrySet()){

                List<ResStatistics> value = colle.getValue();

                int i=0;
                for (ResStatistics restatis:value) {//第二轮
                    i+=restatis.getAmount();
                }


                Map<String, List<ResStatistics>> restypes = value.stream().collect(Collectors.groupingBy(ResStatistics::getResType));

                ArrayList<ResourcesDetailsDto> resourcesDetailsDtos = new ArrayList<>();
                for (Map.Entry<String, List<ResStatistics>> colles:restypes.entrySet()){

                    List<ResStatistics> value1 = colles.getValue();
                    int j=0;
                    String nuit=null;
                    for (ResStatistics resta:value1) {//第三轮
                       j+=resta.getAmount();
                        nuit=resta.getUnit();

                    }
                    if (value1==null){

                    }else {
                        resourcesDetailsDtos.add(ResourcesDetailsDto.builder()
                                .name(colles.getKey())
                                .num(""+j)
                                .unit(nuit)
                                .build());
                        units=nuit;
                    }

                }

                if (value==null){//第二轮

                }else {
                    int j=0;
                    ArrayList<ResourcesDetailsDto> resourcesDetailsDtostow = new ArrayList<>();
                    for (ResourcesDetailsDto resourcesDetailsDto:resourcesDetailsDtos) {
                        j++;
                        resourcesDetailsDtostow.add(resourcesDetailsDto);
                        if (j==4){
                            threes.add(resourcesDetailsDtostow);
                            resourcesDetailsDtostow=new ArrayList<>();
                            j=0;
                        }
                    }
                    if (resourcesDetailsDtostow.size()<4&&resourcesDetailsDtostow.size()>0){
                        threes.add(resourcesDetailsDtostow);
                    }

                        resourcesDtos.add(ResourcesDto.builder()
                                .resourcesName(colle.getKey())
                                .allValue(""+i)
                                .allUnit(units)
                                .numsn(threes)
                                .build());


                    threes=new ArrayList<>();

                }
            }
//第一轮
            ArrayList<ResourcesDto> resourcesDto=new ArrayList<>();
            int i=0;
            for (ResourcesDto res:resourcesDtos) {
                i++;
                resourcesDto.add(res);
                if (i==8){
                    lists.add(resourcesDto);
                    i=0;
                    resourcesDto=new ArrayList<>();
                }
            }
            if(resourcesDto!=null&&resourcesDto.size()<8&&resourcesDto.size()>0){
                lists.add(resourcesDto);
            }

            professionalDots.add(ProfessionalDot.builder()
                    .speciality(speciality)
                    .specialityName(speciality)
                    .resourcesDtos(lists)
                    .build());
        }
        return professionalDots;
    }

    private List<ProfessionalDot> statisticalss() {
        List<String> specialityNames = entityTypeRepository.findSpecialityNames();//所有专业名
        ArrayList<ProfessionalDot> professionalDots = new ArrayList<>();

        for (String speciality:specialityNames) {//循环专业

            //如果是全国查找所有 省级数据
            List<String> taskcodes = taskLatestRepository.findAll().stream()
                    .map(TaskLatest::getTaskCode).collect(Collectors.toList());//全国所有审核后的数据 taskcode
            List<String> provinces = taskLatestRepository.findAll().stream()
                    .map(TaskLatest::getProvince).collect(Collectors.toList());//全国所有审核后的数据 provice

            List<EntityType> bySpecialityName = entityTypeRepository.findBySpecialityName(speciality);//当前专业有哪些类型

            List<ResStatistics> allnums = resStatisticsRepository.findByTaskCodeInAndProvinceCodeInAndSpecialityName(taskcodes, provinces, speciality);

            Map<String, List<ResStatistics>> resnames = allnums.stream().collect(Collectors.groupingBy(ResStatistics::getResName));//resname分组

            ArrayList<ResourcesDto> resourcesDtos = null;

            ArrayList<List<ResourcesDto>> lists=null;
            ArrayList<List<ResourcesDetailsDto>> threes = new ArrayList<>();

            resourcesDtos = new ArrayList<>();
            lists = new ArrayList<>();
            String units="";
            for (Map.Entry<String, List<ResStatistics>> colle:resnames.entrySet()){

                List<ResStatistics> value = colle.getValue();

                int i=0;
                for (ResStatistics restatis:value) {//第二轮
                    i+=restatis.getAmount();
                }


                Map<String, List<ResStatistics>> restypes = value.stream().collect(Collectors.groupingBy(ResStatistics::getResType));

                ArrayList<ResourcesDetailsDto> resourcesDetailsDtos = new ArrayList<>();
                for (Map.Entry<String, List<ResStatistics>> colles:restypes.entrySet()){

                    List<ResStatistics> value1 = colles.getValue();
                    int j=0;
                    String nuit=null;
                    for (ResStatistics resta:value1) {//第三轮
                        j+=resta.getAmount();
                        nuit=resta.getUnit();

                    }
                    if (value1==null){

                    }else {
                        resourcesDetailsDtos.add(ResourcesDetailsDto.builder()
                                .name(colles.getKey())
                                .num(""+j)
                                .unit(nuit)
                                .build());
                        units=nuit;
                    }

                }

                if (value==null){//第二轮

                }else {
                    int j=0;
                    ArrayList<ResourcesDetailsDto> resourcesDetailsDtostow = new ArrayList<>();
                    for (ResourcesDetailsDto resourcesDetailsDto:resourcesDetailsDtos) {
                        j++;
                        resourcesDetailsDtostow.add(resourcesDetailsDto);
                        if (j==4){
                            threes.add(resourcesDetailsDtostow);
                            resourcesDetailsDtostow=new ArrayList<>();
                            j=0;
                        }
                    }
                    if (resourcesDetailsDtostow.size()<4&&resourcesDetailsDtostow.size()>0){
                        threes.add(resourcesDetailsDtostow);
                    }

                    resourcesDtos.add(ResourcesDto.builder()
                            .resourcesName(colle.getKey())
                            .allValue(""+i)
                            .allUnit(units)
                            .numsn(threes)
                            .build());
                    threes=new ArrayList<>();

                }
            }
//第一轮
            ArrayList<ResourcesDto> resourcesDto=new ArrayList<>();
            int i=0;
            for (ResourcesDto res:resourcesDtos) {
                i++;
                resourcesDto.add(res);
                if (i==8){
                    lists.add(resourcesDto);
                    i=0;
                    resourcesDto=new ArrayList<>();
                }
            }
            if(resourcesDto!=null&&resourcesDto.size()<8&&resourcesDto.size()>0){
                lists.add(resourcesDto);
            }
            professionalDots.add(ProfessionalDot.builder()
                    .speciality(speciality)
                    .specialityName(speciality)
                    .resourcesDtos(lists)
                    .build());
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

    private List<RegionItemDto> graphicals(String speciality,String resname) {
        //查找所有当前专业的最新数据
        List<TaskLatest> bySpecialityName = taskLatestRepository.findBySpecialityName(speciality);
        List<String> taskcodes = bySpecialityName.stream()//所有的taskcode 符合专业 和 地址的最新数据
                .map(TaskLatest::getTaskCode).collect(Collectors.toList());
        //所有 当前 taskcode
        List<ResStatistics> byTaskCodeIn = resStatisticsRepository.findByTaskCodeInAndResName(taskcodes,resname);

        ArrayList<RegionItemDto> regionItemDtos = new ArrayList<>();

        //所有地址
        List<AreaCodeConfig> byRegionTypeOrderByCode = areaCodeConfigRepository.findByRegionTypeOrderByCode(1);
        List<String> name = byRegionTypeOrderByCode.stream()
                .map(AreaCodeConfig::getName).collect(Collectors.toList());
        //按 地址分割
        Map<String, List<ResStatistics>> collect = new HashMap<>();
        List<ResStatistics> resStatistics = new ArrayList<>();
        for (String strname:name) {
            collect.put(strname,resStatistics);
        }
        Map<String, List<ResStatistics>> collect1 = byTaskCodeIn.stream().collect(Collectors.groupingBy(ResStatistics::getProvince));
        collect.putAll(collect1);
        HashMap<String,Integer> doubleStringHashMap = new HashMap<>();
        for (Map.Entry<String, List<ResStatistics>> colles:collect.entrySet()){
            Integer amount = 0;
            for (ResStatistics restaistice:colles.getValue()) {
                 amount+= restaistice.getAmount();
            }
            doubleStringHashMap.put(colles.getKey(),amount);
        }
        //这里将map.entrySet()转换成list
               List<Map.Entry<String,Integer>> list = new ArrayList<Map.Entry<String,Integer>>(doubleStringHashMap.entrySet());
             //然后通过比较器来实现排序
               Collections.sort(list,new Comparator<Map.Entry<String, Integer>>() {
                   @Override
                   public int compare(Map.Entry<String, Integer> o1, Map.Entry<String, Integer> o2) {
                       return o2.getValue().compareTo(o1.getValue());
                   }
               });
        for (Map.Entry<String,Integer> ma:list) {
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
            ExcelDownData excelDownData = allData(specia);
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

    private ExcelDownData allData(String speciality){
        //第一行  当前专业有哪些 第一级数据

        List<TaskLatest> bySpecialityName = taskLatestRepository.findBySpecialityName(speciality);
        List<String> taskcodes = bySpecialityName.stream()//所有的taskcode 符合专业 和 地址的最新数据
                .map(TaskLatest::getTaskCode).collect(Collectors.toList());

        //所有 审核数据 都是从这个里面取
        List<ResStatistics> byTaskCodeIn = resStatisticsRepository.findByTaskCodeIn(taskcodes);

        Map<String, List<ResStatistics>> collect = byTaskCodeIn.stream().collect(Collectors.groupingBy(ResStatistics::getResName));
        ArrayList<String> strings = new ArrayList<>();//这个是第一行数据
        ArrayList<String> stringss = new ArrayList<>();//这个是第二行数据  大专业包含的小专业（带 单位 和 合计的） 他的size可以当总长度
        ArrayList<Integer> onenum = new ArrayList<>();//第一行每个长度  用来合并

        Map<String, List<ResStatistics>> collect1 = null;//
        HashMap<String, List<String>> stringStringHashMap = new HashMap<>();// 键 大专业  值他包含的小专业
        for (Map.Entry<String, List<ResStatistics>> colles:collect.entrySet()){
            strings.add(colles.getKey());

             collect1 = colles.getValue().stream().collect(Collectors.groupingBy(ResStatistics::getResType));
            onenum.add(collect1.size()+1);
             //第二行
            String unm="";
            ArrayList<String> strings1 = new ArrayList<>();//小专业数据
            for (Map.Entry<String, List<ResStatistics>> colless:collect1.entrySet()){
                strings1.add(colless.getKey());

                unm=colless.getValue().get(0).getUnit();
                stringss.add(colless.getKey()+"/"+colless.getValue().get(0).getUnit());
            }
            stringStringHashMap.put(colles.getKey(),strings1);


            stringss.add("总和"+"/"+unm);
        }

        //每个省 每个大专业下的小专业数据


        //地址数据
        List<String> collect2 = byTaskCodeIn.stream()//有哪些省
                .map(ResStatistics::getProvince).collect(Collectors.toList());

        HashMap<String, List<Integer>> alldata = new HashMap<>();//地址 数据 下面行
        for (String coll:collect2) {

        //首先查找
        List<Integer> allsums=new ArrayList<>();//下面数据
        for (Map.Entry<String, List<String>> colles:stringStringHashMap.entrySet()){
            Integer littall=0;
            List<String> value = colles.getValue();
            for (String val:value) {
                List<ResStatistics> in = resStatisticsRepository.findByTaskCodeInAndProvinceAndResNameAndResType(taskcodes,coll,colles.getKey(),val);
                List<Integer> allsum = in.stream()//
                        .map(ResStatistics::getAmount).collect(Collectors.toList());
                Integer sum=0;
                for (Integer sums:allsum) {
                    sum+=sums;
                }
                littall+=sum;
                allsums.add(sum);
            }
            allsums.add(littall);
        }
            alldata.put(coll,allsums);
        }

        List<ProfessionalDot> statisticals = statisticalss();//全国 数据
        List<ResourcesDto> resourcesDtos = new ArrayList<>();//当前专业数据
        for (ProfessionalDot profes:statisticals) {
            if (profes.getSpeciality().equals(speciality)){
                resourcesDtos = profes.getResourcesDtosn();
            }
        }

        List<Integer> allsums=new ArrayList<>();
        for (ResourcesDto res:resourcesDtos) {
            for (ResourcesDetailsDto resouces:res.getNums()) {
                allsums.add(Integer.valueOf(resouces.getNum()));
            }
            allsums.add(Integer.valueOf(res.getAllValue()));
        }
        alldata.put("总计",allsums);
        ExcelDownData excelDownData = new ExcelDownData();
        if (strings.size()==0){
            excelDownData=null;
        }else {
            excelDownData.setSpeciality(speciality);
            excelDownData.setAlldata(alldata);
            excelDownData.setOnenum(onenum);
            excelDownData.setStrings(strings);
            excelDownData.setStringss(stringss);
        }

        return excelDownData;
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

    private StatisticsAllData statisticsAll(){
        List<ProfessionalDot> statisticals = statisticalss();
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
