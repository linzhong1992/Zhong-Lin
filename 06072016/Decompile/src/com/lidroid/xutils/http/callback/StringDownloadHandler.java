package com.lidroid.xutils.http.callback;

import org.apache.http.*;
import com.lidroid.xutils.util.*;
import java.io.*;

public class StringDownloadHandler
{
    public String handleEntity(final HttpEntity httpEntity, final RequestCallBackHandler requestCallBackHandler, final String s) throws IOException {
        if (httpEntity == null) {
            return null;
        }
        long n = 0L;
        final long contentLength = httpEntity.getContentLength();
        if (requestCallBackHandler != null && !requestCallBackHandler.updateProgress(contentLength, 0L, true)) {
            return null;
        }
        Closeable content = null;
        final StringBuilder sb = new StringBuilder();
        try {
            final InputStream inputStream = (InputStream)(content = httpEntity.getContent());
            final BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStream, s));
            while (true) {
                long n2 = 0L;
                Block_8: {
                    while (true) {
                        content = inputStream;
                        final String line = bufferedReader.readLine();
                        if (line == null) {
                            break;
                        }
                        content = inputStream;
                        sb.append(line).append('\n');
                        content = inputStream;
                        n2 = (n += OtherUtils.sizeOfString(line, s));
                        if (requestCallBackHandler == null) {
                            continue;
                        }
                        content = inputStream;
                        final boolean updateProgress = requestCallBackHandler.updateProgress(contentLength, n2, false);
                        n = n2;
                        if (!updateProgress) {
                            break Block_8;
                        }
                    }
                    if (requestCallBackHandler != null) {
                        content = inputStream;
                        requestCallBackHandler.updateProgress(contentLength, n, true);
                    }
                    IOUtils.closeQuietly(inputStream);
                    return sb.toString().trim();
                }
                n = n2;
                continue;
            }
        }
        finally {
            IOUtils.closeQuietly(content);
        }
    }
}
