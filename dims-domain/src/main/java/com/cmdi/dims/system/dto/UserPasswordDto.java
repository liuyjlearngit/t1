package com.cmdi.dims.system.dto;

import lombok.Data;

@Data
public class UserPasswordDto {

    private Long userId;
    private String oldPassword;
    private String password;
}
