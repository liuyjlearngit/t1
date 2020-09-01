package com.cmdi.dims.batch;

import java.util.Map;
import java.util.concurrent.atomic.AtomicLong;

import com.cmdi.dims.domain.DataService;
import com.lmax.disruptor.WorkHandler;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class DataWithMetadataHandler implements WorkHandler<DataWithMetadata> {

    private int i;

    private DataService dataService;

    private Map<String, AtomicLong> successCounters;

    public DataWithMetadataHandler(int i, DataService dataService, Map<String, AtomicLong> successCounters) {
        this.i = i;
        this.dataService = dataService;
        this.successCounters = successCounters;
    }

    @Override
    public void onEvent(DataWithMetadata event) {
        log.debug("handler {} bucket load {}", i, event.getIndex());
        if (null != event.getParameters() && event.getParameters().size() > 0) {
            try {
                dataService.importData(event.getMetadata(), event.getParameters());
                successCounters.get(event.getMetadata().getEntityType().getCode().toUpperCase()).getAndAdd(event.getParameters().size());
            } catch (Exception e) {
                log.error(e.getMessage(), e);
            }
        } else {
            log.info("entity type [" + event.getMetadata().getEntityType().getName() + " - " + event.getMetadata().getEntityType().getCode() + "] data process finished");
        }
    }
}
