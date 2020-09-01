package com.cmdi.dims.web;

import java.util.Objects;

import com.cmdi.dims.system.dto.UserDetailsDto;
import com.cmdi.dims.system.dto.UserPasswordDto;
import com.cmdi.dims.system.service.UserInfoService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class UserInitializeController {

    @Autowired
    UserInfoService userInfoService;

    @RequestMapping(value = "/initialize", method = RequestMethod.GET)
    public String initialize() {
        return "initialize";
    }

    @RequestMapping(value = "/initialize", method = RequestMethod.POST)
    public String initialize(
            @RequestParam("oldPassword") String oldPassword,
            @RequestParam("newPassword") String newPassword,
            @RequestParam("retypedNewPassword") String retypedNewPassword, Model model) {
        if (StringUtils.isEmpty(oldPassword)) {
            model.addAttribute("message", "请输入旧密码");
            return "initialize";
        }
        if (StringUtils.isEmpty(newPassword)) {
            model.addAttribute("messsage", "请输入新密码");
            return "initialize";
        }
        if (StringUtils.isEmpty(retypedNewPassword)) {
            model.addAttribute("message", "请重新输入新密码");
            return "initialize";
        }
        if (!Objects.equals(newPassword, retypedNewPassword)) {
            model.addAttribute("message", "两次输入密码不一致");
            return "initialize";
        }
        UserDetailsDto principal = (UserDetailsDto) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        try {
            UserPasswordDto userPasswordDto = new UserPasswordDto();
            userPasswordDto.setUserId(principal.getUserId());
            userPasswordDto.setOldPassword(oldPassword);
            userPasswordDto.setPassword(newPassword);
            userInfoService.modifyPassword(userPasswordDto);
        } catch (Exception e) {
            log.error(e.getMessage(), e);
            model.addAttribute("message", e.getMessage());
            return "initialize";
        }

        return "redirect:/logout";
    }
}
