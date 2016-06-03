package com.lidroid.xutils.view;

import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.content.res.XmlResourceParser;
import android.graphics.Movie;
import android.graphics.drawable.Drawable;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;

public class ResLoader
{
  public static Animation getAnimation(Context paramContext, int paramInt)
  {
    return AnimationUtils.loadAnimation(paramContext, paramInt);
  }
  
  public static boolean getBoolean(Context paramContext, int paramInt)
  {
    return paramContext.getResources().getBoolean(paramInt);
  }
  
  public static int getColor(Context paramContext, int paramInt)
  {
    return paramContext.getResources().getColor(paramInt);
  }
  
  public static ColorStateList getColorStateList(Context paramContext, int paramInt)
  {
    return paramContext.getResources().getColorStateList(paramInt);
  }
  
  public static float getDimension(Context paramContext, int paramInt)
  {
    return paramContext.getResources().getDimension(paramInt);
  }
  
  public static int getDimensionPixelOffset(Context paramContext, int paramInt)
  {
    return paramContext.getResources().getDimensionPixelOffset(paramInt);
  }
  
  public static int getDimensionPixelSize(Context paramContext, int paramInt)
  {
    return paramContext.getResources().getDimensionPixelSize(paramInt);
  }
  
  public static Drawable getDrawable(Context paramContext, int paramInt)
  {
    return paramContext.getResources().getDrawable(paramInt);
  }
  
  public static int[] getIntArray(Context paramContext, int paramInt)
  {
    return paramContext.getResources().getIntArray(paramInt);
  }
  
  public static int getInteger(Context paramContext, int paramInt)
  {
    return paramContext.getResources().getInteger(paramInt);
  }
  
  public static Movie getMovie(Context paramContext, int paramInt)
  {
    return paramContext.getResources().getMovie(paramInt);
  }
  
  public static String getString(Context paramContext, int paramInt)
  {
    return paramContext.getResources().getString(paramInt);
  }
  
  public static String[] getStringArray(Context paramContext, int paramInt)
  {
    return paramContext.getResources().getStringArray(paramInt);
  }
  
  public static CharSequence getText(Context paramContext, int paramInt)
  {
    return paramContext.getResources().getText(paramInt);
  }
  
  public static CharSequence[] getTextArray(Context paramContext, int paramInt)
  {
    return paramContext.getResources().getTextArray(paramInt);
  }
  
  public static XmlResourceParser getXml(Context paramContext, int paramInt)
  {
    return paramContext.getResources().getXml(paramInt);
  }
  
  public static Object loadRes(ResType paramResType, Context paramContext, int paramInt)
  {
    if ((paramContext == null) || (paramInt < 1)) {
      return null;
    }
    switch (paramResType)
    {
    default: 
      return null;
    case Animation: 
      return getAnimation(paramContext, paramInt);
    case Boolean: 
      return Boolean.valueOf(getBoolean(paramContext, paramInt));
    case Color: 
      return Integer.valueOf(getColor(paramContext, paramInt));
    case ColorStateList: 
      return getColorStateList(paramContext, paramInt);
    case Dimension: 
      return Float.valueOf(getDimension(paramContext, paramInt));
    case DimensionPixelOffset: 
      return Integer.valueOf(getDimensionPixelOffset(paramContext, paramInt));
    case DimensionPixelSize: 
      return Integer.valueOf(getDimensionPixelSize(paramContext, paramInt));
    case Drawable: 
      return getDrawable(paramContext, paramInt);
    case IntArray: 
      return Integer.valueOf(getInteger(paramContext, paramInt));
    case Integer: 
      return getIntArray(paramContext, paramInt);
    case Movie: 
      return getMovie(paramContext, paramInt);
    case String: 
      return getString(paramContext, paramInt);
    case StringArray: 
      return getStringArray(paramContext, paramInt);
    case Text: 
      return getText(paramContext, paramInt);
    case TextArray: 
      return getTextArray(paramContext, paramInt);
    }
    return getXml(paramContext, paramInt);
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\lidroid\xutils\view\ResLoader.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */