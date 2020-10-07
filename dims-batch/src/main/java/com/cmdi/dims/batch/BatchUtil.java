package com.cmdi.dims.batch;

import com.cmdi.dims.domain.meta.dto.AttributeType;
import com.cmdi.dims.domain.meta.dto.Metadata;
import com.cmdi.dims.infrastructure.util.DefaultFtpSessionFactory;
import com.cmdi.dims.infrastructure.util.FtpSession;
import com.cmdi.dims.sdk.model.FileLocationDto;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.compress.archivers.ArchiveEntry;
import org.apache.commons.compress.archivers.ArchiveException;
import org.apache.commons.compress.archivers.ArchiveInputStream;
import org.apache.commons.compress.archivers.ArchiveStreamFactory;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.io.filefilter.FalseFileFilter;
import org.apache.commons.io.filefilter.IOFileFilter;
import org.apache.commons.lang3.ArrayUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.batch.core.JobExecution;
import org.springframework.batch.core.scope.context.StepContext;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.zip.GZIPInputStream;

public class BatchUtil {

    public static final String PROVINCE = "PROVINCE";
    public static final String SPECIALITY = "SPECIALITY";
    public static final String LOCKED_AT = "LOCKED_AT";
    static final String TASK_CODE = "TASK_CODE";
    static final String SKIP = "SKIP";
    static final char DefaultDelimiter = '^';

    static String getProvince(JobExecution jobExecution) {
        return jobExecution.getJobParameters().getString(PROVINCE);
    }

    static String getProvince(StepContext stepContext) {
        return stepContext.getStepExecution().getJobParameters().getString(PROVINCE);
    }

    static String getSpeciality(JobExecution jobExecution) {
        return jobExecution.getJobParameters().getString(SPECIALITY);
    }


    static String getSpeciality(StepContext stepContext) {
        return stepContext.getStepExecution().getJobParameters().getString(SPECIALITY);
    }

    static void setTaskCode(JobExecution jobExecution, String taskCode) {
        jobExecution.getExecutionContext().putString(TASK_CODE, taskCode);
    }

    static String getTaskCode(JobExecution jobExecution) {
        return jobExecution.getExecutionContext().getString(TASK_CODE);
    }

    static String getTaskCode(StepContext stepContext) {
        return stepContext.getStepExecution().getJobExecution().getExecutionContext().getString(TASK_CODE);
    }

    static void setSkip(JobExecution jobExecution, SkipEnum skip) {
        jobExecution.getExecutionContext().putInt(SKIP, skip.getCode());
    }

    static boolean isSkip(JobExecution jobExecution) {
        return SkipEnum.get(jobExecution.getExecutionContext().getInt(SKIP)).isSkip();
    }

    static void setSkip(StepContext stepContext, SkipEnum skip) {
        stepContext.getStepExecution().getJobExecution().getExecutionContext().putInt(SKIP, skip.getCode());
    }

    static boolean isSkip(StepContext stepContext) {
        return SkipEnum.get(stepContext.getStepExecution().getJobExecution().getExecutionContext().getInt(SKIP)).isSkip();
    }

    //创建临时目录
    static File getTaskFolder(String taskCode, boolean create) throws IOException {
        File tempDirectory = FileUtils.getTempDirectory();
        File taskDirectory = new File(tempDirectory, String.valueOf(taskCode));
        if (create) {
            if (taskDirectory.exists()) {
                FileUtils.forceDelete(taskDirectory);
            }
            FileUtils.forceMkdir(taskDirectory);
        }
        return taskDirectory;
    }

    static File getTaskFolder(String taskCode) throws IOException {
        return getTaskFolder(taskCode, false);
    }

    static Map<String, Object> asParameter(Metadata metadata, Map<String, Integer> headerMap, Map<Integer, String> record) {
        Map<String, Object> p = new HashMap<>();
        int size = record.size();
        for (AttributeType attributeType : metadata.getAttributeTypes()) {
            Integer index = headerMap.get(attributeType.getColumnName().toUpperCase());
            if (null != index && index < size) {
                String value = record.get(index);
                Integer maxLength = null != metadata.getAttributeMaxLength() ? metadata.getAttributeMaxLength().get(attributeType.getColumnName().toUpperCase()) : null;
                if (null != maxLength && null != value && value.length() > maxLength) {
                    value = value.substring(0, maxLength);
                }
                p.put(attributeType.getColumnName().toUpperCase(), replaceQuote(value));
            } else {
                p.put(attributeType.getColumnName().toUpperCase(), null);
            }

        }
        return p;
    }

    private static String replaceQuote(String value) {
        return null != value ? StringUtils.trim(value.replaceAll("\"", "")) : null;
    }

    static Charset encodingOf(String encoding) {
        try {
            if (StringUtils.isEmpty(encoding)) {
                //encoding = "GBK";
                encoding = "UTF8";
            }
            return Charset.forName(encoding);
        } catch (Exception e) {
            return Charset.defaultCharset();
        }
    }

    static char safeDelimiter(String delimiterStr) {
        //char delimiter = 'Ж';
        char delimiter = DefaultDelimiter;
        if (StringUtils.isNotBlank(delimiterStr) && delimiterStr.length() == 1) {
            delimiter = delimiterStr.charAt(0);
        }
        return delimiter;
    }

