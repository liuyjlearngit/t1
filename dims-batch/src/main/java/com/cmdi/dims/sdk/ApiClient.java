package com.cmdi.dims.sdk;

import com.fasterxml.jackson.databind.ObjectMapper;

import feign.Feign;
import feign.form.FormEncoder;
import feign.httpclient.ApacheHttpClient;
import feign.jackson.JacksonDecoder;
import feign.jackson.JacksonEncoder;
import feign.slf4j.Slf4jLogger;

public class ApiClient {
    public interface Api {
    }

    private String basePath;
    private Feign.Builder feignBuilder;

    public ApiClient(ObjectMapper objectMapper, String basePath) {
        this.basePath = basePath;
        feignBuilder = Feign.builder()
                .encoder(new FormEncoder(new JacksonEncoder(objectMapper)))
                .decoder(new JacksonDecoder(objectMapper))
                .client(new ApacheHttpClient())
                .logger(new Slf4jLogger());
    }

    /**
     * Creates a feign client for given API interface.
     * <p>
     * Usage:
     * ApiClient apiClient = new ApiClient();
     * apiClient.setBasePath("http://localhost:8080");
     * XYZApi api = apiClient.buildClient(XYZApi.class);
     * XYZResponse response = api.someMethod(...);
     *
     * @param <T>         Type
     * @param clientClass Client class
     * @return The Client
     */
    public <T extends Api> T buildClient(Class<T> clientClass) {
        return feignBuilder.target(clientClass, basePath);
    }
}
