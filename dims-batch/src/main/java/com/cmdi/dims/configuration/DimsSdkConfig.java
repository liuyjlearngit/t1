package com.cmdi.dims.configuration;

import com.cmdi.dims.sdk.ApiClient;
import com.cmdi.dims.sdk.api.ConfigRestApi;
import com.cmdi.dims.sdk.api.TaskRestApi;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

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
    public ConfigRestApi configRestApi() {
        return apiClient().buildClient(ConfigRestApi.class);
    }

    @Bean
    public TaskRestApi taskRestApi() {
        return apiClient().buildClient(TaskRestApi.class);
    }
}
