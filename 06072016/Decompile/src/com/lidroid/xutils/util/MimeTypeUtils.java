package com.lidroid.xutils.util;

import android.webkit.*;

public class MimeTypeUtils
{
    public static String getMimeType(String substring) {
        String mimeTypeFromExtension = "application/octet-stream";
        final int lastIndex = substring.lastIndexOf(".");
        if (lastIndex != -1) {
            substring = substring.substring(lastIndex + 1);
            mimeTypeFromExtension = MimeTypeMap.getSingleton().getMimeTypeFromExtension(substring);
        }
        return mimeTypeFromExtension;
    }
}
