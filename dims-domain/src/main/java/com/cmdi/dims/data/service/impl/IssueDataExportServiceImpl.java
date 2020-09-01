package com.cmdi.dims.data.service.impl;

import cn.hutool.core.util.ZipUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;
import com.cmdi.dims.data.entity.DataColumn;
import com.cmdi.dims.data.repository.DataColumnRepository;
import com.cmdi.dims.data.repository.IssueDataExportDAO;
import com.cmdi.dims.data.service.IssueDataExportService;
import com.cmdi.dims.task.entity.AreaCodeConfig;
import com.cmdi.dims.task.entity.TaskLatest;
import com.cmdi.dims.task.repository.AreaCodeConfigRepository;
import com.cmdi.dims.task.repository.TaskLatestRepository;

import java.io.*;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

@Slf4j
@Service
public class IssueDataExportServiceImpl implements IssueDataExportService {


    @Autowired
    TaskLatestRepository taskLatestRepository;

    @Autowired
    DataColumnRepository dataColumnRepository;
    @Autowired
    IssueDataExportDAO issueDataExportDAO;
    @Autowired
    AreaCodeConfigRepository areaCodeConfigRepository;

    @Override
    public String batchExport(String province, String speciality, String regionCode, String[] ruleCodes) throws Exception {


        AreaCodeConfig areaCodeConfig = areaCodeConfigRepository.findByCode(regionCode);
        Assert.notNull(areaCodeConfig, "没有找到该区域");
        int regionType = areaCodeConfig.getRegionType();
        String areaLevel = null;
        switch (regionType) {
            case 1:
                areaLevel = "province_code";
                break;
            case 2:
                areaLevel = "prefecture_code";
                break;
            case 3:
                areaLevel = "county_code";
                break;
        }
        String queryTableNameSql = " SELECT\n" +
                "    i.table_name" +
                "    FROM " +
                "    dims_data_index i\n" +
                "    LEFT JOIN dims_data_storage s ON i.task_code = s.task_code \n" +
                "    AND i.speciality_name = s.speciality_name \n" +
                "    AND i.TABLE_NAME = s.TABLE_NAME \n" +
                "    AND i.data_key = s.data_key \n" +
                "    WHERE\n" +
                "    i.index_code = " + "'%s'" +
                "    AND i." + "%s=" + "'%s'" +
                "    ORDER BY " +
                "    s.ID limit 1 ";

        String queryDataSql = " SELECT\n" +
                "    s.DATA \n" +
                "    FROM\n" +
                "    \tdims_data_index i\n" +
                "    \tLEFT JOIN dims_data_storage s ON i.task_code = s.task_code \n" +
                "    \tAND i.speciality_name = s.speciality_name \n" +
                "    \tAND i.TABLE_NAME = s.TABLE_NAME \n" +
                "    \tAND i.data_key = s.data_key \n" +
                "    WHERE\n" +
                "    i.index_code = " + "'%s'" +
                "    AND i." + "%s=" + "'%s'" +
                "    ORDER BY " +
                "    s.ID ";
        //获取核查任务编码
        List<TaskLatest> taskLatest = taskLatestRepository.findByProvinceAndSpecialityName(province, speciality);
        Assert.notEmpty(taskLatest, "无该专业核查结果");
        String taskCode = taskLatest.get(0).getTaskCode();

        //创建错误文件临时目录
        String uuid = UUID.randomUUID().toString().replace("-", "");
        String projectPath = System.getProperty("user.dir");
        File f = new File(projectPath + "//temp//" + uuid);
        if (!f.exists()) {
            f.mkdirs(); //创建目录
        }
        for (int i = 0; i < ruleCodes.length; i++) {
            //查询表名
            String execQueryTableNameSql = String.format(queryTableNameSql, ruleCodes[i], areaLevel, regionCode);
            List<String> tableNames = issueDataExportDAO.queryTableName(execQueryTableNameSql);
            if(tableNames.size()==0){
                log.info(ruleCodes+"没有相关错误数据...");
                continue;
            }
            String tableName=tableNames.get(0);
            //导出数据sql
            String execQueryDataSql = String.format(queryDataSql, ruleCodes[i], areaLevel, regionCode);
            List<String> errorData = issueDataExportDAO.batchExport(execQueryDataSql);
            //创建错误表的CSV
            File table = new File(f.getPath() + "//" + tableName + ".csv");
            table.createNewFile();
            FileOutputStream fileOutputStream = new FileOutputStream(table);
            //获取表头
            List<DataColumn> tableColumns = dataColumnRepository.findByTaskCodeAndSpecialityNameAndTableName(taskCode, speciality, tableName);
            String header = tableColumns.parallelStream().map(DataColumn::getColumns).collect(Collectors.joining("Ж"));
            fileOutputStream.write(header.getBytes());
            fileOutputStream.write("Ж违反规则编码Ж违反规则描述".getBytes());
            fileOutputStream.write("\n".getBytes());
            for (String s : errorData) {
                fileOutputStream.write(s.getBytes());
                fileOutputStream.write("\n".getBytes());
            }
            fileOutputStream.close();
        }
        //如果临时目录没有错误表数据，则路径返回为空
        if (f.listFiles().length==0){
            f.delete();
            return null;
        }
        String zipPath = f.getParent() + File.separator + regionCode+".zip";
        //压缩文件
        dozip(f.getPath(), zipPath);
        //删除临时错误文件
        File[] list = f.listFiles();
        for (File t : list) {
            t.delete();
        }
        //删除临时目录
        f.delete();
        return zipPath;
    }

