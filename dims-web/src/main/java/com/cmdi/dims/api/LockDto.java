package com.cmdi.dims.api;

import java.util.Date;

import lombok.Data;

@Data
public class LockDto {
    private String province;
    private String speciality;
    private Date lockedAt;
}
