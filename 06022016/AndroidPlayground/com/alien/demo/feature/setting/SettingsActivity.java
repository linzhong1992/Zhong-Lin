package com.alien.demo.feature.setting;

import android.app.ActionBar;
import android.app.Activity;
import android.os.Bundle;
import android.util.Log;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnTouchListener;
import android.view.Window;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemSelectedListener;
import android.widget.CheckBox;
import android.widget.CompoundButton;
import android.widget.CompoundButton.OnCheckedChangeListener;
import android.widget.SeekBar;
import android.widget.SeekBar.OnSeekBarChangeListener;
import android.widget.Spinner;
import android.widget.TextView;
import com.alien.common.DeviceInfo;
import com.alien.demo.data.LocalSettings;
import com.alien.demo.rfid.TagScanner;
import com.alien.rfid.RFIDInfo;
import com.alien.rfid.RFIDReader;
import com.alien.rfid.Session;
import com.alien.rfid.Target;

public class SettingsActivity
  extends Activity
{
  private static final String TAG = "AlienRFID-Settings";
  private CheckBox chkDebugMode;
  LocalSettings localSettings;
  private View localSettingsView;
  private int power;
  private int qvalue;
  private RFIDReader reader;
  private int session;
  private SeekBar skPower;
  private SeekBar skQvalue;
  private Spinner spSession;
  private Spinner spTarget;
  private int target;
  private TextView txtDeviceInfo;
  private TextView txtPower;
  private TextView txtQValue;
  
  private void loadReaderSetting()
  {
    try
    {
      this.chkDebugMode.setChecked(this.localSettings.isDebugMode());
      this.qvalue = this.reader.getQ();
      this.session = this.reader.getSession().getValue();
      this.power = this.reader.getPower();
      this.target = this.reader.getTarget().getValue();
      this.skPower.setProgress(this.power - 1);
      this.skQvalue.setProgress(this.qvalue);
      this.spSession.setSelection(this.session);
      this.spTarget.setSelection(this.target);
      return;
    }
    catch (Exception localException)
    {
      Log.e("AlienRFID-Settings", "Error loading reader settings: " + localException);
      localException.printStackTrace();
    }
  }
  
  private void resetSetting()
  {
    try
    {
      this.reader.setQ(3);
      this.reader.setSession(Session.S1);
      this.reader.setTarget(Target.A);
      this.reader.setPower(30);
      loadReaderSetting();
      return;
    }
    catch (Exception localException)
    {
      Log.e("AlienRFID-Settings", "Error reset reader settings: " + localException);
      localException.printStackTrace();
    }
  }
  
  private void saveReaderSetting()
  {
    try
    {
      this.reader.setQ(this.qvalue);
      this.reader.setSession(Session.fromValue(this.session));
      this.reader.setPower(this.power);
      this.reader.setTarget(Target.fromValue(this.target));
      return;
    }
    catch (Exception localException)
    {
      Log.e("AlienRFID-Settings", "Error saving reader settings: " + localException);
      localException.printStackTrace();
    }
  }
  
  public void onClickCancel(View paramView)
  {
    finish();
  }
  
  public void onClickReset(View paramView)
  {
    resetSetting();
  }
  
  public void onClickSave(View paramView)
  {
    saveReaderSetting();
    finish();
  }
  
  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    setContentView(2130903071);
    getActionBar().setDisplayHomeAsUpEnabled(true);
    getWindow().addFlags(128);
    this.localSettings = new LocalSettings();
    this.localSettingsView = findViewById(2131493000);
    this.chkDebugMode = ((CheckBox)findViewById(2131493001));
    this.chkDebugMode.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener()
    {
      public void onCheckedChanged(CompoundButton paramAnonymousCompoundButton, boolean paramAnonymousBoolean)
      {
        SettingsActivity.this.localSettings.setDebugMode(paramAnonymousBoolean);
      }
    });
    this.txtPower = ((TextView)findViewById(2131492995));
    this.txtQValue = ((TextView)findViewById(2131492998));
    this.txtDeviceInfo = ((TextView)findViewById(2131493002));
    this.txtDeviceInfo.setOnTouchListener(new View.OnTouchListener()
    {
      long lastTouch = 0L;
      int touchCount = 0;
      
      private void showHideSettings()
      {
        LocalSettings localLocalSettings = SettingsActivity.this.localSettings;
        if (!SettingsActivity.this.localSettings.isShowHiddenSetting()) {}
        for (boolean bool = true;; bool = false)
        {
          localLocalSettings.setShowHiddenSetting(bool);
          if (!SettingsActivity.this.localSettings.isShowHiddenSetting()) {
            break;
          }
          SettingsActivity.this.localSettingsView.setVisibility(0);
          return;
        }
        SettingsActivity.this.localSettingsView.setVisibility(4);
      }
      
      public boolean onTouch(View paramAnonymousView, MotionEvent paramAnonymousMotionEvent)
      {
        long l = System.currentTimeMillis();
        if (l - this.lastTouch > 500L)
        {
          this.lastTouch = l;
          this.touchCount = 1;
        }
        do
        {
          return false;
          this.lastTouch = l;
          this.touchCount += 1;
        } while (this.touchCount != 5);
        showHideSettings();
        this.touchCount = 0;
        return false;
      }
    });
    this.skPower = ((SeekBar)findViewById(2131492994));
    this.skPower.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener()
    {
      public void onProgressChanged(SeekBar paramAnonymousSeekBar, int paramAnonymousInt, boolean paramAnonymousBoolean)
      {
        SettingsActivity.access$102(SettingsActivity.this, paramAnonymousInt + 1);
        SettingsActivity.this.txtPower.setText("" + SettingsActivity.this.power + " dBm");
      }
      
      public void onStartTrackingTouch(SeekBar paramAnonymousSeekBar) {}
      
      public void onStopTrackingTouch(SeekBar paramAnonymousSeekBar) {}
    });
    this.spSession = ((Spinner)findViewById(2131492996));
    this.spSession.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener()
    {
      public void onItemSelected(AdapterView<?> paramAnonymousAdapterView, View paramAnonymousView, int paramAnonymousInt, long paramAnonymousLong)
      {
        SettingsActivity.access$302(SettingsActivity.this, paramAnonymousInt);
      }
      
      public void onNothingSelected(AdapterView<?> paramAnonymousAdapterView) {}
    });
    this.skQvalue = ((SeekBar)findViewById(2131492997));
    this.skQvalue.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener()
    {
      public void onProgressChanged(SeekBar paramAnonymousSeekBar, int paramAnonymousInt, boolean paramAnonymousBoolean)
      {
        SettingsActivity.access$402(SettingsActivity.this, paramAnonymousInt);
        SettingsActivity.this.txtQValue.setText("" + SettingsActivity.this.qvalue);
      }
      
      public void onStartTrackingTouch(SeekBar paramAnonymousSeekBar) {}
      
      public void onStopTrackingTouch(SeekBar paramAnonymousSeekBar) {}
    });
    this.spTarget = ((Spinner)findViewById(2131492999));
    this.spTarget.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener()
    {
      public void onItemSelected(AdapterView<?> paramAnonymousAdapterView, View paramAnonymousView, int paramAnonymousInt, long paramAnonymousLong)
      {
        SettingsActivity.access$602(SettingsActivity.this, paramAnonymousInt);
      }
      
      public void onNothingSelected(AdapterView<?> paramAnonymousAdapterView) {}
    });
    this.reader = TagScanner.getRFIDReader();
    Object localObject3 = new DeviceInfo(this);
    paramBundle = this.reader.getInfo(RFIDInfo.HARDWARE_VER);
    Object localObject2 = this.reader.getInfo(RFIDInfo.FIRMWARE_VER);
    Object localObject1 = this.reader.getInfo(RFIDInfo.MODULE_ID);
    String str = this.reader.getInfo(RFIDInfo.REGION);
    localObject3 = ((DeviceInfo)localObject3).getDeviceID();
    StringBuilder localStringBuilder = new StringBuilder().append("Hardware Version: ");
    if (paramBundle != null)
    {
      localStringBuilder = localStringBuilder.append(paramBundle).append("\n").append("Firmware Version: ");
      if (localObject2 == null) {
        break label508;
      }
      paramBundle = (Bundle)localObject2;
      label367:
      localObject2 = localStringBuilder.append(paramBundle).append("\n").append("Module ID: ");
      if (localObject1 == null) {
        break label515;
      }
      paramBundle = (Bundle)localObject1;
      label395:
      localObject1 = ((StringBuilder)localObject2).append(paramBundle).append("\n").append("Region: ");
      if (str == null) {
        break label522;
      }
      paramBundle = str;
      label421:
      paramBundle = paramBundle + "\n" + "API Version: " + "1.0.2" + "\n" + "Device ID: " + (String)localObject3;
      this.txtDeviceInfo.setText(paramBundle);
      loadReaderSetting();
      paramBundle = this.localSettingsView;
      if (!this.localSettings.isShowHiddenSetting()) {
        break label529;
      }
    }
    label508:
    label515:
    label522:
    label529:
    for (int i = 0;; i = 4)
    {
      paramBundle.setVisibility(i);
      return;
      paramBundle = "";
      break;
      paramBundle = "";
      break label367;
      paramBundle = "";
      break label395;
      paramBundle = "";
      break label421;
    }
  }
  
  public boolean onCreateOptionsMenu(Menu paramMenu)
  {
    getMenuInflater().inflate(2131558406, paramMenu);
    return true;
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
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\alien\demo\feature\setting\SettingsActivity.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */