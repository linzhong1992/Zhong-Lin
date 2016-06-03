package com.alien.demo.feature.barcode;

import android.app.ActionBar;
import android.app.Activity;
import android.os.Bundle;
import android.view.KeyEvent;
import android.view.MenuItem;
import android.view.View;
import android.view.Window;
import android.widget.ListView;
import android.widget.SimpleAdapter;
import com.alien.barcode.BarcodeCallback;
import com.alien.barcode.BarcodeReader;
import com.alien.demo.system.Sound;
import com.dd.processbutton.iml.ActionProcessButton;
import java.util.ArrayList;
import java.util.HashMap;

public class BarcodeActivity
  extends Activity
{
  private static final String BARCODE_NUM = "barcodeNum";
  private static final String BARCODE_VALUE = "barcodeValue";
  private SimpleAdapter barcodeAdapter;
  private ArrayList<HashMap<String, String>> barcodeList;
  private BarcodeReader barcodeReader;
  private ActionProcessButton btnStartStop;
  private ListView lvBarcodes;
  
  private void startScan()
  {
    if (this.barcodeReader.isRunning()) {
      return;
    }
    this.btnStartStop.setText(2131034162);
    this.btnStartStop.startAnimation();
    this.barcodeReader.start(new BarcodeCallback()
    {
      public void onBarcodeRead(String paramAnonymousString)
      {
        HashMap localHashMap = new HashMap();
        localHashMap.put("barcodeNum", "" + (BarcodeActivity.this.barcodeList.size() + 1));
        localHashMap.put("barcodeValue", paramAnonymousString);
        BarcodeActivity.this.barcodeList.add(localHashMap);
        BarcodeActivity.this.barcodeAdapter.notifyDataSetChanged();
        BarcodeActivity.this.lvBarcodes.smoothScrollToPosition(BarcodeActivity.this.barcodeList.size() - 1);
        Sound.playSuccess(BarcodeActivity.this);
        BarcodeActivity.this.btnStartStop.setText(2131034161);
        BarcodeActivity.this.btnStartStop.stopAnimation();
      }
    });
  }
  
  public void onClickClear(View paramView)
  {
    this.barcodeList.clear();
    this.barcodeAdapter.notifyDataSetChanged();
  }
  
  public void onClickStartStop(View paramView)
  {
    if (!this.barcodeReader.isRunning())
    {
      startScan();
      return;
    }
    stopScan();
  }
  
  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    getActionBar().setDisplayHomeAsUpEnabled(true);
    setContentView(2130903066);
    getWindow().addFlags(128);
    this.btnStartStop = ((ActionProcessButton)findViewById(2131492975));
    this.barcodeList = new ArrayList();
    this.lvBarcodes = ((ListView)findViewById(2131492976));
    this.barcodeAdapter = new SimpleAdapter(this, this.barcodeList, 2130903074, new String[] { "barcodeNum", "barcodeValue" }, new int[] { 2131493005, 2131493006 });
    this.lvBarcodes.setAdapter(this.barcodeAdapter);
    this.barcodeReader = new BarcodeReader(this);
  }
  
  public boolean onKeyDown(int paramInt, KeyEvent paramKeyEvent)
  {
    if ((paramInt == 139) && (paramKeyEvent.getRepeatCount() == 0))
    {
      startScan();
      return true;
    }
    return super.onKeyDown(paramInt, paramKeyEvent);
  }
  
  public boolean onKeyUp(int paramInt, KeyEvent paramKeyEvent)
  {
    if (paramInt == 139)
    {
      stopScan();
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
  
  public void stopScan()
  {
    try
    {
      if (this.barcodeReader.isRunning())
      {
        this.barcodeReader.stop();
        this.btnStartStop.setText(2131034161);
        this.btnStartStop.stopAnimation();
      }
      return;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\alien\demo\feature\barcode\BarcodeActivity.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */