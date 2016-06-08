package com.lidroid.xutils.http;

import org.apache.http.*;
import java.util.*;
import com.lidroid.xutils.util.*;
import com.lidroid.xutils.*;
import java.io.*;

public class ResponseStream extends InputStream
{
    private String _directResult;
    private HttpResponse baseResponse;
    private InputStream baseStream;
    private String charset;
    private long expiry;
    private String requestMethod;
    private String requestUrl;
    
    public ResponseStream(final String directResult) throws IOException {
        if (directResult == null) {
            throw new IllegalArgumentException("result may not be null");
        }
        this._directResult = directResult;
    }
    
    public ResponseStream(final HttpResponse httpResponse, final String s, final long n) throws IOException {
        this(httpResponse, "UTF-8", s, n);
    }
    
    public ResponseStream(final HttpResponse baseResponse, final String charset, final String requestUrl, final long expiry) throws IOException {
        if (baseResponse == null) {
            throw new IllegalArgumentException("baseResponse may not be null");
        }
        this.baseResponse = baseResponse;
        this.baseStream = baseResponse.getEntity().getContent();
        this.charset = charset;
        this.requestUrl = requestUrl;
        this.expiry = expiry;
    }
    
    @Override
    public int available() throws IOException {
        if (this.baseStream == null) {
            return 0;
        }
        return this.baseStream.available();
    }
    
    @Override
    public void close() throws IOException {
        if (this.baseStream == null) {
            return;
        }
        this.baseStream.close();
    }
    
    public HttpResponse getBaseResponse() {
        return this.baseResponse;
    }
    
    public InputStream getBaseStream() {
        return this.baseStream;
    }
    
    public Locale getLocale() {
        if (this._directResult != null) {
            return Locale.getDefault();
        }
        return this.baseResponse.getLocale();
    }
    
    public String getReasonPhrase() {
        if (this._directResult != null) {
            return "";
        }
        return this.baseResponse.getStatusLine().getReasonPhrase();
    }
    
    public String getRequestMethod() {
        return this.requestMethod;
    }
    
    public String getRequestUrl() {
        return this.requestUrl;
    }
    
    public int getStatusCode() {
        if (this._directResult != null) {
            return 200;
        }
        return this.baseResponse.getStatusLine().getStatusCode();
    }
    
    @Override
    public void mark(final int n) {
        if (this.baseStream == null) {
            return;
        }
        this.baseStream.mark(n);
    }
    
    @Override
    public boolean markSupported() {
        return this.baseStream != null && this.baseStream.markSupported();
    }
    
    @Override
    public int read() throws IOException {
        if (this.baseStream == null) {
            return -1;
        }
        return this.baseStream.read();
    }
    
    @Override
    public int read(final byte[] array) throws IOException {
        if (this.baseStream == null) {
            return -1;
        }
        return this.baseStream.read(array);
    }
    
    @Override
    public int read(final byte[] array, final int n, final int n2) throws IOException {
        if (this.baseStream == null) {
            return -1;
        }
        return this.baseStream.read(array, n, n2);
    }
    
    public void readFile(String s) throws IOException {
        if (this._directResult != null || this.baseStream == null) {
            return;
        }
        String s2 = null;
        while (true) {
            try {
                s = (String)new FileOutputStream(s);
                try {
                    final BufferedInputStream bufferedInputStream = new BufferedInputStream(this.baseStream);
                    final byte[] array = new byte[4096];
                    while (true) {
                        final int read = bufferedInputStream.read(array);
                        if (read == -1) {
                            break;
                        }
                        ((FileOutputStream)s).write(array, 0, read);
                    }
                    ((OutputStream)s).flush();
                    IOUtils.closeQuietly((Closeable)s);
                    IOUtils.closeQuietly(this.baseStream);
                    return;
                }
                finally {}
                IOUtils.closeQuietly((Closeable)s);
                IOUtils.closeQuietly(this.baseStream);
                throw s2;
            }
            finally {
                s = s2;
                final String s3;
                s2 = s3;
                continue;
            }
            break;
        }
    }
    
    public String readString() throws IOException {
        if (this._directResult != null) {
            return this._directResult;
        }
        if (this.baseStream == null) {
            return null;
        }
        try {
            final BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(this.baseStream, this.charset));
            final StringBuilder sb = new StringBuilder();
            while (true) {
                final String line = bufferedReader.readLine();
                if (line == null) {
                    break;
                }
                sb.append(line);
            }
            this._directResult = sb.toString();
            if (this.requestUrl != null && HttpUtils.sHttpCache.isEnabled(this.requestMethod)) {
                HttpUtils.sHttpCache.put(this.requestUrl, this._directResult, this.expiry);
            }
            return this._directResult;
        }
        finally {
            IOUtils.closeQuietly(this.baseStream);
        }
    }
    
    @Override
    public void reset() throws IOException {
        synchronized (this) {
            if (this.baseStream != null) {
                this.baseStream.reset();
            }
        }
    }
    
    void setRequestMethod(final String requestMethod) {
        this.requestMethod = requestMethod;
    }
    
    @Override
    public long skip(final long n) throws IOException {
        if (this.baseStream == null) {
            return 0L;
        }
        return this.baseStream.skip(n);
    }
}
