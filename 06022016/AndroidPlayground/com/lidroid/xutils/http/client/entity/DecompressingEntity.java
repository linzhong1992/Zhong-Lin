package com.lidroid.xutils.http.client.entity;

import com.lidroid.xutils.http.callback.RequestCallBackHandler;
import com.lidroid.xutils.util.IOUtils;
import java.io.Closeable;
import java.io.IOException;
import java.io.InputStream;
import java.io.InterruptedIOException;
import java.io.OutputStream;
import org.apache.http.HttpEntity;
import org.apache.http.entity.HttpEntityWrapper;

abstract class DecompressingEntity
  extends HttpEntityWrapper
  implements UploadEntity
{
  private RequestCallBackHandler callBackHandler = null;
  private InputStream content;
  private long uncompressedLength;
  private long uploadedSize = 0L;
  
  public DecompressingEntity(HttpEntity paramHttpEntity)
  {
    super(paramHttpEntity);
    this.uncompressedLength = paramHttpEntity.getContentLength();
  }
  
  private InputStream getDecompressingStream()
    throws IOException
  {
    Object localObject = null;
    try
    {
      InputStream localInputStream = this.wrappedEntity.getContent();
      localObject = localInputStream;
      localInputStream = decorate(localInputStream);
      return localInputStream;
    }
    catch (IOException localIOException)
    {
      IOUtils.closeQuietly((Closeable)localObject);
      throw localIOException;
    }
  }
  
  abstract InputStream decorate(InputStream paramInputStream)
    throws IOException;
  
  public InputStream getContent()
    throws IOException
  {
    if (this.wrappedEntity.isStreaming())
    {
      if (this.content == null) {
        this.content = getDecompressingStream();
      }
      return this.content;
    }
    return getDecompressingStream();
  }
  
  public long getContentLength()
  {
    return -1L;
  }
  
  public void setCallBackHandler(RequestCallBackHandler paramRequestCallBackHandler)
  {
    this.callBackHandler = paramRequestCallBackHandler;
  }
  
  public void writeTo(OutputStream paramOutputStream)
    throws IOException
  {
    if (paramOutputStream == null) {
      throw new IllegalArgumentException("Output stream may not be null");
    }
    Object localObject = null;
    try
    {
      InputStream localInputStream = getContent();
      localObject = localInputStream;
      byte[] arrayOfByte = new byte['က'];
      do
      {
        do
        {
          localObject = localInputStream;
          int i = localInputStream.read(arrayOfByte);
          if (i == -1)
          {
            localObject = localInputStream;
            paramOutputStream.flush();
            localObject = localInputStream;
            if (this.callBackHandler != null)
            {
              localObject = localInputStream;
              this.callBackHandler.updateProgress(this.uncompressedLength, this.uploadedSize, true);
            }
            IOUtils.closeQuietly(localInputStream);
            return;
          }
          localObject = localInputStream;
          paramOutputStream.write(arrayOfByte, 0, i);
          localObject = localInputStream;
          this.uploadedSize += i;
          localObject = localInputStream;
        } while (this.callBackHandler == null);
        localObject = localInputStream;
      } while (this.callBackHandler.updateProgress(this.uncompressedLength, this.uploadedSize, false));
      localObject = localInputStream;
      throw new InterruptedIOException("stop");
    }
    finally
    {
      IOUtils.closeQuietly((Closeable)localObject);
    }
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\lidroid\xutils\http\client\entity\DecompressingEntity.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */