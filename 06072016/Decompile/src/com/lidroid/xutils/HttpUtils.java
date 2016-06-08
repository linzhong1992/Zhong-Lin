package com.lidroid.xutils;

import java.util.concurrent.atomic.*;
import java.util.concurrent.*;
import org.apache.http.protocol.*;
import org.apache.http.conn.params.*;
import org.apache.http.params.*;
import org.apache.http.conn.scheme.*;
import org.apache.http.impl.conn.tsccm.*;
import org.apache.http.conn.*;
import com.lidroid.xutils.http.client.*;
import com.lidroid.xutils.http.client.entity.*;
import org.apache.http.*;
import org.apache.http.impl.client.*;
import com.lidroid.xutils.http.callback.*;
import com.lidroid.xutils.http.*;
import org.apache.http.client.methods.*;
import android.text.*;
import org.apache.http.conn.ssl.*;
import java.io.*;
import org.apache.http.client.*;

public class HttpUtils
{
    private static final int DEFAULT_CONN_TIMEOUT = 15000;
    private static final int DEFAULT_RETRY_TIMES = 5;
    private static final String ENCODING_GZIP = "gzip";
    private static final String HEADER_ACCEPT_ENCODING = "Accept-Encoding";
    private static Executor executor;
    public static final HttpCache sHttpCache;
    private static final ThreadFactory sThreadFactory;
    private static int threadPoolSize;
    private long currentRequestExpiry;
    private final DefaultHttpClient httpClient;
    private final HttpContext httpContext;
    private HttpRedirectHandler httpRedirectHandler;
    private String responseTextCharset;
    
    static {
        sHttpCache = new HttpCache();
        sThreadFactory = new ThreadFactory() {
            private final AtomicInteger mCount = new AtomicInteger(1);
            
            @Override
            public Thread newThread(final Runnable runnable) {
                final Thread thread = new Thread(runnable, "HttpUtils #" + this.mCount.getAndIncrement());
                thread.setPriority(4);
                return thread;
            }
        };
        HttpUtils.threadPoolSize = 3;
        HttpUtils.executor = Executors.newFixedThreadPool(HttpUtils.threadPoolSize, HttpUtils.sThreadFactory);
    }
    
    public HttpUtils() {
        this(15000);
    }
    
    public HttpUtils(final int n) {
        this.httpContext = (HttpContext)new BasicHttpContext();
        this.responseTextCharset = "UTF-8";
        this.currentRequestExpiry = HttpCache.getDefaultExpiryTime();
        final BasicHttpParams basicHttpParams = new BasicHttpParams();
        ConnManagerParams.setTimeout((HttpParams)basicHttpParams, (long)n);
        HttpConnectionParams.setSoTimeout((HttpParams)basicHttpParams, n);
        HttpConnectionParams.setConnectionTimeout((HttpParams)basicHttpParams, n);
        ConnManagerParams.setMaxConnectionsPerRoute((HttpParams)basicHttpParams, (ConnPerRoute)new ConnPerRouteBean(10));
        ConnManagerParams.setMaxTotalConnections((HttpParams)basicHttpParams, 10);
        HttpConnectionParams.setTcpNoDelay((HttpParams)basicHttpParams, true);
        HttpConnectionParams.setSocketBufferSize((HttpParams)basicHttpParams, 8192);
        HttpProtocolParams.setVersion((HttpParams)basicHttpParams, (ProtocolVersion)HttpVersion.HTTP_1_1);
        final SchemeRegistry schemeRegistry = new SchemeRegistry();
        schemeRegistry.register(new Scheme("http", (SocketFactory)PlainSocketFactory.getSocketFactory(), 80));
        schemeRegistry.register(new Scheme("https", (SocketFactory)DefaultSSLSocketFactory.getSocketFactory(), 443));
        (this.httpClient = new DefaultHttpClient((ClientConnectionManager)new ThreadSafeClientConnManager((HttpParams)basicHttpParams, schemeRegistry), (HttpParams)basicHttpParams)).setHttpRequestRetryHandler((HttpRequestRetryHandler)new RetryHandler(5));
        this.httpClient.addRequestInterceptor((HttpRequestInterceptor)new HttpRequestInterceptor() {
            public void process(final HttpRequest httpRequest, final HttpContext httpContext) throws HttpException, IOException {
                if (!httpRequest.containsHeader("Accept-Encoding")) {
                    httpRequest.addHeader("Accept-Encoding", "gzip");
                }
            }
        });
        this.httpClient.addResponseInterceptor((HttpResponseInterceptor)new HttpResponseInterceptor() {
            public void process(final HttpResponse httpResponse, final HttpContext httpContext) throws HttpException, IOException {
                final HttpEntity entity = httpResponse.getEntity();
                if (entity != null) {
                    final Header contentEncoding = entity.getContentEncoding();
                    if (contentEncoding != null) {
                        final HeaderElement[] elements = contentEncoding.getElements();
                        for (int length = elements.length, i = 0; i < length; ++i) {
                            if (elements[i].getName().equalsIgnoreCase("gzip")) {
                                httpResponse.setEntity((HttpEntity)new GZipDecompressingEntity(httpResponse.getEntity()));
                                return;
                            }
                        }
                    }
                }
            }
        });
    }
    
