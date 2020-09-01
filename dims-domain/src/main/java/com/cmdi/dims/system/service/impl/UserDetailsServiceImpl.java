package com.cmdi.dims.system.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.cmdi.dims.system.dto.UserDetailsDto;
import com.cmdi.dims.system.entity.Authorization;
import com.cmdi.dims.system.entity.Permission;
import com.cmdi.dims.system.entity.User;
import com.cmdi.dims.system.repository.AuthorizationRepository;
import com.cmdi.dims.system.repository.PermissionRepository;
import com.cmdi.dims.system.repository.UserRepository;

public class UserDetailsServiceImpl implements UserDetailsService {

    @Autowired
    UserRepository userRepository;

    @Autowired
    PermissionRepository permissionRepository;

    @Autowired
    AuthorizationRepository authorizationRepository;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userRepository.findByUsername(username);
        if (null == user) {
            throw new UsernameNotFoundException("当前用户【" + username + "】不存在！");
        }
        List<Authorization> authorizations = authorizationRepository.findByUserId(user.getUserId());
        List<Permission> permissions = null;
        if (null != authorizations && authorizations.size() > 0) {
            List<Long> permissionIds = new ArrayList<>();
            authorizations.forEach((a) -> {
                permissionIds.add(a.getPermissionId());
            });
            permissions = permissionRepository.findAllById(permissionIds);
        }
        return UserDetailsDto.newUserDetails(user, permissions);
    }
}
