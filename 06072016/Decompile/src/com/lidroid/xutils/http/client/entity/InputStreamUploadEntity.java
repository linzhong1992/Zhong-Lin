package com.lidroid.xutils.http.client.entity;

import org.apache.http.entity.*;
import com.lidroid.xutils.http.callback.*;
import com.lidroid.xutils.util.*;
import java.io.*;

public class InputStreamUploadEntity extends AbstractHttpEntity implements UploadEntity
{
    private static final int BUFFER_SIZE = 2048;
    private RequestCallBackHandler callBackHandler;
    private final InputStream content;
    private final long length;
    private long uploadedSize;
    
    public InputStreamUploadEntity(final InputStream content, final long length) {
        this.uploadedSize = 0L;
        this.callBackHandler = null;
        if (content == null) {
            throw new IllegalArgumentException("Source input stream may not be null");
        }
        this.content = content;
        this.length = length;
    }
    
    public void consumeContent() throws IOException {
        this.content.close();
    }
    
    public InputStream getContent() throws IOException {
        return this.content;
    }
    
    public long getContentLength() {
        return this.length;
    }
    
    public boolean isRepeatable() {
        return false;
    }
    
    public boolean isStreaming() {
        return true;
    }
    
    public void setCallBackHandler(final RequestCallBackHandler callBackHandler) {
        this.callBackHandler = callBackHandler;
    }
    
    public void writeTo(final OutputStream outputStream) throws IOException {
        if (outputStream == null) {
            throw new IllegalArgumentException("Output stream may not be null");
        }
    Label_0049_Outer:
        while (true) {
            final InputStream content = this.content;
        Label_0049:
            while (true) {
                byte[] array;
                try {
                    array = new byte[2048];
                    if (this.length < 0L) {
                        do {
                            final int read = content.read(array);
                            if (read == -1) {
                                outputStream.flush();
                                if (this.callBackHandler != null) {
                                    this.callBackHandler.updateProgress(this.length, this.uploadedSize, true);
                                }
                                return;
                            }
                            outputStream.write(array, 0, read);
                            this.uploadedSize += read;
                        } while (this.callBackHandler == null || this.callBackHandler.updateProgress(this.uploadedSize + 1L, this.uploadedSize, false));
                        throw new InterruptedIOException("stop");
                    }
                }
                finally {
                    IOUtils.closeQuietly(content);
                }
                long length = this.length;
                while (length > 0L) {
                    final int read2 = content.read(array, 0, (int)Math.min(2048L, length));
                    if (read2 == -1) {
                        continue Label_0049;
                    }
                    outputStream.write(array, 0, read2);
                    final long n = length - read2;
                    this.uploadedSize += read2;
                    length = n;
                    if (this.callBackHandler == null) {
                        continue Label_0049_Outer;
                    }
                    length = n;
                    if (!this.callBackHandler.updateProgress(this.length, this.uploadedSize, false)) {
                        break Label_0049_Outer;
                    }
                }
                continue Label_0049;
            }
        }
        throw new InterruptedIOException("stop");
    }
}
