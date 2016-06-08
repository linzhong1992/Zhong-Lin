package com.lidroid.xutils.http.client.multipart.content;

import com.lidroid.xutils.http.client.multipart.*;
import java.io.*;

public interface ContentBody extends ContentDescriptor
{
    String getFilename();
    
    void setCallBackInfo(final MultipartEntity.CallBackInfo p0);
    
    void writeTo(final OutputStream p0) throws IOException;
}
