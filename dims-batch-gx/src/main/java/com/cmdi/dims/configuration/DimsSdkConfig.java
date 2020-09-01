package com.cmdi.dims.configuration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.fasterxml.jackson.databind.ObjectMapper;

import com.cmdi.dims.sdk.ApiClient;
import com.cmdi.dims.sdk.api.LockRestApi;
import com.cmdi.dims.sdk.api.MetaRestApi;
import com.cmdi.dims.sdk.api.TaskRestApi;

@Configuration
public class DimsSdkConfig {

    @Value("${dims.url}")
    private String baseUrl;
    @Autowired
    private ObjectMapper objectMapper;

    @Bean
    public ApiClient apiClient() {
        return new ApiClient(objectMapper, baseUrl);
    }

    @Bean
    public MetaRestApi metaRestApi() {
        return apiClient().buildClient(MetaRestApi.class);
    }

    @Bean
    public TaskRestApi taskRestApi() {
        return apiClient().buildClient(TaskRestApi.class);
    }

    @Bean
    public LockRestApi lockRestApi() {
        return apiClient().buildClient(LockRestApi.class);
    }

}
