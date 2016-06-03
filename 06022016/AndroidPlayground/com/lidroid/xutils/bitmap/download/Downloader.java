package com.lidroid.xutils.bitmap.download;

import android.content.Context;
import com.lidroid.xutils.BitmapUtils.BitmapLoadTask;
import java.io.OutputStream;

public abstract class Downloader
{
  private Context context;
  private int defaultConnectTimeout;
  private long defaultExpiry;
  private int defaultReadTimeout;
  
  public abstract long downloadToStream(String paramString, OutputStream paramOutputStream, BitmapUtils.BitmapLoadTask<?> paramBitmapLoadTask);
  
  public Context getContext()
  {
    return this.context;
  }
  
  public int getDefaultConnectTimeout()
  {
    return this.defaultConnectTimeout;
  }
  
  public long getDefaultExpiry()
  {
    return this.defaultExpiry;
  }
  
  public int getDefaultReadTimeout()
  {
    return this.defaultReadTimeout;
  }
  
  public void setContext(Context paramContext)
  {
    this.context = paramContext;
  }
  
  public void setDefaultConnectTimeout(int paramInt)
  {
    this.defaultConnectTimeout = paramInt;
  }
  
  public void setDefaultExpiry(long paramLong)
  {
    this.defaultExpiry = paramLong;
  }
  
  public void setDefaultReadTimeout(int paramInt)
  {
    this.defaultReadTimeout = paramInt;
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\lidroid\xutils\bitmap\download\Downloader.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */