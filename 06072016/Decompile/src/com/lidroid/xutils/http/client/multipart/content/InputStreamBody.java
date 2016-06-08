package com.lidroid.xutils.http.client.multipart.content;

import com.lidroid.xutils.util.*;
import com.lidroid.xutils.http.client.multipart.*;
import java.io.*;

public class InputStreamBody extends AbstractContentBody
{
    private final String filename;
    private final InputStream in;
    private long length;
    
    public InputStreamBody(final InputStream inputStream, final long n) {
        this(inputStream, n, "no_name", "application/octet-stream");
    }
    
    public InputStreamBody(final InputStream inputStream, final long n, final String s) {
        this(inputStream, n, s, "application/octet-stream");
    }
    
    public InputStreamBody(final InputStream in, final long length, final String filename, final String s) {
        super(s);
        if (in == null) {
            throw new IllegalArgumentException("Input stream may not be null");
        }
        this.in = in;
        this.filename = filename;
        this.length = length;
    }
    
    @Override
    public String getCharset() {
        return null;
    }
    
    @Override
    public long getContentLength() {
        return this.length;
    }
    
    @Override
    public String getFilename() {
        return this.filename;
    }
    
    public InputStream getInputStream() {
        return this.in;
    }
    
    @Override
    public String getTransferEncoding() {
        return "binary";
    }
    
    @Override
    public void writeTo(final OutputStream outputStream) throws IOException {
        if (outputStream == null) {
            throw new IllegalArgumentException("Output stream may not be null");
        }
        try {
            final byte[] array = new byte[4096];
            do {
                final int read = this.in.read(array);
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
        finally {
            IOUtils.closeQuietly(this.in);
        }
    }
}
