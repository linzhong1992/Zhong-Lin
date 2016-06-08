package com.lidroid.xutils.http.client.multipart.content;

import com.lidroid.xutils.util.*;
import java.io.*;
import com.lidroid.xutils.http.client.multipart.*;

public class FileBody extends AbstractContentBody
{
    private final String charset;
    private final File file;
    private final String filename;
    
    public FileBody(final File file) {
        this(file, null, "application/octet-stream", null);
    }
    
    public FileBody(final File file, final String s) {
        this(file, null, s, null);
    }
    
    public FileBody(final File file, final String s, final String s2) {
        this(file, null, s, s2);
    }
    
    public FileBody(final File file, final String filename, final String s, final String charset) {
        super(s);
        if (file == null) {
            throw new IllegalArgumentException("File may not be null");
        }
        this.file = file;
        if (filename != null) {
            this.filename = filename;
        }
        else {
            this.filename = file.getName();
        }
        this.charset = charset;
    }
    
    @Override
    public String getCharset() {
        return this.charset;
    }
    
    @Override
    public long getContentLength() {
        return this.file.length();
    }
    
    public File getFile() {
        return this.file;
    }
    
    @Override
    public String getFilename() {
        return this.filename;
    }
    
    public InputStream getInputStream() throws IOException {
        return new FileInputStream(this.file);
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
                            IOUtils.closeQuietly(fileInputStream);
                            return;
                        }
                        outputStream.write(array, 0, read);
                        final MultipartEntity.CallBackInfo callBackInfo = this.callBackInfo;
                        callBackInfo.pos += read;
                    } while (this.callBackInfo.doCallBack(false));
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
