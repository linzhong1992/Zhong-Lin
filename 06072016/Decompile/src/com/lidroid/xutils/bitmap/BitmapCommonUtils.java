package com.lidroid.xutils.bitmap;

import com.lidroid.xutils.bitmap.core.*;
import java.io.*;
import com.lidroid.xutils.util.*;
import android.content.*;
import android.os.*;
import android.widget.*;
import java.lang.reflect.*;
import android.util.*;
import android.view.*;

public class BitmapCommonUtils
{
    private static BitmapSize screenSize;
    
    static {
        BitmapCommonUtils.screenSize = null;
    }
    
    public static long getAvailableSpace(final File file) {
        try {
            final StatFs statFs = new StatFs(file.getPath());
            return statFs.getBlockSize() * statFs.getAvailableBlocks();
        }
        catch (Throwable t) {
            LogUtils.e(t.getMessage(), t);
            return -1L;
        }
    }
    
    public static String getDiskCacheDir(final Context context, final String s) {
        String path = null;
        if ("mounted".equals(Environment.getExternalStorageState())) {
            final File externalCacheDir = context.getExternalCacheDir();
            path = path;
            if (externalCacheDir != null) {
                path = externalCacheDir.getPath();
            }
        }
        String path2;
        if ((path2 = path) == null) {
            path2 = context.getCacheDir().getPath();
        }
        return String.valueOf(path2) + File.separator + s;
    }
    
    private static int getImageViewFieldValue(final Object o, final String s) {
        int n2;
        final int n = n2 = 0;
        if (!(o instanceof ImageView)) {
            return n2;
        }
        try {
            final Field declaredField = ImageView.class.getDeclaredField(s);
            declaredField.setAccessible(true);
            final int intValue = (int)declaredField.get(o);
            n2 = n;
            if (intValue > 0) {
                n2 = n;
                if (intValue < Integer.MAX_VALUE) {
                    n2 = intValue;
                }
            }
            return n2;
        }
        catch (Throwable t) {
            return 0;
        }
    }
    
    public static BitmapSize getScreenSize(final Context context) {
        if (BitmapCommonUtils.screenSize == null) {
            BitmapCommonUtils.screenSize = new BitmapSize();
            final DisplayMetrics displayMetrics = context.getResources().getDisplayMetrics();
            BitmapCommonUtils.screenSize.setWidth(displayMetrics.widthPixels);
            BitmapCommonUtils.screenSize.setHeight(displayMetrics.heightPixels);
        }
        return BitmapCommonUtils.screenSize;
    }
    
    public static BitmapSize optimizeMaxSizeByView(final View view, int n, int n2) {
        final int n3 = n;
        final int n4 = n2;
        if (n3 > 0 && n4 > 0) {
            return new BitmapSize(n3, n4);
        }
        final ViewGroup$LayoutParams layoutParams = view.getLayoutParams();
        n = n4;
        int n5 = n3;
        if (layoutParams != null) {
            if (layoutParams.width > 0) {
                n2 = layoutParams.width;
            }
            else {
                n2 = n3;
                if (layoutParams.width != -2) {
                    n2 = view.getWidth();
                }
            }
            if (layoutParams.height > 0) {
                n = layoutParams.height;
                n5 = n2;
            }
            else {
                n = n4;
                n5 = n2;
                if (layoutParams.height != -2) {
                    n = view.getHeight();
                    n5 = n2;
                }
            }
        }
        if ((n2 = n5) <= 0) {
            n2 = getImageViewFieldValue(view, "mMaxWidth");
        }
        int imageViewFieldValue;
        if ((imageViewFieldValue = n) <= 0) {
            imageViewFieldValue = getImageViewFieldValue(view, "mMaxHeight");
        }
        final BitmapSize screenSize = getScreenSize(view.getContext());
        if ((n = n2) <= 0) {
            n = screenSize.getWidth();
        }
        if ((n2 = imageViewFieldValue) <= 0) {
            n2 = screenSize.getHeight();
        }
        return new BitmapSize(n, n2);
    }
}
