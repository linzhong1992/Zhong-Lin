package com.lidroid.xutils.http.client.entity;

import com.lidroid.xutils.http.callback.RequestCallBackHandler;
import com.lidroid.xutils.util.IOUtils;
import java.io.Closeable;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InterruptedIOException;
import java.io.OutputStream;
import org.apache.http.entity.FileEntity;

public class FileUploadEntity
  extends FileEntity
  implements UploadEntity
{
  private RequestCallBackHandler callBackHandler = null;
  private long fileSize;
  private long uploadedSize = 0L;
  
  public FileUploadEntity(File paramFile, String paramString)
  {
    super(paramFile, paramString);
    this.fileSize = paramFile.length();
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
    byte[] arrayOfByte = null;
    try
    {
      localObject1 = new FileInputStream(this.file);
      try
      {
        arrayOfByte = new byte['က'];
        do
        {
          int i = ((InputStream)localObject1).read(arrayOfByte);
          if (i == -1)
          {
            paramOutputStream.flush();
            if (this.callBackHandler != null) {
              this.callBackHandler.updateProgress(this.fileSize, this.uploadedSize, true);
            }
            IOUtils.closeQuietly((Closeable)localObject1);
            return;
          }
          paramOutputStream.write(arrayOfByte, 0, i);
          this.uploadedSize += i;
        } while ((this.callBackHandler == null) || (this.callBackHandler.updateProgress(this.fileSize, this.uploadedSize, false)));
        throw new InterruptedIOException("stop");
      }
      finally
      {
        paramOutputStream = (OutputStream)localObject1;
        localObject1 = localObject3;
      }
    }
    finally
    {
      Object localObject1;
      paramOutputStream = (OutputStream)localObject3;
    }
    IOUtils.closeQuietly(paramOutputStream);
    throw ((Throwable)localObject1);
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\lidroid\xutils\http\client\entity\FileUploadEntity.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */