package com.cmdi.dims;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.util.Assert;

import com.cmdi.dims.service.ImportService;

@SpringBootApplication
public class IssueImporterApplication implements ApplicationRunner {

    @Autowired
    ImportService importService;

    private static final String ARG_PROVINCE_NAME = "province";
    private static final String ARG_SPECIALTY_NAME = "specialty";

    public static void main(String[] args) {
        SpringApplication.run(IssueImporterApplication.class, args);
    }

    @Override
    public void run(ApplicationArguments args) throws Exception {
        List<String> provinces = args.getOptionValues(ARG_PROVINCE_NAME);
        List<String> specialties = args.getOptionValues(ARG_SPECIALTY_NAME);
        Assert.notEmpty(provinces, "Please set args --province=xxx");
        Assert.notEmpty(specialties, "Please set args --specialty=xxx");
        importService.downloadFileFromFtp(provinces.get(0), specialties.get(0));
    }
}
