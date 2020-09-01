package com.cmdi.dims.config;

import com.cmdi.dims.config.security.IssueDataInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.Ordered;
import org.springframework.web.servlet.config.annotation.*;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

    @Override
    public void addViewControllers(ViewControllerRegistry registry) {
        registry.addViewController("/system").setViewName("system");
        registry.addViewController("/system/**").setViewName("system");
        registry.addViewController("/meta").setViewName("meta");
        registry.addViewController("/meta/**").setViewName("meta");
        registry.addViewController("/collector").setViewName("collector");
        registry.addViewController("/collector/**").setViewName("collector");
        registry.addViewController("/indicator").setViewName("indicator");
        registry.addViewController("/indicator/**").setViewName("indicator");
        registry.addViewController("/attachment").setViewName("attachment");
        registry.addViewController("/attachment/**").setViewName("attachment");
        registry.addViewController("/report").setViewName("report");
        registry.addViewController("/report/**").setViewName("report");
        registry.addViewController("/admin").setViewName("admin");
        registry.addViewController("/admin/**").setViewName("admin");
        registry.setOrder(Ordered.HIGHEST_PRECEDENCE);
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/swagger-ui.html").addResourceLocations("classpath:/META-INF/resources/");
        registry.addResourceHandler("/download/**").addResourceLocations("classpath:/download/");
    }


    @Autowired
    private IssueDataInterceptor issueDataInterceptor;
    /**
     * 拦截器配置
     * @param registry
     */
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        //拦截登录
        InterceptorRegistration addInterceptor = registry.addInterceptor(issueDataInterceptor);

        addInterceptor.addPathPatterns("/app/v1/statistic/issue/data/export");
        addInterceptor.addPathPatterns("/app/v1/statistic/issue/data/batchexport");
    }
}
