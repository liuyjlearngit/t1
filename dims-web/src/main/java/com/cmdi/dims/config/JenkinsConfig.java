package com.cmdi.dims.config;

import java.net.URI;
import java.net.URISyntaxException;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.offbytwo.jenkins.JenkinsServer;
import com.offbytwo.jenkins.JenkinsTriggerHelper;

@Configuration
public class JenkinsConfig {

    @Value("${jenkins.url}")
    private String url;

    @Value("${jenkins.username}")
    private String username;

    @Value("${jenkins.password}")
    private String password;

    @Bean
    public JenkinsServer jenkinsServer() throws URISyntaxException {
        return new JenkinsServer(new URI(url), username, password);
    }

    @Bean
    public JenkinsTriggerHelper jenkinsTriggerHelper(JenkinsServer jenkinsServer) {
        return new JenkinsTriggerHelper(jenkinsServer);
    }
}
