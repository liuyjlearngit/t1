package com.cmdi.dims.util;

import org.apache.commons.lang3.ArrayUtils;

import net.sourceforge.pinyin4j.PinyinHelper;
import org.apache.commons.lang3.StringUtils;

public class PinyinUtil {

    public static String convert(String str) {
        if(StringUtils.equalsIgnoreCase(str,"家客"))
            return "JIAKE" ;
        if(StringUtils.equalsIgnoreCase(str,"集客"))
            return "JIKE" ;
        StringBuffer resultPinyinStrBuf = new StringBuffer();

        for (int i = 0; i < str.length(); i++) {
            String[] mainPinyinStrOfChar = PinyinHelper.toHanyuPinyinStringArray(str.charAt(i));

            if (ArrayUtils.isNotEmpty(mainPinyinStrOfChar)) {
                resultPinyinStrBuf.append(Character.toUpperCase(mainPinyinStrOfChar[0].charAt(0)));
            } else {
                resultPinyinStrBuf.append(Character.toUpperCase(str.charAt(i)));
            }
        }
        return resultPinyinStrBuf.toString();
    }
}
