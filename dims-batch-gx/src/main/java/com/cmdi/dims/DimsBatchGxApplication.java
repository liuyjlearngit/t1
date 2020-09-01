package com.cmdi.dims;

import java.util.Date;
import java.util.List;

import com.cmdi.dims.batch.BatchUtil;
import org.springframework.batch.core.ExitStatus;
import org.springframework.batch.core.Job;
import org.springframework.batch.core.JobExecution;
import org.springframework.batch.core.JobParameters;
import org.springframework.batch.core.JobParametersBuilder;
import org.springframework.batch.core.configuration.JobLocator;
import org.springframework.batch.core.launch.JobLauncher;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.util.Assert;

@SpringBootApplication
public class DimsBatchGxApplication implements ApplicationRunner {

    private static final String ARG_JOB_NAME = "job";
    private static final String ARG_PROVINCE_NAME = "province";
    private static final String ARG_SPECIALTY_NAME = "specialty";

    @Autowired
    JobLocator jobLocator;

    @Autowired
    JobLauncher jobLauncher;

    public static void main(String[] args) {
        SpringApplication.run(DimsBatchGxApplication.class, args);
    }

    @Override
    public void run(ApplicationArguments args) throws Exception {
        List<String> jobs = args.getOptionValues(ARG_JOB_NAME);
        List<String> provinces = args.getOptionValues(ARG_PROVINCE_NAME);
        List<String> specialties = args.getOptionValues(ARG_SPECIALTY_NAME);
        Assert.notEmpty(jobs, "Please set args --job=xxx");
        Assert.notEmpty(provinces, "Please set args --province=xxx");
        Assert.notEmpty(specialties, "Please set args --specialty=xxx");


        Job job = jobLocator.getJob(jobs.get(0));
        JobParameters parameters = new JobParametersBuilder()
                .addString(BatchUtil.PROVINCE, provinces.get(0))
                .addString(BatchUtil.SPECIALITY, specialties.get(0))
                .addDate(BatchUtil.LOCKED_AT, new Date())
                .toJobParameters();
        JobExecution jobExecution = jobLauncher.run(job, parameters);
        Assert.state(ExitStatus.COMPLETED.equals(jobExecution.getExitStatus()), "任务执行失败");
    }
}
