package com.cmdi.dims.batch;

import com.cmdi.dims.domain.DataService;
import com.cmdi.dims.domain.ConfigService;
import com.cmdi.dims.domain.meta.dto.AttributeType;
import com.cmdi.dims.domain.meta.dto.Metadata;
import com.cmdi.dims.infrastructure.util.DefaultFtpSessionFactory;
import com.cmdi.dims.infrastructure.util.FtpSession;
import com.cmdi.dims.sdk.model.FileLocationDto;
import com.cmdi.dims.sdk.model.TaskConfigDto;
import com.cmdi.dims.sdk.model.TaskItemBusinessDto;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.compress.archivers.zip.Zip64Mode;
import org.apache.commons.compress.archivers.zip.ZipArchiveEntry;
import org.apache.commons.compress.archivers.zip.ZipArchiveOutputStream;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.io.IOUtils;
import org.joda.time.DateTime;
import org.springframework.util.Assert;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Objects;

@Slf4j
public class FileUploadTasklet extends AbstractDimsTasklet {

    private static final int PAGE_SIZE = 20000;

    @Setter
    private DataService dataService;
    @Setter
    private ConfigService configService;

    @Override
    public void process(String taskCode, String province, String speciality) throws Exception {
        List<TaskItemBusinessDto> taskItemBusinesses = taskService.findTaskItemBusinessesByTaskCode(taskCode);
        if (CollectionUtils.isNotEmpty(taskItemBusinesses)) {
            TaskConfigDto taskConfig = configService.loadConfig(province, speciality);
            FileLocationDto location = getFileLocationDto(taskConfig);
            File localTaskFolder = BatchUtil.getTaskFolder(taskCode, false);
            File resultDir = new File(localTaskFolder, "result");
            FileUtils.forceMkdir(resultDir);
            DateTime datetime = new DateTime().withMillisOfDay(0);
            String date = datetime.toString("yyyyMMdd");
            List<File> zips = new ArrayList();
            for (TaskItemBusinessDto taskItemBusinessDto : taskItemBusinesses) {
                Metadata metadata = dataService.loadMetadata(taskItemBusinessDto.getCode());
                if (Objects.equals(metadata.getEntityType().getSpecialityName(), speciality)) {
                    long count = dataService.countErrorData(metadata);
                    if (count > 0) {
                        try {
                            File csvFile = exportDataToCsv(metadata, location, resultDir, count);
                            File zipFile = compressCsvFileToZip(csvFile);
                            log.info("实体对象【" + taskItemBusinessDto.getName() + "】错误数据压缩成功，原始CSV大小" + FileUtils.sizeOf(csvFile) + "压缩后ZIP大小" + FileUtils.sizeOf(zipFile));
//                            uploadZipFileToFtp(zipFile, location, date);
//                            log.info("实体对象【" + taskItemBusinessDto.getName() + "】错误数据上传成功");
                            zips.add(zipFile);
                        } catch (Exception e) {
                            log.error("实体对象【" + taskItemBusinessDto.getName() + "】错误数据压缩失败：" + e.getMessage());
                            throw e;
                        }
                    } else {
                        log.warn("实体对象【" + taskItemBusinessDto.getName() + "】没有错误数据，将不会生成错误文件");
                    }

                } else {
                    log.warn("实体对象【" + taskItemBusinessDto.getName() + "】不是核查的专业对象，将不会生成错误文件");
                }
            }
            try {
                File result = compressZips(localTaskFolder, date + "_RESULT.zip", zips);
                uploadZipFileToFtp(result, location);
            } catch (Exception e) {
                log.error("错误数据上传失败：" + e.getMessage(), e);
            }
        }
    }

    private void uploadZipFileToFtp(File zipFile, FileLocationDto location) throws IOException {
        DefaultFtpSessionFactory factory = BatchUtil.createSessionFactory(location);
        try (FtpSession session = factory.getSession();
             InputStream inputStream = Files.newInputStream(zipFile.toPath())
        ) {
            Assert.state(session.exists(location.getPath()), "没有找到FTP配置的目录:" + location.getPath());
            String zipFileName = FilenameUtils.getName(zipFile.getName());
            boolean remoteExists = session.exists(location.getPath() + "/" + zipFileName);
            if (remoteExists) {
                session.remove(location.getPath() + "/" + zipFileName);
            }
            session.write(inputStream, location.getPath() + "/" + zipFileName);
        }
    }

