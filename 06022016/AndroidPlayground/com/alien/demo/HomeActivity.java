package com.alien.demo;

import android.app.Activity;
import android.app.ProgressDialog;
import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.util.Log;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.Window;
import android.widget.TextView;
import android.widget.Toast;
import com.alien.common.DeviceInfo;
import com.alien.demo.data.Assets;
import com.alien.demo.feature.barcode.BarcodeActivity;
import com.alien.demo.feature.geiger.GeigerActivity;
import com.alien.demo.feature.inventory.InventoryActivity;
import com.alien.demo.feature.setting.SettingsActivity;
import com.alien.demo.feature.tagaccess.TagAccessActivity;
import com.alien.demo.rfid.TagScanner;
import com.alien.rfid.ReaderException;

public class HomeActivity
  extends Activity
{
  private static final String TAG = "AlienRFID-Home";
  private TextView txtModel;
  private TextView txtVersion;
  
  public void onClickBarcode(View paramView)
  {
    startActivity(new Intent(this, BarcodeActivity.class));
  }
  
  public void onClickGeiger(View paramView)
  {
    startActivity(new Intent(this, GeigerActivity.class));
  }
  
  public void onClickInventory(View paramView)
  {
    startActivity(new Intent(this, InventoryActivity.class));
  }
  
  public void onClickTagAccess(View paramView)
  {
    startActivity(new Intent(this, TagAccessActivity.class));
  }
  
  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    setContentView(2130903068);
    getWindow().addFlags(128);
    this.txtModel = ((TextView)findViewById(2131492988));
    this.txtVersion = ((TextView)findViewById(2131492989));
    this.txtVersion.setText("v16.01.28.60");
    paramBundle = new DeviceInfo(this);
    this.txtModel.setText(paramBundle.getModel());
    new InitTask().execute(new String[0]);
  }
  
  public boolean onCreateOptionsMenu(Menu paramMenu)
  {
    getMenuInflater().inflate(2131558403, paramMenu);
    return true;
  }
  
  public void onDestroy()
  {
    TagScanner.deinit();
    super.onDestroy();
  }
  
  public boolean onOptionsItemSelected(MenuItem paramMenuItem)
  {
    if (paramMenuItem.getItemId() == 2131493111) {
      startActivity(new Intent(this, SettingsActivity.class));
    }
    return super.onOptionsItemSelected(paramMenuItem);
  }
  
  public class InitTask
    extends AsyncTask<String, Integer, Boolean>
  {
    String errorMsg = "";
    ProgressDialog mypDialog;
    
    public InitTask() {}
    
    protected Boolean doInBackground(String... paramVarArgs)
    {
      try
      {
        TagScanner.init();
        Assets.init();
        return Boolean.valueOf(true);
      }
      catch (ReaderException paramVarArgs)
      {
        this.errorMsg = paramVarArgs.getMessage();
        Log.e("AlienRFID-Home", "Application init error: " + paramVarArgs);
        paramVarArgs.printStackTrace();
      }
      return Boolean.valueOf(false);
    }
    
    protected void onPostExecute(Boolean paramBoolean)
    {
      super.onPostExecute(paramBoolean);
      this.mypDialog.cancel();
      if (!paramBoolean.booleanValue())
      {
        Toast.makeText(HomeActivity.this, "Initialization failed: " + this.errorMsg, 1).show();
        new Thread(new Runnable()
        {
          public void run()
          {
            try
            {
              Thread.sleep(3500L);
              HomeActivity.this.finish();
              return;
            }
            catch (Exception localException)
            {
              for (;;) {}
            }
          }
        }).start();
      }
    }
    
    protected void onPreExecute()
    {
      super.onPreExecute();
      this.mypDialog = new ProgressDialog(HomeActivity.this);
      this.mypDialog.setProgressStyle(0);
      this.mypDialog.setMessage("Initializing...");
      this.mypDialog.setCanceledOnTouchOutside(false);
      this.mypDialog.show();
    }
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\alien\demo\HomeActivity.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */