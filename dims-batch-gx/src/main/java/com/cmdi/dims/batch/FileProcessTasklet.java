package com.cmdi.dims.batch;

import java.io.BufferedReader;
import java.io.File;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.atomic.AtomicLong;

import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang3.ArrayUtils;
import org.apache.commons.lang3.BooleanUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.util.Assert;

import com.lmax.disruptor.BlockingWaitStrategy;
import com.lmax.disruptor.RingBuffer;
import com.lmax.disruptor.dsl.Disruptor;
import com.lmax.disruptor.dsl.ProducerType;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import com.cmdi.dims.domain.DataService;
import com.cmdi.dims.domain.MetaService;
import com.cmdi.dims.sdk.model.MetadataDto;
import com.cmdi.dims.sdk.model.TaskConfigDto;
import com.cmdi.dims.sdk.model.TaskItemBusinessDto;
import com.cmdi.dims.sdk.model.TaskItemFileDto;

@Slf4j
public class FileProcessTasklet extends AbstractDimsTasklet {

    private static final int BATCH_SIZE = 2000;

    private static final int HANDLER_SIZE = 16;

    private static final int RING_BUFFER_SIZE = 64;

    @Setter
    private MetaService metaService;
    @Setter
    private DataService dataService;

    private Map<String, AtomicLong> successCounters = new HashMap<>();

    private void countBusinessData(String taskCode) {
        List<TaskItemBusinessDto> taskItemBusinesses = taskService.findTaskItemBusinessesByTaskCode(taskCode);
        if (CollectionUtils.isNotEmpty(taskItemBusinesses)) {
            for (TaskItemBusinessDto dto : taskItemBusinesses) {
                AtomicLong counter = successCounters.get(dto.getCode());
                if (null != counter) {
                    dto.setAmount(counter.get());
                }
                taskService.saveTaskItemBusiness(dto);
            }
        }

    }

//    private void preCleanData() {
//        List<String> tables = metaService.loadAllTables();
//        if (CollectionUtils.isNotEmpty(tables)) {
//            for (String table : tables) {
//                try {
//                    dataService.cleanData(table);
//                    log.info("Pre clean table " + table + " success!");
//                } catch (Exception e) {
//                    log.error("Pre clean table " + table + " error! " + e.getMessage(), e);
//                }
//            }
//        }
//    }

    private void executeTaskItemFileNative(TaskConfigDto taskConfigDto, TaskItemFileDto taskItemFile, File taskDirectory, RingBuffer<DataWithMetadata> ringBuffer) {
        if (BooleanUtils.isNotTrue(taskItemFile.isSuccess())) {
            return;
        }
        MetadataDto metadata = metaService.loadMetadata(taskItemFile.getDestTable(), taskConfigDto.getTableSpecialityMappings().get(taskItemFile.getDestTable()));
        long start = System.currentTimeMillis();
        boolean success = true;
        long totalRecord = 0L;
        String errorMessage = null;
        try {
            Path file = Paths.get(taskDirectory.getAbsolutePath(), taskItemFile.getSignature(), taskItemFile.getCsvFile());
            Assert.state(Files.exists(file), "file not exists");
            try (InputStream is = Files.newInputStream(file);
                 InputStreamReader isr = new InputStreamReader(is, BatchUtil.encodingOf(taskItemFile.getFileEncoding()));
                 BufferedReader reader = new BufferedReader(isr)
            ) {
                char delimiter = BatchUtil.safeDelimiter(taskItemFile.getFileDelimiter());
                String header = reader.readLine();
                Assert.hasLength(header, "header not found");

                Map<String, Integer> upperHeaderMap = BatchUtil.headerMapOf(header, delimiter);
                BatchUtil.validateHeader(upperHeaderMap, metadata);
                int columnSize = upperHeaderMap.size();

                List<Map<String, Object>> parameters = new ArrayList<>(BATCH_SIZE);
                String dataLine;
                int idx;
                Map<Integer, String> parameter;
                String preDateLine = null;
                while (null != (dataLine = reader.readLine())) {
                    totalRecord++;

                    dataLine = dataLine.replaceAll("\u0000", "");
                    String currentDateLine = dataLine;
                    if (null != preDateLine) {
                        currentDateLine = preDateLine + dataLine;
                    }
                    if (StringUtils.isEmpty(currentDateLine)) {
                        continue;
                    }
                    String[] columns = StringUtils.splitPreserveAllTokens(currentDateLine, delimiter);
                    parameter = new HashMap<>();
                    if (ArrayUtils.isNotEmpty(columns)) {
                        int currentSize = columns.length;
                        if (currentSize < columnSize) {
                            if (currentSize == 1) {
                                preDateLine = null;
                                log.warn(taskItemFile.getDestTable() + "对象文件" + taskItemFile.getCsvFile() + "第" + totalRecord + "行可能是上一行的结尾，当前已经无法正确合并，即将丢弃");
                                continue;
                            }
                            preDateLine = currentDateLine;
                            log.warn(taskItemFile.getDestTable() + "对象文件" + taskItemFile.getCsvFile() + "第" + totalRecord + "行可能字段包含换行符，准备与下一行合并计算");
                            continue;
                        } else if (currentSize == columnSize) {
                            for (idx = 0; idx < currentSize; idx++) {
                                parameter.put(idx, columns[idx]);
                            }
                        } else if (currentSize > columnSize) {
                            if (null == preDateLine) {
                                log.warn(taskItemFile.getDestTable() + "对象文件" + taskItemFile.getCsvFile() + "第" + totalRecord + "行可能包含多余的分割符");
                                for (idx = 0; idx < currentSize; idx++) {
                                    parameter.put(idx, columns[idx]);
                                }
                            } else {
                                log.warn(taskItemFile.getDestTable() + "对象文件" + taskItemFile.getCsvFile() + "第" + totalRecord + "行与上一行合并失败，分开两行计算");
                                String[] preLineColumns = StringUtils.splitPreserveAllTokens(preDateLine, delimiter);
                                if (ArrayUtils.isNotEmpty(preLineColumns)) {
                                    int preLineSize = preLineColumns.length;
                                    for (idx = 0; idx < preLineSize; idx++) {
                                        parameter.put(idx, preLineColumns[idx]);
                                    }
                                }
                                parameters.add(BatchUtil.asParameter(metadata, upperHeaderMap, parameter));
                                parameter = new HashMap<>();

                                String[] currentLineColumns = StringUtils.splitPreserveAllTokens(dataLine, delimiter);
                                if (ArrayUtils.isNotEmpty(currentLineColumns)) {
                                    int currentLineSize = currentLineColumns.length;
                                    if (currentLineSize < columnSize) {
                                        preDateLine = dataLine;
                                        log.warn(taskItemFile.getDestTable() + "对象文件" + taskItemFile.getCsvFile() + "第" + totalRecord + "行可能字段包含换行符，准备与下一行合并计算");
                                        continue;
                                    } else if (currentLineSize == columnSize) {
                                        for (idx = 0; idx < currentLineSize; idx++) {
                                            parameter.put(idx, currentLineColumns[idx]);
                                        }
                                    } else if (currentLineSize > columnSize) {
                                        log.warn(taskItemFile.getDestTable() + "对象文件" + taskItemFile.getCsvFile() + "第" + totalRecord + "行可能包含多余的分割符");
                                        for (idx = 0; idx < currentLineSize; idx++) {
                                            parameter.put(idx, currentLineColumns[idx]);
                                        }
                                    }
                                }
                            }

                        }

                    } else {
                        log.warn(taskItemFile.getDestTable() + "对象文件" + taskItemFile.getCsvFile() + "第" + totalRecord + "行是个空行！");
                    }
                    preDateLine = null;

                    parameters.add(BatchUtil.asParameter(metadata, upperHeaderMap, parameter));
                    if (parameters.size() >= BATCH_SIZE) {
                        publish(ringBuffer, metadata, new ArrayList<>(parameters), totalRecord);
                        parameters.clear();
                    }
                }
                if (parameters.size() > 0) {
                    publish(ringBuffer, metadata, new ArrayList<>(parameters), totalRecord);
                    parameters.clear();
                }
                publish(ringBuffer, metadata, new ArrayList<>(), totalRecord);
            }
        } catch (Exception e) {
            success = false;
            errorMessage = taskItemFile.getDestTable() + "对象文件" + taskItemFile.getCsvFile() + "解析出错" + e.getMessage();
            log.error(errorMessage, e);
        } finally {
            taskService.saveTaskItemBusiness(populate(metadata, taskItemFile, totalRecord, System.currentTimeMillis() - start, success, errorMessage));
        }
    }

    private TaskItemBusinessDto populate(MetadataDto metadata, TaskItemFileDto taskItemFile, Long originAmount, Long analysisCosts, boolean success, String message) {
        return populate(metadata.getEntityType().getName(),
                metadata.getEntityType().getCode().toUpperCase(),
                taskItemFile.getCollectionDate(),
                taskItemFile.getTaskCode(),
                taskItemFile.getProvince(),
                originAmount,
                analysisCosts,
                success,
                message);
    }

    private TaskItemBusinessDto populate(String name, String code, Date collectionDate, String taskCode, String province, Long originAmount, Long analysisCosts, boolean success, String message) {
        TaskItemBusinessDto taskItemBusiness = new TaskItemBusinessDto();
        taskItemBusiness.setCollectionDate(collectionDate);
        taskItemBusiness.setName(name);
        taskItemBusiness.setCode(code);
        taskItemBusiness.setTaskCode(taskCode);
        taskItemBusiness.setProvince(province);
        taskItemBusiness.setOriginAmount(originAmount);
        taskItemBusiness.setAnalysisCosts(analysisCosts);
        taskItemBusiness.setSuccess(success);
        taskItemBusiness.setMemo(message);
        return taskItemBusiness;
    }

    private void publish(RingBuffer<DataWithMetadata> ringBuffer, MetadataDto metadata, List<Map<String, Object>> parameters, long index) {
        log.debug("{} batch load {}", metadata.getEntityType().getExtensionTable(), index);
        long sequence = ringBuffer.next();
        try {
            DataWithMetadata event = ringBuffer.get(sequence);
            event.setIndex(index);
            event.setMetadata(metadata);
            event.setParameters(new ArrayList<>(parameters));
        } finally {
            ringBuffer.publish(sequence);
        }
    }

    public boolean validateHeader(List<TaskItemFileDto> taskItemFiles, TaskConfigDto taskConfigDto, File taskDirectory, String taskCode, String province) {
        Set<String> tables = new HashSet<>();
        boolean result = true;
        for (TaskItemFileDto taskItemFile : taskItemFiles) {
            tables.add(taskItemFile.getDestTable());
            String errorMessage = null;
            MetadataDto metadata = metaService.loadMetadata(taskItemFile.getDestTable(), taskConfigDto.getTableSpecialityMappings().get(taskItemFile.getDestTable()));
            boolean success = false;
            try {
                Path file = Paths.get(taskDirectory.getAbsolutePath(), taskItemFile.getSignature(), taskItemFile.getCsvFile());
                Assert.state(Files.exists(file), "file not exists");
                try (InputStream is = Files.newInputStream(file);
                     InputStreamReader isr = new InputStreamReader(is, BatchUtil.encodingOf(taskItemFile.getFileEncoding()));
                     BufferedReader reader = new BufferedReader(isr)
                ) {
                    char delimiter = BatchUtil.safeDelimiter(taskItemFile.getFileDelimiter());
                    String header = reader.readLine();
                    Assert.hasLength(header, "header not found");
                    Map<String, Integer> upperHeaderMap = BatchUtil.headerMapOf(header, delimiter);
                    BatchUtil.validateHeader(upperHeaderMap, metadata);
                    success = true;
                }
            } catch (Exception e) {
                errorMessage = taskItemFile.getDestTable() + "对象文件" + taskItemFile.getCsvFile() + "解析出错" + e.getMessage();
                log.error(errorMessage, e);
            } finally {
                taskService.saveTaskItemBusiness(populate(metadata, taskItemFile, 0L, 0L, success, errorMessage));
                if (result) {
                    result = success;
                }
            }
        }
        for (Map.Entry<String, String> table : taskConfigDto.getTables().entrySet()) {
            if (!tables.contains(table.getKey())) {
                taskService.saveTaskItemBusiness(populate(table.getValue(), table.getKey(), null, taskCode, province, 0L, 0L, false, "没有找到对应的文件"));
            }
        }
        return result;
    }


