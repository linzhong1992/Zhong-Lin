package com.lidroid.xutils.http.callback;

import org.apache.http.Header;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpRequestBase;

public class DefaultHttpRedirectHandler
  implements HttpRedirectHandler
{
  public HttpRequestBase getDirectRequest(HttpResponse paramHttpResponse)
  {
    if (paramHttpResponse.containsHeader("Location"))
    {
      HttpGet localHttpGet = new HttpGet(paramHttpResponse.getFirstHeader("Location").getValue());
      if (paramHttpResponse.containsHeader("Set-Cookie")) {
        localHttpGet.addHeader("Cookie", paramHttpResponse.getFirstHeader("Set-Cookie").getValue());
      }
      return localHttpGet;
    }
    return null;
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\lidroid\xutils\http\callback\DefaultHttpRedirectHandler.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */