package com.alien.demo;

import android.content.Context;

public class Application
  extends android.app.Application
{
  private static Context mContext;
  
  public static Context getContext()
  {
    return mContext;
  }
  
  public void onCreate()
  {
    super.onCreate();
    mContext = getApplicationContext();
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\alien\demo\Application.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */