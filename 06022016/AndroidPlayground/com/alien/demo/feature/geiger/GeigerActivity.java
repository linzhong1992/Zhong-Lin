package com.alien.demo.feature.geiger;

import android.app.ActionBar;
import android.app.Activity;
import android.content.Intent;
import android.content.res.AssetFileDescriptor;
import android.content.res.AssetManager;
import android.media.MediaPlayer;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.util.Log;
import android.view.KeyEvent;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.Window;
import android.widget.ProgressBar;
import android.widget.TextView;
import com.alien.demo.feature.mask.MaskActivity;
import com.alien.demo.rfid.TagMask;
import com.alien.demo.rfid.TagScanner;
import com.alien.rfid.RFIDCallback;
import com.alien.rfid.Tag;
import com.dd.processbutton.iml.ActionProcessButton;
import com.dd.processbutton.iml.ActionProcessButton.Mode;

public class GeigerActivity
  extends Activity
  implements RFIDCallback
{
  private static final long INTERVAL_STATUS = 100L;
  private static final int REQUEST_MASK = 1;
  private static final String TAG = "AlienRFID-Geiger";
  private static final long TAG_TIME_OUT = 1000L;
  private static TagScanner scanner;
  private Activity activity;
  private ActionProcessButton btnStartStop;
  private boolean closing = false;
  private int currentRangeLevel = 0;
  private Handler handler;
  private ProgressBar progressBar;
  private RangeLevel[] ranges;
  private String tagEpc = "";
  private long tagLastSeen = 0L;
  private int tagRange = 0;
  private String tagRssi = "0";
  private TextView txtEpc;
  private TextView txtMaskEpc;
  private TextView txtRssi;
  
  private void refreshDetection()
  {
    if ((System.currentTimeMillis() - this.tagLastSeen > 1000L) && (!"0".equals(this.txtRssi.getText()))) {
      resetDetection();
    }
  }
  
  private void refreshTagInfo()
  {
    this.handler.sendEmptyMessage(0);
  }
  
  private void resetDetection()
  {
    this.tagEpc = "";
    this.tagRssi = "0";
    this.tagRange = 0;
    this.ranges[this.currentRangeLevel].pause();
    this.currentRangeLevel = 0;
    refreshTagInfo();
  }
  
  private void startSearch()
  {
    if (!scanner.isScanning())
    {
      this.btnStartStop.setText(2131034171);
      this.btnStartStop.startAnimation();
      scanner.scan();
    }
  }
  
  private void startSoundFeedbackThread()
  {
    new Thread(new Runnable()
    {
      public void run()
      {
        if (!GeigerActivity.this.closing)
        {
          GeigerActivity.this.refreshDetection();
          int j = GeigerActivity.this.currentRangeLevel;
          int i = 0;
          for (;;)
          {
            if (i < GeigerActivity.this.ranges.length)
            {
              if (GeigerActivity.this.tagRange <= GeigerActivity.this.ranges[i].value) {
                GeigerActivity.access$902(GeigerActivity.this, i);
              }
            }
            else
            {
              if (j != GeigerActivity.this.currentRangeLevel)
              {
                GeigerActivity.this.ranges[j].pause();
                GeigerActivity.this.ranges[GeigerActivity.this.currentRangeLevel].play();
              }
              try
              {
                Thread.sleep(100L);
              }
              catch (InterruptedException localInterruptedException) {}
              break;
            }
            i += 1;
          }
        }
      }
    }).start();
  }
  
  private void stopSearch()
  {
    if (scanner.isScanning())
    {
      this.btnStartStop.setText(2131034170);
      this.btnStartStop.stopAnimation();
      scanner.stop(this);
    }
    resetDetection();
  }
  
  private void updateMask()
  {
    String str = scanner.getFilter().toString();
    if (str.isEmpty())
    {
      this.txtMaskEpc.setText(2131034172);
      return;
    }
    this.txtMaskEpc.setText(str);
  }
  
  protected void onActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    if ((paramInt1 == 1) && (paramInt2 == -1))
    {
      scanner.getFilter().loadFromString(paramIntent.getStringExtra("filter_data"));
      Log.i("AlienRFID-Geiger", "Set mask EPC: " + scanner.getFilter().toString());
      updateMask();
    }
  }
  
  public void onClickMask(View paramView)
  {
    paramView = new Intent(this, MaskActivity.class);
    paramView.putExtra("filter_data", scanner.getFilter().convertToString());
    startActivityForResult(paramView, 1);
  }
  
  public void onClickStartStopSearch(View paramView)
  {
    if (!scanner.isScanning())
    {
      startSearch();
      return;
    }
    stopSearch();
  }
  
  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    getActionBar().setDisplayHomeAsUpEnabled(true);
    this.activity = this;
    setContentView(2130903067);
    getWindow().addFlags(128);
    this.progressBar = ((ProgressBar)findViewById(2131492981));
    this.txtMaskEpc = ((TextView)findViewById(2131492978));
    this.txtRssi = ((TextView)findViewById(2131492979));
    this.txtEpc = ((TextView)findViewById(2131492982));
    this.btnStartStop = ((ActionProcessButton)findViewById(2131492980));
    this.btnStartStop.setMode(ActionProcessButton.Mode.ENDLESS);
    this.ranges = new RangeLevel[] { new RangeLevel(0, null), new RangeLevel(30, "quietest_snd.mp3"), new RangeLevel(40, "default_snd.mp3"), new RangeLevel(60, "loudest_snd.mp3"), new RangeLevel(100, "success_snd.mp3") };
    this.handler = new Handler()
    {
      public void handleMessage(Message paramAnonymousMessage)
      {
        String str1 = GeigerActivity.this.tagEpc;
        String str2 = GeigerActivity.this.tagRssi;
        int j = GeigerActivity.this.tagRange;
        int i = 0;
        paramAnonymousMessage = "";
        if (i < str1.length())
        {
          paramAnonymousMessage = paramAnonymousMessage + str1.substring(i, Math.min(i + 4, str1.length()));
          i += 4;
          StringBuilder localStringBuilder = new StringBuilder().append(paramAnonymousMessage);
          if (i % 12 != 0) {}
          for (paramAnonymousMessage = " ";; paramAnonymousMessage = "\n")
          {
            paramAnonymousMessage = paramAnonymousMessage;
            break;
          }
        }
        GeigerActivity.this.txtEpc.setText(paramAnonymousMessage);
        GeigerActivity.this.txtRssi.setText(str2);
        GeigerActivity.this.progressBar.setProgress(j);
      }
    };
    if (scanner == null) {
      scanner = new TagScanner(this);
    }
    for (;;)
    {
      startSoundFeedbackThread();
      return;
      scanner.setListener(this);
      updateMask();
    }
  }
  
  public boolean onCreateOptionsMenu(Menu paramMenu)
  {
    getMenuInflater().inflate(2131558402, paramMenu);
    return true;
  }
  
  protected void onDestroy()
  {
    super.onDestroy();
    this.closing = true;
    scanner.stop();
  }
  
  public boolean onKeyDown(int paramInt, KeyEvent paramKeyEvent)
  {
    if ((paramInt == 139) && (paramKeyEvent.getRepeatCount() == 0))
    {
      startSearch();
      return true;
    }
    return super.onKeyDown(paramInt, paramKeyEvent);
  }
  
  public boolean onKeyUp(int paramInt, KeyEvent paramKeyEvent)
  {
    if (paramInt == 139)
    {
      stopSearch();
      return true;
    }
    return super.onKeyUp(paramInt, paramKeyEvent);
  }
  
  public boolean onOptionsItemSelected(MenuItem paramMenuItem)
  {
    switch (paramMenuItem.getItemId())
    {
    default: 
      return super.onOptionsItemSelected(paramMenuItem);
    }
    onBackPressed();
    return true;
  }
  
  public void onPause()
  {
    super.onPause();
    stopSearch();
  }
  
  public void onTagRead(Tag paramTag)
  {
    TagProximator.addData(paramTag.getEPC(), paramTag.getRSSI());
    double d = TagProximator.getProximity(paramTag.getEPC());
    int i = TagProximator.getScaledProximity(paramTag.getEPC());
    this.tagLastSeen = System.currentTimeMillis();
    this.tagEpc = paramTag.getEPC();
    this.tagRssi = String.format("%1$,.1f", new Object[] { Double.valueOf(d) });
    this.tagRange = Math.min(i, 100);
    this.tagRange = Math.max(i, 0);
    refreshTagInfo();
  }
  
  class RangeLevel
  {
    MediaPlayer mp;
    String sound;
    int value;
    
    RangeLevel(int paramInt, String paramString)
    {
      this.value = paramInt;
      this.sound = paramString;
      if (paramString == null) {
        return;
      }
      try
      {
        this.mp = new MediaPlayer();
        this$1 = GeigerActivity.this.activity.getAssets().openFd(paramString);
        this.mp.setDataSource(GeigerActivity.this.getFileDescriptor(), GeigerActivity.this.getStartOffset(), GeigerActivity.this.getLength());
        GeigerActivity.this.close();
        this.mp.setLooping(true);
        this.mp.prepare();
        return;
      }
      catch (Exception this$1)
      {
        Log.e("AlienRFID-Geiger", "Error play range audio : " + GeigerActivity.this);
        GeigerActivity.this.printStackTrace();
      }
    }
    
    void pause()
    {
      if (this.mp == null) {
        return;
      }
      this.mp.pause();
    }
    
    void play()
    {
      if (this.mp == null) {
        return;
      }
      this.mp.start();
    }
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\alien\demo\feature\geiger\GeigerActivity.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */