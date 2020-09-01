package com.cmdi.dims.common.util;

import java.net.URLEncoder;

public class UrlUtil {
    public static String urlEncode(String filename) {
        try {
            return URLEncoder.encode(filename, "UTF-8");
        } catch (Exception e) {
            return filename;
        }
    }
}
