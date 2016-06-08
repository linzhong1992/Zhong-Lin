package com.lidroid.xutils.http.client.multipart.content;

import com.lidroid.xutils.http.client.multipart.*;

public abstract class AbstractContentBody implements ContentBody
{
    protected MultipartEntity.CallBackInfo callBackInfo;
    private final String mediaType;
    private final String mimeType;
    private final String subType;
    
    public AbstractContentBody(final String s) {
        this.callBackInfo = MultipartEntity.CallBackInfo.DEFAULT;
        if (s == null) {
            throw new IllegalArgumentException("MIME type may not be null");
        }
        this.mimeType = s;
        final int index = s.indexOf(47);
        if (index != -1) {
            this.mediaType = s.substring(0, index);
            this.subType = s.substring(index + 1);
            return;
        }
        this.mediaType = s;
        this.subType = null;
    }
    
    @Override
    public String getMediaType() {
        return this.mediaType;
    }
    
    @Override
    public String getMimeType() {
        return this.mimeType;
    }
    
    @Override
    public String getSubType() {
        return this.subType;
    }
    
    @Override
    public void setCallBackInfo(final MultipartEntity.CallBackInfo callBackInfo) {
        this.callBackInfo = callBackInfo;
    }
}
