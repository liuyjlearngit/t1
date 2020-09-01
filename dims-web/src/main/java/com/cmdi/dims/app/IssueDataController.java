package com.cmdi.dims.app;

import java.io.*;
import java.util.Date;
import java.util.List;

import com.cmdi.dims.common.util.DefaultFtpSessionFactory;
import com.cmdi.dims.common.util.FtpSession;
import com.cmdi.dims.common.util.UrlUtil;
import com.cmdi.dims.data.service.IssueDataExportService;
import com.cmdi.dims.task.entity.AreaCodeConfig;
import com.cmdi.dims.task.entity.FileLocation;
import com.cmdi.dims.task.entity.Task;
import com.cmdi.dims.task.entity.TaskLatest;
import com.cmdi.dims.task.repository.AreaCodeConfigRepository;
import com.cmdi.dims.task.repository.FileLocationRepository;
import com.cmdi.dims.task.repository.TaskLatestRepository;
import com.cmdi.dims.task.repository.TaskRepository;
import org.apache.commons.lang3.StringUtils;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.*;
import com.google.common.collect.Lists;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/app/v1/statistic")
public class IssueDataController {

    @Autowired
    private TaskLatestRepository taskLatestRepository;
    @Autowired
    private TaskRepository taskRepository;
    @Autowired
    private AreaCodeConfigRepository areaCodeConfigRepository;
    @Autowired
    private FileLocationRepository fileLocationRepository;
    @Autowired
    private IssueDataExportService issueDataExportService;

