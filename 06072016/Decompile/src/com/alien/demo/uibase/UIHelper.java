package com.alien.demo.uibase;

import android.content.*;
import android.widget.*;
import android.view.*;
import android.view.animation.*;
import android.os.*;

public class UIHelper
{
    public static void ToastMessage(final Context context, final int n) {
        Toast.makeText(context, n, 0).show();
    }
    
    public static void ToastMessage(final Context context, final String s) {
        Toast.makeText(context, (CharSequence)s, 0).show();
    }
    
    public static void ToastMessage(final Context context, final String s, final int n) {
        Toast.makeText(context, (CharSequence)s, n).show();
    }
    
    public static void flashingView(final View view) {
        final AlphaAnimation alphaAnimation = new AlphaAnimation(1.0f, 0.0f);
        ((Animation)alphaAnimation).setDuration(500L);
        ((Animation)alphaAnimation).setInterpolator((Interpolator)new LinearInterpolator());
        ((Animation)alphaAnimation).setRepeatCount(-1);
        ((Animation)alphaAnimation).setRepeatMode(2);
        view.startAnimation((Animation)alphaAnimation);
        new CountDownTimer(1000L, 1000L) {
            public void onFinish() {
                view.clearAnimation();
            }
            
            public void onTick(final long n) {
            }
        }.start();
    }
}
