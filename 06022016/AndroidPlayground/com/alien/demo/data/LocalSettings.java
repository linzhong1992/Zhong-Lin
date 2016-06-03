package com.alien.demo.data;

public class LocalSettings
{
  private static boolean debugMode;
  private static boolean showHiddenSetting;
  
  public boolean isDebugMode()
  {
    return debugMode;
  }
  
  public boolean isShowHiddenSetting()
  {
    return showHiddenSetting;
  }
  
  public void setDebugMode(boolean paramBoolean)
  {
    debugMode = paramBoolean;
  }
  
  public void setShowHiddenSetting(boolean paramBoolean)
  {
    showHiddenSetting = paramBoolean;
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\alien\demo\data\LocalSettings.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */