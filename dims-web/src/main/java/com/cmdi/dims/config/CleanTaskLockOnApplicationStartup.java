package com.cmdi.dims.config;

import com.cmdi.dims.task.serivce.LockService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.context.event.EventListener;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class CleanTaskLockOnApplicationStartup {

    @Autowired
    private LockService lockService;

    @EventListener(ApplicationReadyEvent.class)
    public void checkSuperUser() {
        try {
            lockService.cleanLockAfterStartup();
            log.info("CLEAN TASK LOCK AFTER APPLICATION STARTUP SUCCESS !");
        } catch (Exception e) {
            log.error("CLEAN TASK LOCK AFTER APPLICATION STARTUP FAILURE !" + e.getMessage(), e);
        }
    }
}
