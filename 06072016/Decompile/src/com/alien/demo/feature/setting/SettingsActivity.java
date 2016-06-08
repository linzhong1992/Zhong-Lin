package com.alien.demo.feature.setting;

import android.app.*;
import com.alien.demo.data.*;
import android.util.*;
import android.os.*;
import android.widget.*;
import com.alien.demo.rfid.*;
import com.alien.common.*;
import android.content.*;
import com.alien.rfid.*;
import android.view.*;

public class SettingsActivity extends Activity
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
    
    private void loadReaderSetting() {
        try {
            this.chkDebugMode.setChecked(this.localSettings.isDebugMode());
            this.qvalue = this.reader.getQ();
            this.session = this.reader.getSession().getValue();
            this.power = this.reader.getPower();
            this.target = this.reader.getTarget().getValue();
            this.skPower.setProgress(this.power - 1);
            this.skQvalue.setProgress(this.qvalue);
            this.spSession.setSelection(this.session);
            this.spTarget.setSelection(this.target);
        }
        catch (Exception ex) {
            Log.e("AlienRFID-Settings", "Error loading reader settings: " + ex);
            ex.printStackTrace();
        }
    }
    
    private void resetSetting() {
        try {
            this.reader.setQ(3);
            this.reader.setSession(Session.S1);
            this.reader.setTarget(Target.A);
            this.reader.setPower(30);
            this.loadReaderSetting();
        }
        catch (Exception ex) {
            Log.e("AlienRFID-Settings", "Error reset reader settings: " + ex);
            ex.printStackTrace();
        }
    }
    
    private void saveReaderSetting() {
        try {
            this.reader.setQ(this.qvalue);
            this.reader.setSession(Session.fromValue(this.session));
            this.reader.setPower(this.power);
            this.reader.setTarget(Target.fromValue(this.target));
        }
        catch (Exception ex) {
            Log.e("AlienRFID-Settings", "Error saving reader settings: " + ex);
            ex.printStackTrace();
        }
    }
    
    public void onClickCancel(final View view) {
        this.finish();
    }
    
    public void onClickReset(final View view) {
        this.resetSetting();
    }
    
    public void onClickSave(final View view) {
        this.saveReaderSetting();
        this.finish();
    }
    
    protected void onCreate(final Bundle bundle) {
        super.onCreate(bundle);
        this.setContentView(2130903071);
        this.getActionBar().setDisplayHomeAsUpEnabled(true);
        this.getWindow().addFlags(128);
        this.localSettings = new LocalSettings();
        this.localSettingsView = this.findViewById(2131493000);
        (this.chkDebugMode = (CheckBox)this.findViewById(2131493001)).setOnCheckedChangeListener((CompoundButton$OnCheckedChangeListener)new CompoundButton$OnCheckedChangeListener() {
            public void onCheckedChanged(final CompoundButton compoundButton, final boolean debugMode) {
                SettingsActivity.this.localSettings.setDebugMode(debugMode);
            }
        });
        this.txtPower = (TextView)this.findViewById(2131492995);
        this.txtQValue = (TextView)this.findViewById(2131492998);
        (this.txtDeviceInfo = (TextView)this.findViewById(2131493002)).setOnTouchListener((View$OnTouchListener)new View$OnTouchListener() {
            long lastTouch = 0L;
            int touchCount = 0;
            
            private void showHideSettings() {
                SettingsActivity.this.localSettings.setShowHiddenSetting(!SettingsActivity.this.localSettings.isShowHiddenSetting());
                if (SettingsActivity.this.localSettings.isShowHiddenSetting()) {
                    SettingsActivity.this.localSettingsView.setVisibility(0);
                    return;
                }
                SettingsActivity.this.localSettingsView.setVisibility(4);
            }
            
            public boolean onTouch(final View view, final MotionEvent motionEvent) {
                final long currentTimeMillis = System.currentTimeMillis();
                if (currentTimeMillis - this.lastTouch > 500L) {
                    this.lastTouch = currentTimeMillis;
                    this.touchCount = 1;
                }
                else {
                    this.lastTouch = currentTimeMillis;
                    ++this.touchCount;
                    if (this.touchCount == 5) {
                        this.showHideSettings();
                        this.touchCount = 0;
                        return false;
                    }
                }
                return false;
            }
        });
        (this.skPower = (SeekBar)this.findViewById(2131492994)).setOnSeekBarChangeListener((SeekBar$OnSeekBarChangeListener)new SeekBar$OnSeekBarChangeListener() {
            public void onProgressChanged(final SeekBar seekBar, final int n, final boolean b) {
                SettingsActivity.this.power = n + 1;
                SettingsActivity.this.txtPower.setText((CharSequence)("" + SettingsActivity.this.power + " dBm"));
            }
            
            public void onStartTrackingTouch(final SeekBar seekBar) {
            }
            
            public void onStopTrackingTouch(final SeekBar seekBar) {
            }
        });
        (this.spSession = (Spinner)this.findViewById(2131492996)).setOnItemSelectedListener((AdapterView$OnItemSelectedListener)new AdapterView$OnItemSelectedListener() {
            public void onItemSelected(final AdapterView<?> adapterView, final View view, final int n, final long n2) {
                SettingsActivity.this.session = n;
            }
            
            public void onNothingSelected(final AdapterView<?> adapterView) {
            }
        });
        (this.skQvalue = (SeekBar)this.findViewById(2131492997)).setOnSeekBarChangeListener((SeekBar$OnSeekBarChangeListener)new SeekBar$OnSeekBarChangeListener() {
            public void onProgressChanged(final SeekBar seekBar, final int n, final boolean b) {
                SettingsActivity.this.qvalue = n;
                SettingsActivity.this.txtQValue.setText((CharSequence)("" + SettingsActivity.this.qvalue));
            }
            
            public void onStartTrackingTouch(final SeekBar seekBar) {
            }
            
            public void onStopTrackingTouch(final SeekBar seekBar) {
            }
        });
        (this.spTarget = (Spinner)this.findViewById(2131492999)).setOnItemSelectedListener((AdapterView$OnItemSelectedListener)new AdapterView$OnItemSelectedListener() {
            public void onItemSelected(final AdapterView<?> adapterView, final View view, final int n, final long n2) {
                SettingsActivity.this.target = n;
            }
            
            public void onNothingSelected(final AdapterView<?> adapterView) {
            }
        });
        this.reader = TagScanner.getRFIDReader();
        final DeviceInfo deviceInfo = new DeviceInfo((Context)this);
        String info = this.reader.getInfo(RFIDInfo.HARDWARE_VER);
        final String info2 = this.reader.getInfo(RFIDInfo.FIRMWARE_VER);
        final String info3 = this.reader.getInfo(RFIDInfo.MODULE_ID);
        final String info4 = this.reader.getInfo(RFIDInfo.REGION);
        final String deviceID = deviceInfo.getDeviceID();
        final StringBuilder append = new StringBuilder().append("Hardware Version: ");
        if (info == null) {
            info = "";
        }
        final StringBuilder append2 = append.append(info).append("\n").append("Firmware Version: ");
        String s;
        if (info2 != null) {
            s = info2;
        }
        else {
            s = "";
        }
        final StringBuilder append3 = append2.append(s).append("\n").append("Module ID: ");
        String s2;
        if (info3 != null) {
            s2 = info3;
        }
        else {
            s2 = "";
        }
        final StringBuilder append4 = append3.append(s2).append("\n").append("Region: ");
        String s3;
        if (info4 != null) {
            s3 = info4;
        }
        else {
            s3 = "";
        }
        this.txtDeviceInfo.setText((CharSequence)append4.append(s3).append("\n").append("API Version: ").append("1.0.2").append("\n").append("Device ID: ").append(deviceID).toString());
        this.loadReaderSetting();
        final View localSettingsView = this.localSettingsView;
        int visibility;
        if (this.localSettings.isShowHiddenSetting()) {
            visibility = 0;
        }
        else {
            visibility = 4;
        }
        localSettingsView.setVisibility(visibility);
    }
    
    public boolean onCreateOptionsMenu(final Menu menu) {
        this.getMenuInflater().inflate(2131558406, menu);
        return true;
    }
    
    public boolean onOptionsItemSelected(final MenuItem menuItem) {
        switch (menuItem.getItemId()) {
            default: {
                return super.onOptionsItemSelected(menuItem);
            }
            case 16908332: {
                this.onBackPressed();
                return true;
            }
        }
    }
}
