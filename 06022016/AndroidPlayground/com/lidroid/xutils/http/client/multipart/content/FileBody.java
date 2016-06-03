package com.lidroid.xutils.http.client.multipart.content;

import com.lidroid.xutils.http.client.multipart.MultipartEntity.CallBackInfo;
import com.lidroid.xutils.util.IOUtils;
import java.io.Closeable;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InterruptedIOException;
import java.io.OutputStream;

public class FileBody
  extends AbstractContentBody
{
  private final String charset;
  private final File file;
  private final String filename;
  
  public FileBody(File paramFile)
  {
    this(paramFile, null, "application/octet-stream", null);
  }
  
  public FileBody(File paramFile, String paramString)
  {
    this(paramFile, null, paramString, null);
  }
  
  public FileBody(File paramFile, String paramString1, String paramString2)
  {
    this(paramFile, null, paramString1, paramString2);
  }
  
  public FileBody(File paramFile, String paramString1, String paramString2, String paramString3)
  {
    super(paramString2);
    if (paramFile == null) {
      throw new IllegalArgumentException("File may not be null");
    }
    this.file = paramFile;
    if (paramString1 != null) {}
    for (this.filename = paramString1;; this.filename = paramFile.getName())
    {
      this.charset = paramString3;
      return;
    }
  }
  
  public String getCharset()
  {
    return this.charset;
  }
  
  public long getContentLength()
  {
    return this.file.length();
  }
  
  public File getFile()
  {
    return this.file;
  }
  
  public String getFilename()
  {
    return this.filename;
  }
  
  public InputStream getInputStream()
    throws IOException
  {
    return new FileInputStream(this.file);
  }
  
  public String getTransferEncoding()
  {
    return "binary";
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
            IOUtils.closeQuietly((Closeable)localObject1);
            return;
          }
          paramOutputStream.write(arrayOfByte, 0, i);
          MultipartEntity.CallBackInfo localCallBackInfo = this.callBackInfo;
          localCallBackInfo.pos += i;
        } while (this.callBackInfo.doCallBack(false));
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


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\lidroid\xutils\http\client\multipart\content\FileBody.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */