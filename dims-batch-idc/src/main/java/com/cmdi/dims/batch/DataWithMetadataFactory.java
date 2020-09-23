package com.cmdi.dims.batch;

import com.lmax.disruptor.EventFactory;

public class DataWithMetadataFactory implements EventFactory<DataWithMetadata> {
    @Override
    public DataWithMetadata newInstance() {
        return new DataWithMetadata();
    }
}