    @Override
    public void process(String taskCode, String province, String speciality) throws Exception {
        Assert.hasText(taskCode, "taskId is null");
//        log.info("begin clean business data, prepare space for Task[taskCode=" + taskCode + "] ...");
//        this.preCleanData();
//        log.info("finish clean business data!");
        TaskConfigDto taskConfigDto = metaService.loadConfig(province, speciality);
        List<TaskItemFileDto> taskItemFiles = taskService.findTaskItemFilesByTaskCode(taskCode);
        Assert.notEmpty(taskItemFiles, "task item files is empty !!!");
        successCounters.clear();
        taskItemFiles.forEach(taskItemFile -> successCounters.put(taskItemFile.getDestTable().toUpperCase(), new AtomicLong(0)));

        File taskDirectory = BatchUtil.getTaskFolder(taskCode);
        Assert.state(taskDirectory.exists(), "task folder not exists");
//        Assert.state(validateHeader(taskItemFiles, taskConfigDto, taskDirectory, taskCode, province), "文件列头不匹配");

        DataWithMetadataHandler[] handler = new DataWithMetadataHandler[HANDLER_SIZE];

        for (int i = 0; i < HANDLER_SIZE; i++) {
            handler[i] = new DataWithMetadataHandler(i, dataService, successCounters);
        }
        DataWithMetadataFactory factory = new DataWithMetadataFactory();

        Disruptor<DataWithMetadata> disruptor = new Disruptor<>(factory, RING_BUFFER_SIZE,
                (Runnable r) -> new Thread(new ThreadGroup("Data With Metadata Handler"), r), ProducerType.MULTI, new BlockingWaitStrategy());
        disruptor.handleEventsWithWorkerPool(handler);
        disruptor.start();

        ExecutorService executor = Executors.newFixedThreadPool(4, r -> new Thread(new ThreadGroup("Data Producer"), r));

        RingBuffer<DataWithMetadata> ringBuffer = disruptor.getRingBuffer();

        CountDownLatch latch = new CountDownLatch(taskItemFiles.size());
        for (TaskItemFileDto taskItemFile : taskItemFiles) {
            if (StringUtils.isEmpty(taskItemFile.getCsvFile())) {
                latch.countDown();
                continue;
            }
            executor.execute(() -> {
                String absolutePath = taskDirectory.getAbsolutePath() + "\\" + taskItemFile.getSignature() + "\\" + taskItemFile.getCsvFile();
                log.info("begin process local csv file : " + absolutePath);
                try {
                    executeTaskItemFileNative(taskConfigDto, taskItemFile, taskDirectory, ringBuffer);
                } catch (Throwable t) {
                    log.error("process local csv file : " + absolutePath + " error !" + t.getMessage(), t);
                } finally {
                    latch.countDown();
                    log.info("end process local csv file : " + absolutePath);
                }
            });
        }
        latch.await();

        executor.shutdown();

        disruptor.shutdown();

        countBusinessData(taskCode);
    }
}