    /**
     * @param province   省份
     * @param speciality 专业名称
     * @param regionCode 当前界面的regioncode
     * @return
     */
    @GetMapping(value = "/issue/data/export", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
    public ResponseEntity<byte[]> issueData(
            @RequestParam("province") String province,
            @RequestParam("speciality") String speciality,
            @RequestParam("regioncode") String regionCode,
            @RequestParam("userid") Long userId
    ) throws Exception {
        byte[] result = null;
        String filename = null;
        try {

            Assert.hasText(province, "请选择省份");
            Assert.hasText(speciality, "请选择专业");
            Assert.hasText(regionCode, "请输入区域编码");

            AreaCodeConfig config = areaCodeConfigRepository.findByCode(province);
            String realProvince = config.getRegionType() == 1 ? config.getCode() : config.getProvinceCode();
            List<TaskLatest> taskLatest = taskLatestRepository.findByProvinceAndSpecialityName(realProvince, speciality);
            Assert.notEmpty(taskLatest, "没有找到最新的核查结果");
            Task task = taskRepository.findByCode(taskLatest.get(0).getTaskCode());
            Assert.notNull(task, "没有找到最新的核查结果");

            //地市区县专业数据的全量导出
            AreaCodeConfig config1 = areaCodeConfigRepository.findByCode(regionCode);
            String taskCode = taskLatest.get(0).getTaskCode();
            int regionType = config1.getRegionType();
            //采用两种方式，省份级别采用FTP中上传的数据，地市或区县则从库中进行查询
            if (regionType != 1) {
                //当行政级别不同时，则查询字段不同 prefecture_code、county_code
                String regionField = null;
                if (regionType == 2) {
                    regionField = "prefecture_code";
                } else if (regionType == 3) {
                    regionField = "county_code";
                }
                String zipPath = issueDataExportService.export(province, speciality, regionCode, regionField, taskCode);
                if (zipPath != null) {
                    File f = new File(zipPath);
                    if (!f.exists()) {
                        throw new FileNotFoundException("file not exists");
                    }
                    ByteArrayOutputStream bos = new ByteArrayOutputStream((int) f.length());
                    BufferedInputStream in = null;
                    try {
                        in = new BufferedInputStream(new FileInputStream(f));
                        int buf_size = 2048;
                        byte[] buffer = new byte[buf_size];
                        int len = 0;
                        while (-1 != (len = in.read(buffer, 0, buf_size))) {
                            bos.write(buffer, 0, len);
                        }
                        in.close();
                        result = bos.toByteArray();
                        filename = "问题数据-" +regionCode+"-"+speciality +"-" +new DateTime(new Date()).toString("yyyyMMdd") + "_RESULT.zip";
                        f.delete();
                    } catch (Exception e) {
                        log.error(e.getMessage(), e);
                        result = ("导出报错！" + e.getMessage()).getBytes();
                        filename = "导出错误.txt";
                    }
                } else {
                    result = ("导出报错！" + "该地市或区县没有错误数据").getBytes();
                    filename = "导出错误.txt";
                }
                return ResponseEntity.ok()
                        .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + UrlUtil.urlEncode(filename) + "\"")
                        .body(result);
            }


            List<FileLocation> locations = fileLocationRepository.findByProvinceAndSpecialityNameIn(realProvince, Lists.newArrayList(speciality));
            Assert.notEmpty(locations, "没有找到保存核查结果的FTP");
            FileLocation location = locations.get(0);

            DefaultFtpSessionFactory factory = new DefaultFtpSessionFactory();
            factory.setHost(StringUtils.isNotEmpty(location.getHost()) ? location.getHost() : "localhost");
            factory.setPort(null != location.getPort() ? location.getPort() : 21);
            factory.setUsername(location.getUsername());
            factory.setPassword(location.getPassword());
            factory.setControlEncoding(StringUtils.isNotEmpty(location.getEncoding()) ? location.getEncoding() : "UTF-8");
            ByteArrayOutputStream os = new ByteArrayOutputStream();
            FtpSession session = factory.getSession();
            String filePath = location.getPath() + "/" + new DateTime(task.getCollectionDate()).toString("yyyyMMdd") + "_RESULT.zip";
            Assert.state(session.exists(filePath), "核查结果文件不存在");
            session.read(filePath, os);
            result = os.toByteArray();
            filename = "问题数据-" + new DateTime(task.getCollectionDate()).toString("yyyyMMdd") + "_RESULT.zip";

        } catch (Exception e) {
            log.error(e.getMessage(), e);
            result = String.valueOf("导出报错！" + e.getMessage()).getBytes();
            filename = "导出错误.txt";
        }
        return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + UrlUtil.urlEncode(filename) + "\"")
                .body(result);
    }


    /**
     * 根据规则id导出相关错误明细
     *
     * @param province   省份
     * @param speciality 专业名称
     * @param regionCode 当前界面的regioncode
     * @param userId     用户id
     * @param rulecodes
     * @return
     */
    @GetMapping(value = "/issue/data/batchexport", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
    public ResponseEntity<byte[]> batchexportissueData(
            @RequestParam("province") String province,
            @RequestParam("speciality") String speciality,
            @RequestParam("regioncode") String regionCode,
            @RequestParam("userid") Long userId,
            @RequestParam("rulecodes") String[] rulecodes
    ) throws Exception {
        byte[] result = null;
        String filename = null;
        //获取错误明细压缩包的文件
        String zipPath = issueDataExportService.batchExport(province, speciality, regionCode, rulecodes);
        if (zipPath != null) {
            File f = new File(zipPath);
            if (!f.exists()) {
                throw new FileNotFoundException("file not exists");
            }
            ByteArrayOutputStream bos = new ByteArrayOutputStream((int) f.length());
            BufferedInputStream in = null;
            try {
                in = new BufferedInputStream(new FileInputStream(f));
                int buf_size = 1024;
                byte[] buffer = new byte[buf_size];
                int len = 0;
                while (-1 != (len = in.read(buffer, 0, buf_size))) {
                    bos.write(buffer, 0, len);
                }
                in.close();
                result = bos.toByteArray();
                filename = "违反规则问题数据-" +regionCode+"-"+speciality +"-" +new DateTime(new Date()).toString("yyyyMMdd") + "_RESULT.zip";
                f.delete();
            } catch (Exception e) {
                log.error(e.getMessage(), e);
                f.delete();
                result = ("导出报错！" + e.getMessage()).getBytes();
                filename = "导出错误.txt";
            }
        } else {
            result = ("导出报错！" + "选中的规则没有错误数据").getBytes();
            filename = "导出错误.txt";
        }
        return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + UrlUtil.urlEncode(filename) + "\"")
                .body(result);
    }
}
