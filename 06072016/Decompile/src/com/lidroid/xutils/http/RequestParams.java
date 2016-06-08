package com.lidroid.xutils.http;

import android.text.*;
import org.apache.http.*;
import java.nio.charset.*;
import com.lidroid.xutils.http.client.multipart.*;
import com.lidroid.xutils.http.client.multipart.content.*;
import com.lidroid.xutils.util.*;
import java.io.*;
import java.util.*;
import com.lidroid.xutils.http.client.entity.*;
import org.apache.http.message.*;

public class RequestParams
{
    private HttpEntity bodyEntity;
    private List<NameValuePair> bodyParams;
    private String charset;
    private HashMap<String, ContentBody> fileParams;
    private List<HeaderItem> headers;
    private List<NameValuePair> queryStringParams;
    
    public RequestParams() {
        this.charset = "UTF-8";
    }
    
    public RequestParams(final String charset) {
        this.charset = "UTF-8";
        if (!TextUtils.isEmpty((CharSequence)charset)) {
            this.charset = charset;
        }
    }
    
    public void addBodyParameter(final String s, final File file) {
        if (this.fileParams == null) {
            this.fileParams = new HashMap<String, ContentBody>();
        }
        this.fileParams.put(s, new FileBody(file));
    }
    
    public void addBodyParameter(final String s, final File file, final String s2) {
        if (this.fileParams == null) {
            this.fileParams = new HashMap<String, ContentBody>();
        }
        this.fileParams.put(s, new FileBody(file, s2));
    }
    
    public void addBodyParameter(final String s, final File file, final String s2, final String s3) {
        if (this.fileParams == null) {
            this.fileParams = new HashMap<String, ContentBody>();
        }
        this.fileParams.put(s, new FileBody(file, s2, s3));
    }
    
    public void addBodyParameter(final String s, final File file, final String s2, final String s3, final String s4) {
        if (this.fileParams == null) {
            this.fileParams = new HashMap<String, ContentBody>();
        }
        this.fileParams.put(s, new FileBody(file, s2, s3, s4));
    }
    
    public void addBodyParameter(final String s, final InputStream inputStream, final long n) {
        if (this.fileParams == null) {
            this.fileParams = new HashMap<String, ContentBody>();
        }
        this.fileParams.put(s, new InputStreamBody(inputStream, n));
    }
    
    public void addBodyParameter(final String s, final InputStream inputStream, final long n, final String s2) {
        if (this.fileParams == null) {
            this.fileParams = new HashMap<String, ContentBody>();
        }
        this.fileParams.put(s, new InputStreamBody(inputStream, n, s2));
    }
    
    public void addBodyParameter(final String s, final InputStream inputStream, final long n, final String s2, final String s3) {
        if (this.fileParams == null) {
            this.fileParams = new HashMap<String, ContentBody>();
        }
        this.fileParams.put(s, new InputStreamBody(inputStream, n, s2, s3));
    }
    
    public void addBodyParameter(final String s, final String s2) {
        if (this.bodyParams == null) {
            this.bodyParams = new ArrayList<NameValuePair>();
        }
        this.bodyParams.add((NameValuePair)new BasicNameValuePair(s, s2));
    }
    
    public void addBodyParameter(final List<NameValuePair> list) {
        if (this.bodyParams == null) {
            this.bodyParams = new ArrayList<NameValuePair>();
        }
        if (list != null && list.size() > 0) {
            final Iterator<NameValuePair> iterator = list.iterator();
            while (iterator.hasNext()) {
                this.bodyParams.add(iterator.next());
            }
        }
    }
    
    public void addBodyParameter(final NameValuePair nameValuePair) {
        if (this.bodyParams == null) {
            this.bodyParams = new ArrayList<NameValuePair>();
        }
        this.bodyParams.add(nameValuePair);
    }
    
    public void addHeader(final String s, final String s2) {
        if (this.headers == null) {
            this.headers = new ArrayList<HeaderItem>();
        }
        this.headers.add(new HeaderItem(s, s2));
    }
    
    public void addHeader(final Header header) {
        if (this.headers == null) {
            this.headers = new ArrayList<HeaderItem>();
        }
        this.headers.add(new HeaderItem(header));
    }
    
    public void addHeaders(final List<Header> list) {
        if (this.headers == null) {
            this.headers = new ArrayList<HeaderItem>();
        }
        final Iterator<Header> iterator = list.iterator();
        while (iterator.hasNext()) {
            this.headers.add(new HeaderItem(iterator.next()));
        }
    }
    
