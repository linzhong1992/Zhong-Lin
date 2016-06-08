package com.lidroid.xutils.http;

import org.apache.http.impl.client.*;
import org.apache.http.protocol.*;
import com.lidroid.xutils.exception.*;
import com.lidroid.xutils.http.callback.*;
import org.apache.http.*;
import java.io.*;
import com.lidroid.xutils.*;
import org.apache.http.client.methods.*;
import java.net.*;
import org.apache.http.client.*;

public class SyncHttpHandler
{
    private String charset;
    private final AbstractHttpClient client;
    private final HttpContext context;
    private long expiry;
    private HttpRedirectHandler httpRedirectHandler;
    private String requestMethod;
    private String requestUrl;
    private int retriedTimes;
    
    public SyncHttpHandler(final AbstractHttpClient client, final HttpContext context, final String charset) {
        this.retriedTimes = 0;
        this.expiry = HttpCache.getDefaultExpiryTime();
        this.client = client;
        this.context = context;
        this.charset = charset;
    }
    
    private ResponseStream handleResponse(final HttpResponse httpResponse) throws HttpException, IOException {
        if (httpResponse == null) {
            throw new HttpException("response is null");
        }
        final StatusLine statusLine = httpResponse.getStatusLine();
        final int statusCode = statusLine.getStatusCode();
        if (statusCode < 300) {
            final ResponseStream responseStream = new ResponseStream(httpResponse, this.charset, this.requestUrl, this.expiry);
            responseStream.setRequestMethod(this.requestMethod);
            return responseStream;
        }
        if (statusCode == 301 || statusCode == 302) {
            if (this.httpRedirectHandler == null) {
                this.httpRedirectHandler = new DefaultHttpRedirectHandler();
            }
            final HttpRequestBase directRequest = this.httpRedirectHandler.getDirectRequest(httpResponse);
            if (directRequest != null) {
                return this.sendRequest(directRequest);
            }
            return null;
        }
        else {
            if (statusCode == 416) {
                throw new HttpException(statusCode, "maybe the file has downloaded completely");
            }
            throw new HttpException(statusCode, statusLine.getReasonPhrase());
        }
    }
    
    public ResponseStream sendRequest(final HttpRequestBase httpRequestBase) throws HttpException {
        final HttpRequestRetryHandler httpRequestRetryHandler = this.client.getHttpRequestRetryHandler();
        try {
            this.requestUrl = httpRequestBase.getURI().toString();
            this.requestMethod = httpRequestBase.getMethod();
            if (HttpUtils.sHttpCache.isEnabled(this.requestMethod)) {
                final String value = HttpUtils.sHttpCache.get(this.requestUrl);
                if (value != null) {
                    return new ResponseStream(value);
                }
            }
            return this.handleResponse(this.client.execute((HttpUriRequest)httpRequestBase, this.context));
        }
        catch (UnknownHostException ex) {
            httpRequestRetryHandler.retryRequest(ex, ++this.retriedTimes, this.context);
        }
        catch (IOException ex) {
            httpRequestRetryHandler.retryRequest(ex, ++this.retriedTimes, this.context);
            goto Label_0118;
        }
        catch (NullPointerException ex2) {
            final IOException ex = new IOException(ex2.getMessage());
            ex.initCause(ex2);
            httpRequestRetryHandler.retryRequest(ex, ++this.retriedTimes, this.context);
            goto Label_0118;
        }
        catch (HttpException ex3) {
            throw ex3;
        }
        catch (Throwable t) {
            final IOException ex = new IOException(t.getMessage());
            ex.initCause(t);
            httpRequestRetryHandler.retryRequest(ex, ++this.retriedTimes, this.context);
            goto Label_0118;
        }
    }
    
    public void setExpiry(final long expiry) {
        this.expiry = expiry;
    }
    
    public void setHttpRedirectHandler(final HttpRedirectHandler httpRedirectHandler) {
        this.httpRedirectHandler = httpRedirectHandler;
    }
}
