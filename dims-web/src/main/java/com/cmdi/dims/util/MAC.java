package com.cmdi.dims.util;

import java.net.NetworkInterface;
import java.util.Enumeration;
import java.util.HashSet;
import java.util.Set;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class MAC {

    public static Set<String> getPhysicalAddress() {
        Set<String> macs = new HashSet<>();
        String format = "%02X";
        try {

            Enumeration<NetworkInterface> nis = NetworkInterface.getNetworkInterfaces();
            while (nis.hasMoreElements()) {
                NetworkInterface ni = nis.nextElement();
                byte mac[] = ni.getHardwareAddress(); // Physical Address (MAC - Medium Access Control)
                if (mac != null) {
                    final StringBuilder macAddress = new StringBuilder();
                    for (int i = 0; i < mac.length; i++) {
                        macAddress.append(String.format("%s" + format, (i == 0) ? "" : ":", mac[i]));
                    }
                    macs.add(macAddress.toString().toUpperCase());
                }
            }
        } catch (Exception ex) {
            log.error(ex.getMessage(), ex);
        }
        return macs;
    }
}
