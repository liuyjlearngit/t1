package com.cmdi.dims.app.dto;

import io.swagger.annotations.ApiModel;
import lombok.Builder;
import lombok.Data;

import java.util.List;

@ApiModel("核查的指标")
@Data
@Builder
public class PointerTypes {
    private String specialityType;
    private List<PointerType> specialityValue;
}
