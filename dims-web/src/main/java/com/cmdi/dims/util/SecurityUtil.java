package com.cmdi.dims.util;

import com.cmdi.dims.system.dto.UserDetailsDto;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;

public class SecurityUtil {

    public static boolean isLoggedIn() {
        return SecurityContextHolder.getContext().getAuthentication() != null &&
                SecurityContextHolder.getContext().getAuthentication().isAuthenticated() &&
                //when Anonymous Authentication is enabled
                !(SecurityContextHolder.getContext().getAuthentication()
                        instanceof AnonymousAuthenticationToken);
    }

    public static String getUsername() {
        if (null != SecurityContextHolder.getContext().getAuthentication() &&
                SecurityContextHolder.getContext().getAuthentication().getPrincipal() instanceof UserDetailsDto) {
            return ((UserDetailsDto) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUsername();
        }
        return "anon";
    }
}
