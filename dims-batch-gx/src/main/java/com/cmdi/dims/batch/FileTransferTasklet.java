package com.cmdi.dims.batch;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.cmdi.dims.infrastructure.util.DefaultFtpSessionFactory;
import com.cmdi.dims.infrastructure.util.FtpSession;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.ArrayUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.net.ftp.FTPFile;
import org.joda.time.DateTime;
import org.springframework.util.Assert;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import com.cmdi.dims.domain.MetaService;
import com.cmdi.dims.sdk.model.FileLocationDto;
import com.cmdi.dims.sdk.model.TaskConfigDto;
import com.cmdi.dims.sdk.model.TaskItemFileDto;

@Slf4j
public class FileTransferTasklet extends AbstractDimsTasklet {

    @Setter
    private MetaService metaService;

    @Override
    public void process(String taskCode, String province, String speciality) throws Exception {
        TaskConfigDto config = metaService.loadConfig(province, speciality);

        File localTaskFolder = BatchUtil.getTaskFolder(taskCode, true);
        Map<String, List<TaskItemFileDto>> result = new HashMap<>();

        for (FileLocationDto location : config.getLocations()) {
            List<TaskItemFileDto> resultOfLocation = result.computeIfAbsent(location.getSpecialityName(), k -> new ArrayList<>());
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
                        populateTaskItemFile(config, location, taskCode, lastCollectionDate.toDate(), localTaskFolder, session, taskFolder, 1, resultOfLocation);
                        break;
                    }
                    lastCollectionDate = lastCollectionDate.minusDays(1);
                }
            }
        }
        for (Map.Entry<String, List<TaskItemFileDto>> entry : result.entrySet()) {
            Assert.notEmpty(entry.getValue(), "对应专业【" + entry.getKey() + "】没有找到匹配文件");
        }
    }

    private static final int MAX_LEVEL = 3;

    private void populateTaskItemFile(TaskConfigDto config, FileLocationDto location, String taskCode, Date collectionDate, File localTaskFolder,
                                      FtpSession session,
                                      String folder,
                                      int level,
                                      List<TaskItemFileDto> result) throws IOException {
        FTPFile[] files = session.list(folder);
        if (ArrayUtils.isNotEmpty(files)) {
            for (FTPFile file : files) {
                if (file.isFile()) {
                    String baseName = FilenameUtils.getBaseName(file.getName());
                    String fileName = FilenameUtils.getName(file.getName());
                    if (config.getTables().containsKey(baseName.toUpperCase())) {
                        TaskItemFileDto taskItemFile = new TaskItemFileDto();
                        taskItemFile.setDestTable(baseName.toUpperCase());
                        taskItemFile.setName(fileName);
                        taskItemFile.setCode(folder + "/" + file.getName());
                        taskItemFile.setTaskCode(taskCode);
                        taskItemFile.setCollectionDate(collectionDate);
                        taskItemFile.setProvince(config.getProvince());
                        taskItemFile.setFileEncoding(location.getFileEncoding());
                        taskItemFile.setFileDelimiter(location.getFileDelimiter());
                        taskItemFile.setMemo(assembleUrl(location, taskItemFile.getCode()));
                        downloadFileFromFtp(session, localTaskFolder, taskItemFile);
                        result.add(taskItemFile);
                    } else {
                        log.warn(file + " no mapping entity type!!!");
                    }
                } else if (file.isDirectory() && level <= MAX_LEVEL) {
                    populateTaskItemFile(config, location, taskCode, collectionDate, localTaskFolder, session, folder + "/" + file.getName(), level + 1, result);
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

            Files.move(itemFile, destPath);

            Path csvFile = null;
            String extension = FilenameUtils.getExtension(taskItemFile.getName());
            if ("zip".equalsIgnoreCase(extension)) {
                BatchUtil.extractCsv(destPath);
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
