package com.lidroid.xutils.util;

import android.text.TextUtils;
import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;
import java.security.cert.X509Certificate;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;
import org.apache.http.Header;
import org.apache.http.HeaderElement;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.methods.HttpRequestBase;
import org.apache.http.conn.ssl.SSLSocketFactory;

public class OtherUtils
{
  private static final int STRING_BUFFER_LENGTH = 100;
  private static TrustManager[] trustAllCerts;
  
  public static StackTraceElement getCallerStackTraceElement()
  {
    return Thread.currentThread().getStackTrace()[4];
  }
  
  public static Charset getCharsetFromHttpRequest(HttpRequestBase paramHttpRequestBase)
  {
    if (paramHttpRequestBase == null) {}
    for (;;)
    {
      return null;
      Object localObject1 = null;
      Object localObject2 = paramHttpRequestBase.getFirstHeader("Content-Type");
      paramHttpRequestBase = (HttpRequestBase)localObject1;
      int i;
      label46:
      boolean bool2;
      boolean bool1;
      if (localObject2 != null)
      {
        paramHttpRequestBase = ((Header)localObject2).getElements();
        int j = paramHttpRequestBase.length;
        i = 0;
        if (i >= j) {
          paramHttpRequestBase = (HttpRequestBase)localObject1;
        }
      }
      else
      {
        bool2 = false;
        bool1 = bool2;
        if (TextUtils.isEmpty(paramHttpRequestBase)) {}
      }
      try
      {
        bool1 = Charset.isSupported(paramHttpRequestBase);
        if (!bool1) {
          continue;
        }
        return Charset.forName(paramHttpRequestBase);
        localObject2 = paramHttpRequestBase[i].getParameterByName("charset");
        if (localObject2 != null)
        {
          paramHttpRequestBase = ((NameValuePair)localObject2).getValue();
          break label46;
        }
        i += 1;
      }
      catch (Throwable localThrowable)
      {
        for (;;)
        {
          bool1 = bool2;
        }
      }
    }
  }
  
  public static StackTraceElement getCurrentStackTraceElement()
  {
    return Thread.currentThread().getStackTrace()[3];
  }
  
  public static String getFileNameFromHttpResponse(HttpResponse paramHttpResponse)
  {
    if (paramHttpResponse == null) {}
    for (;;)
    {
      return null;
      paramHttpResponse = paramHttpResponse.getFirstHeader("Content-Disposition");
      if (paramHttpResponse != null)
      {
        paramHttpResponse = paramHttpResponse.getElements();
        int j = paramHttpResponse.length;
        int i = 0;
        while (i < j)
        {
          NameValuePair localNameValuePair = paramHttpResponse[i].getParameterByName("filename");
          if (localNameValuePair != null)
          {
            paramHttpResponse = localNameValuePair.getValue();
            return CharsetUtils.toCharset(paramHttpResponse, "UTF-8", paramHttpResponse.length());
          }
          i += 1;
        }
      }
    }
  }
  
  public static String getSubString(String paramString, int paramInt1, int paramInt2)
  {
    return new String(paramString.substring(paramInt1, paramInt2));
  }
  
  public static boolean isSupportRange(HttpResponse paramHttpResponse)
  {
    if (paramHttpResponse == null) {}
    do
    {
      do
      {
        return false;
        Header localHeader = paramHttpResponse.getFirstHeader("Accept-Ranges");
        if (localHeader != null) {
          return "bytes".equals(localHeader.getValue());
        }
        paramHttpResponse = paramHttpResponse.getFirstHeader("Content-Range");
      } while (paramHttpResponse == null);
      paramHttpResponse = paramHttpResponse.getValue();
    } while ((paramHttpResponse == null) || (!paramHttpResponse.startsWith("bytes")));
    return true;
  }
  
  public static long sizeOfString(String paramString1, String paramString2)
    throws UnsupportedEncodingException
  {
    long l2;
    if (TextUtils.isEmpty(paramString1)) {
      l2 = 0L;
    }
    int k;
    long l1;
    int i;
    do
    {
      return l2;
      k = paramString1.length();
      if (k < 100) {
        return paramString1.getBytes(paramString2).length;
      }
      l1 = 0L;
      i = 0;
      l2 = l1;
    } while (i >= k);
    int j = i + 100;
    if (j < k) {}
    for (;;)
    {
      l1 += getSubString(paramString1, i, j).getBytes(paramString2).length;
      i += 100;
      break;
      j = k;
    }
  }
  
  public static void trustAllSSLForHttpsURLConnection()
  {
    if (trustAllCerts == null) {
      trustAllCerts = new TrustManager[] { new X509TrustManager()
      {
        public void checkClientTrusted(X509Certificate[] paramAnonymousArrayOfX509Certificate, String paramAnonymousString) {}
        
        public void checkServerTrusted(X509Certificate[] paramAnonymousArrayOfX509Certificate, String paramAnonymousString) {}
        
        public X509Certificate[] getAcceptedIssuers()
        {
          return null;
        }
      } };
    }
    try
    {
      SSLContext localSSLContext = SSLContext.getInstance("TLS");
      localSSLContext.init(null, trustAllCerts, null);
      HttpsURLConnection.setDefaultSSLSocketFactory(localSSLContext.getSocketFactory());
      HttpsURLConnection.setDefaultHostnameVerifier(SSLSocketFactory.ALLOW_ALL_HOSTNAME_VERIFIER);
      return;
    }
    catch (Throwable localThrowable)
    {
      for (;;)
      {
        LogUtils.e(localThrowable.getMessage(), localThrowable);
      }
    }
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\lidroid\xutils\util\OtherUtils.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */