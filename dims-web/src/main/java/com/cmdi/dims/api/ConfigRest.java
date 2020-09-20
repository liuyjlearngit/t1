package com.cmdi.dims.api;

import com.cmdi.dims.app.dto.ResponseDto;
import com.cmdi.dims.task.dto.TaskConfigDto;
import com.cmdi.dims.task.serivce.ConfigService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("/api/config")
@RestController
public class ConfigRest {

    @Autowired
    private ConfigService configService;

    @GetMapping("/loadConfig")
    public ResponseDto<TaskConfigDto> loadConfig(@RequestParam("province") String province, @RequestParam("specialityName") String specialityName) {
        return ResponseDto.success(configService.loadConfig(province, specialityName));
    }
}
