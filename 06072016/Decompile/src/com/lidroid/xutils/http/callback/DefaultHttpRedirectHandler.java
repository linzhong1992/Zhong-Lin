package com.lidroid.xutils.http.callback;

import org.apache.http.*;
import org.apache.http.client.methods.*;

public class DefaultHttpRedirectHandler implements HttpRedirectHandler
{
    @Override
    public HttpRequestBase getDirectRequest(final HttpResponse httpResponse) {
        if (httpResponse.containsHeader("Location")) {
            final HttpGet httpGet = new HttpGet(httpResponse.getFirstHeader("Location").getValue());
            if (httpResponse.containsHeader("Set-Cookie")) {
                httpGet.addHeader("Cookie", httpResponse.getFirstHeader("Set-Cookie").getValue());
            }
            return (HttpRequestBase)httpGet;
        }
        return null;
    }
}
