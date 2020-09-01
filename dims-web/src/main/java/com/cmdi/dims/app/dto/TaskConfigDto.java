package com.cmdi.dims.app.dto;

import lombok.Data;

@Data
public class TaskConfigDto {

    private Long taskConfigId;

    private String name;

    private String code;

    private String province;

    private String specialityName;

    private String includeSpecialities;
}
