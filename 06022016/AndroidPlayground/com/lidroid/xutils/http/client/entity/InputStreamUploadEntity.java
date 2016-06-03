package com.lidroid.xutils.http.client.entity;

import com.lidroid.xutils.http.callback.RequestCallBackHandler;
import com.lidroid.xutils.util.IOUtils;
import java.io.IOException;
import java.io.InputStream;
import java.io.InterruptedIOException;
import java.io.OutputStream;
import org.apache.http.entity.AbstractHttpEntity;

public class InputStreamUploadEntity
  extends AbstractHttpEntity
  implements UploadEntity
{
  private static final int BUFFER_SIZE = 2048;
  private RequestCallBackHandler callBackHandler = null;
  private final InputStream content;
  private final long length;
  private long uploadedSize = 0L;
  
  public InputStreamUploadEntity(InputStream paramInputStream, long paramLong)
  {
    if (paramInputStream == null) {
      throw new IllegalArgumentException("Source input stream may not be null");
    }
    this.content = paramInputStream;
    this.length = paramLong;
  }
  
  public void consumeContent()
    throws IOException
  {
    this.content.close();
  }
  
  public InputStream getContent()
    throws IOException
  {
    return this.content;
  }
  
  public long getContentLength()
  {
    return this.length;
  }
  
  public boolean isRepeatable()
  {
    return false;
  }
  
  public boolean isStreaming()
  {
    return true;
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
    InputStream localInputStream = this.content;
    do
    {
      long l2;
      do
      {
        byte[] arrayOfByte;
        int i;
        do
        {
          do
          {
            try
            {
              arrayOfByte = new byte['ࠀ'];
              if (this.length < 0L)
              {
                do
                {
                  i = localInputStream.read(arrayOfByte);
                  if (i == -1)
                  {
                    paramOutputStream.flush();
                    if (this.callBackHandler != null) {
                      this.callBackHandler.updateProgress(this.length, this.uploadedSize, true);
                    }
                    return;
                  }
                  paramOutputStream.write(arrayOfByte, 0, i);
                  this.uploadedSize += i;
                } while ((this.callBackHandler == null) || (this.callBackHandler.updateProgress(this.uploadedSize + 1L, this.uploadedSize, false)));
                throw new InterruptedIOException("stop");
              }
            }
            finally
            {
              IOUtils.closeQuietly(localInputStream);
            }
            l1 = this.length;
          } while (l1 <= 0L);
          i = localInputStream.read(arrayOfByte, 0, (int)Math.min(2048L, l1));
        } while (i == -1);
        paramOutputStream.write(arrayOfByte, 0, i);
        l2 = l1 - i;
        this.uploadedSize += i;
        l1 = l2;
      } while (this.callBackHandler == null);
      long l1 = l2;
    } while (this.callBackHandler.updateProgress(this.length, this.uploadedSize, false));
    throw new InterruptedIOException("stop");
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\lidroid\xutils\http\client\entity\InputStreamUploadEntity.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */