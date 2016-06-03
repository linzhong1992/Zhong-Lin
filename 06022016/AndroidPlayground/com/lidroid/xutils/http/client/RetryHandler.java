package com.lidroid.xutils.http.client;

import android.os.SystemClock;
import com.lidroid.xutils.util.LogUtils;
import java.io.IOException;
import java.io.InterruptedIOException;
import java.net.SocketException;
import java.net.UnknownHostException;
import java.util.HashSet;
import javax.net.ssl.SSLHandshakeException;
import org.apache.http.NoHttpResponseException;
import org.apache.http.client.HttpRequestRetryHandler;
import org.apache.http.client.methods.HttpRequestBase;
import org.apache.http.impl.client.RequestWrapper;
import org.apache.http.protocol.HttpContext;

public class RetryHandler
  implements HttpRequestRetryHandler
{
  private static final int RETRY_SLEEP_INTERVAL = 500;
  private static HashSet<Class<?>> exceptionBlackList;
  private static HashSet<Class<?>> exceptionWhiteList = new HashSet();
  private final int maxRetries;
  
  static
  {
    exceptionBlackList = new HashSet();
    exceptionWhiteList.add(NoHttpResponseException.class);
    exceptionWhiteList.add(UnknownHostException.class);
    exceptionWhiteList.add(SocketException.class);
    exceptionBlackList.add(InterruptedIOException.class);
    exceptionBlackList.add(SSLHandshakeException.class);
  }
  
  public RetryHandler(int paramInt)
  {
    this.maxRetries = paramInt;
  }
  
  public boolean retryRequest(IOException paramIOException, int paramInt, HttpContext paramHttpContext)
  {
    bool2 = false;
    boolean bool1 = true;
    if ((paramIOException == null) || (paramHttpContext == null)) {
      return false;
    }
    Object localObject = paramHttpContext.getAttribute("http.request_sent");
    if (localObject == null)
    {
      if (paramInt <= this.maxRetries) {
        break label112;
      }
      bool1 = false;
      label42:
      bool2 = bool1;
      if (!bool1) {}
    }
    for (;;)
    {
      try
      {
        paramIOException = paramHttpContext.getAttribute("http.request");
        if (paramIOException == null) {
          continue;
        }
        if (!(paramIOException instanceof HttpRequestBase)) {
          continue;
        }
        bool2 = "GET".equals(((HttpRequestBase)paramIOException).getMethod());
      }
      catch (Throwable paramIOException)
      {
        label112:
        bool2 = false;
        LogUtils.e("retry error", paramIOException);
        continue;
      }
      if (bool2) {
        SystemClock.sleep(500L);
      }
      return bool2;
      bool2 = ((Boolean)localObject).booleanValue();
      break;
      if (exceptionBlackList.contains(paramIOException.getClass()))
      {
        bool1 = false;
        break label42;
      }
      if (exceptionWhiteList.contains(paramIOException.getClass()))
      {
        bool1 = true;
        break label42;
      }
      if (bool2) {
        break label42;
      }
      bool1 = true;
      break label42;
      bool2 = bool1;
      if ((paramIOException instanceof RequestWrapper))
      {
        bool2 = "GET".equals(((RequestWrapper)paramIOException).getMethod());
        continue;
        bool2 = false;
        LogUtils.e("retry error, curr request is null");
      }
    }
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\lidroid\xutils\http\client\RetryHandler.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */