package com.cmdi.dims.batch;

import com.cmdi.dims.domain.ConfigService;
import com.cmdi.dims.domain.DataService;
import com.cmdi.dims.infrastructure.util.DefaultFtpSessionFactory;
import com.cmdi.dims.infrastructure.util.FtpSession;
import com.cmdi.dims.sdk.model.FileLocationDto;
import com.cmdi.dims.sdk.model.TaskConfigDto;
import com.cmdi.dims.sdk.model.TaskItemFileDto;
import com.google.common.collect.Lists;
import com.jcraft.jsch.ChannelSftp;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.ArrayUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.net.ftp.FTPFile;
import org.joda.time.DateTime;
import org.springframework.integration.sftp.session.DefaultSftpSessionFactory;
import org.springframework.integration.sftp.session.SftpSession;
import org.springframework.util.Assert;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.*;

@Slf4j
public class FileTransferTasklet extends AbstractDimsTasklet {

    @Setter
    private ConfigService configService;
    @Setter
    private DataService dataService;
    public static final String regex1= "-R";
    public static final String regex2 = ".*[0-9].*";
    public static final String specialTableName = "BOARD,PORT,CE_DEVICE_GF";
    //TODO process中的三个参数怎么传进来
    @Override
    public void process(String taskCode, String province, String speciality) throws Exception {
        /**
         * 加载配置
         */
        TaskConfigDto config = configService.loadConfig(province, speciality);
        String[] specialities = StringUtils.split(config.getIncludeSpecialities(), ",");
        List<String> specialityList = ArrayUtils.isNotEmpty(specialities) ? Lists.newArrayList(specialities) : Lists.newArrayList(config.getSpeciality());
        Map<String, String> specialityTables = dataService.loadTables(specialityList,speciality);
        //taskcode由tasklister产生并存入上下文，并且生成核查任务临时目录
        File localTaskFolder = BatchUtil.getTaskFolder(taskCode, true);
        Map<String, List<TaskItemFileDto>> result = new HashMap<>();
        //加载任务配置中所有FTP配置中的路径
        for (FileLocationDto location : config.getLocations()) {
            List<TaskItemFileDto> resultOfLocation = result.computeIfAbsent(location.getSpecialityName(), k -> new ArrayList<>());
            if(StringUtils.equalsIgnoreCase(location.getSchema(),"sftp")){
                DefaultSftpSessionFactory sftpFactory = BatchUtil.createSFTPSessionFactory(location);
                try (SftpSession session = sftpFactory.getSession()) {
                    boolean exists = false;
                    String taskFolder = null;
                    DateTime lastCollectionDate = new DateTime().withMillisOfDay(0);
                    DateTime min = lastCollectionDate.minusDays(90);
                    while (lastCollectionDate.isAfter(min)) {
                        taskFolder = location.getPath() + "/" + lastCollectionDate.toString("yyyyMMdd");
                        exists = session.exists(taskFolder);
                        log.info("目录：" + taskFolder + ",是否存在：" + exists);
                        if (exists) {
                            populateTaskItemFile(config, specialityTables, location, taskCode, lastCollectionDate.toDate(), localTaskFolder, session, taskFolder, 1, resultOfLocation);
                            break;
                        }
                        lastCollectionDate = lastCollectionDate.minusDays(1);
                    }
                }
            } else{
                DefaultFtpSessionFactory factory = BatchUtil.createSessionFactory(location);
                try (FtpSession session = factory.getSession()) {
                    boolean exists = false;
                    String taskFolder = null;
                    DateTime lastCollectionDate = new DateTime().withMillisOfDay(0);
                    DateTime min = lastCollectionDate.minusDays(90);
                    while (lastCollectionDate.isAfter(min)) {
                        taskFolder = location.getPath() + "/" + lastCollectionDate.toString("yyyyMMdd");
                        exists = session.exists(taskFolder);
                        log.info("目录：" + taskFolder + ",是否存在：" + exists);
                        if (exists) {
                            populateTaskItemFile(config, specialityTables, location, taskCode, lastCollectionDate.toDate(), localTaskFolder, session, taskFolder, 1, resultOfLocation);
                            break;
                        }
                        lastCollectionDate = lastCollectionDate.minusDays(1);
                    }
                }
            }
        }
        for (Map.Entry<String, List<TaskItemFileDto>> entry : result.entrySet()) {
            Assert.notEmpty(entry.getValue(), "对应专业【" + entry.getKey() + "】没有找到匹配文件");
        }
    }
    //递归检测目录的层级数
    private static final int MAX_LEVEL = 3;

