package com.lidroid.xutils.http.client;

import org.apache.http.client.*;
import java.util.*;
import org.apache.http.*;
import java.net.*;
import javax.net.ssl.*;
import java.io.*;
import org.apache.http.protocol.*;
import org.apache.http.client.methods.*;
import org.apache.http.impl.client.*;
import com.lidroid.xutils.util.*;
import android.os.*;

public class RetryHandler implements HttpRequestRetryHandler
{
    private static final int RETRY_SLEEP_INTERVAL = 500;
    private static HashSet<Class<?>> exceptionBlackList;
    private static HashSet<Class<?>> exceptionWhiteList;
    private final int maxRetries;
    
    static {
        RetryHandler.exceptionWhiteList = new HashSet<Class<?>>();
        RetryHandler.exceptionBlackList = new HashSet<Class<?>>();
        RetryHandler.exceptionWhiteList.add(NoHttpResponseException.class);
        RetryHandler.exceptionWhiteList.add(UnknownHostException.class);
        RetryHandler.exceptionWhiteList.add(SocketException.class);
        RetryHandler.exceptionBlackList.add(InterruptedIOException.class);
        RetryHandler.exceptionBlackList.add(SSLHandshakeException.class);
    }
    
    public RetryHandler(final int maxRetries) {
        this.maxRetries = maxRetries;
    }
    
    public boolean retryRequest(final IOException ex, final int n, final HttpContext httpContext) {
        boolean booleanValue = false;
        boolean b = true;
        if (ex == null || httpContext == null) {
            return false;
        }
        final Object attribute = httpContext.getAttribute("http.request_sent");
    Label_0085:
        while (true) {
            while (true) {
                Label_0042: {
                    while (true) {
                        Label_0031: {
                            if (attribute == null) {
                                break Label_0031;
                            }
                            Label_0099: {
                                break Label_0099;
                                while (true) {
                                    try {
                                        final Object attribute2 = httpContext.getAttribute("http.request");
                                        boolean b2;
                                        if (attribute2 != null) {
                                            if (attribute2 instanceof HttpRequestBase) {
                                                b2 = "GET".equals(((HttpRequestBase)attribute2).getMethod());
                                            }
                                            else {
                                                b2 = b;
                                                if (attribute2 instanceof RequestWrapper) {
                                                    b2 = "GET".equals(((RequestWrapper)attribute2).getMethod());
                                                }
                                            }
                                        }
                                        else {
                                            b2 = false;
                                            LogUtils.e("retry error, curr request is null");
                                        }
                                        if (b2) {
                                            SystemClock.sleep(500L);
                                        }
                                        return b2;
                                        Label_0131: {
                                            b = true;
                                        }
                                        // iftrue(Label_0150:, !RetryHandler.exceptionWhiteList.contains((Object)ex.getClass()))
                                        break Label_0042;
                                        // iftrue(Label_0131:, !RetryHandler.exceptionBlackList.contains((Object)ex.getClass()))
                                        while (true) {
                                            Block_8: {
                                                break Block_8;
                                                booleanValue = (boolean)attribute;
                                                break;
                                                b = true;
                                                break Label_0042;
                                            }
                                            b = false;
                                            break Label_0042;
                                            Label_0150: {
                                                continue;
                                            }
                                        }
                                    }
                                    // iftrue(Label_0042:, booleanValue)
                                    catch (Throwable t) {
                                        final boolean b2 = false;
                                        LogUtils.e("retry error", t);
                                        continue Label_0085;
                                    }
                                    continue Label_0085;
                                }
                            }
                        }
                        if (n <= this.maxRetries) {
                            continue;
                        }
                        break;
                    }
                    b = false;
                }
                boolean b2 = b;
                if (b) {
                    continue;
                }
                break;
            }
            continue Label_0085;
        }
    }
}