    /**
     * 地市区县的导出
     * @param
     * @param province
     * @param speciality
     * @param regionCode
     * @param regionField
     * @return
     */
    @Override
    public String export(String province, String speciality, String regionCode, String regionField, String taskCode) throws Exception {

        String queryTableSql="select table_name from dims_data_storage where %s = '%s' and  task_code = '%s' group by table_name";
        String execQueryTableNameSql=String.format(queryTableSql,regionField,regionCode,taskCode);
        List<String> tableNames = issueDataExportDAO.queryTableName(execQueryTableNameSql);
        Assert.notNull(tableNames,"该地市或区县没有错误数据");

        //创建错误文件临时目录
        String uuid = UUID.randomUUID().toString().replace("-", "");
        String projectPath = System.getProperty("user.dir");
        File f = new File(projectPath + "//temp//" + uuid);
        if (!f.exists()) {
            f.mkdirs(); //创建目录
        }
        //导出错误数据的sql
        String exportDataSql="select data from dims_data_storage where %s = '%s' and  task_code = '%s' and table_name='%s'";

        for(int i=0;i<tableNames.size();i++){
            String tableName=tableNames.get(i);
            //查询表头
            List<DataColumn> tableColumns = dataColumnRepository.findByTaskCodeAndSpecialityNameAndTableName(taskCode, speciality, tableName);
            String header =tableColumns.get(0).getColumns();
            //导出错误数据的sql
            String execExportDataSql=String.format(exportDataSql,regionField,regionCode,taskCode,tableName);
            List<String> errorData=issueDataExportDAO.batchExport(execExportDataSql);
            //创建错误表的CSV
            File table = new File(f.getPath() + "//" + tableName + ".csv");
            table.createNewFile();
            FileOutputStream fileOutputStream = new FileOutputStream(table);

            fileOutputStream.write(header.getBytes());
            fileOutputStream.write("Ж违反规则编码Ж违反规则描述".getBytes());
            fileOutputStream.write("\n".getBytes());
            for (String s : errorData) {
                fileOutputStream.write(s.getBytes());
                fileOutputStream.write("\n".getBytes());
            }
            fileOutputStream.close();
        }

        //如果临时目录没有错误表数据，则路径返回为空
        if (f.listFiles().length==0){
            f.delete();
            return null;
        }
        String zipPath = f.getParent() + File.separator + regionCode+".zip";
        log.info("开始压缩");
        //压缩文件
        dozip(f.getPath(), zipPath);
        log.info("结束压缩");
        //删除临时错误文件
        File[] list = f.listFiles();
        for (File t : list) {
            t.delete();
        }
        //删除临时目录
        f.delete();
        return zipPath;
    }


    //压缩文件夹下的文件
    private void dozip(String srcPath, String zipPath) throws Exception {
        ZipUtil.zip(srcPath,zipPath);

//        File dir = new File(srcPath);
//        File zipfile = new File(zipPath);
//        //文件输入流
//        InputStream input = null;
//        //声明压缩对象
//        ZipOutputStream zipOut = null;
//        zipOut = new ZipOutputStream(new FileOutputStream(zipfile));
//        //注释
////        zipOut.setComment("11111");
//        int temp = 0;
//        if (dir.isDirectory()) {
//            File lists[] = dir.listFiles();
//            for (int i = 0; i < lists.length; i++) {
//                input = new FileInputStream(lists[i]);
//                zipOut.putNextEntry(new ZipEntry(lists[i].getName()));
//                while ((temp = input.read()) != -1) {
//                    zipOut.write(temp);
//                }
//                input.close();
//            }
//        }
//        zipOut.close();

    }


}
