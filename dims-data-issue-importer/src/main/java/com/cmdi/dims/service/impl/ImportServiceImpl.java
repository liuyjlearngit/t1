package com.cmdi.dims.service.impl;

import com.cmdi.dims.infrastructure.util.DefaultFtpSessionFactory;
import com.cmdi.dims.infrastructure.util.FtpSession;
import com.cmdi.dims.service.DataService;
import com.cmdi.dims.service.ImportService;
import com.cmdi.dims.service.vo.FileLocationVo;
import com.cmdi.dims.service.vo.TaskVo;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.ArrayUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.integration.sftp.session.DefaultSftpSessionFactory;
import org.springframework.integration.sftp.session.SftpSession;
import org.springframework.stereotype.Component;
import org.springframework.util.Assert;

import java.io.BufferedReader;
import java.io.File;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.*;
import java.util.stream.Collectors;

@Slf4j
@Component
public class ImportServiceImpl implements ImportService {

    private static final int BATCH_SIZE = 2000;

    @Autowired
    private DataService dataService;

    @Override
    public void downloadFileFromFtp(String province, String speciality) throws Exception {
        TaskVo task = dataService.getTask(province, speciality);
        Assert.notNull(task, "没有找到最新的成功的核查任务");
        try {
            doDownloadFileFromFtp(province, speciality, task);
        } finally {
            FileUtils.forceDelete(BatchUtil.getTaskFolder(task.getTaskCode()));
        }
    }

    public void doDownloadFileFromFtp(String province, String speciality, TaskVo task) throws Exception {


        String taskCode = task.getTaskCode();
        File localFolder = BatchUtil.getTaskFolder(taskCode, true);
        //Date collectionDate = task.getCollectionDate();
        log.info("开始清理数据...");
        dataService.cleanColumns(taskCode);
        dataService.cleanStorage(taskCode);

        log.info("下载文件...");
       // String resultZipName = new DateTime(collectionDate).toString("yyyyMMdd") + "_RESULT.zip";
        String resultZipName = taskCode + "_RESULT.zip";
        List<FileLocationVo> locations = dataService.getFileLocation(province, speciality);
        Assert.notEmpty(locations, "没有找到任务对应的FTP");
        FileLocationVo location = null;
        for (FileLocationVo curLocation : locations) {
            if(StringUtils.equalsIgnoreCase(curLocation.getSchema(),"sftp")){
                DefaultSftpSessionFactory factory = BatchUtil.createSFTPSessionFactory(curLocation);
                try (SftpSession session = factory.getSession()) {
                    String resultFtpFilePath = curLocation.getPath() + "/" + resultZipName;
                    if (session.exists(resultFtpFilePath)) {
                        Path resultZip = Paths.get(localFolder.getAbsolutePath(), resultZipName);
                        if (Files.exists(resultZip)) {
                            FileUtils.forceDelete(resultZip.toFile());
                        }
                        BatchUtil.transferSFTP(session, resultFtpFilePath, resultZip);
                        BatchUtil.extractCsv(resultZip);
                        location = curLocation;
                        break;
                    }
                }
            } else{
                DefaultFtpSessionFactory factory = BatchUtil.createSessionFactory(curLocation);
                try (FtpSession session = factory.getSession()) {
                    String resultFtpFilePath = curLocation.getPath() + "/" + resultZipName;
                    if (session.exists(resultFtpFilePath)) {
                        Path resultZip = Paths.get(localFolder.getAbsolutePath(), resultZipName);
                        if (Files.exists(resultZip)) {
                            FileUtils.forceDelete(resultZip.toFile());
                        }
                        BatchUtil.transfer(session, resultFtpFilePath, resultZip);
                        BatchUtil.extractCsv(resultZip);
                        location = curLocation;
                        break;
                    }
                }
            }
        }
        Assert.notNull(location, "没有找到核查结果文件");

        log.info("开始解压文件...");
        Collection<File> zips = FileUtils.listFiles(localFolder, new String[]{"zip"}, false);
        zips = zips.stream().filter(z -> FilenameUtils.getBaseName(z.getName()).startsWith("RESULT-")).collect(Collectors.toList());
        if (CollectionUtils.isNotEmpty(zips)) {
            for (File zip : zips) {
                BatchUtil.extractCsv(zip.toPath());
            }
        }
        log.info("开始导入文件...");
        Collection<File> csvs = FileUtils.listFiles(localFolder, new String[]{"csv"}, false);
        csvs = csvs.stream().filter(c -> FilenameUtils.getBaseName(c.getName()).startsWith("RESULT-")).collect(Collectors.toList());
        if (CollectionUtils.isNotEmpty(csvs)) {
            Map<String, String> indexNames = dataService.getIndexName(speciality);
            for (File csv : csvs) {
                log.info("开始导入文件：" + FilenameUtils.getName(csv.getName()));
                try (InputStream is = Files.newInputStream(csv.toPath());
                     InputStreamReader isr = new InputStreamReader(is, BatchUtil.encodingOf(location.getFileEncoding()));
                     BufferedReader reader = new BufferedReader(isr)
                ) {
                    char delimiter = BatchUtil.safeDelimiter(location.getFileDelimiter());
                    String header = reader.readLine();
                    Assert.hasLength(header, "header not found");

                    String tableName = FilenameUtils.getBaseName(csv.getName()).substring(7).toUpperCase();

                    Map<String, Integer> upperHeaderMap = BatchUtil.headerMapOf(header, delimiter);
                    Assert.notNull(upperHeaderMap.get("DIMS_COL_RESULT"), "文件格式有误，没有结果列");
                    int columnSize = upperHeaderMap.size();
                    String[] allColumnTitles = StringUtils.splitPreserveAllTokens(header, delimiter);
                    String[] busiColumnTitles = ArrayUtils.subarray(allColumnTitles, 0, allColumnTitles.length );

                    dataService.saveColumn(taskCode, speciality, tableName, StringUtils.join(busiColumnTitles, delimiter));

                    List<String[]> parameters = new ArrayList<>(BATCH_SIZE);
                    String dataLine;
                    long totalRecord = 0L;
                    int idx;
                    String[] parameter;
                    String preDateLine = null;
                    while (null != (dataLine = reader.readLine())) {
                        totalRecord++;
                        dataLine = dataLine.replaceAll("\u0000", "");
                        String currentDateLine = dataLine;
                        if (null != preDateLine) {
                            currentDateLine = preDateLine + dataLine;
                        }
                        if (StringUtils.isEmpty(currentDateLine)) {
                            continue;
                        }
                        String[] columns = StringUtils.splitPreserveAllTokens(currentDateLine, delimiter);
                        parameter = null;
                        if (ArrayUtils.isNotEmpty(columns)) {
                            int currentSize = columns.length;
                            if (currentSize < columnSize) {
                                if (currentSize == 1) {
                                    preDateLine = null;
                                    log.warn("文件" + csv.getName() + "第" + totalRecord + "行可能是上一行的结尾，当前已经无法正确合并，即将丢弃");
                                    continue;
                                }
                                preDateLine = currentDateLine;
                                log.warn("文件" + csv.getName() + "第" + totalRecord + "行可能字段包含换行符，准备与下一行合并计算");
                                continue;
                            } else if (currentSize == columnSize) {
                                parameter = ArrayUtils.clone(columns);
                            } else if (currentSize > columnSize) {
                                if (null == preDateLine) {
                                    log.warn("文件" + csv.getName() + "第" + totalRecord + "行可能包含多余的分割符");
                                    parameter = ArrayUtils.clone(columns);
                                } else {
                                    log.warn("文件" + csv.getName() + "第" + totalRecord + "行与上一行合并失败，分开两行计算");
                                    String[] preLineColumns = StringUtils.splitPreserveAllTokens(preDateLine, delimiter);
                                    parameter = ArrayUtils.clone(preLineColumns);
                                    parameters.add(parameter);
                                    parameter = null;

                                    String[] currentLineColumns = StringUtils.splitPreserveAllTokens(dataLine, delimiter);
                                    if (ArrayUtils.isNotEmpty(currentLineColumns)) {
                                        int currentLineSize = currentLineColumns.length;
                                        if (currentLineSize < columnSize) {
                                            preDateLine = dataLine;
                                            log.warn("文件" + csv.getName() + "第" + totalRecord + "行可能字段包含换行符，准备与下一行合并计算");
                                            continue;
                                        } else if (currentLineSize == columnSize) {
                                            parameter = ArrayUtils.clone(currentLineColumns);
                                        } else if (currentLineSize > columnSize) {
                                            log.warn("文件" + csv.getName() + "第" + totalRecord + "行可能包含多余的分割符");
                                            parameter = ArrayUtils.clone(currentLineColumns);
                                        }
                                    }
                                }

                            }

                        } else {
                            log.warn("文件" + csv.getName() + "第" + totalRecord + "行是个空行！");
                        }
                        preDateLine = null;

                        parameters.add(parameter);
                        if (parameters.size() >= BATCH_SIZE) {
                            saveStorage(province, speciality, tableName, taskCode, indexNames, upperHeaderMap, parameters, delimiter, columnSize);
                            parameters.clear();
                        }
                    }
                    if (parameters.size() > 0) {
                        saveStorage(province, speciality, tableName, taskCode, indexNames, upperHeaderMap, parameters, delimiter, columnSize);
                        parameters.clear();
                    }
                }
            }
        }
        //log.info("清除历史冗余文件......");


    }

