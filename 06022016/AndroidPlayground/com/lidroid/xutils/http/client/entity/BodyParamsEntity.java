package com.lidroid.xutils.http.client.entity;

import com.lidroid.xutils.http.client.util.URLEncodedUtils;
import com.lidroid.xutils.util.LogUtils;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import org.apache.http.NameValuePair;
import org.apache.http.entity.AbstractHttpEntity;
import org.apache.http.message.BasicNameValuePair;

public class BodyParamsEntity
  extends AbstractHttpEntity
  implements Cloneable
{
  private String charset = "UTF-8";
  protected byte[] content;
  private boolean dirty = true;
  private List<NameValuePair> params;
  
  public BodyParamsEntity()
  {
    this(null);
  }
  
  public BodyParamsEntity(String paramString)
  {
    if (paramString != null) {
      this.charset = paramString;
    }
    setContentType("application/x-www-form-urlencoded");
    this.params = new ArrayList();
  }
  
  public BodyParamsEntity(List<NameValuePair> paramList)
  {
    this(paramList, null);
  }
  
  public BodyParamsEntity(List<NameValuePair> paramList, String paramString)
  {
    if (paramString != null) {
      this.charset = paramString;
    }
    setContentType("application/x-www-form-urlencoded");
    this.params = paramList;
    refreshContent();
  }
  
  private void refreshContent()
  {
    if (this.dirty) {}
    try
    {
      this.content = URLEncodedUtils.format(this.params, this.charset).getBytes(this.charset);
      this.dirty = false;
      return;
    }
    catch (UnsupportedEncodingException localUnsupportedEncodingException)
    {
      for (;;)
      {
        LogUtils.e(localUnsupportedEncodingException.getMessage(), localUnsupportedEncodingException);
      }
    }
  }
  
  public BodyParamsEntity addParameter(String paramString1, String paramString2)
  {
    this.params.add(new BasicNameValuePair(paramString1, paramString2));
    this.dirty = true;
    return this;
  }
  
  public BodyParamsEntity addParams(List<NameValuePair> paramList)
  {
    this.params.addAll(paramList);
    this.dirty = true;
    return this;
  }
  
  public Object clone()
    throws CloneNotSupportedException
  {
    return super.clone();
  }
  
  public InputStream getContent()
    throws IOException
  {
    refreshContent();
    return new ByteArrayInputStream(this.content);
  }
  
  public long getContentLength()
  {
    refreshContent();
    return this.content.length;
  }
  
  public boolean isRepeatable()
  {
    return true;
  }
  
  public boolean isStreaming()
  {
    return false;
  }
  
  public void writeTo(OutputStream paramOutputStream)
    throws IOException
  {
    if (paramOutputStream == null) {
      throw new IllegalArgumentException("Output stream may not be null");
    }
    refreshContent();
    paramOutputStream.write(this.content);
    paramOutputStream.flush();
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\lidroid\xutils\http\client\entity\BodyParamsEntity.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */