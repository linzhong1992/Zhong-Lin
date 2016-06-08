package com.lidroid.xutils.http.callback;

import com.lidroid.xutils.exception.*;
import com.lidroid.xutils.http.*;

public abstract class RequestCallBack<T>
{
    private static final int DEFAULT_RATE = 1000;
    private static final int MIN_RATE = 200;
    private int rate;
    private String requestUrl;
    protected Object userTag;
    
    public RequestCallBack() {
        this.rate = 1000;
    }
    
    public RequestCallBack(final int rate) {
        this.rate = rate;
    }
    
    public RequestCallBack(final int rate, final Object userTag) {
        this.rate = rate;
        this.userTag = userTag;
    }
    
    public RequestCallBack(final Object userTag) {
        this.rate = 1000;
        this.userTag = userTag;
    }
    
    public final int getRate() {
        if (this.rate < 200) {
            return 200;
        }
        return this.rate;
    }
    
    public final String getRequestUrl() {
        return this.requestUrl;
    }
    
    public Object getUserTag() {
        return this.userTag;
    }
    
    public abstract void onFailure(final HttpException p0, final String p1);
    
    public void onLoading(final long n, final long n2, final boolean b) {
    }
    
    public void onStart() {
    }
    
    public void onStopped() {
    }
    
    public abstract void onSuccess(final ResponseInfo<T> p0);
    
    public final void setRate(final int rate) {
        this.rate = rate;
    }
    
    public final void setRequestUrl(final String requestUrl) {
        this.requestUrl = requestUrl;
    }
    
    public void setUserTag(final Object userTag) {
        this.userTag = userTag;
    }
}
