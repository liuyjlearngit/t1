package com.cmdi.dims.app.dto;

import lombok.Data;

@Data
public class ModifyPasswordForm {

    private String password;
    private String oldPassword;
}
