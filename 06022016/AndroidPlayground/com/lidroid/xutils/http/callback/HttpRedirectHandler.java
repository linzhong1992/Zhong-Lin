package com.lidroid.xutils.http.callback;

import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpRequestBase;

public abstract interface HttpRedirectHandler
{
  public abstract HttpRequestBase getDirectRequest(HttpResponse paramHttpResponse);
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\lidroid\xutils\http\callback\HttpRedirectHandler.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */