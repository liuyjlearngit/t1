package com.cmdi.dims.web;

import com.cmdi.dims.util.SecurityUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginController {

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login() {
        if (SecurityUtil.isLoggedIn()) {
            return "redirect:/";
        }
        return "login";
    }

}