    static Path csvFile(File taskFolder, String sourceFileName) {
        String baseName = FilenameUtils.getBaseName(sourceFileName);
        baseName = StringUtils.containsIgnoreCase(baseName, ".csv") ? StringUtils.substringBefore(baseName, ".") : baseName;
        String targetFileName = baseName + ".csv";

        Path csvItemFile = Paths.get(taskFolder.getAbsolutePath(), targetFileName);
        if (!Files.exists(csvItemFile)) {
            Collection<File> files = FileUtils.listFiles(taskFolder, new IOFileFilter() {
                @Override
                public boolean accept(File file) {
                    return file.getName().equalsIgnoreCase(targetFileName);
                }

                @Override
                public boolean accept(File dir, String name) {
                    return name.equalsIgnoreCase(targetFileName);
                }
            }, FalseFileFilter.INSTANCE);
            if (files.size() == 1) {
                csvItemFile = files.iterator().next().toPath();
            }
        }
        return csvItemFile;
    }

    static void transfer(FtpSession session, String filePath, Path itemFile) throws IOException {
        try (OutputStream os = Files.newOutputStream(itemFile);
             BufferedOutputStream stream = new BufferedOutputStream(os)
        ) {
            session.read(filePath, stream);
        }
    }

    static String sha1(Path itemFile) throws IOException {
        try (InputStream is = Files.newInputStream(itemFile);
             BufferedInputStream bufferedInputStream = new BufferedInputStream(is)
        ) {
            return DigestUtils.sha1Hex(bufferedInputStream);
        }
    }

    static void extractCsv(Path itemFile) throws IOException {
        try (InputStream fs = Files.newInputStream(itemFile);
             BufferedInputStream bis = new BufferedInputStream(fs);
             ArchiveInputStream ais = new ArchiveStreamFactory().createArchiveInputStream(bis)
        ) {
            ArchiveEntry entry;
            while ((entry = ais.getNextEntry()) != null) {
                if (entry.isDirectory()) {
                    Files.createDirectories(Paths.get(itemFile.getParent().toString(), entry.getName()));
                } else {
                    Path targetFile = Paths.get(itemFile.getParent().toString(), entry.getName());
                    if (Files.exists(targetFile)) {
                        FileUtils.forceDelete(targetFile.toFile());
                    }
                    Files.copy(ais, targetFile);
                }
            }
        } catch (ArchiveException e) {
            throw new RuntimeException("压缩文件存在问题，请检查！", e);
        }
    }

    //String sourceDir,String sourceFileName
    static void unGzipFile(Path itemFile) {
        String outFileName = StringUtils.substringBefore(itemFile.getFileName().toString(), ".") + ".csv";
        try {
            //建立gzip压缩文件输入流
            InputStream inStream = Files.newInputStream(itemFile);
            //建立gzip解压工作流
            GZIPInputStream gZinStream = new GZIPInputStream(inStream);
            //建立解压文件输出流
            Path targetFile = Paths.get(itemFile.getParent().toString(), outFileName);
            if (Files.exists(targetFile)) {
                FileUtils.forceDelete(targetFile.toFile());
            }
            OutputStream outStream = Files.newOutputStream(targetFile);

            int num;
            byte[] buf = new byte[1024];
            while ((num = gZinStream.read(buf, 0, buf.length)) != -1) {
                outStream.write(buf, 0, num);
            }
            gZinStream.close();
            outStream.close();
            inStream.close();
        } catch (Exception ex) {
            System.err.println(ex.toString());
        }
    }

    static DefaultFtpSessionFactory createSessionFactory(FileLocationDto location) {
        DefaultFtpSessionFactory factory = new DefaultFtpSessionFactory();
        factory.setHost(StringUtils.isNotEmpty(location.getHost()) ? location.getHost() : "localhost");
        factory.setPort(null != location.getPort() ? location.getPort() : 21);
        factory.setUsername(location.getUsername());
        factory.setPassword(location.getPassword());
        factory.setControlEncoding(StringUtils.isNotEmpty(location.getEncoding()) ? location.getEncoding() : "UTF-8");
        return factory;
    }

    static Map<String, Integer> headerMapOf(String firstLine, char delimiter) {
        Map<String, Integer> upperHeaderMap = new HashMap<>();
        String[] columns = StringUtils.splitPreserveAllTokens(firstLine, delimiter);
        if (ArrayUtils.isNotEmpty(columns)) {
            for (int i = 0; i < columns.length; i++) {
                upperHeaderMap.put(BatchUtil.replaceQuote(columns[i].toUpperCase()), i);
            }
        }
        return upperHeaderMap;
    }

    static void validateHeader(Map<String, Integer> csvHeader, Metadata metadata) {
        if (CollectionUtils.isNotEmpty(metadata.getAttributeTypes())) {
            Map<String, Integer> copy = new HashMap<>(csvHeader);
            List<String> notExists = new ArrayList<>();
            for (AttributeType attributeType : metadata.getAttributeTypes()) {
                Integer index = csvHeader.get(attributeType.getColumnName().toUpperCase());
                if (null != index) {
                    copy.remove(attributeType.getColumnName().toUpperCase());
                } else {
                    notExists.add(attributeType.getColumnName().toUpperCase());
                }
            }
            if (CollectionUtils.isNotEmpty(notExists)) {
                throw new IllegalArgumentException("文件格式不匹配，定义的列【" + StringUtils.join(notExists, ", ") + "】与CSV的列【" + StringUtils.join(copy.keySet(), ",") + "】不匹配");
            }
        }
    }
}
