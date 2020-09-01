package com.cmdi.dims.common.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * @author admin
 */
public abstract class DateFormatUtil {

    private static final transient Log log = LogFactory.getLog(DateFormatUtil.class);

    public static final String DATETIME_FORMAT = "yyyy-MM-dd HH:mm:ss";

    public static final String DATETIME_NUMBER_FORMAT = "yyyyMMddHHmmss";

    public static final String DATE_FORMAT = "yyyy-MM-dd";

    public static final String TIME_FORMAT = "HH:mm:ss";

    private static ThreadLocal<DateFormat> datetimeFormat = new ThreadLocal<DateFormat>() {
        @Override
        protected synchronized DateFormat initialValue() {
            return new SimpleDateFormat(DATETIME_FORMAT);
        }
    };

    private static ThreadLocal<DateFormat> datetimeNumberFormat = new ThreadLocal<DateFormat>() {
        protected synchronized DateFormat initialValue() {
            return new SimpleDateFormat(DATETIME_NUMBER_FORMAT);
        }
    };

    private static ThreadLocal<DateFormat> dateFormat = new ThreadLocal<DateFormat>() {
        @Override
        protected synchronized DateFormat initialValue() {
            return new SimpleDateFormat(DATE_FORMAT);
        }
    };

    private static ThreadLocal<DateFormat> timeFormat = new ThreadLocal<DateFormat>() {
        @Override
        protected synchronized DateFormat initialValue() {
            return new SimpleDateFormat(TIME_FORMAT);
        }
    };

    private static DateFormat getDatetimeFormat() {
        return datetimeFormat.get();
    }

    private static DateFormat getDatatimeNumberFormat() {
        return datetimeNumberFormat.get();
    }

    private static DateFormat getDateFormat() {
        return dateFormat.get();
    }

    private static DateFormat getTimeFormat() {
        return timeFormat.get();
    }

    public static String toDatetimeString(Date date) {
        return getDatetimeFormat().format(date);
    }

    public static String toDatatimeNumberString(Date date) {
        return getDatatimeNumberFormat().format(date);
    }

    public static String toTimeString(Date date) {
        return getTimeFormat().format(date);
    }

    public static Date toDatetime(String string) {
        try {
            return getDatetimeFormat().parse(string);
        } catch (ParseException e) {
            if (log.isErrorEnabled()) {
                log.error(string, e);
            }
        }
        return null;
    }

    public static Date toDate(String string) {
        try {
            return getDateFormat().parse(string);
        } catch (ParseException e) {
            if (log.isErrorEnabled()) {
                log.error(string, e);
            }
        }
        return null;
    }

    public static Date toTime(String string) {
        try {
            return getTimeFormat().parse(string);
        } catch (ParseException e) {
            if (log.isErrorEnabled()) {
                log.error(string, e);
            }
        }
        return null;
    }

    public static String toDateString(Date date) {
        return getDateFormat().format(date);
    }

}