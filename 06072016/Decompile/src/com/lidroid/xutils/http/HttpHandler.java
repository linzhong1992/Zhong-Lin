package com.lidroid.xutils.http;

import com.lidroid.xutils.util.core.*;
import org.apache.http.impl.client.*;
import org.apache.http.protocol.*;
import com.lidroid.xutils.exception.*;
import com.lidroid.xutils.util.*;
import com.lidroid.xutils.*;
import com.lidroid.xutils.http.callback.*;
import java.io.*;
import org.apache.http.client.methods.*;
import org.apache.http.client.*;
import android.os.*;
import java.net.*;
import org.apache.http.*;

public class HttpHandler<T> extends CompatibleAsyncTask<Object, Object, Void> implements RequestCallBackHandler
{
    private static final int UPDATE_FAILURE = 3;
    private static final int UPDATE_LOADING = 2;
    private static final int UPDATE_START = 1;
    private static final int UPDATE_SUCCESS = 4;
    private static final NotUseApacheRedirectHandler notUseApacheRedirectHandler;
    private boolean autoRename;
    private boolean autoResume;
    private RequestCallBack<T> callback;
    private String charset;
    private final AbstractHttpClient client;
    private final HttpContext context;
    private long expiry;
    private String fileSavePath;
    private HttpRedirectHandler httpRedirectHandler;
    private boolean isDownloadingFile;
    private boolean isUploading;
    private long lastUpdateTime;
    private final FileDownloadHandler mFileDownloadHandler;
    private final StringDownloadHandler mStringDownloadHandler;
    private HttpRequestBase request;
    private String requestMethod;
    private String requestUrl;
    private int retriedCount;
    private State state;
    
    static {
        notUseApacheRedirectHandler = new NotUseApacheRedirectHandler(null);
    }
    
    public HttpHandler(final AbstractHttpClient client, final HttpContext context, final String charset, final RequestCallBack<T> callback) {
        this.mStringDownloadHandler = new StringDownloadHandler();
        this.mFileDownloadHandler = new FileDownloadHandler();
        this.isUploading = true;
        this.retriedCount = 0;
        this.fileSavePath = null;
        this.isDownloadingFile = false;
        this.autoResume = false;
        this.autoRename = false;
        this.state = State.WAITING;
        this.expiry = HttpCache.getDefaultExpiryTime();
        this.client = client;
        this.context = context;
        this.callback = callback;
        this.charset = charset;
        this.client.setRedirectHandler((RedirectHandler)HttpHandler.notUseApacheRedirectHandler);
    }
    
    private ResponseInfo<T> handleResponse(final HttpResponse httpResponse) throws HttpException, IOException {
        final String s = null;
        if (httpResponse == null) {
            throw new HttpException("response is null");
        }
        if (!this.isCancelled()) {
            final StatusLine statusLine = httpResponse.getStatusLine();
            final int statusCode = statusLine.getStatusCode();
            if (statusCode < 300) {
                Object o = null;
                final HttpEntity entity = httpResponse.getEntity();
                if (entity != null) {
                    this.isUploading = false;
                    if (this.isDownloadingFile) {
                        this.autoResume = (this.autoResume && OtherUtils.isSupportRange(httpResponse));
                        String fileNameFromHttpResponse = s;
                        if (this.autoRename) {
                            fileNameFromHttpResponse = OtherUtils.getFileNameFromHttpResponse(httpResponse);
                        }
                        o = this.mFileDownloadHandler.handleEntity(entity, this, this.fileSavePath, this.autoResume, fileNameFromHttpResponse);
                    }
                    else {
                        final String s2 = (String)(o = this.mStringDownloadHandler.handleEntity(entity, this, this.charset));
                        if (HttpUtils.sHttpCache.isEnabled(this.requestMethod)) {
                            HttpUtils.sHttpCache.put(this.requestUrl, s2, this.expiry);
                            o = s2;
                        }
                    }
                }
                return new ResponseInfo<T>(httpResponse, o, false);
            }
            if (statusCode == 301 || statusCode == 302) {
                if (this.httpRedirectHandler == null) {
                    this.httpRedirectHandler = new DefaultHttpRedirectHandler();
                }
                final HttpRequestBase directRequest = this.httpRedirectHandler.getDirectRequest(httpResponse);
                if (directRequest != null) {
                    return this.sendRequest(directRequest);
                }
            }
            else {
                if (statusCode == 416) {
                    throw new HttpException(statusCode, "maybe the file has downloaded completely");
                }
                throw new HttpException(statusCode, statusLine.getReasonPhrase());
            }
        }
        return null;
    }
    
