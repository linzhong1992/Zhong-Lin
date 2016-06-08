package com.lidroid.xutils.util;

import android.database.*;
import java.io.*;

public class IOUtils
{
    public static void closeQuietly(final Cursor cursor) {
        if (cursor == null) {
            return;
        }
        try {
            cursor.close();
        }
        catch (Throwable t) {}
    }
    
    public static void closeQuietly(final Closeable closeable) {
        if (closeable == null) {
            return;
        }
        try {
            closeable.close();
        }
        catch (Throwable t) {}
    }
}
