package com.alien.demo;

import android.content.*;

public class Application extends android.app.Application
{
    private static Context mContext;
    
    public static Context getContext() {
        return Application.mContext;
    }
    
    public void onCreate() {
        super.onCreate();
        Application.mContext = this.getApplicationContext();
    }
}