    private ResponseInfo<T> sendRequest(final HttpRequestBase httpRequestBase) throws HttpException {
        final HttpRequestRetryHandler httpRequestRetryHandler = this.client.getHttpRequestRetryHandler();
        if (this.autoResume && this.isDownloadingFile) {
            final File file = new File(this.fileSavePath);
            long length;
            final long n = length = 0L;
            if (file.isFile()) {
                length = n;
                if (file.exists()) {
                    length = file.length();
                }
            }
            if (length > 0L) {
                httpRequestBase.setHeader("RANGE", "bytes=" + length + "-");
            }
        }
        try {
            this.requestMethod = httpRequestBase.getMethod();
            if (HttpUtils.sHttpCache.isEnabled(this.requestMethod)) {
                final String value = HttpUtils.sHttpCache.get(this.requestUrl);
                if (value != null) {
                    return new ResponseInfo<T>(null, value, true);
                }
            }
            if (!this.isCancelled()) {
                return this.handleResponse(this.client.execute((HttpUriRequest)httpRequestBase, this.context));
            }
        }
        catch (UnknownHostException ex) {
            httpRequestRetryHandler.retryRequest(ex, ++this.retriedCount, this.context);
        }
        catch (IOException ex) {
            httpRequestRetryHandler.retryRequest(ex, ++this.retriedCount, this.context);
            goto Label_0208;
        }
        catch (NullPointerException ex2) {
            final IOException ex = new IOException(ex2.getMessage());
            ex.initCause(ex2);
            httpRequestRetryHandler.retryRequest(ex, ++this.retriedCount, this.context);
            goto Label_0208;
        }
        catch (HttpException ex3) {
            throw ex3;
        }
        catch (Throwable t) {
            final IOException ex = new IOException(t.getMessage());
            ex.initCause(t);
            httpRequestRetryHandler.retryRequest(ex, ++this.retriedCount, this.context);
            goto Label_0208;
        }
        return null;
    }
    
    @Override
    protected Void doInBackground(final Object... array) {
        if (this.state != State.STOPPED && array != null && array.length != 0) {
            while (true) {
                Label_0077: {
                    if (array.length <= 3) {
                        break Label_0077;
                    }
                    this.fileSavePath = String.valueOf(array[1]);
                    if (this.fileSavePath == null) {
                        break Label_0077;
                    }
                    final boolean isDownloadingFile = true;
                    this.isDownloadingFile = isDownloadingFile;
                    this.autoResume = (boolean)array[2];
                    this.autoRename = (boolean)array[3];
                    try {
                        if (this.state == State.STOPPED) {
                            return null;
                        }
                        this.request = (HttpRequestBase)array[0];
                        this.requestUrl = this.request.getURI().toString();
                        if (this.callback != null) {
                            this.callback.setRequestUrl(this.requestUrl);
                        }
                        this.publishProgress(1);
                        this.lastUpdateTime = SystemClock.uptimeMillis();
                        final ResponseInfo<T> sendRequest = this.sendRequest(this.request);
                        if (sendRequest != null) {
                            this.publishProgress(4, sendRequest);
                            return null;
                        }
                        return null;
                    }
                    catch (HttpException ex) {
                        this.publishProgress(3, ex, ex.getMessage());
                        return null;
                    }
                }
                final boolean isDownloadingFile = false;
                continue;
            }
        }
        return null;
    }
    
    public RequestCallBack<T> getRequestCallBack() {
        return this.callback;
    }
    
