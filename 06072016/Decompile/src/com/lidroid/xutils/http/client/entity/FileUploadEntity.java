package com.lidroid.xutils.http.client.entity;

import org.apache.http.entity.*;
import com.lidroid.xutils.http.callback.*;
import com.lidroid.xutils.util.*;
import java.io.*;

public class FileUploadEntity extends FileEntity implements UploadEntity
{
    private RequestCallBackHandler callBackHandler;
    private long fileSize;
    private long uploadedSize;
    
    public FileUploadEntity(final File file, final String s) {
        super(file, s);
        this.uploadedSize = 0L;
        this.callBackHandler = null;
        this.fileSize = file.length();
    }
    
    public void setCallBackHandler(final RequestCallBackHandler callBackHandler) {
        this.callBackHandler = callBackHandler;
    }
    
    public void writeTo(final OutputStream outputStream) throws IOException {
        if (outputStream == null) {
            throw new IllegalArgumentException("Output stream may not be null");
        }
        final Throwable t = null;
        while (true) {
            try {
                final FileInputStream fileInputStream = new FileInputStream(this.file);
                Object o;
                Throwable t2;
                try {
                    final byte[] array = new byte[4096];
                    do {
                        final int read = fileInputStream.read(array);
                        if (read == -1) {
                            outputStream.flush();
                            if (this.callBackHandler != null) {
                                this.callBackHandler.updateProgress(this.fileSize, this.uploadedSize, true);
                            }
                            IOUtils.closeQuietly(fileInputStream);
                            return;
                        }
                        outputStream.write(array, 0, read);
                        this.uploadedSize += read;
                    } while (this.callBackHandler == null || this.callBackHandler.updateProgress(this.fileSize, this.uploadedSize, false));
                    throw new InterruptedIOException("stop");
                }
                finally {
                    o = fileInputStream;
                    t2 = t;
                }
                IOUtils.closeQuietly((Closeable)o);
                throw t2;
            }
            finally {
                final Object o = t;
                continue;
            }
            break;
        }
    }
}
