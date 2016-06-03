package com.lidroid.xutils.http;

import com.lidroid.xutils.HttpUtils;
import com.lidroid.xutils.exception.HttpException;
import com.lidroid.xutils.http.callback.DefaultHttpRedirectHandler;
import com.lidroid.xutils.http.callback.HttpRedirectHandler;
import java.io.IOException;
import java.net.URI;
import java.net.UnknownHostException;
import org.apache.http.HttpResponse;
import org.apache.http.StatusLine;
import org.apache.http.client.HttpRequestRetryHandler;
import org.apache.http.client.methods.HttpRequestBase;
import org.apache.http.impl.client.AbstractHttpClient;
import org.apache.http.protocol.HttpContext;

public class SyncHttpHandler
{
  private String charset;
  private final AbstractHttpClient client;
  private final HttpContext context;
  private long expiry = HttpCache.getDefaultExpiryTime();
  private HttpRedirectHandler httpRedirectHandler;
  private String requestMethod;
  private String requestUrl;
  private int retriedTimes = 0;
  
  public SyncHttpHandler(AbstractHttpClient paramAbstractHttpClient, HttpContext paramHttpContext, String paramString)
  {
    this.client = paramAbstractHttpClient;
    this.context = paramHttpContext;
    this.charset = paramString;
  }
  
  private ResponseStream handleResponse(HttpResponse paramHttpResponse)
    throws HttpException, IOException
  {
    if (paramHttpResponse == null) {
      throw new HttpException("response is null");
    }
    StatusLine localStatusLine = paramHttpResponse.getStatusLine();
    int i = localStatusLine.getStatusCode();
    if (i < 300)
    {
      paramHttpResponse = new ResponseStream(paramHttpResponse, this.charset, this.requestUrl, this.expiry);
      paramHttpResponse.setRequestMethod(this.requestMethod);
      return paramHttpResponse;
    }
    if ((i == 301) || (i == 302))
    {
      if (this.httpRedirectHandler == null) {
        this.httpRedirectHandler = new DefaultHttpRedirectHandler();
      }
      paramHttpResponse = this.httpRedirectHandler.getDirectRequest(paramHttpResponse);
      if (paramHttpResponse != null) {
        return sendRequest(paramHttpResponse);
      }
    }
    else
    {
      if (i == 416) {
        throw new HttpException(i, "maybe the file has downloaded completely");
      }
      throw new HttpException(i, localStatusLine.getReasonPhrase());
    }
    return null;
  }
  
  public ResponseStream sendRequest(HttpRequestBase paramHttpRequestBase)
    throws HttpException
  {
    HttpRequestRetryHandler localHttpRequestRetryHandler = this.client.getHttpRequestRetryHandler();
    try
    {
      this.requestUrl = paramHttpRequestBase.getURI().toString();
      this.requestMethod = paramHttpRequestBase.getMethod();
      if (HttpUtils.sHttpCache.isEnabled(this.requestMethod))
      {
        localObject = HttpUtils.sHttpCache.get(this.requestUrl);
        if (localObject != null) {
          return new ResponseStream((String)localObject);
        }
      }
      Object localObject = handleResponse(this.client.execute(paramHttpRequestBase, this.context));
      return (ResponseStream)localObject;
    }
    catch (UnknownHostException localUnknownHostException)
    {
      do
      {
        i = this.retriedTimes + 1;
        this.retriedTimes = i;
        bool = localHttpRequestRetryHandler.retryRequest(localUnknownHostException, i, this.context);
      } while (bool);
      throw new HttpException(localUnknownHostException);
    }
    catch (IOException localIOException1)
    {
      for (;;)
      {
        i = this.retriedTimes + 1;
        this.retriedTimes = i;
        bool = localHttpRequestRetryHandler.retryRequest(localIOException1, i, this.context);
      }
    }
    catch (NullPointerException localNullPointerException)
    {
      for (;;)
      {
        localIOException2 = new IOException(localNullPointerException.getMessage());
        localIOException2.initCause(localNullPointerException);
        i = this.retriedTimes + 1;
        this.retriedTimes = i;
        bool = localHttpRequestRetryHandler.retryRequest(localIOException2, i, this.context);
      }
    }
    catch (HttpException paramHttpRequestBase)
    {
      throw paramHttpRequestBase;
    }
    catch (Throwable localThrowable)
    {
      for (;;)
      {
        IOException localIOException2 = new IOException(localThrowable.getMessage());
        localIOException2.initCause(localThrowable);
        int i = this.retriedTimes + 1;
        this.retriedTimes = i;
        boolean bool = localHttpRequestRetryHandler.retryRequest(localIOException2, i, this.context);
      }
    }
  }
  
  public void setExpiry(long paramLong)
  {
    this.expiry = paramLong;
  }
  
  public void setHttpRedirectHandler(HttpRedirectHandler paramHttpRedirectHandler)
  {
    this.httpRedirectHandler = paramHttpRedirectHandler;
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\lidroid\xutils\http\SyncHttpHandler.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */