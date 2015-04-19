package com._30.common.util;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.lang.StringUtils;

public class DateUtils {

    /**
     * 
     * @param format
     *            if null then MM月dd日HH时mm分
     * @return
     */

    private final static String FORMAT = "MM月dd日HH时mm分";

    public static String getCurrent(String format) {

        if (StringUtils.isBlank(format)) {
            format = FORMAT;
        }

        DateFormat df = new SimpleDateFormat(format);

        return df.format(new Date());

    }

}