    private <T> HttpHandler<T> sendRequest(final com.lidroid.xutils.http.client.HttpRequest httpRequest, final RequestParams requestParams, final RequestCallBack<T> requestCallBack) {
        final HttpHandler httpHandler = new HttpHandler<Object>((AbstractHttpClient)this.httpClient, this.httpContext, this.responseTextCharset, requestCallBack);
        httpHandler.setExpiry(this.currentRequestExpiry);
        httpHandler.setHttpRedirectHandler(this.httpRedirectHandler);
        httpRequest.setRequestParams(requestParams, httpHandler);
        httpHandler.executeOnExecutor(HttpUtils.executor, httpRequest);
        return (HttpHandler<T>)httpHandler;
    }
    
    private ResponseStream sendSyncRequest(final com.lidroid.xutils.http.client.HttpRequest httpRequest, final RequestParams requestParams) throws com.lidroid.xutils.exception.HttpException {
        final SyncHttpHandler syncHttpHandler = new SyncHttpHandler((AbstractHttpClient)this.httpClient, this.httpContext, this.responseTextCharset);
        syncHttpHandler.setExpiry(this.currentRequestExpiry);
        syncHttpHandler.setHttpRedirectHandler(this.httpRedirectHandler);
        httpRequest.setRequestParams(requestParams);
        return syncHttpHandler.sendRequest(httpRequest);
    }
    
    public HttpUtils configCookieStore(final CookieStore cookieStore) {
        this.httpContext.setAttribute("http.cookie-store", (Object)cookieStore);
        return this;
    }
    
    public HttpUtils configCurrentHttpCacheExpiry(final long currentRequestExpiry) {
        this.currentRequestExpiry = currentRequestExpiry;
        return this;
    }
    
    public HttpUtils configDefaultHttpCacheExpiry(final long defaultExpiryTime) {
        HttpCache.setDefaultExpiryTime(defaultExpiryTime);
        this.currentRequestExpiry = HttpCache.getDefaultExpiryTime();
        return this;
    }
    
    public HttpUtils configHttpCacheSize(final int cacheSize) {
        HttpUtils.sHttpCache.setCacheSize(cacheSize);
        return this;
    }
    
    public HttpUtils configHttpRedirectHandler(final HttpRedirectHandler httpRedirectHandler) {
        this.httpRedirectHandler = httpRedirectHandler;
        return this;
    }
    
    public HttpUtils configRegisterScheme(final Scheme scheme) {
        this.httpClient.getConnectionManager().getSchemeRegistry().register(scheme);
        return this;
    }
    
    public HttpUtils configRequestRetryCount(final int n) {
        this.httpClient.setHttpRequestRetryHandler((HttpRequestRetryHandler)new RetryHandler(n));
        return this;
    }
    
    public HttpUtils configRequestThreadPoolSize(final int threadPoolSize) {
        if (threadPoolSize > 0 && threadPoolSize != HttpUtils.threadPoolSize) {
            HttpUtils.threadPoolSize = threadPoolSize;
            HttpUtils.executor = Executors.newFixedThreadPool(threadPoolSize, HttpUtils.sThreadFactory);
        }
        return this;
    }
    
    public HttpUtils configResponseTextCharset(final String responseTextCharset) {
        if (!TextUtils.isEmpty((CharSequence)responseTextCharset)) {
            this.responseTextCharset = responseTextCharset;
        }
        return this;
    }
    
    public HttpUtils configSSLSocketFactory(final SSLSocketFactory sslSocketFactory) {
        this.httpClient.getConnectionManager().getSchemeRegistry().register(new Scheme("https", (SocketFactory)sslSocketFactory, 443));
        return this;
    }
    
    public HttpUtils configTimeout(final int n) {
        final HttpParams params = this.httpClient.getParams();
        ConnManagerParams.setTimeout(params, (long)n);
        HttpConnectionParams.setSoTimeout(params, n);
        HttpConnectionParams.setConnectionTimeout(params, n);
        return this;
    }
    
    public HttpUtils configUserAgent(final String s) {
        HttpProtocolParams.setUserAgent(this.httpClient.getParams(), s);
        return this;
    }
    
    public HttpHandler<File> download(final com.lidroid.xutils.http.client.HttpRequest.HttpMethod httpMethod, final String s, final String s2, final RequestParams requestParams, final RequestCallBack<File> requestCallBack) {
        return this.download(httpMethod, s, s2, requestParams, false, false, requestCallBack);
    }
    
    public HttpHandler<File> download(final com.lidroid.xutils.http.client.HttpRequest.HttpMethod httpMethod, final String s, final String s2, final RequestParams requestParams, final boolean b, final RequestCallBack<File> requestCallBack) {
        return this.download(httpMethod, s, s2, requestParams, b, false, requestCallBack);
    }
    
    public HttpHandler<File> download(final com.lidroid.xutils.http.client.HttpRequest.HttpMethod httpMethod, final String s, final String s2, final RequestParams requestParams, final boolean b, final boolean b2, final RequestCallBack<File> requestCallBack) {
        if (s == null) {
            throw new IllegalArgumentException("url may not be null");
        }
        if (s2 == null) {
            throw new IllegalArgumentException("target may not be null");
        }
        final com.lidroid.xutils.http.client.HttpRequest httpRequest = new com.lidroid.xutils.http.client.HttpRequest(httpMethod, s);
        final HttpHandler httpHandler = new HttpHandler<Object>((AbstractHttpClient)this.httpClient, this.httpContext, this.responseTextCharset, requestCallBack);
        httpHandler.setExpiry(this.currentRequestExpiry);
        httpHandler.setHttpRedirectHandler(this.httpRedirectHandler);
        httpRequest.setRequestParams(requestParams, httpHandler);
        httpHandler.executeOnExecutor(HttpUtils.executor, httpRequest, s2, b, b2);
        return (HttpHandler<File>)httpHandler;
    }
    
    public HttpHandler<File> download(final String s, final String s2, final RequestParams requestParams, final RequestCallBack<File> requestCallBack) {
        return this.download(com.lidroid.xutils.http.client.HttpRequest.HttpMethod.GET, s, s2, requestParams, false, false, requestCallBack);
    }
    
    public HttpHandler<File> download(final String s, final String s2, final RequestParams requestParams, final boolean b, final RequestCallBack<File> requestCallBack) {
        return this.download(com.lidroid.xutils.http.client.HttpRequest.HttpMethod.GET, s, s2, requestParams, b, false, requestCallBack);
    }
    
    public HttpHandler<File> download(final String s, final String s2, final RequestParams requestParams, final boolean b, final boolean b2, final RequestCallBack<File> requestCallBack) {
        return this.download(com.lidroid.xutils.http.client.HttpRequest.HttpMethod.GET, s, s2, requestParams, b, b2, requestCallBack);
    }
    
    public HttpHandler<File> download(final String s, final String s2, final RequestCallBack<File> requestCallBack) {
        return this.download(com.lidroid.xutils.http.client.HttpRequest.HttpMethod.GET, s, s2, null, false, false, requestCallBack);
    }
    
    public HttpHandler<File> download(final String s, final String s2, final boolean b, final RequestCallBack<File> requestCallBack) {
        return this.download(com.lidroid.xutils.http.client.HttpRequest.HttpMethod.GET, s, s2, null, b, false, requestCallBack);
    }
    
    public HttpHandler<File> download(final String s, final String s2, final boolean b, final boolean b2, final RequestCallBack<File> requestCallBack) {
        return this.download(com.lidroid.xutils.http.client.HttpRequest.HttpMethod.GET, s, s2, null, b, b2, requestCallBack);
    }
    
    public HttpClient getHttpClient() {
        return (HttpClient)this.httpClient;
    }
    
    public <T> HttpHandler<T> send(final com.lidroid.xutils.http.client.HttpRequest.HttpMethod httpMethod, final String s, final RequestParams requestParams, final RequestCallBack<T> requestCallBack) {
        if (s == null) {
            throw new IllegalArgumentException("url may not be null");
        }
        return this.sendRequest(new com.lidroid.xutils.http.client.HttpRequest(httpMethod, s), requestParams, requestCallBack);
    }
    
    public <T> HttpHandler<T> send(final com.lidroid.xutils.http.client.HttpRequest.HttpMethod httpMethod, final String s, final RequestCallBack<T> requestCallBack) {
        return this.send(httpMethod, s, null, requestCallBack);
    }
    
    public ResponseStream sendSync(final com.lidroid.xutils.http.client.HttpRequest.HttpMethod httpMethod, final String s) throws com.lidroid.xutils.exception.HttpException {
        return this.sendSync(httpMethod, s, null);
    }
    
    public ResponseStream sendSync(final com.lidroid.xutils.http.client.HttpRequest.HttpMethod httpMethod, final String s, final RequestParams requestParams) throws com.lidroid.xutils.exception.HttpException {
        if (s == null) {
            throw new IllegalArgumentException("url may not be null");
        }
        return this.sendSyncRequest(new com.lidroid.xutils.http.client.HttpRequest(httpMethod, s), requestParams);
    }
}
