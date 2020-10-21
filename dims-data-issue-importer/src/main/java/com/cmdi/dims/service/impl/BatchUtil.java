package com.cmdi.dims.service.impl;

import com.cmdi.dims.infrastructure.util.DefaultFtpSessionFactory;
import com.cmdi.dims.infrastructure.util.FtpSession;
import com.cmdi.dims.service.vo.FileLocationVo;
import org.apache.commons.codec.digest.DigestUtils;
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
import org.springframework.integration.sftp.session.DefaultSftpSessionFactory;
import org.springframework.integration.sftp.session.SftpSession;

import java.io.*;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

public class BatchUtil {

    public static final String PROVINCE = "PROVINCE";
    public static final String SPECIALITY = "SPECIALITY";
    public static final String LOCKED_AT = "LOCKED_AT";
    static final String TASK_CODE = "TASK_CODE";
    static final String SKIP = "SKIP";
    static final char Delimiter = '^';

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

    static File getFileValidationFolder(String taskConfigCode, boolean create) throws IOException {
        File tempDirectory = FileUtils.getTempDirectory();
        File validationDirectory = new File(tempDirectory, "validation-" + taskConfigCode);
        if (create) {
            FileUtils.forceMkdir(validationDirectory);
        }
        return validationDirectory;
    }

    static File getTaskFolder(String taskCode) throws IOException {
        return getTaskFolder(taskCode, false);
    }

    private static String replaceQuote(String value) {
        return null != value ? StringUtils.trim(value.replaceAll("\"", "")) : null;
    }

    static Charset encodingOf(String encoding) {
        try {
            if (StringUtils.isEmpty(encoding)) {
                encoding = "UTF8";
            }
            return Charset.forName(encoding);
        } catch (Exception e) {
            return Charset.defaultCharset();
        }
    }

    static char safeDelimiter(String delimiterStr) {
        char delimiter = Delimiter;
        if (StringUtils.isNotBlank(delimiterStr) && delimiterStr.length() == 1) {
            delimiter = delimiterStr.charAt(0);
        }
        return delimiter;
    }

    static Path csvFile(File taskFolder, String sourceFileName) {
        String baseName = FilenameUtils.getBaseName(sourceFileName);
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
    static void transferSFTP(SftpSession session, String filePath, Path itemFile) throws IOException {
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

    static String sha1(String data) {
        return DigestUtils.sha1Hex(data);
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

    static DefaultFtpSessionFactory createSessionFactory(FileLocationVo location) {
        DefaultFtpSessionFactory factory = new DefaultFtpSessionFactory();
        factory.setHost(StringUtils.isNotEmpty(location.getHost()) ? location.getHost() : "localhost");
        factory.setPort(null != location.getPort() ? location.getPort() : 21);
        factory.setUsername(location.getUsername());
        factory.setPassword(location.getPassword());
        factory.setControlEncoding(StringUtils.isNotEmpty(location.getEncoding()) ? location.getEncoding() : "UTF-8");
        return factory;
    }
    static DefaultSftpSessionFactory createSFTPSessionFactory(FileLocationVo location) {
        DefaultSftpSessionFactory factory = new DefaultSftpSessionFactory();
        factory.setHost(StringUtils.isNotEmpty(location.getHost()) ? location.getHost() : "localhost");
        factory.setPort(null != location.getPort() ? location.getPort() : 22);
        factory.setUser(location.getUsername());
        factory.setPassword(location.getPassword());
        // factory.setControlEncoding(StringUtils.isNotEmpty(location.getEncoding()) ? location.getEncoding() : "UTF-8");
        factory.setAllowUnknownKeys(true);
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

}
