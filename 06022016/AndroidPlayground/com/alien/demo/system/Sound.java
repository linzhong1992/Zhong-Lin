package com.alien.demo.system;

import android.content.Context;
import android.content.res.AssetFileDescriptor;
import android.content.res.AssetManager;
import android.media.MediaPlayer;
import android.media.MediaPlayer.OnCompletionListener;
import android.util.Log;

public class Sound
{
  private static final String DETECT_SOUND = "detect_snd.mp3";
  private static final String ERROR_SOUND = "beep_error.mp3";
  private static final String TAG = "AlienRFID-Sound";
  
  public static void playError(Context paramContext)
  {
    try
    {
      MediaPlayer localMediaPlayer = new MediaPlayer();
      paramContext = paramContext.getAssets().openFd("beep_error.mp3");
      localMediaPlayer.setDataSource(paramContext.getFileDescriptor(), paramContext.getStartOffset(), paramContext.getLength());
      paramContext.close();
      localMediaPlayer.prepare();
      localMediaPlayer.start();
      localMediaPlayer.setOnCompletionListener(new MediaPlayer.OnCompletionListener()
      {
        public void onCompletion(MediaPlayer paramAnonymousMediaPlayer)
        {
          paramAnonymousMediaPlayer.release();
        }
      });
      return;
    }
    catch (Exception paramContext)
    {
      Log.e("AlienRFID-Sound", "Error play sound: " + paramContext);
      paramContext.printStackTrace();
    }
  }
  
  public static void playSuccess(Context paramContext)
  {
    try
    {
      MediaPlayer localMediaPlayer = new MediaPlayer();
      paramContext = paramContext.getAssets().openFd("detect_snd.mp3");
      localMediaPlayer.setDataSource(paramContext.getFileDescriptor(), paramContext.getStartOffset(), paramContext.getLength());
      paramContext.close();
      localMediaPlayer.prepare();
      localMediaPlayer.start();
      localMediaPlayer.setOnCompletionListener(new MediaPlayer.OnCompletionListener()
      {
        public void onCompletion(MediaPlayer paramAnonymousMediaPlayer)
        {
          paramAnonymousMediaPlayer.release();
        }
      });
      return;
    }
    catch (Exception paramContext)
    {
      Log.e("AlienRFID-Sound", "Error play sound: " + paramContext);
      paramContext.printStackTrace();
    }
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\alien\demo\system\Sound.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */