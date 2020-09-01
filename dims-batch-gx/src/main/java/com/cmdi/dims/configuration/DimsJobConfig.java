package com.cmdi.dims.configuration;

import com.cmdi.dims.domain.TaskService;
import org.springframework.batch.core.Job;
import org.springframework.batch.core.JobExecutionListener;
import org.springframework.batch.core.Step;
import org.springframework.batch.core.configuration.annotation.JobBuilderFactory;
import org.springframework.batch.core.configuration.annotation.StepBuilderFactory;
import org.springframework.batch.core.launch.JobLauncher;
import org.springframework.batch.core.launch.support.SimpleJobLauncher;
import org.springframework.batch.core.repository.JobRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.task.SimpleAsyncTaskExecutor;

import com.cmdi.dims.batch.BusinessAnalysisGxTasklet;
import com.cmdi.dims.batch.DimsTaskListener;
import com.cmdi.dims.batch.FileCompareTasklet;
import com.cmdi.dims.batch.FileProcessTasklet;
import com.cmdi.dims.batch.FileTransferTasklet;
import com.cmdi.dims.batch.FileUploadTasklet;
import com.cmdi.dims.domain.DataService;
import com.cmdi.dims.domain.LockService;
import com.cmdi.dims.domain.MetaService;

@Configuration
public class DimsJobConfig {

    @Autowired
    private JobBuilderFactory jobBuilderFactory;
    @Autowired
    private StepBuilderFactory stepBuilderFactory;
    @Autowired
    private TaskService taskService;
    @Autowired
    private LockService lockService;
    @Autowired
    private MetaService metaService;
    @Autowired
    private DataService dataService;
    @Autowired
    private JobRepository jobRepository;

    @Bean
    public JobLauncher asyncJobLauncher() {
        SimpleJobLauncher jobLauncher = new SimpleJobLauncher();
        jobLauncher.setJobRepository(jobRepository);
        jobLauncher.setTaskExecutor(new SimpleAsyncTaskExecutor());
        return jobLauncher;
    }

    @Bean
    public FileTransferTasklet fileTransferTasklet() {
        FileTransferTasklet tasklet = new FileTransferTasklet();
        tasklet.setTaskService(taskService);
        tasklet.setMetaService(metaService);
        return tasklet;
    }

    @Bean
    public FileProcessTasklet fileProcessTasklet() {
        FileProcessTasklet tasklet = new FileProcessTasklet();
        tasklet.setTaskService(taskService);
        tasklet.setMetaService(metaService);
        tasklet.setDataService(dataService);
        return tasklet;
    }

    @Bean
    public BusinessAnalysisGxTasklet businessAnalysisTasklet() {
        BusinessAnalysisGxTasklet tasklet = new BusinessAnalysisGxTasklet();
        tasklet.setTaskService(taskService);
        tasklet.setMetaService(metaService);
        tasklet.setDataService(dataService);
        return tasklet;
    }

    @Bean
    public FileCompareTasklet fileCompareTasklet() {
        FileCompareTasklet tasklet = new FileCompareTasklet();
        tasklet.setTaskService(taskService);
        return tasklet;
    }

    @Bean
    public FileUploadTasklet fileUploadTasklet() {
        FileUploadTasklet tasklet = new FileUploadTasklet();
        tasklet.setTaskService(taskService);
        tasklet.setMetaService(metaService);
        tasklet.setDataService(dataService);
        return tasklet;
    }

    @Bean
    public JobExecutionListener taskListener() {
        return new DimsTaskListener(taskService, lockService);
    }

    @Bean
    public Step fileTransferStep() {
        return stepBuilderFactory.get("fileTransferStep").tasklet(fileTransferTasklet()).build();
    }

    @Bean
    public Step fileCompareStep() {
        return stepBuilderFactory.get("fileCompareStep").tasklet(fileCompareTasklet()).build();
    }

    @Bean
    public Step fileProcessStep() {
        return stepBuilderFactory.get("fileProcessStep").tasklet(fileProcessTasklet()).build();
    }

    @Bean
    public Step businessAnalysisStep() {
        return stepBuilderFactory.get("businessAnalysisStep").tasklet(businessAnalysisTasklet()).build();
    }

    @Bean
    public Step fileUploadStep() {
        return stepBuilderFactory.get("fileUploadStep").tasklet(fileUploadTasklet()).build();
    }

    @Bean
    public Job dataCollector() {
        return jobBuilderFactory.get("dataCollector")
                .listener(taskListener())
                .start(fileTransferStep())
//                .next(fileCompareStep())
                .next(fileProcessStep())
                .next(businessAnalysisStep())
                .next(fileUploadStep())
                .build();
    }
}
