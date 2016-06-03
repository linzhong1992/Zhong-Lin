package com.lidroid.xutils.bitmap;

import android.content.Context;
import android.content.res.Resources;
import android.os.Environment;
import android.os.StatFs;
import android.util.DisplayMetrics;
import android.view.View;
import android.view.ViewGroup.LayoutParams;
import android.widget.ImageView;
import com.lidroid.xutils.bitmap.core.BitmapSize;
import com.lidroid.xutils.util.LogUtils;
import java.io.File;
import java.lang.reflect.Field;

public class BitmapCommonUtils
{
  private static BitmapSize screenSize = null;
  
  public static long getAvailableSpace(File paramFile)
  {
    try
    {
      paramFile = new StatFs(paramFile.getPath());
      long l = paramFile.getBlockSize();
      int i = paramFile.getAvailableBlocks();
      return l * i;
    }
    catch (Throwable paramFile)
    {
      LogUtils.e(paramFile.getMessage(), paramFile);
    }
    return -1L;
  }
  
  public static String getDiskCacheDir(Context paramContext, String paramString)
  {
    Object localObject2 = null;
    Object localObject1 = localObject2;
    if ("mounted".equals(Environment.getExternalStorageState()))
    {
      File localFile = paramContext.getExternalCacheDir();
      localObject1 = localObject2;
      if (localFile != null) {
        localObject1 = localFile.getPath();
      }
    }
    localObject2 = localObject1;
    if (localObject1 == null) {
      localObject2 = paramContext.getCacheDir().getPath();
    }
    return localObject2 + File.separator + paramString;
  }
  
  private static int getImageViewFieldValue(Object paramObject, String paramString)
  {
    int j = 0;
    int i = j;
    if ((paramObject instanceof ImageView)) {}
    try
    {
      paramString = ImageView.class.getDeclaredField(paramString);
      paramString.setAccessible(true);
      int k = ((Integer)paramString.get(paramObject)).intValue();
      i = j;
      if (k > 0)
      {
        i = j;
        if (k < Integer.MAX_VALUE) {
          i = k;
        }
      }
      return i;
    }
    catch (Throwable paramObject) {}
    return 0;
  }
  
  public static BitmapSize getScreenSize(Context paramContext)
  {
    if (screenSize == null)
    {
      screenSize = new BitmapSize();
      paramContext = paramContext.getResources().getDisplayMetrics();
      screenSize.setWidth(paramContext.widthPixels);
      screenSize.setHeight(paramContext.heightPixels);
    }
    return screenSize;
  }
  
  public static BitmapSize optimizeMaxSizeByView(View paramView, int paramInt1, int paramInt2)
  {
    int j = paramInt1;
    int k = paramInt2;
    if ((j > 0) && (k > 0)) {
      return new BitmapSize(j, k);
    }
    ViewGroup.LayoutParams localLayoutParams = paramView.getLayoutParams();
    paramInt1 = k;
    int i = j;
    if (localLayoutParams != null)
    {
      if (localLayoutParams.width <= 0) {
        break label141;
      }
      paramInt2 = localLayoutParams.width;
      if (localLayoutParams.height <= 0) {
        break label162;
      }
      paramInt1 = localLayoutParams.height;
      i = paramInt2;
    }
    for (;;)
    {
      paramInt2 = i;
      if (i <= 0) {
        paramInt2 = getImageViewFieldValue(paramView, "mMaxWidth");
      }
      i = paramInt1;
      if (paramInt1 <= 0) {
        i = getImageViewFieldValue(paramView, "mMaxHeight");
      }
      paramView = getScreenSize(paramView.getContext());
      paramInt1 = paramInt2;
      if (paramInt2 <= 0) {
        paramInt1 = paramView.getWidth();
      }
      paramInt2 = i;
      if (i <= 0) {
        paramInt2 = paramView.getHeight();
      }
      return new BitmapSize(paramInt1, paramInt2);
      label141:
      paramInt2 = j;
      if (localLayoutParams.width == -2) {
        break;
      }
      paramInt2 = paramView.getWidth();
      break;
      label162:
      paramInt1 = k;
      i = paramInt2;
      if (localLayoutParams.height != -2)
      {
        paramInt1 = paramView.getHeight();
        i = paramInt2;
      }
    }
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\lidroid\xutils\bitmap\BitmapCommonUtils.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */