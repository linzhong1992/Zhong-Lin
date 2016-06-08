package com.alien.demo.system;

import android.content.*;
import android.media.*;
import android.util.*;
import android.content.res.*;

public class Sound
{
    private static final String DETECT_SOUND = "detect_snd.mp3";
    private static final String ERROR_SOUND = "beep_error.mp3";
    private static final String TAG = "AlienRFID-Sound";
    
    public static void playError(final Context context) {
        try {
            final MediaPlayer mediaPlayer = new MediaPlayer();
            final AssetFileDescriptor openFd = context.getAssets().openFd("beep_error.mp3");
            mediaPlayer.setDataSource(openFd.getFileDescriptor(), openFd.getStartOffset(), openFd.getLength());
            openFd.close();
            mediaPlayer.prepare();
            mediaPlayer.start();
            mediaPlayer.setOnCompletionListener((MediaPlayer$OnCompletionListener)new MediaPlayer$OnCompletionListener() {
                public void onCompletion(final MediaPlayer mediaPlayer) {
                    mediaPlayer.release();
                }
            });
        }
        catch (Exception ex) {
            Log.e("AlienRFID-Sound", "Error play sound: " + ex);
            ex.printStackTrace();
        }
    }
    
    public static void playSuccess(final Context context) {
        try {
            final MediaPlayer mediaPlayer = new MediaPlayer();
            final AssetFileDescriptor openFd = context.getAssets().openFd("detect_snd.mp3");
            mediaPlayer.setDataSource(openFd.getFileDescriptor(), openFd.getStartOffset(), openFd.getLength());
            openFd.close();
            mediaPlayer.prepare();
            mediaPlayer.start();
            mediaPlayer.setOnCompletionListener((MediaPlayer$OnCompletionListener)new MediaPlayer$OnCompletionListener() {
                public void onCompletion(final MediaPlayer mediaPlayer) {
                    mediaPlayer.release();
                }
            });
        }
        catch (Exception ex) {
            Log.e("AlienRFID-Sound", "Error play sound: " + ex);
            ex.printStackTrace();
        }
    }
}
