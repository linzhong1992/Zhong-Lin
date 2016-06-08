package com.lidroid.xutils.util;

import org.apache.http.client.methods.*;
import java.nio.charset.*;
import android.text.*;
import org.apache.http.*;
import java.io.*;
import java.security.cert.*;
import java.security.*;
import org.apache.http.conn.ssl.*;
import javax.net.ssl.*;

public class OtherUtils
{
    private static final int STRING_BUFFER_LENGTH = 100;
    private static TrustManager[] trustAllCerts;
    
    public static StackTraceElement getCallerStackTraceElement() {
        return Thread.currentThread().getStackTrace()[4];
    }
    
    public static Charset getCharsetFromHttpRequest(HttpRequestBase httpRequestBase) {
        if (httpRequestBase != null) {
            final HttpRequestBase httpRequestBase2 = null;
            final Header firstHeader = httpRequestBase.getFirstHeader("Content-Type");
            httpRequestBase = httpRequestBase2;
        Label_0038_Outer:
            while (true) {
                if (firstHeader == null) {
                    break Label_0046;
                }
                httpRequestBase = (HttpRequestBase)(Object)firstHeader.getElements();
                final int length = httpRequestBase.length;
                int n = 0;
            Label_0064_Outer:
                while (true) {
                    Label_0073: {
                        if (n < length) {
                            break Label_0073;
                        }
                        httpRequestBase = httpRequestBase2;
                        boolean supported = false;
                        while (true) {
                            if (TextUtils.isEmpty((CharSequence)httpRequestBase)) {
                                break Label_0064;
                            }
                            try {
                                supported = Charset.isSupported((String)httpRequestBase);
                                if (supported) {
                                    return Charset.forName((String)httpRequestBase);
                                }
                                return null;
                                Label_0101: {
                                    ++n;
                                }
                                continue Label_0064_Outer;
                                while (true) {
                                    final NameValuePair parameterByName;
                                    httpRequestBase = (HttpRequestBase)parameterByName.getValue();
                                    continue Label_0038_Outer;
                                    parameterByName = httpRequestBase[n].getParameterByName("charset");
                                    continue;
                                }
                            }
                            // iftrue(Label_0101:, parameterByName == null)
                            catch (Throwable t) {
                                supported = supported;
                                continue;
                            }
                            break;
                        }
                    }
                    break;
                }
                break;
            }
        }
        return null;
    }
    
    public static StackTraceElement getCurrentStackTraceElement() {
        return Thread.currentThread().getStackTrace()[3];
    }
    
    public static String getFileNameFromHttpResponse(final HttpResponse httpResponse) {
        if (httpResponse != null) {
            final Header firstHeader = httpResponse.getFirstHeader("Content-Disposition");
            if (firstHeader != null) {
                final HeaderElement[] elements = firstHeader.getElements();
                for (int length = elements.length, i = 0; i < length; ++i) {
                    final NameValuePair parameterByName = elements[i].getParameterByName("filename");
                    if (parameterByName != null) {
                        final String value = parameterByName.getValue();
                        return CharsetUtils.toCharset(value, "UTF-8", value.length());
                    }
                }
            }
        }
        return null;
    }
    
    public static String getSubString(final String s, final int n, final int n2) {
        return new String(s.substring(n, n2));
    }
    
    public static boolean isSupportRange(final HttpResponse httpResponse) {
        if (httpResponse != null) {
            final Header firstHeader = httpResponse.getFirstHeader("Accept-Ranges");
            if (firstHeader != null) {
                return "bytes".equals(firstHeader.getValue());
            }
            final Header firstHeader2 = httpResponse.getFirstHeader("Content-Range");
            if (firstHeader2 != null) {
                final String value = firstHeader2.getValue();
                if (value != null && value.startsWith("bytes")) {
                    return true;
                }
            }
        }
        return false;
    }
    
    public static long sizeOfString(final String s, final String s2) throws UnsupportedEncodingException {
        long n;
        if (TextUtils.isEmpty((CharSequence)s)) {
            n = 0L;
        }
        else {
            final int length = s.length();
            if (length < 100) {
                return s.getBytes(s2).length;
            }
            long n2 = 0L;
            int n3 = 0;
            while (true) {
                n = n2;
                if (n3 >= length) {
                    break;
                }
                int n4 = n3 + 100;
                if (n4 >= length) {
                    n4 = length;
                }
                n2 += getSubString(s, n3, n4).getBytes(s2).length;
                n3 += 100;
            }
        }
        return n;
    }
    
    public static void trustAllSSLForHttpsURLConnection() {
        if (OtherUtils.trustAllCerts == null) {
            OtherUtils.trustAllCerts = new TrustManager[] { new X509TrustManager() {
                    @Override
                    public void checkClientTrusted(final X509Certificate[] array, final String s) {
                    }
                    
                    @Override
                    public void checkServerTrusted(final X509Certificate[] array, final String s) {
                    }
                    
                    @Override
                    public X509Certificate[] getAcceptedIssuers() {
                        return null;
                    }
                } };
        }
        while (true) {
            try {
                final SSLContext instance = SSLContext.getInstance("TLS");
                instance.init(null, OtherUtils.trustAllCerts, null);
                HttpsURLConnection.setDefaultSSLSocketFactory(instance.getSocketFactory());
                HttpsURLConnection.setDefaultHostnameVerifier((HostnameVerifier)SSLSocketFactory.ALLOW_ALL_HOSTNAME_VERIFIER);
            }
            catch (Throwable t) {
                LogUtils.e(t.getMessage(), t);
                continue;
            }
            break;
        }
    }
}
