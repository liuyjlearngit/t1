package com.cmdi.dims.config.security;

import com.cmdi.dims.system.service.UserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.context.event.EventListener;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class SuperUserInitializeOnApplicationStartup {


    @Autowired
    UserInfoService userInfoService;

    @EventListener(ApplicationReadyEvent.class)
    public void checkSuperUser() {
        try {
            userInfoService.initializeSuperUser();
        } catch (Exception e) {
            log.error(e.getMessage(), e);
        }
    }

}