    private File exportDataToCsv(Metadata metadata, FileLocationDto location, File resultDir, long count) throws IOException {
        File targetResultFile = new File(resultDir, "RESULT-" + metadata.getEntityType().getCode() + ".csv");
        if (targetResultFile.exists()) {
            FileUtils.forceDelete(targetResultFile);
        }
        long total = 0;
        try (OutputStream os = Files.newOutputStream(targetResultFile.toPath())) {
            Charset encoding = BatchUtil.encodingOf(location.getFileEncoding());
            os.write(buildHeader(metadata, location).getBytes(encoding));
            os.flush();
            for (int offset = 0; offset <= count; offset += PAGE_SIZE) {
                List<Map<String, Object>> result = dataService.exportData(metadata, PAGE_SIZE, offset);
                if (CollectionUtils.isNotEmpty(result)) {
                    int i = 0;
                    for (Map<String, Object> data : result) {
                        i++;
                        String row = buildData(metadata, location, data);
                        try {
                            os.write(row.getBytes(encoding));
                        } catch (Exception e) {
                            log.error("row index:" + i + " row:" + row);
                            throw e;
                        }

                    }
                    total += result.size();
                }
                os.flush();
            }
            os.flush();
        }
        if (total != count) {
            log.warn("实体对象【" + metadata.getEntityType().getName() + "】错误数据CSV生成完成，实际" + count + "条，导出" + total + "条");
        } else {
            log.info("实体对象【" + metadata.getEntityType().getName() + "】错误数据CSV生成完成，总共" + count + "条");
        }
        return targetResultFile;
    }

    private File compressZips(File localTaskFolder, String resultFile, List<File> zips) throws IOException {
        File zipFile = new File(localTaskFolder, resultFile);
        if (zipFile.exists()) {
            FileUtils.forceDelete(zipFile);
        }
        try (OutputStream outputStream = Files.newOutputStream(zipFile.toPath());
             ZipArchiveOutputStream zipOs = new ZipArchiveOutputStream(outputStream);
        ) {
            zipOs.setUseZip64(Zip64Mode.Always);
            for (File zip : zips) {
                try (InputStream inputStream = Files.newInputStream(zip.toPath())) {
                    zipOs.putArchiveEntry(new ZipArchiveEntry(FilenameUtils.getName(zip.getName())));
                    IOUtils.copy(inputStream, zipOs);
                    zipOs.closeArchiveEntry();
                }
            }
            zipOs.finish();
        }
        return zipFile;
    }

    private File compressCsvFileToZip(File csvFile) throws IOException {
        String zipName = FilenameUtils.getBaseName(csvFile.getName()) + ".zip";
        File zipFile = new File(csvFile.getParent(), zipName);
        if (zipFile.exists()) {
            FileUtils.forceDelete(zipFile);
        }
        try (OutputStream outputStream = Files.newOutputStream(zipFile.toPath());
             ZipArchiveOutputStream zipOs = new ZipArchiveOutputStream(outputStream);
             InputStream inputStream = Files.newInputStream(csvFile.toPath())
        ) {
            zipOs.setUseZip64(Zip64Mode.Always);
            zipOs.putArchiveEntry(new ZipArchiveEntry(FilenameUtils.getName(csvFile.getName())));
            IOUtils.copy(inputStream, zipOs);
            zipOs.closeArchiveEntry();
            zipOs.finish();
        }
        return zipFile;
    }

    private String buildHeader(Metadata metadata, FileLocationDto location) {
        char delimiter = BatchUtil.safeDelimiter(location.getFileDelimiter());
        StringBuilder builder = new StringBuilder();
        for (AttributeType attributeType : metadata.getAttributeTypes()) {
            builder.append(attributeType.getColumnName());
            builder.append(delimiter);
        }
        builder.append("DIMS_COL_RESULT").append(delimiter).append("DIMS_COL_RTNAME").append('\n');
        return builder.toString();
    }

    private String buildData(Metadata metadata, FileLocationDto location, Map<String, Object> data) {
        char delimiter = BatchUtil.safeDelimiter(location.getFileDelimiter());
        StringBuilder builder = new StringBuilder();
        for (AttributeType attributeType : metadata.getAttributeTypes()) {
            Object value = data.get(attributeType.getColumnName());
            builder.append(null != value ? String.valueOf(value) : "");
            builder.append(delimiter);
        }
        Object result = data.get("DIMS_COL_RESULT");
        Object rtname = data.get("DIMS_COL_RTNAME");
        builder.append(null != result ? String.valueOf(result) : "").append(delimiter).append(null != rtname ? String.valueOf(rtname) : "").append('\n');
        return builder.toString();
    }

    private FileLocationDto getFileLocationDto(TaskConfigDto taskConfig) {
        return taskConfig.getLocations().stream()
                .filter(l -> Objects.equals(l.getSpecialityName(), taskConfig.getSpeciality()))
                .findFirst()
                .orElseThrow(() -> new IllegalArgumentException("任务配置错误，当前专业不在包含专业内"));
    }
}
