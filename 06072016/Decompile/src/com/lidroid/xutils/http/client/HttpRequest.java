package com.lidroid.xutils.http.client;

import org.apache.http.client.methods.*;
import com.lidroid.xutils.http.client.util.*;
import java.nio.charset.*;
import java.util.*;
import org.apache.http.client.utils.*;
import org.apache.http.*;
import com.lidroid.xutils.util.*;
import java.net.*;
import com.lidroid.xutils.http.*;
import com.lidroid.xutils.http.callback.*;
import com.lidroid.xutils.http.client.entity.*;

public class HttpRequest extends HttpRequestBase implements HttpEntityEnclosingRequest
{
    private HttpEntity entity;
    private HttpMethod method;
    private URIBuilder uriBuilder;
    private Charset uriCharset;
    
    public HttpRequest(final HttpMethod method) {
        this.method = method;
    }
    
    public HttpRequest(final HttpMethod method, final String uri) {
        this.method = method;
        this.setURI(uri);
    }
    
    public HttpRequest(final HttpMethod method, final URI uri) {
        this.method = method;
        this.setURI(uri);
    }
    
    public HttpRequest addQueryStringParameter(final String s, final String s2) {
        this.uriBuilder.addParameter(s, s2);
        return this;
    }
    
    public HttpRequest addQueryStringParameter(final NameValuePair nameValuePair) {
        this.uriBuilder.addParameter(nameValuePair.getName(), nameValuePair.getValue());
        return this;
    }
    
    public HttpRequest addQueryStringParams(final List<NameValuePair> list) {
        if (list != null) {
            for (final NameValuePair nameValuePair : list) {
                this.uriBuilder.addParameter(nameValuePair.getName(), nameValuePair.getValue());
            }
        }
        return this;
    }
    
    public Object clone() throws CloneNotSupportedException {
        final HttpRequest httpRequest = (HttpRequest)super.clone();
        if (this.entity != null) {
            httpRequest.entity = (HttpEntity)CloneUtils.clone((Object)this.entity);
        }
        return httpRequest;
    }
    
    public boolean expectContinue() {
        final Header firstHeader = this.getFirstHeader("Expect");
        return firstHeader != null && "100-Continue".equalsIgnoreCase(firstHeader.getValue());
    }
    
    public HttpEntity getEntity() {
        return this.entity;
    }
    
    public String getMethod() {
        return this.method.toString();
    }
    
    public URI getURI() {
        try {
            if (this.uriCharset == null) {
                this.uriCharset = OtherUtils.getCharsetFromHttpRequest(this);
            }
            if (this.uriCharset == null) {
                this.uriCharset = Charset.forName("UTF-8");
            }
            return this.uriBuilder.build(this.uriCharset);
        }
        catch (URISyntaxException ex) {
            LogUtils.e(ex.getMessage(), ex);
            return null;
        }
    }
    
    public void setEntity(final HttpEntity entity) {
        this.entity = entity;
    }
    
    public void setRequestParams(final RequestParams requestParams) {
        if (requestParams != null) {
            if (this.uriCharset == null) {
                this.uriCharset = Charset.forName(requestParams.getCharset());
            }
            final List<RequestParams.HeaderItem> headers = requestParams.getHeaders();
            if (headers != null) {
                for (final RequestParams.HeaderItem headerItem : headers) {
                    if (headerItem.overwrite) {
                        this.setHeader(headerItem.header);
                    }
                    else {
                        this.addHeader(headerItem.header);
                    }
                }
            }
            this.addQueryStringParams(requestParams.getQueryStringParams());
            this.setEntity(requestParams.getEntity());
        }
    }
    
    public void setRequestParams(final RequestParams requestParams, final RequestCallBackHandler callBackHandler) {
        if (requestParams != null) {
            if (this.uriCharset == null) {
                this.uriCharset = Charset.forName(requestParams.getCharset());
            }
            final List<RequestParams.HeaderItem> headers = requestParams.getHeaders();
            if (headers != null) {
                for (final RequestParams.HeaderItem headerItem : headers) {
                    if (headerItem.overwrite) {
                        this.setHeader(headerItem.header);
                    }
                    else {
                        this.addHeader(headerItem.header);
                    }
                }
            }
            this.addQueryStringParams(requestParams.getQueryStringParams());
            final HttpEntity entity = requestParams.getEntity();
            if (entity != null) {
                if (entity instanceof UploadEntity) {
                    ((UploadEntity)entity).setCallBackHandler(callBackHandler);
                }
                this.setEntity(entity);
            }
        }
    }
    
    public void setURI(final String s) {
        this.uriBuilder = new URIBuilder(s);
    }
    
    public void setURI(final URI uri) {
        this.uriBuilder = new URIBuilder(uri);
    }
    
    public enum HttpMethod
    {
        CONNECT("CONNECT", 9, "CONNECT"), 
        COPY("COPY", 5, "COPY"), 
        DELETE("DELETE", 6, "DELETE"), 
        GET("GET", 0, "GET"), 
        HEAD("HEAD", 3, "HEAD"), 
        MOVE("MOVE", 4, "MOVE"), 
        OPTIONS("OPTIONS", 7, "OPTIONS"), 
        POST("POST", 1, "POST"), 
        PUT("PUT", 2, "PUT"), 
        TRACE("TRACE", 8, "TRACE");
        
        private final String value;
        
        private HttpMethod(final String s, final int n, final String value) {
            this.value = value;
        }
        
        @Override
        public String toString() {
            return this.value;
        }
    }
}
