package com.cmdi.dims.configuration;

import com.cmdi.dims.batch.*;
import com.cmdi.dims.domain.ConfigService;
import com.cmdi.dims.domain.DataService;
import com.cmdi.dims.domain.StatisticsService;
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

@Configuration
public class DimsJobConfig {

    @Autowired
    private JobBuilderFactory jobBuilderFactory;
    @Autowired
    private StepBuilderFactory stepBuilderFactory;
    @Autowired
    private TaskService taskService;
    @Autowired
    private ConfigService configService;
    @Autowired
    private DataService dataService;
    @Autowired
    private JobRepository jobRepository;
    @Autowired
    private StatisticsService statisticsService;
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
        tasklet.setConfigService(configService);
        tasklet.setDataService(dataService);
        return tasklet;
    }

    @Bean
    public FileProcessTasklet fileProcessTasklet() {
        FileProcessTasklet tasklet = new FileProcessTasklet();
        tasklet.setTaskService(taskService);
        tasklet.setConfigService(configService);
        tasklet.setDataService(dataService);
        return tasklet;
    }

    @Bean
    public BusinessAnalysisTasklet businessAnalysisTasklet() {
        BusinessAnalysisTasklet tasklet = new BusinessAnalysisTasklet();
        tasklet.setTaskService(taskService);
        tasklet.setConfigService(configService);
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
        tasklet.setConfigService(configService);
        tasklet.setDataService(dataService);
        return tasklet;
    }
    @Bean
    public StatisticsTasklet statisticsTasklet() {
        StatisticsTasklet tasklet = new StatisticsTasklet();
        tasklet.setTaskService(taskService);
        tasklet.setStatisticsService(statisticsService);
        return tasklet;
    }

    @Bean
    public JobExecutionListener taskListener() {
        return new DimsTaskListener(taskService);
    }
    //从FTP下载文件
    @Bean
    public Step fileTransferStep() {
        return stepBuilderFactory.get("fileTransferStep").tasklet(fileTransferTasklet()).build();
    }
    //比对文件
    @Bean
    public Step fileCompareStep() {
        return stepBuilderFactory.get("fileCompareStep").tasklet(fileCompareTasklet()).build();
    }
    //文件入库分析
    @Bean
    public Step fileProcessStep() {
        return stepBuilderFactory.get("fileProcessStep").tasklet(fileProcessTasklet()).build();
    }
    //指标计算
    @Bean
    public Step businessAnalysisStep() {
        return stepBuilderFactory.get("businessAnalysisStep").tasklet(businessAnalysisTasklet()).build();
    }
    //根据维度统计资源数据
    @Bean
    public Step statisticsStep() {
        return stepBuilderFactory.get("statisticsStep").tasklet(statisticsTasklet()).build();
    }

    //上传错误文件
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
                .next(statisticsStep())
                .next(fileUploadStep())
                .build();
    }
}
