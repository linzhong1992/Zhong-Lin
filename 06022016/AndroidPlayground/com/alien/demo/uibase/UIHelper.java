package com.alien.demo.uibase;

import android.content.Context;
import android.os.CountDownTimer;
import android.view.View;
import android.view.animation.AlphaAnimation;
import android.view.animation.Animation;
import android.view.animation.LinearInterpolator;
import android.widget.Toast;

public class UIHelper
{
  public static void ToastMessage(Context paramContext, int paramInt)
  {
    Toast.makeText(paramContext, paramInt, 0).show();
  }
  
  public static void ToastMessage(Context paramContext, String paramString)
  {
    Toast.makeText(paramContext, paramString, 0).show();
  }
  
  public static void ToastMessage(Context paramContext, String paramString, int paramInt)
  {
    Toast.makeText(paramContext, paramString, paramInt).show();
  }
  
  public static void flashingView(View paramView)
  {
    AlphaAnimation localAlphaAnimation = new AlphaAnimation(1.0F, 0.0F);
    localAlphaAnimation.setDuration(500L);
    localAlphaAnimation.setInterpolator(new LinearInterpolator());
    localAlphaAnimation.setRepeatCount(-1);
    localAlphaAnimation.setRepeatMode(2);
    paramView.startAnimation(localAlphaAnimation);
    new CountDownTimer(1000L, 1000L)
    {
      public void onFinish()
      {
        this.val$v.clearAnimation();
      }
      
      public void onTick(long paramAnonymousLong) {}
    }.start();
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\alien\demo\uibase\UIHelper.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */