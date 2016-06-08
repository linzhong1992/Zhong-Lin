package com.lidroid.xutils.http.client.multipart.content;

import java.nio.charset.*;
import com.lidroid.xutils.http.client.multipart.*;
import java.io.*;

public class StringBody extends AbstractContentBody
{
    private final Charset charset;
    private final byte[] content;
    
    public StringBody(final String s) throws UnsupportedEncodingException {
        this(s, "text/plain", null);
    }
    
    public StringBody(final String s, final String s2, final Charset charset) throws UnsupportedEncodingException {
        super(s2);
        if (s == null) {
            throw new IllegalArgumentException("Text may not be null");
        }
        Charset forName;
        if ((forName = charset) == null) {
            forName = Charset.forName("UTF-8");
        }
        this.content = s.getBytes(forName.name());
        this.charset = forName;
    }
    
    public StringBody(final String s, final Charset charset) throws UnsupportedEncodingException {
        this(s, "text/plain", charset);
    }
    
    public static StringBody create(final String s) throws IllegalArgumentException {
        return create(s, null, null);
    }
    
    public static StringBody create(final String s, final String s2, final Charset charset) throws IllegalArgumentException {
        try {
            return new StringBody(s, s2, charset);
        }
        catch (UnsupportedEncodingException ex) {
            throw new IllegalArgumentException("Charset " + charset + " is not supported", ex);
        }
    }
    
    public static StringBody create(final String s, final Charset charset) throws IllegalArgumentException {
        return create(s, null, charset);
    }
    
    @Override
    public String getCharset() {
        return this.charset.name();
    }
    
    @Override
    public long getContentLength() {
        return this.content.length;
    }
    
    @Override
    public String getFilename() {
        return null;
    }
    
    public Reader getReader() {
        return new InputStreamReader(new ByteArrayInputStream(this.content), this.charset);
    }
    
    @Override
    public String getTransferEncoding() {
        return "8bit";
    }
    
    @Override
    public void writeTo(final OutputStream outputStream) throws IOException {
        if (outputStream == null) {
            throw new IllegalArgumentException("Output stream may not be null");
        }
        final ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(this.content);
        final byte[] array = new byte[4096];
        do {
            final int read = byteArrayInputStream.read(array);
            if (read == -1) {
                outputStream.flush();
                return;
            }
            outputStream.write(array, 0, read);
            final MultipartEntity.CallBackInfo callBackInfo = this.callBackInfo;
            callBackInfo.pos += read;
        } while (this.callBackInfo.doCallBack(false));
        throw new InterruptedIOException("stop");
    }
}
