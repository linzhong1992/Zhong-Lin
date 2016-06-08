package com.lidroid.xutils.http.client.multipart.content;

import com.lidroid.xutils.http.client.multipart.*;
import java.io.*;

public class ByteArrayBody extends AbstractContentBody
{
    private final byte[] data;
    private final String filename;
    
    public ByteArrayBody(final byte[] array, final String s) {
        this(array, "application/octet-stream", s);
    }
    
    public ByteArrayBody(final byte[] data, final String s, final String filename) {
        super(s);
        if (data == null) {
            throw new IllegalArgumentException("byte[] may not be null");
        }
        this.data = data;
        this.filename = filename;
    }
    
    @Override
    public String getCharset() {
        return null;
    }
    
    @Override
    public long getContentLength() {
        return this.data.length;
    }
    
    @Override
    public String getFilename() {
        return this.filename;
    }
    
    @Override
    public String getTransferEncoding() {
        return "binary";
    }
    
    @Override
    public void writeTo(final OutputStream outputStream) throws IOException {
        outputStream.write(this.data);
        final MultipartEntity.CallBackInfo callBackInfo = this.callBackInfo;
        callBackInfo.pos += this.data.length;
        this.callBackInfo.doCallBack(false);
    }
}
