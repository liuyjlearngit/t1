package com.cmdi.dims.config;

import java.nio.charset.StandardCharsets;
import java.util.Base64;
import java.util.Set;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.util.Assert;

import lombok.extern.slf4j.Slf4j;
import com.cmdi.dims.util.AES;
import com.cmdi.dims.util.MAC;

@Slf4j
@Component
public class LicenseValidationOnStartup {

    @Value("${dims.license.key}")
    private String license;

   // @EventListener(ApplicationReadyEvent.class)
    public void validate() {
        Set<String> macs = MAC.getPhysicalAddress();
        Assert.hasText(license, "请配置License");

        String realLicense = new String(Base64.getDecoder().decode(license), StandardCharsets.UTF_8);
        String[] sections = StringUtils.split(realLicense, "$");
        Assert.state(sections.length == 3, "1.请配置正确的License");
        String key = sections[0];
        String iv = sections[1];
        String pass = sections[2];
        String mac = null;
        try {
            mac = AES.decrypt(pass, key, iv);
        } catch (Exception e) {
            Assert.state(false, "2.请输入正确的License");
        }
        Assert.state(macs.contains(mac), "3.请输入正确的License");
        log.warn("LICENSE VALIDATION SUCCESS!");
    }
}