    private void saveStorage(String province, String speciality, String tableName, String taskCode, Map<String, String> indexNames, Map<String, Integer> upperHeaderMap, List<String[]> parameters, char delimiter, int columnSize) {
        Integer headerIdx = upperHeaderMap.get("DIMS_COL_RESULT");
        //Integer prefectureIdx = upperHeaderMap.get("PREFECTURE_CODE");
        //Integer countyIdx = upperHeaderMap.get("COUNTY_CODE");
        Integer prefectureIdx = null!=upperHeaderMap.get("CITY_ID")?upperHeaderMap.get("CITY_ID"):upperHeaderMap.get("CITY");
        Integer countyIdx = null!=upperHeaderMap.get("COUNTY_ID")?upperHeaderMap.get("COUNTY_ID"):upperHeaderMap.get("COUNTY");
        List<Map<String, Object>> storages = new ArrayList<>();
        List<Map<String, Object>> indices = new ArrayList<>();
        for (String[] cur : parameters) {
            if (cur.length <= headerIdx) {
                log.error("行格式错误，将忽略此行：" + StringUtils.join(cur, delimiter));
            } else {
                String colResult = cur[headerIdx];
                String[] codes = StringUtils.split(colResult, ",");
                if (ArrayUtils.isEmpty(codes)) {
                    log.info("here1");
                    continue;
                }
                String data = StringUtils.join(cur, delimiter);
                String dataKey = BatchUtil.sha1(data);
                String prefecture = null != prefectureIdx ? cur[prefectureIdx] : null;
                String county = null != countyIdx ? cur[countyIdx] : null;
                List<Map<String, Object>> curIndices = new ArrayList<>();
                for (String code : codes) {
                    if (null != indexNames.get(code)) {
                        Map<String, Object> curIndex = new HashMap<>();
                        curIndex.put("indexCode", code);
                        curIndex.put("indexName", indexNames.get(code));
                        curIndex.put("province", province);
                        curIndex.put("prefecture", prefecture);
                        curIndex.put("county", county);
                        curIndex.put("speciality", speciality);
                        curIndex.put("table", tableName);
                        curIndex.put("taskCode", taskCode);
                        curIndex.put("dataKey", dataKey);
                        curIndices.add(curIndex);
                    } else {
                        log.info(code + prefecture + province);
                    }
                }
                if (CollectionUtils.isNotEmpty(curIndices)) {
                    indices.addAll(curIndices);
                    Map<String, Object> storage = new HashMap<>();
                    storage.put("taskCode", taskCode);
                    storage.put("dataKey", dataKey);
                    storage.put("data", data);
                    storage.put("speciality", speciality);
                    storage.put("table", tableName);
                    storage.put("province", province);
                    storage.put("prefecture", prefecture);
                    storage.put("county", county);
                    storages.add(storage);
                }
            }
        }
        dataService.saveStorage(indices, storages);
        log.info("文件入库成功, 数据" + parameters.size() + "行，实际入库存储" + storages.size() + "行，索引" + indices.size() + "行");
    }
}
