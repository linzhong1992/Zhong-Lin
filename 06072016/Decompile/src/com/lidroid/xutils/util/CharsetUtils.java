package com.lidroid.xutils.util;

import java.util.*;

public class CharsetUtils
{
    public static final String DEFAULT_ENCODING_CHARSET = "ISO-8859-1";
    public static final List<String> SUPPORT_CHARSET;
    
    static {
        (SUPPORT_CHARSET = new ArrayList<String>()).add("ISO-8859-1");
        CharsetUtils.SUPPORT_CHARSET.add("GB2312");
        CharsetUtils.SUPPORT_CHARSET.add("GBK");
        CharsetUtils.SUPPORT_CHARSET.add("GB18030");
        CharsetUtils.SUPPORT_CHARSET.add("US-ASCII");
        CharsetUtils.SUPPORT_CHARSET.add("ASCII");
        CharsetUtils.SUPPORT_CHARSET.add("ISO-2022-KR");
        CharsetUtils.SUPPORT_CHARSET.add("ISO-8859-2");
        CharsetUtils.SUPPORT_CHARSET.add("ISO-2022-JP");
        CharsetUtils.SUPPORT_CHARSET.add("ISO-2022-JP-2");
        CharsetUtils.SUPPORT_CHARSET.add("UTF-8");
    }
    
    public static String getEncoding(final String s, final int n) {
        for (final String s2 : CharsetUtils.SUPPORT_CHARSET) {
            if (isCharset(s, s2, n)) {
                return s2;
            }
        }
        return "ISO-8859-1";
    }
    
    public static boolean isCharset(String substring, final String s, final int n) {
        try {
            if (substring.length() > n) {
                substring = substring.substring(0, n);
            }
            return substring.equals(new String(substring.getBytes(s), s));
        }
        catch (Throwable t) {
            return false;
        }
    }
    
    public static String toCharset(final String s, String s2, final int n) {
        try {
            s2 = new String(s.getBytes(getEncoding(s, n)), s2);
            return s2;
        }
        catch (Throwable t) {
            LogUtils.w(t);
            return s;
        }
    }
}
