package com.alien.demo.data;

public class LocalSettings
{
    private static boolean debugMode;
    private static boolean showHiddenSetting;
    
    public boolean isDebugMode() {
        return LocalSettings.debugMode;
    }
    
    public boolean isShowHiddenSetting() {
        return LocalSettings.showHiddenSetting;
    }
    
    public void setDebugMode(final boolean debugMode) {
        LocalSettings.debugMode = debugMode;
    }
    
    public void setShowHiddenSetting(final boolean showHiddenSetting) {
        LocalSettings.showHiddenSetting = showHiddenSetting;
    }
}
