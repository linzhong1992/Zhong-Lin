package com.lidroid.xutils.bitmap.core;

import com.lidroid.xutils.util.*;
import java.io.*;
import android.content.res.*;
import android.graphics.*;

public class BitmapDecoder
{
    public static int calculateInSampleSize(final BitmapFactory$Options bitmapFactory$Options, final int n, final int n2) {
        final int outHeight = bitmapFactory$Options.outHeight;
        final int outWidth = bitmapFactory$Options.outWidth;
        int n3 = 1;
        if (outWidth > n || outHeight > n2) {
            if (outWidth > outHeight) {
                n3 = Math.round(outHeight / n2);
            }
            else {
                n3 = Math.round(outWidth / n);
            }
            while (outWidth * outHeight / (n3 * n3) > n * n2 * 2) {
                ++n3;
            }
        }
        return n3;
    }
    
    public static Bitmap decodeByteArray(final byte[] array) {
        final BitmapFactory$Options bitmapFactory$Options = new BitmapFactory$Options();
        bitmapFactory$Options.inPurgeable = true;
        bitmapFactory$Options.inInputShareable = true;
        try {
            return BitmapFactory.decodeByteArray(array, 0, array.length, bitmapFactory$Options);
        }
        catch (Throwable t) {
            LogUtils.e(t.getMessage(), t);
            return null;
        }
    }
    
    public static Bitmap decodeFile(final String s) {
        final BitmapFactory$Options bitmapFactory$Options = new BitmapFactory$Options();
        bitmapFactory$Options.inPurgeable = true;
        bitmapFactory$Options.inInputShareable = true;
        try {
            return BitmapFactory.decodeFile(s, bitmapFactory$Options);
        }
        catch (Throwable t) {
            LogUtils.e(t.getMessage(), t);
            return null;
        }
    }
    
    public static Bitmap decodeFileDescriptor(final FileDescriptor fileDescriptor) {
        final BitmapFactory$Options bitmapFactory$Options = new BitmapFactory$Options();
        bitmapFactory$Options.inPurgeable = true;
        bitmapFactory$Options.inInputShareable = true;
        try {
            return BitmapFactory.decodeFileDescriptor(fileDescriptor, (Rect)null, bitmapFactory$Options);
        }
        catch (Throwable t) {
            LogUtils.e(t.getMessage(), t);
            return null;
        }
    }
    
    public static Bitmap decodeResource(final Resources resources, final int n) {
        final BitmapFactory$Options bitmapFactory$Options = new BitmapFactory$Options();
        bitmapFactory$Options.inPurgeable = true;
        bitmapFactory$Options.inInputShareable = true;
        try {
            return BitmapFactory.decodeResource(resources, n, bitmapFactory$Options);
        }
        catch (Throwable t) {
            LogUtils.e(t.getMessage(), t);
            return null;
        }
    }
    
    public static Bitmap decodeSampledBitmapFromByteArray(final byte[] array, final BitmapSize bitmapSize, final Bitmap$Config inPreferredConfig) {
        final BitmapFactory$Options bitmapFactory$Options = new BitmapFactory$Options();
        bitmapFactory$Options.inJustDecodeBounds = true;
        bitmapFactory$Options.inPurgeable = true;
        bitmapFactory$Options.inInputShareable = true;
        BitmapFactory.decodeByteArray(array, 0, array.length, bitmapFactory$Options);
        bitmapFactory$Options.inSampleSize = calculateInSampleSize(bitmapFactory$Options, bitmapSize.getWidth(), bitmapSize.getHeight());
        bitmapFactory$Options.inJustDecodeBounds = false;
        if (inPreferredConfig != null) {
            bitmapFactory$Options.inPreferredConfig = inPreferredConfig;
        }
        try {
            return BitmapFactory.decodeByteArray(array, 0, array.length, bitmapFactory$Options);
        }
        catch (Throwable t) {
            LogUtils.e(t.getMessage(), t);
            return null;
        }
    }
    
    public static Bitmap decodeSampledBitmapFromDescriptor(final FileDescriptor fileDescriptor, final BitmapSize bitmapSize, final Bitmap$Config inPreferredConfig) {
        final BitmapFactory$Options bitmapFactory$Options = new BitmapFactory$Options();
        bitmapFactory$Options.inJustDecodeBounds = true;
        bitmapFactory$Options.inPurgeable = true;
        bitmapFactory$Options.inInputShareable = true;
        BitmapFactory.decodeFileDescriptor(fileDescriptor, (Rect)null, bitmapFactory$Options);
        bitmapFactory$Options.inSampleSize = calculateInSampleSize(bitmapFactory$Options, bitmapSize.getWidth(), bitmapSize.getHeight());
        bitmapFactory$Options.inJustDecodeBounds = false;
        if (inPreferredConfig != null) {
            bitmapFactory$Options.inPreferredConfig = inPreferredConfig;
        }
        try {
            return BitmapFactory.decodeFileDescriptor(fileDescriptor, (Rect)null, bitmapFactory$Options);
        }
        catch (Throwable t) {
            LogUtils.e(t.getMessage(), t);
            return null;
        }
    }
    
    public static Bitmap decodeSampledBitmapFromFile(final String s, final BitmapSize bitmapSize, final Bitmap$Config inPreferredConfig) {
        final BitmapFactory$Options bitmapFactory$Options = new BitmapFactory$Options();
        bitmapFactory$Options.inJustDecodeBounds = true;
        bitmapFactory$Options.inPurgeable = true;
        bitmapFactory$Options.inInputShareable = true;
        BitmapFactory.decodeFile(s, bitmapFactory$Options);
        bitmapFactory$Options.inSampleSize = calculateInSampleSize(bitmapFactory$Options, bitmapSize.getWidth(), bitmapSize.getHeight());
        bitmapFactory$Options.inJustDecodeBounds = false;
        if (inPreferredConfig != null) {
            bitmapFactory$Options.inPreferredConfig = inPreferredConfig;
        }
        try {
            return BitmapFactory.decodeFile(s, bitmapFactory$Options);
        }
        catch (Throwable t) {
            LogUtils.e(t.getMessage(), t);
            return null;
        }
    }
    
    public static Bitmap decodeSampledBitmapFromResource(final Resources resources, final int n, final BitmapSize bitmapSize, final Bitmap$Config inPreferredConfig) {
        final BitmapFactory$Options bitmapFactory$Options = new BitmapFactory$Options();
        bitmapFactory$Options.inJustDecodeBounds = true;
        bitmapFactory$Options.inPurgeable = true;
        bitmapFactory$Options.inInputShareable = true;
        BitmapFactory.decodeResource(resources, n, bitmapFactory$Options);
        bitmapFactory$Options.inSampleSize = calculateInSampleSize(bitmapFactory$Options, bitmapSize.getWidth(), bitmapSize.getHeight());
        bitmapFactory$Options.inJustDecodeBounds = false;
        if (inPreferredConfig != null) {
            bitmapFactory$Options.inPreferredConfig = inPreferredConfig;
        }
        try {
            return BitmapFactory.decodeResource(resources, n, bitmapFactory$Options);
        }
        catch (Throwable t) {
            LogUtils.e(t.getMessage(), t);
            return null;
        }
    }
}
