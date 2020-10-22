package com.cmdi.dims.app;

import java.io.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import com.cmdi.dims.app.dto.FileLocationDto;
import com.cmdi.dims.app.dto.ReadFileErrDot;
import com.cmdi.dims.app.dto.ResponseDto;
import com.cmdi.dims.common.util.DefaultFtpSessionFactory;
import com.cmdi.dims.task.entity.FileLocation;
import com.cmdi.dims.task.repository.FileLocationRepository;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.integration.sftp.session.DefaultSftpSessionFactory;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Slf4j
@RestController
@RequestMapping("/app/v1/filelocation")
public class FileConfigRestController {

    @Autowired
    private FileLocationRepository fileLocationRepository;

    @GetMapping
    public ResponseDto<List<FileLocation>> fileLocations(
            @RequestParam(value = "fileLocationId", required = false) Long fileLocationId,
            @RequestParam(value = "name", required = false) String name,
            @RequestParam(value = "start", defaultValue = "0") Integer start,
            @RequestParam(value = "limit", defaultValue = "100") Integer limit
    ) {
        Integer size = null != limit ? limit : 20;
        Integer page = null != start ? start / size : 0;

        Page<FileLocation> locations = fileLocationRepository.findAll((Root<FileLocation> root, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) -> {
            List<Predicate> predicates = new ArrayList<>();
            if (null != fileLocationId) {
                predicates.add(criteriaBuilder.equal(root.get("fileLocationId"), fileLocationId));
            }
            if (StringUtils.isNotEmpty(name)) {
                predicates.add(criteriaBuilder.like(root.get("name"), "%" + name + "%"));
            }
            return criteriaBuilder.and(predicates.toArray(new Predicate[0]));
        }, PageRequest.of(page, size, Sort.Direction.DESC, "fileLocationId"));

        return ResponseDto.success(locations.getContent(), locations.getTotalElements(), locations.getNumberOfElements());
    }

    @PostMapping
    public ResponseDto<FileLocation> saveFileLocation(
            FileLocationDto fileLocationDto
    ) {
        FileLocation fileLocation;

        if (null != fileLocationDto.getFileLocationId()) {
            fileLocation = fileLocationRepository.findById(fileLocationDto.getFileLocationId())
                    .orElseThrow(() -> new IllegalArgumentException("FTP配置ID=" + fileLocationDto.getFileLocationId() + "不存在"));
        } else {
            fileLocation = new FileLocation();
        }
        BeanUtils.copyProperties(fileLocationDto, fileLocation);
        FileLocation saved = fileLocationRepository.save(fileLocation);
        return ResponseDto.success(saved);
    }


    @DeleteMapping(value = "/{fileLocationId}")
    public ResponseDto<Void> deleteFileLocation(
            @PathVariable("fileLocationId") Long fileLocationId
    ) {
        Assert.notNull(fileLocationId, "not null");
        FileLocation fileLocation = fileLocationRepository.findById(fileLocationId).orElseThrow(() -> new IllegalArgumentException("FTP配置ID=" + fileLocationId + "不存在"));
        fileLocationRepository.delete(fileLocation);
        return ResponseDto.success();
    }

    @PostMapping(value = "/{fileLocationId}/test")
    public ResponseDto<String[]> testFileLocation(
            @PathVariable("fileLocationId") Long fileLocationId
    ) {
        Assert.notNull(fileLocationId, "not null");
        FileLocation fileLocation = fileLocationRepository.findById(fileLocationId).orElseThrow(() -> new IllegalArgumentException("FTP配置ID=" + fileLocationId + "不存在"));
        Assert.notNull(fileLocation, "not null");
        String[] names = null;
        if ("FTP".equalsIgnoreCase(fileLocation.getSchema())) {
            try {
                DefaultFtpSessionFactory factory = new DefaultFtpSessionFactory();
                factory.setHost(StringUtils.isNotEmpty(fileLocation.getHost()) ? fileLocation.getHost() : "localhost");
                factory.setPort(null != fileLocation.getPort() ? fileLocation.getPort() : 21);
                factory.setUsername(fileLocation.getUsername());
                factory.setPassword(fileLocation.getPassword());
                factory.setControlEncoding(StringUtils.isNotEmpty(fileLocation.getEncoding()) ? fileLocation.getEncoding() : "UTF-8");

                names = factory.getSession().listNames(StringUtils.isNotEmpty(fileLocation.getPath()) ? fileLocation.getPath() : "/");
                System.out.println("===---"+ Arrays.toString(names));
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        } else{
            try {
                DefaultSftpSessionFactory factory = new DefaultSftpSessionFactory();
                factory.setHost(StringUtils.isNotEmpty(fileLocation.getHost()) ? fileLocation.getHost() : "localhost");
                factory.setPort(null != fileLocation.getPort() ? fileLocation.getPort() : 22);
                factory.setUser(fileLocation.getUsername());
                factory.setPassword(fileLocation.getPassword());
                factory.setAllowUnknownKeys(true);
                // factory.setControlEncoding(StringUtils.isNotEmpty(location.getEncoding()) ? location.getEncoding() : "UTF-8");
                names = factory.getSession().listNames(StringUtils.isNotEmpty(fileLocation.getPath()) ? fileLocation.getPath() : "/");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return ResponseDto.success(names);
    }

    //按csv文件格式读取
    @PostMapping (value = "/fileread")
    public ReadFileErrDot fileread(MultipartFile file) throws IOException {
        String filename = file.getOriginalFilename();//文件名  用来判断文件名  文件后缀  文件头判断(英文)
        System.out.println(filename);
        String[] split = filename.split("\\.");
        if (!split[split.length-1].equals("csv")){
            throw new IllegalArgumentException("文件格式错误");
        }

        BufferedReader br = new BufferedReader(new InputStreamReader(file.getInputStream(), "utf-8"));
        List<FileLocation> saveAll = null;
        ArrayList<String> objects=null;
        ArrayList<String> arrayLists = new ArrayList<>();
        String s ="";
        int numftp=0;
        int i1=0;
        try {
            String line;
            int i=0;
            ArrayList<FileLocation> fileLocationDtos = new ArrayList<>();

            while ((line = br.readLine()) != null) {
                String[] info = line.split(";");
                i++;
                if (i==1&&!line.equals("province;specialityName;name;schema;host;port;path;username;password;fileDelimiter")){
                    throw new IllegalArgumentException("文件头错误");
                }
                if (i!=1){
                    FileLocation fileLocationDto = new FileLocation();

                    int len=info.length;

                    for (String inf:info) {
                        if (inf.equals("")){
                            len=info.length-1;
                        }
                    }
                    if (len!=10){

                    }else {
                        fileLocationDto.setProvince(info[0]);
                        fileLocationDto.setSpecialityName(info[1]);
                        fileLocationDto.setName(info[2]);
                        fileLocationDto.setSchema(info[3]);
                        fileLocationDto.setHost(info[4]);
                        fileLocationDto.setPort(Integer.valueOf(info[5]));
                        fileLocationDto.setPath(info[6]);
                        fileLocationDto.setUsername(info[7]);
                        fileLocationDto.setPassword(info[8]);
                        fileLocationDto.setFileDelimiter(info[9]);
                        fileLocationDtos.add(fileLocationDto);
                    }

                }

//                    FileLocation saved = fileLocationRepository.save(fileLocation);
//                    return ResponseDto.success(saved);

                 saveAll = fileLocationRepository.saveAll(fileLocationDtos);
            }
            //错误条数
            i1 = i - 1 - saveAll.size();//添加错误了几条

  /*             objects = new ArrayList<>();
                for (FileLocation  fileLocations:fileLocationDtos) {
                Assert.notNull(fileLocations.getFileLocationId(), "not null");
                FileLocation fileLocation = fileLocationRepository.findById(fileLocations.getFileLocationId()).orElseThrow(() -> new IllegalArgumentException("FTP配置ID=" + fileLocations.getFileLocationId() + "不存在"));
                Assert.notNull(fileLocation, "not null");
                String[] responseDto = null;
                if ("FTP".equalsIgnoreCase(fileLocation.getSchema())) {
                    DefaultFtpSessionFactory factory = new DefaultFtpSessionFactory();
                    factory.setHost(StringUtils.isNotEmpty(fileLocation.getHost()) ? fileLocation.getHost() : "localhost");
                    factory.setPort(null != fileLocation.getPort() ? fileLocation.getPort() : 21);
                    factory.setUsername(fileLocation.getUsername());
                    factory.setPassword(fileLocation.getPassword());
                    factory.setControlEncoding(StringUtils.isNotEmpty(fileLocation.getEncoding()) ? fileLocation.getEncoding() : "UTF-8");
                    try {
                        responseDto = factory.getSession().listNames(StringUtils.isNotEmpty(fileLocation.getPath()) ? fileLocation.getPath() : "/");
                    }catch (IllegalStateException e){
                    }
                    System.out.println("===---" + Arrays.toString(responseDto));
                }
                if (responseDto==null){
                    String name = fileLocation.getName();
                    objects.add(name);//错误的数据的名字
                    s+=" "+name;
                    if (objects.size()==3){
                        arrayLists.add(s);
                        s="";
                    }else {
                        s+="，";
                    }
                    numftp++;
                }
            }*/
        } catch (FileNotFoundException ex) {
            System.out.println("没找到文件！");
        } catch (IOException ex) {
            System.out.println("读写文件出错！");
        }
        arrayLists.add(s);
        return ReadFileErrDot.builder().numerr(i1).ftperrs(arrayLists).ftperrnum(numftp).build();
    }


}
