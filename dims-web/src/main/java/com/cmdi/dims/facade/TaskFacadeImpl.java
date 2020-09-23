package com.cmdi.dims.facade;

import com.cmdi.dims.task.entity.TaskConfig;
import com.cmdi.dims.task.serivce.ConfigService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class TaskFacadeImpl implements TaskFacade {

    @Autowired
    private ConfigService configService;
    @Autowired
    private JenkinsFacade jenkinsFacade;
    @Override
    public void startTask(Long taskConfigId) throws Exception {
        TaskConfig taskConfig = configService.findTaskConfigByTaskConfigId(taskConfigId);
        Assert.notNull(taskConfig, "task config not found");
        this.doStartTask(taskConfig.getProvince(), taskConfig.getSpecialityName());
    }

    private void doStartTask(String province, String speciality) throws Exception {
        jenkinsFacade.start(province, speciality);
    }
}