    public State getState() {
        return this.state;
    }
    
    public boolean isStopped() {
        return this.state == State.STOPPED;
    }
    
    @Override
    protected void onProgressUpdate(final Object... array) {
        if (this.state != State.STOPPED && array != null && array.length != 0 && this.callback != null) {
            switch ((int)array[0]) {
                default: {}
                case 1: {
                    this.state = State.STARTED;
                    this.callback.onStart();
                }
                case 2: {
                    if (array.length == 3) {
                        this.state = State.LOADING;
                        this.callback.onLoading(Long.valueOf(String.valueOf(array[1])), Long.valueOf(String.valueOf(array[2])), this.isUploading);
                        return;
                    }
                    break;
                }
                case 3: {
                    if (array.length == 3) {
                        this.state = State.FAILURE;
                        this.callback.onFailure((HttpException)array[1], (String)array[2]);
                        return;
                    }
                    break;
                }
                case 4: {
                    if (array.length == 2) {
                        this.state = State.SUCCESS;
                        this.callback.onSuccess((ResponseInfo<T>)array[1]);
                        return;
                    }
                    break;
                }
            }
        }
    }
    
    public void setExpiry(final long expiry) {
        this.expiry = expiry;
    }
    
    public void setHttpRedirectHandler(final HttpRedirectHandler httpRedirectHandler) {
        if (httpRedirectHandler != null) {
            this.httpRedirectHandler = httpRedirectHandler;
        }
    }
    
    public void setRequestCallBack(final RequestCallBack<T> callback) {
        this.callback = callback;
    }
    
    public void stop() {
        this.state = State.STOPPED;
        while (true) {
            if (this.request == null || this.request.isAborted()) {
                break Label_0031;
            }
            try {
                this.request.abort();
                Label_0044: {
                    if (this.isCancelled()) {
                        break Label_0044;
                    }
                    try {
                        this.cancel(true);
                        if (this.callback != null) {
                            this.callback.onStopped();
                        }
                    }
                    catch (Throwable t) {}
                }
            }
            catch (Throwable t2) {
                continue;
            }
            break;
        }
    }
    
    @Override
    public boolean updateProgress(final long n, final long n2, final boolean b) {
        if (this.callback != null && this.state != State.STOPPED) {
            if (b) {
                this.publishProgress(2, n, n2);
            }
            else {
                final long uptimeMillis = SystemClock.uptimeMillis();
                if (uptimeMillis - this.lastUpdateTime >= this.callback.getRate()) {
                    this.lastUpdateTime = uptimeMillis;
                    this.publishProgress(2, n, n2);
                }
            }
        }
        return this.state != State.STOPPED;
    }
    
    private static final class NotUseApacheRedirectHandler implements RedirectHandler
    {
        public URI getLocationURI(final HttpResponse httpResponse, final HttpContext httpContext) throws ProtocolException {
            return null;
        }
        
        public boolean isRedirectRequested(final HttpResponse httpResponse, final HttpContext httpContext) {
            return false;
        }
    }
    
    public enum State
    {
        FAILURE("FAILURE", 3, 3), 
        LOADING("LOADING", 2, 2), 
        STARTED("STARTED", 1, 1), 
        STOPPED("STOPPED", 4, 4), 
        SUCCESS("SUCCESS", 5, 5), 
        WAITING("WAITING", 0, 0);
        
        private int value;
        
        private State(final String s, final int n, final int value) {
            this.value = 0;
            this.value = value;
        }
        
        public static State valueOf(final int n) {
            switch (n) {
                default: {
                    return State.FAILURE;
                }
                case 0: {
                    return State.WAITING;
                }
                case 1: {
                    return State.STARTED;
                }
                case 2: {
                    return State.LOADING;
                }
                case 3: {
                    return State.FAILURE;
                }
                case 4: {
                    return State.STOPPED;
                }
                case 5: {
                    return State.SUCCESS;
                }
            }
        }
        
        public int value() {
            return this.value;
        }
    }
}
