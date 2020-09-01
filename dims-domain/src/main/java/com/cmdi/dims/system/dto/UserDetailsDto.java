package com.cmdi.dims.system.dto;

import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.cmdi.dims.system.entity.Permission;
import com.cmdi.dims.system.entity.User;
import org.apache.commons.lang3.BooleanUtils;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class UserDetailsDto implements UserDetails {

    private User user;
    private Set<? extends GrantedAuthority> authorities;


    public void setUser(User user) {
        this.user = user;
    }

    public void setAuthorities(List<Permission> permissions) {
        HashSet<SimpleGrantedAuthority> authorities = new HashSet<>();
        if (null != permissions) {
            permissions.forEach((p) -> {
                authorities.add(new SimpleGrantedAuthority(p.getCode()));
            });
        }
        this.authorities = authorities;
    }

    public Long getUserId() {
        return user.getUserId();
    }

    public String getName() {
        return user.getName();
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return authorities;
    }

    @Override
    public String getPassword() {
        return user.getPassword();
    }

    @Override
    public String getUsername() {
        return user.getUsername();
    }

    @Override
    public boolean isAccountNonExpired() {
        return null != user.getAccountExpiredAt() ? user.getAccountExpiredAt().getTime() > System.currentTimeMillis() : true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return BooleanUtils.isNotFalse(user.getLocked());
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return null != user.getPasswordExpiredAt() ? user.getPasswordExpiredAt().getTime() > System.currentTimeMillis() : true;
    }

    @Override
    public boolean isEnabled() {
        return BooleanUtils.isNotFalse(user.getLocked());
    }

    public static UserDetailsDto newUserDetails(User user, List<Permission> permissions) {
        UserDetailsDto userDetails = new UserDetailsDto();
        userDetails.setUser(user);
        userDetails.setAuthorities(permissions);
        return userDetails;
    }

    public boolean isPasswordInitialized() {
        return BooleanUtils.isTrue(user.getPasswordInitialized());
    }
}