    public void addQueryStringParameter(final String s, final String s2) {
        if (this.queryStringParams == null) {
            this.queryStringParams = new ArrayList<NameValuePair>();
        }
        this.queryStringParams.add((NameValuePair)new BasicNameValuePair(s, s2));
    }
    
    public void addQueryStringParameter(final List<NameValuePair> list) {
        if (this.queryStringParams == null) {
            this.queryStringParams = new ArrayList<NameValuePair>();
        }
        if (list != null && list.size() > 0) {
            final Iterator<NameValuePair> iterator = list.iterator();
            while (iterator.hasNext()) {
                this.queryStringParams.add(iterator.next());
            }
        }
    }
    
    public void addQueryStringParameter(final NameValuePair nameValuePair) {
        if (this.queryStringParams == null) {
            this.queryStringParams = new ArrayList<NameValuePair>();
        }
        this.queryStringParams.add(nameValuePair);
    }
    
    public String getCharset() {
        return this.charset;
    }
    
    public HttpEntity getEntity() {
        HttpEntity bodyEntity;
        if (this.bodyEntity != null) {
            bodyEntity = this.bodyEntity;
        }
        else {
            final HttpEntity httpEntity = null;
            if (this.fileParams != null && !this.fileParams.isEmpty()) {
                final MultipartEntity multipartEntity = new MultipartEntity(HttpMultipartMode.STRICT, null, Charset.forName(this.charset));
                if (this.bodyParams != null && !this.bodyParams.isEmpty()) {
                    for (final NameValuePair nameValuePair : this.bodyParams) {
                        try {
                            multipartEntity.addPart(nameValuePair.getName(), new StringBody(nameValuePair.getValue()));
                        }
                        catch (UnsupportedEncodingException ex) {
                            LogUtils.e(ex.getMessage(), ex);
                        }
                    }
                }
                for (final Map.Entry<String, ContentBody> entry : this.fileParams.entrySet()) {
                    multipartEntity.addPart(entry.getKey(), entry.getValue());
                }
                return (HttpEntity)multipartEntity;
            }
            bodyEntity = httpEntity;
            if (this.bodyParams != null) {
                bodyEntity = httpEntity;
                if (!this.bodyParams.isEmpty()) {
                    return (HttpEntity)new BodyParamsEntity(this.bodyParams, this.charset);
                }
            }
        }
        return bodyEntity;
    }
    
    public List<HeaderItem> getHeaders() {
        return this.headers;
    }
    
    public List<NameValuePair> getQueryStringParams() {
        return this.queryStringParams;
    }
    
    public void setBodyEntity(final HttpEntity bodyEntity) {
        this.bodyEntity = bodyEntity;
        if (this.bodyParams != null) {
            this.bodyParams.clear();
            this.bodyParams = null;
        }
        if (this.fileParams != null) {
            this.fileParams.clear();
            this.fileParams = null;
        }
    }
    
    public void setContentType(final String s) {
        this.setHeader("Content-Type", s);
    }
    
    public void setHeader(final String s, final String s2) {
        if (this.headers == null) {
            this.headers = new ArrayList<HeaderItem>();
        }
        this.headers.add(new HeaderItem(s, s2, true));
    }
    
    public void setHeader(final Header header) {
        if (this.headers == null) {
            this.headers = new ArrayList<HeaderItem>();
        }
        this.headers.add(new HeaderItem(header, true));
    }
    
    public void setHeaders(final List<Header> list) {
        if (this.headers == null) {
            this.headers = new ArrayList<HeaderItem>();
        }
        final Iterator<Header> iterator = list.iterator();
        while (iterator.hasNext()) {
            this.headers.add(new HeaderItem(iterator.next(), true));
        }
    }
    
    public class HeaderItem
    {
        public final Header header;
        public final boolean overwrite;
        
        public HeaderItem(final String s, final String s2) {
            this.overwrite = false;
            this.header = (Header)new BasicHeader(s, s2);
        }
        
        public HeaderItem(final String s, final String s2, final boolean overwrite) {
            this.overwrite = overwrite;
            this.header = (Header)new BasicHeader(s, s2);
        }
        
        public HeaderItem(final Header header) {
            this.overwrite = false;
            this.header = header;
        }
        
        public HeaderItem(final Header header, final boolean overwrite) {
            this.overwrite = overwrite;
            this.header = header;
        }
    }
}
