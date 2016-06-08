package com.lidroid.xutils.http.client.multipart;

import com.lidroid.xutils.http.client.entity.*;
import java.nio.charset.*;
import org.apache.http.*;
import org.apache.http.message.*;
import com.lidroid.xutils.http.client.multipart.content.*;
import java.util.*;
import com.lidroid.xutils.http.callback.*;
import java.io.*;

public class MultipartEntity implements HttpEntity, UploadEntity
{
    private static final char[] MULTIPART_CHARS;
    private final String boundary;
    private CallBackInfo callBackInfo;
    private final Charset charset;
    private Header contentType;
    private volatile boolean dirty;
    private long length;
    private final HttpMultipart multipart;
    private String multipartSubtype;
    
    static {
        MULTIPART_CHARS = "-_1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ".toCharArray();
    }
    
    public MultipartEntity() {
        this(HttpMultipartMode.STRICT, null, null);
    }
    
    public MultipartEntity(final HttpMultipartMode httpMultipartMode) {
        this(httpMultipartMode, null, null);
    }
    
    public MultipartEntity(final HttpMultipartMode httpMultipartMode, final String s, Charset default_CHARSET) {
        this.callBackInfo = new CallBackInfo();
        this.multipartSubtype = "form-data";
        String generateBoundary = s;
        if (s == null) {
            generateBoundary = this.generateBoundary();
        }
        this.boundary = generateBoundary;
        HttpMultipartMode strict;
        if ((strict = httpMultipartMode) == null) {
            strict = HttpMultipartMode.STRICT;
        }
        if (default_CHARSET == null) {
            default_CHARSET = MIME.DEFAULT_CHARSET;
        }
        this.charset = default_CHARSET;
        this.multipart = new HttpMultipart(this.multipartSubtype, this.charset, this.boundary, strict);
        this.contentType = (Header)new BasicHeader("Content-Type", this.generateContentType(this.boundary, this.charset));
        this.dirty = true;
    }
    
    public void addPart(final FormBodyPart formBodyPart) {
        this.multipart.addBodyPart(formBodyPart);
        this.dirty = true;
    }
    
    public void addPart(final String s, final ContentBody contentBody) {
        this.addPart(new FormBodyPart(s, contentBody));
    }
    
    public void addPart(final String s, final ContentBody contentBody, final String s2) {
        this.addPart(new FormBodyPart(s, contentBody, s2));
    }
    
    public void consumeContent() throws IOException, UnsupportedOperationException {
        if (this.isStreaming()) {
            throw new UnsupportedOperationException("Streaming entity does not implement #consumeContent()");
        }
    }
    
    protected String generateBoundary() {
        final StringBuilder sb = new StringBuilder();
        final Random random = new Random();
        for (int nextInt = random.nextInt(11), i = 0; i < nextInt + 30; ++i) {
            sb.append(MultipartEntity.MULTIPART_CHARS[random.nextInt(MultipartEntity.MULTIPART_CHARS.length)]);
        }
        return sb.toString();
    }
    
    protected String generateContentType(final String s, final Charset charset) {
        final StringBuilder sb = new StringBuilder();
        sb.append("multipart/" + this.multipartSubtype + "; boundary=");
        sb.append(s);
        return sb.toString();
    }
    
    public InputStream getContent() throws IOException, UnsupportedOperationException {
        throw new UnsupportedOperationException("Multipart form entity does not implement #getContent()");
    }
    
    public Header getContentEncoding() {
        return null;
    }
    
    public long getContentLength() {
        if (this.dirty) {
            this.length = this.multipart.getTotalLength();
            this.dirty = false;
        }
        return this.length;
    }
    
    public Header getContentType() {
        return this.contentType;
    }
    
    public boolean isChunked() {
        return !this.isRepeatable();
    }
    
    public boolean isRepeatable() {
        final Iterator<FormBodyPart> iterator = this.multipart.getBodyParts().iterator();
        while (iterator.hasNext()) {
            if (iterator.next().getBody().getContentLength() < 0L) {
                return false;
            }
        }
        return true;
    }
    
    public boolean isStreaming() {
        return !this.isRepeatable();
    }
    
    public void setCallBackHandler(final RequestCallBackHandler callBackHandler) {
        this.callBackInfo.callBackHandler = callBackHandler;
    }
    
    public void setMultipartSubtype(final String s) {
        this.multipartSubtype = s;
        this.multipart.setSubType(s);
        this.contentType = (Header)new BasicHeader("Content-Type", this.generateContentType(this.boundary, this.charset));
    }
    
    public void writeTo(final OutputStream outputStream) throws IOException {
        this.callBackInfo.totalLength = this.getContentLength();
        this.multipart.writeTo(outputStream, this.callBackInfo);
    }
    
    public static class CallBackInfo
    {
        public static final CallBackInfo DEFAULT;
        public RequestCallBackHandler callBackHandler;
        public long pos;
        public long totalLength;
        
        static {
            DEFAULT = new CallBackInfo();
        }
        
        public CallBackInfo() {
            this.callBackHandler = null;
            this.totalLength = 0L;
            this.pos = 0L;
        }
        
        public boolean doCallBack(final boolean b) {
            return this.callBackHandler == null || this.callBackHandler.updateProgress(this.totalLength, this.pos, b);
        }
    }
}
