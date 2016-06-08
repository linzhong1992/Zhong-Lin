package com.lidroid.xutils.bitmap.download;

import android.content.*;
import java.io.*;
import com.lidroid.xutils.*;

public abstract class Downloader
{
    private Context context;
    private int defaultConnectTimeout;
    private long defaultExpiry;
    private int defaultReadTimeout;
    
    public abstract long downloadToStream(final String p0, final OutputStream p1, final BitmapUtils.BitmapLoadTask<?> p2);
    
    public Context getContext() {
        return this.context;
    }
    
    public int getDefaultConnectTimeout() {
        return this.defaultConnectTimeout;
    }
    
    public long getDefaultExpiry() {
        return this.defaultExpiry;
    }
    
    public int getDefaultReadTimeout() {
        return this.defaultReadTimeout;
    }
    
    public void setContext(final Context context) {
        this.context = context;
    }
    
    public void setDefaultConnectTimeout(final int defaultConnectTimeout) {
        this.defaultConnectTimeout = defaultConnectTimeout;
    }
    
    public void setDefaultExpiry(final long defaultExpiry) {
        this.defaultExpiry = defaultExpiry;
    }
    
    public void setDefaultReadTimeout(final int defaultReadTimeout) {
        this.defaultReadTimeout = defaultReadTimeout;
    }
}
