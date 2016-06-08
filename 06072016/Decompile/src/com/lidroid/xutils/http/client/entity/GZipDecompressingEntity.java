package com.lidroid.xutils.http.client.entity;

import java.util.zip.*;
import org.apache.http.*;
import com.lidroid.xutils.http.callback.*;
import java.io.*;

public class GZipDecompressingEntity extends DecompressingEntity
{
    public GZipDecompressingEntity(final HttpEntity httpEntity) {
        super(httpEntity);
    }
    
    @Override
    InputStream decorate(final InputStream inputStream) throws IOException {
        return new GZIPInputStream(inputStream);
    }
    
    public Header getContentEncoding() {
        return null;
    }
}
