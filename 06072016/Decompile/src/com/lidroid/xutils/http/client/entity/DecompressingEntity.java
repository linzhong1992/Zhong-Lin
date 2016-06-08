package com.lidroid.xutils.http.client.entity;

import org.apache.http.entity.*;
import com.lidroid.xutils.http.callback.*;
import org.apache.http.*;
import com.lidroid.xutils.util.*;
import java.io.*;

abstract class DecompressingEntity extends HttpEntityWrapper implements UploadEntity
{
    private RequestCallBackHandler callBackHandler;
    private InputStream content;
    private long uncompressedLength;
    private long uploadedSize;
    
    public DecompressingEntity(final HttpEntity httpEntity) {
        super(httpEntity);
        this.uploadedSize = 0L;
        this.callBackHandler = null;
        this.uncompressedLength = httpEntity.getContentLength();
    }
    
    private InputStream getDecompressingStream() throws IOException {
        Closeable content = null;
        try {
            return this.decorate((InputStream)(content = this.wrappedEntity.getContent()));
        }
        catch (IOException ex) {
            IOUtils.closeQuietly(content);
            throw ex;
        }
    }
    
    abstract InputStream decorate(final InputStream p0) throws IOException;
    
    public InputStream getContent() throws IOException {
        if (this.wrappedEntity.isStreaming()) {
            if (this.content == null) {
                this.content = this.getDecompressingStream();
            }
            return this.content;
        }
        return this.getDecompressingStream();
    }
    
    public long getContentLength() {
        return -1L;
    }
    
    public void setCallBackHandler(final RequestCallBackHandler callBackHandler) {
        this.callBackHandler = callBackHandler;
    }
    
    public void writeTo(final OutputStream outputStream) throws IOException {
        if (outputStream == null) {
            throw new IllegalArgumentException("Output stream may not be null");
        }
        Closeable content = null;
        try {
            final InputStream inputStream = (InputStream)(content = this.getContent());
            final byte[] array = new byte[4096];
            while (true) {
                content = inputStream;
                final int read = inputStream.read(array);
                if (read == -1) {
                    content = inputStream;
                    outputStream.flush();
                    content = inputStream;
                    if (this.callBackHandler != null) {
                        content = inputStream;
                        this.callBackHandler.updateProgress(this.uncompressedLength, this.uploadedSize, true);
                    }
                    return;
                }
                content = inputStream;
                outputStream.write(array, 0, read);
                content = inputStream;
                this.uploadedSize += read;
                content = inputStream;
                if (this.callBackHandler == null) {
                    continue;
                }
                content = inputStream;
                if (!this.callBackHandler.updateProgress(this.uncompressedLength, this.uploadedSize, false)) {
                    content = inputStream;
                    throw new InterruptedIOException("stop");
                }
            }
        }
        finally {
            IOUtils.closeQuietly(content);
        }
    }
}
