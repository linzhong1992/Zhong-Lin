package com.lidroid.xutils.http.client.entity;

import org.apache.http.entity.*;
import org.apache.http.*;
import com.lidroid.xutils.http.client.util.*;
import com.lidroid.xutils.util.*;
import org.apache.http.message.*;
import java.util.*;
import java.io.*;

public class BodyParamsEntity extends AbstractHttpEntity implements Cloneable
{
    private String charset;
    protected byte[] content;
    private boolean dirty;
    private List<NameValuePair> params;
    
    public BodyParamsEntity() {
        this((String)null);
    }
    
    public BodyParamsEntity(final String charset) {
        this.dirty = true;
        this.charset = "UTF-8";
        if (charset != null) {
            this.charset = charset;
        }
        this.setContentType("application/x-www-form-urlencoded");
        this.params = new ArrayList<NameValuePair>();
    }
    
    public BodyParamsEntity(final List<NameValuePair> list) {
        this(list, null);
    }
    
    public BodyParamsEntity(final List<NameValuePair> params, final String charset) {
        this.dirty = true;
        this.charset = "UTF-8";
        if (charset != null) {
            this.charset = charset;
        }
        this.setContentType("application/x-www-form-urlencoded");
        this.params = params;
        this.refreshContent();
    }
    
    private void refreshContent() {
        if (!this.dirty) {
            return;
        }
        while (true) {
            try {
                this.content = URLEncodedUtils.format(this.params, this.charset).getBytes(this.charset);
                this.dirty = false;
            }
            catch (UnsupportedEncodingException ex) {
                LogUtils.e(ex.getMessage(), ex);
                continue;
            }
            break;
        }
    }
    
    public BodyParamsEntity addParameter(final String s, final String s2) {
        this.params.add((NameValuePair)new BasicNameValuePair(s, s2));
        this.dirty = true;
        return this;
    }
    
    public BodyParamsEntity addParams(final List<NameValuePair> list) {
        this.params.addAll(list);
        this.dirty = true;
        return this;
    }
    
    public Object clone() throws CloneNotSupportedException {
        return super.clone();
    }
    
    public InputStream getContent() throws IOException {
        this.refreshContent();
        return new ByteArrayInputStream(this.content);
    }
    
    public long getContentLength() {
        this.refreshContent();
        return this.content.length;
    }
    
    public boolean isRepeatable() {
        return true;
    }
    
    public boolean isStreaming() {
        return false;
    }
    
    public void writeTo(final OutputStream outputStream) throws IOException {
        if (outputStream == null) {
            throw new IllegalArgumentException("Output stream may not be null");
        }
        this.refreshContent();
        outputStream.write(this.content);
        outputStream.flush();
    }
}
