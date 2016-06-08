package com.lidroid.xutils.http.client.multipart;

public enum HttpMultipartMode
{
    BROWSER_COMPATIBLE("BROWSER_COMPATIBLE", 1), 
    STRICT("STRICT", 0);
    
    private HttpMultipartMode(final String s, final int n) {
    }
}