    private void populateTaskItemFile(TaskConfigDto config, Map<String, String> specialityTables, FileLocationDto location, String taskCode, Date collectionDate, File localTaskFolder,
                                       FtpSession session,
                                       String folder,
                                       int level,
                                       List<TaskItemFileDto> result) throws IOException {
        FTPFile[] files = session.list(folder);
        if (ArrayUtils.isNotEmpty(files)) {
            for (FTPFile file : files) {
                if (file.isFile()) {
                    String baseName = StringUtils.substringBefore(FilenameUtils.getBaseName(file.getName()),".");
                    String fileName = FilenameUtils.getName(file.getName());
                    if(StringUtils.containsIgnoreCase(baseName,regex1)){
                        //filer files which are retransmissions
                        log.info(fileName+"是错误文件，忽略...");
                        continue;
                    }else if(baseName.matches(regex2)){
                        //in case of split files
                        baseName = StringUtils.substringBefore(baseName,"-");
                    }
                    //table name mapping
                    String[] specialList = specialTableName.split(",");
                    String tableName = baseName;
                    for(String str:specialList){
                        if( StringUtils.equalsIgnoreCase(str,baseName)){
                            tableName = PinyinUtil.convert(location.getSpecialityName())+"_"+ baseName;
                            break;
                        }
                    }
                    if (specialityTables.containsKey(tableName.toUpperCase())) {
                        TaskItemFileDto taskItemFile = new TaskItemFileDto();
                        taskItemFile.setDestTable(tableName.toUpperCase());
                        taskItemFile.setName(fileName);
                        taskItemFile.setCode(folder + "/" + file.getName());
                        taskItemFile.setTaskCode(taskCode);
                        taskItemFile.setCollectionDate(collectionDate);
                        taskItemFile.setProvince(config.getProvince());
                        taskItemFile.setFileEncoding(location.getFileEncoding());
                        taskItemFile.setFileDelimiter(location.getFileDelimiter());
                        //assembleUrl方法组装FTPURL
                        taskItemFile.setMemo(assembleUrl(location, taskItemFile.getCode()));
                        //根据文件信息下载数据，并区分ZIP包和CSV数据，并保存下载的具体信息
                        downloadFileFromFtp(session, localTaskFolder, taskItemFile);
                        result.add(taskItemFile);
                    } else {
                        log.warn(file + " no mapping entity type!!!");
                    }
                } else if (file.isDirectory() && level <= MAX_LEVEL) {
                    populateTaskItemFile(config, specialityTables, location, taskCode, collectionDate, localTaskFolder, session, folder + "/" + file.getName(), level + 1, result);
                }
            }
        }
    }
    private void populateTaskItemFile(TaskConfigDto config, Map<String, String> specialityTables, FileLocationDto location, String taskCode, Date collectionDate, File localTaskFolder,
                                      SftpSession session,
                                      String folder,
                                      int level,
                                      List<TaskItemFileDto> result) throws IOException {
        ChannelSftp.LsEntry[] fileEntry = session.list(folder);
        if (ArrayUtils.isNotEmpty(fileEntry)) {
            for (ChannelSftp.LsEntry entry : fileEntry) {
                if(StringUtils.equalsIgnoreCase(entry.getFilename(),".")||StringUtils.equalsIgnoreCase(entry.getFilename(),"..")){
                    continue;
                }
                Boolean isDirectory = entry.getAttrs().isDir();
                if (!isDirectory) {
                    String baseName = StringUtils.substringBefore(FilenameUtils.getBaseName(entry.getFilename()),".");
                    String fileName = FilenameUtils.getName(entry.getFilename());
                    if(StringUtils.containsIgnoreCase(baseName,regex1)){
                        //filer files which are retransmissions
                        log.info(fileName+"是错误文件，忽略...");
                        continue;
                    }else if(baseName.matches(regex2)){
                        //in case of split files
                        baseName = StringUtils.substringBefore(baseName,"-");
                    }
                    //table name mapping
                    String[] specialList = specialTableName.split(",");
                    String tableName = baseName;
                    for(String str:specialList){
                        if( StringUtils.equalsIgnoreCase(str,baseName)){
                            tableName = PinyinUtil.convert(location.getSpecialityName())+"_"+ baseName;
                            break;
                        }
                    }

                    if (specialityTables.containsKey(tableName.toUpperCase())) {
                        TaskItemFileDto taskItemFile = new TaskItemFileDto();
                        taskItemFile.setDestTable(tableName.toUpperCase());
                        taskItemFile.setName(fileName);
                        taskItemFile.setCode(folder + "/" + entry.getFilename());
                        taskItemFile.setTaskCode(taskCode);
                        taskItemFile.setCollectionDate(collectionDate);
                        taskItemFile.setProvince(config.getProvince());
                        taskItemFile.setFileEncoding(location.getFileEncoding());
                        taskItemFile.setFileDelimiter(location.getFileDelimiter());
                        //assembleUrl方法组装FTPURL
                        taskItemFile.setMemo(assembleUrl(location, taskItemFile.getCode()));
                        //根据文件信息下载数据，并区分ZIP包和CSV数据，并保存下载的具体信息
                        downloadFileFromSFtp(session, localTaskFolder, taskItemFile);
                        result.add(taskItemFile);
                    } else {
                        log.warn(entry.getFilename() + " no mapping entity type!!!");
                    }
                } else if (isDirectory && level <= MAX_LEVEL) {
                    populateTaskItemFile(config, specialityTables, location, taskCode, collectionDate, localTaskFolder, session, folder + "/" + entry.getFilename(), level + 1, result);
                }
            }
        }
    }
    private String assembleUrl(FileLocationDto fileLocation, String path) {
        StringBuilder builder = new StringBuilder();
        builder.append(fileLocation.getSchema());
        builder.append("://");
        if (StringUtils.isNotEmpty(fileLocation.getUsername())) {
            builder.append(fileLocation.getUsername());
            if (StringUtils.isNotEmpty(fileLocation.getPassword())) {
                builder.append(":").append(fileLocation.getPassword());
            }
            builder.append("@");
        }
        builder.append(StringUtils.isNotEmpty(fileLocation.getHost()) ? fileLocation.getHost() : "localhost");
        if (null != fileLocation.getPort()) {
            builder.append(":").append(fileLocation.getPort());
        }
        if (StringUtils.isNotEmpty(path)) {
            builder.append(path);
        } else if (StringUtils.isNotEmpty(fileLocation.getPath())) {
            builder.append(fileLocation.getPath());
        } else {
            builder.append("/");
        }
        return builder.toString();
    }

    private void downloadFileFromFtp(FtpSession session, File taskFolder, TaskItemFileDto taskItemFile) {

        long start = System.currentTimeMillis();
        try {
            Path itemFile = Paths.get(taskFolder.getAbsolutePath(), taskItemFile.getName());
            if (Files.exists(itemFile)) {
                FileUtils.forceDelete(itemFile.toFile());
            }
            BatchUtil.transfer(session, taskItemFile.getCode(), itemFile);
            taskItemFile.setFileSize(Files.size(itemFile));

            taskItemFile.setSignature(BatchUtil.sha1(itemFile));

            Path signaturePath = Paths.get(taskFolder.getAbsolutePath(), taskItemFile.getSignature());
            if (!Files.exists(signaturePath)) {
                Files.createDirectory(signaturePath);
            }
            Path destPath = Paths.get(signaturePath.toFile().getAbsolutePath(), taskItemFile.getName());

            Files.move(itemFile, destPath, StandardCopyOption.REPLACE_EXISTING);

            Path csvFile = null;
            String extension = FilenameUtils.getExtension(taskItemFile.getName());
            if ("zip".equalsIgnoreCase(extension)) {
                //!!!unsupport split files
                BatchUtil.extractCsv(destPath);
                csvFile = BatchUtil.csvFile(destPath.getParent().toFile(), taskItemFile.getName());
            }  else if("gz".equalsIgnoreCase(extension)){
                BatchUtil.unGzipFile(destPath);
                csvFile = BatchUtil.csvFile(destPath.getParent().toFile(), taskItemFile.getName());
            } else if ("csv".equalsIgnoreCase(extension)) {
                csvFile = destPath;
            }
            if (null != csvFile) {
                taskItemFile.setCsvFile(csvFile.toFile().getName());
                taskItemFile.setCsvFileSize(Files.size(destPath));
                taskItemFile.setSuccess(true);
            } else {
                taskItemFile.setSuccess(false);
                taskItemFile.setFailureReason("文件名：" + taskItemFile.getName() + "解压后对应的CSV文件不存在！"
                + itemFile.getFileName().toString()+"解压失败,请确认是否为GZIP压缩文件！");
                log.warn("file " + taskItemFile.getName() + " extract without csv !!!");
            }
        } catch (Exception e) {
            taskItemFile.setSuccess(false);
            taskItemFile.setFailureReason(e.getMessage());
            log.error(e.getMessage(), e);
        } finally {
            long useTime = System.currentTimeMillis() - start;
            taskItemFile.setFileGettingCosts(useTime);
            taskItemFile.setFinishTime(new Date());
            taskService.saveTaskItemFile(taskItemFile);
        }
    }
    private void downloadFileFromSFtp(SftpSession session, File taskFolder, TaskItemFileDto taskItemFile) {

        long start = System.currentTimeMillis();
        try {
            Path itemFile = Paths.get(taskFolder.getAbsolutePath(), taskItemFile.getName());
            if (Files.exists(itemFile)) {
                FileUtils.forceDelete(itemFile.toFile());
            }
            BatchUtil.transferSFTP(session, taskItemFile.getCode(), itemFile);
            taskItemFile.setFileSize(Files.size(itemFile));

            taskItemFile.setSignature(BatchUtil.sha1(itemFile));

            Path signaturePath = Paths.get(taskFolder.getAbsolutePath(), taskItemFile.getSignature());
            if (!Files.exists(signaturePath)) {
                Files.createDirectory(signaturePath);
            }
            Path destPath = Paths.get(signaturePath.toFile().getAbsolutePath(), taskItemFile.getName());

            Files.move(itemFile, destPath, StandardCopyOption.REPLACE_EXISTING);

            Path csvFile = null;
            String extension = FilenameUtils.getExtension(taskItemFile.getName());
            if ("zip".equalsIgnoreCase(extension)) {
                //!!!unsupport split files
                BatchUtil.extractCsv(destPath);
                csvFile = BatchUtil.csvFile(destPath.getParent().toFile(), taskItemFile.getName());
            }  else if("gz".equalsIgnoreCase(extension)){
                BatchUtil.unGzipFile(destPath);
                csvFile = BatchUtil.csvFile(destPath.getParent().toFile(), taskItemFile.getName());
            } else if ("csv".equalsIgnoreCase(extension)) {
                csvFile = destPath;
            }
            if (null != csvFile) {
                taskItemFile.setCsvFile(csvFile.toFile().getName());
                taskItemFile.setCsvFileSize(Files.size(destPath));
                taskItemFile.setSuccess(true);
            } else {
                taskItemFile.setSuccess(false);
                taskItemFile.setFailureReason("文件名：" + taskItemFile.getName() + "解压后对应的CSV文件不存在！");
                log.warn("file " + taskItemFile.getName() + " extract without csv !!!");
            }
        } catch (Exception e) {
            taskItemFile.setSuccess(false);
            taskItemFile.setFailureReason(e.getMessage());
            log.error(e.getMessage(), e);
        } finally {
            long useTime = System.currentTimeMillis() - start;
            taskItemFile.setFileGettingCosts(useTime);
            taskItemFile.setFinishTime(new Date());
            taskService.saveTaskItemFile(taskItemFile);
        }
    }
}
