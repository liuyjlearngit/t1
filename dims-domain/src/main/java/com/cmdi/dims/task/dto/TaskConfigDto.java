package com.cmdi.dims.task.dto;

import java.util.List;
import java.util.Map;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class TaskConfigDto {

    private Long taskConfigId;

    private String province;

    private String speciality;

    private String name;

    private String code;

    private String includeSpecialities;

    private List<FileLocationDto> locations;

    private Map<String, String> tables;

    private Map<String, String> tableSpecialityMappings;
}
