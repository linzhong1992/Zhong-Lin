package com.lidroid.xutils.http.callback;

import org.apache.http.*;
import org.apache.http.client.methods.*;

public interface HttpRedirectHandler
{
    HttpRequestBase getDirectRequest(final HttpResponse p0);
}
