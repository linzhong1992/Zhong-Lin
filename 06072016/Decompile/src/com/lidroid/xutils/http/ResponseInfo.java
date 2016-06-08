package com.lidroid.xutils.http;

import java.util.*;
import org.apache.http.*;

public final class ResponseInfo<T>
{
    public final Header contentEncoding;
    public final long contentLength;
    public final Header contentType;
    public final Locale locale;
    public final ProtocolVersion protocolVersion;
    public final String reasonPhrase;
    private final HttpResponse response;
    public T result;
    public final boolean resultFormCache;
    public final int statusCode;
    
    public ResponseInfo(final HttpResponse response, final T result, final boolean resultFormCache) {
        this.response = response;
        this.result = result;
        this.resultFormCache = resultFormCache;
        if (response == null) {
            this.locale = null;
            this.statusCode = 0;
            this.protocolVersion = null;
            this.reasonPhrase = null;
            this.contentLength = 0L;
            this.contentType = null;
            this.contentEncoding = null;
            return;
        }
        this.locale = response.getLocale();
        final StatusLine statusLine = response.getStatusLine();
        if (statusLine != null) {
            this.statusCode = statusLine.getStatusCode();
            this.protocolVersion = statusLine.getProtocolVersion();
            this.reasonPhrase = statusLine.getReasonPhrase();
        }
        else {
            this.statusCode = 0;
            this.protocolVersion = null;
            this.reasonPhrase = null;
        }
        final HttpEntity entity = response.getEntity();
        if (entity != null) {
            this.contentLength = entity.getContentLength();
            this.contentType = entity.getContentType();
            this.contentEncoding = entity.getContentEncoding();
            return;
        }
        this.contentLength = 0L;
        this.contentType = null;
        this.contentEncoding = null;
    }
    
    public Header[] getAllHeaders() {
        if (this.response == null) {
            return null;
        }
        return this.response.getAllHeaders();
    }
    
    public Header getFirstHeader(final String s) {
        if (this.response == null) {
            return null;
        }
        return this.response.getFirstHeader(s);
    }
    
    public Header[] getHeaders(final String s) {
        if (this.response == null) {
            return null;
        }
        return this.response.getHeaders(s);
    }
    
    public Header getLastHeader(final String s) {
        if (this.response == null) {
            return null;
        }
        return this.response.getLastHeader(s);
    }
}
