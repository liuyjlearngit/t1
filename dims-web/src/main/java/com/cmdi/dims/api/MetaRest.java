package com.cmdi.dims.api;

import java.util.List;

import com.cmdi.dims.app.dto.ResponseDto;
import com.cmdi.dims.task.dto.IndexProcDto;
import com.cmdi.dims.task.dto.MetadataDto;
import com.cmdi.dims.task.dto.TaskConfigDto;
import com.cmdi.dims.task.serivce.MetaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("/api/meta")
@RestController
public class MetaRest {

    @Autowired
    private MetaService metaService;

    @GetMapping("/loadMetadata")
    public ResponseDto<MetadataDto> loadMetadata(@RequestParam("tableName") String tableName, @RequestParam("specialityName") String specialityName) {
        return ResponseDto.success(metaService.loadMetadata(tableName, specialityName));
    }

    @GetMapping("/loadConfig")
    public ResponseDto<TaskConfigDto> loadConfig(@RequestParam("province") String province, @RequestParam("specialityName") String specialityName) {
        return ResponseDto.success(metaService.loadConfig(province, specialityName));
    }

    @GetMapping("/loadAllTables")
    public ResponseDto<List<String>> loadAllTables() {
        return ResponseDto.success(metaService.loadAllTables());
    }

    @GetMapping("/loadIndexProcBySpeciality")
    public ResponseDto<List<IndexProcDto>> loadIndexProcBySpeciality(@RequestParam("speciality") String speciality) {
        return ResponseDto.success(metaService.loadIndexProcBySpeciality(speciality));
    }
}
