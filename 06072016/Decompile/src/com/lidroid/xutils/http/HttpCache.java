package com.lidroid.xutils.http;

import java.util.concurrent.*;
import com.lidroid.xutils.util.core.*;
import com.lidroid.xutils.http.client.*;
import android.text.*;

public class HttpCache
{
    private static final int DEFAULT_CACHE_SIZE = 102400;
    private static final long DEFAULT_EXPIRY_TIME = 60000L;
    private static long defaultExpiryTime;
    private static final ConcurrentHashMap<String, Boolean> httpMethod_enabled_map;
    private int cacheSize;
    private final LruMemoryCache<String, String> mMemoryCache;
    
    static {
        HttpCache.defaultExpiryTime = 60000L;
        (httpMethod_enabled_map = new ConcurrentHashMap<String, Boolean>(10)).put(HttpRequest.HttpMethod.GET.toString(), true);
    }
    
    public HttpCache() {
        this(102400, 60000L);
    }
    
    public HttpCache(final int cacheSize, final long defaultExpiryTime) {
        this.cacheSize = 102400;
        this.cacheSize = cacheSize;
        HttpCache.defaultExpiryTime = defaultExpiryTime;
        this.mMemoryCache = new LruMemoryCache<String, String>(this.cacheSize) {
            @Override
            protected int sizeOf(final String s, final String s2) {
                if (s2 == null) {
                    return 0;
                }
                return s2.length();
            }
        };
    }
    
    public static long getDefaultExpiryTime() {
        return HttpCache.defaultExpiryTime;
    }
    
    public static void setDefaultExpiryTime(final long defaultExpiryTime) {
        HttpCache.defaultExpiryTime = defaultExpiryTime;
    }
    
    public void clear() {
        this.mMemoryCache.evictAll();
    }
    
    public String get(final String s) {
        if (s != null) {
            return this.mMemoryCache.get(s);
        }
        return null;
    }
    
    public boolean isEnabled(final HttpRequest.HttpMethod httpMethod) {
        if (httpMethod != null) {
            final Boolean b = HttpCache.httpMethod_enabled_map.get(httpMethod.toString());
            if (b != null) {
                return b;
            }
        }
        return false;
    }
    
    public boolean isEnabled(final String s) {
        if (!TextUtils.isEmpty((CharSequence)s)) {
            final Boolean b = HttpCache.httpMethod_enabled_map.get(s.toUpperCase());
            if (b != null) {
                return b;
            }
        }
        return false;
    }
    
    public void put(final String s, final String s2) {
        this.put(s, s2, HttpCache.defaultExpiryTime);
    }
    
    public void put(final String s, final String s2, final long n) {
        if (s == null || s2 == null || n < 1L) {
            return;
        }
        this.mMemoryCache.put(s, s2, System.currentTimeMillis() + n);
    }
    
    public void setCacheSize(final int maxSize) {
        this.mMemoryCache.setMaxSize(maxSize);
    }
    
    public void setEnabled(final HttpRequest.HttpMethod httpMethod, final boolean b) {
        HttpCache.httpMethod_enabled_map.put(httpMethod.toString(), b);
    }
}
