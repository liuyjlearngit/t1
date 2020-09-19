package com.cmdi.dims.api;

import com.cmdi.dims.app.dto.ResponseDto;
import com.cmdi.dims.task.dto.IndexProcDto;
import com.cmdi.dims.task.dto.TaskConfigDto;
import com.cmdi.dims.task.serivce.MetaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RequestMapping("/api/meta")
@RestController
public class MetaRest {

    @Autowired
    private MetaService metaService;

    @GetMapping("/loadConfig")
    public ResponseDto<TaskConfigDto> loadConfig(@RequestParam("province") String province, @RequestParam("specialityName") String specialityName) {
        return ResponseDto.success(metaService.loadConfig(province, specialityName));
    }

    @GetMapping("/loadIndexProcBySpeciality")
    public ResponseDto<List<IndexProcDto>> loadIndexProcBySpeciality(@RequestParam("speciality") String speciality) {
        return ResponseDto.success(metaService.loadIndexProcBySpeciality(speciality));
    }
}
