package com.cmdi.dims.app;


import static org.springframework.http.ResponseEntity.ok;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.stream.Collectors;

import com.cmdi.dims.app.dto.AuthenticationRequest;
import com.cmdi.dims.app.dto.ModifyPasswordForm;
import com.cmdi.dims.app.dto.ResponseDto;
import com.cmdi.dims.config.security.InvalidJwtAuthenticationException;
import com.cmdi.dims.config.security.JwtTokenProvider;
import com.cmdi.dims.system.entity.Authorization;
import com.cmdi.dims.system.entity.Permission;
import com.cmdi.dims.system.entity.User;
import com.cmdi.dims.system.repository.AuthorizationRepository;
import com.cmdi.dims.system.repository.PermissionRepository;
import com.cmdi.dims.system.repository.UserRepository;
import com.cmdi.dims.util.SecurityUtil;
import org.apache.commons.collections4.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import io.jsonwebtoken.lang.Assert;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/app/v1/auth")
public class AuthenticationRestController {

    @Autowired
    AuthenticationManager authenticationManager;

    @Autowired
    JwtTokenProvider jwtTokenProvider;

    @Autowired
    UserRepository userRepository;

    @Autowired
    PermissionRepository permissionRepository;

    @Autowired
    AuthorizationRepository authorizationRepository;

    @Autowired
    PasswordEncoder passwordEncoder;

    @PostMapping("/login")
    public ResponseEntity signin(@RequestBody AuthenticationRequest data) {

        try {
            String username = data.getUsername();
            authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(username, data.getPassword()));
            User user = userRepository.findByUsername(username);
            if (null == user) {
                throw new UsernameNotFoundException("Username " + username + "not found");
            }
            String token = jwtTokenProvider.createToken(username, Collections.emptyList());

            List<Authorization> authorizations = authorizationRepository.findByUserId(user.getUserId());
            List<String> permissions = new ArrayList<>();
            if (CollectionUtils.isNotEmpty(authorizations)) {
                List<Permission> permissionList = permissionRepository.findAllById(authorizations.stream().map(Authorization::getPermissionId).collect(Collectors.toList()));
                permissions = permissionList.stream().map(Permission::getCode).collect(Collectors.toList());
            }
            Map<Object, Object> model = new HashMap<>();
            model.put("username", username);
            model.put("name", user.getName());
            model.put("userId",user.getUserId());
            model.put("token", token);
            model.put("permissions", permissions);
            model.put("regionType",user.getRegionType());
            model.put("regionCode",user.getRegionCode());
            return ok(model);
        } catch (AuthenticationException e) {
            throw new BadCredentialsException("Invalid username/password supplied");
        }
    }

    @GetMapping("/me")
    public ResponseEntity me() {
        User user = userRepository.findByUsername(SecurityUtil.getUsername());
        if (null == user) {
            throw new InvalidJwtAuthenticationException("User not found");
        }
        List<Authorization> authorizations = authorizationRepository.findByUserId(user.getUserId());
        List<String> permissions = new ArrayList<>();
        if (CollectionUtils.isNotEmpty(authorizations)) {
            List<Permission> permissionList = permissionRepository.findAllById(authorizations.stream().map(Authorization::getPermissionId).collect(Collectors.toList()));
            permissions = permissionList.stream().map(Permission::getCode).collect(Collectors.toList());
        }
        Map<Object, Object> model = new HashMap<>();
        model.put("username", user.getUsername());
        model.put("name", user.getName());
        model.put("permissions", permissions);
        model.put("userId",user.getUserId());
        model.put("regionType",user.getRegionType());
        model.put("regionCode",user.getRegionCode());
        return ok(model);
    }

    @PostMapping("/modifyPassword")
    public ResponseDto<Void> modifyPassword(@RequestBody ModifyPasswordForm form) {
        User user = userRepository.findByUsername(SecurityUtil.getUsername());
        if (null == user) {
            throw new InvalidJwtAuthenticationException("User not found");
        }
        Assert.state(passwordEncoder.matches(form.getOldPassword(), user.getPassword()), "输入的旧密码与当前密码不一致");
        Assert.state(!Objects.equals(form.getOldPassword(), form.getPassword()), "输入的新密码与旧密码不能相同");
        Assert.hasText(form.getPassword(), "新密码不能为空");
        String encoded = passwordEncoder.encode(form.getPassword());
        user.setPassword(encoded);
        userRepository.save(user);
        return ResponseDto.success();
    }
}
