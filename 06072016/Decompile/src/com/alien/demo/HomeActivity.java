package com.alien.demo;

import com.alien.demo.feature.barcode.*;
import android.content.*;
import com.alien.demo.feature.geiger.*;
import com.alien.demo.feature.inventory.*;
import com.alien.demo.feature.tagaccess.*;
import com.alien.common.*;
import com.alien.demo.rfid.*;
import android.view.*;
import com.alien.demo.feature.setting.*;
import android.os.*;
import android.app.*;
import com.alien.demo.data.*;
import android.util.*;
import com.alien.rfid.*;
import android.widget.*;

public class HomeActivity extends Activity
{
    private static final String TAG = "AlienRFID-Home";
    private TextView txtModel;
    private TextView txtVersion;
    
    public void onClickBarcode(final View view) {
        this.startActivity(new Intent((Context)this, (Class)BarcodeActivity.class));
    }
    
    public void onClickGeiger(final View view) {
        this.startActivity(new Intent((Context)this, (Class)GeigerActivity.class));
    }
    
    public void onClickInventory(final View view) {
        this.startActivity(new Intent((Context)this, (Class)InventoryActivity.class));
    }
    
    public void onClickTagAccess(final View view) {
        this.startActivity(new Intent((Context)this, (Class)TagAccessActivity.class));
    }
    
    protected void onCreate(final Bundle bundle) {
        super.onCreate(bundle);
        this.setContentView(2130903068);
        this.getWindow().addFlags(128);
        this.txtModel = (TextView)this.findViewById(2131492988);
        (this.txtVersion = (TextView)this.findViewById(2131492989)).setText((CharSequence)"v16.01.28.60");
        this.txtModel.setText((CharSequence)new DeviceInfo((Context)this).getModel());
        new InitTask().execute((Object[])new String[0]);
    }
    
    public boolean onCreateOptionsMenu(final Menu menu) {
        this.getMenuInflater().inflate(2131558403, menu);
        return true;
    }
    
    public void onDestroy() {
        TagScanner.deinit();
        super.onDestroy();
    }
    
    public boolean onOptionsItemSelected(final MenuItem menuItem) {
        if (menuItem.getItemId() == 2131493111) {
            this.startActivity(new Intent((Context)this, (Class)SettingsActivity.class));
        }
        return super.onOptionsItemSelected(menuItem);
    }
    
    public class InitTask extends AsyncTask<String, Integer, Boolean>
    {
        String errorMsg;
        ProgressDialog mypDialog;
        
        public InitTask() {
            this.errorMsg = "";
        }
        
        protected Boolean doInBackground(final String... array) {
            try {
                TagScanner.init();
                Assets.init();
                return true;
            }
            catch (ReaderException ex) {
                this.errorMsg = ex.getMessage();
                Log.e("AlienRFID-Home", "Application init error: " + ex);
                ex.printStackTrace();
                return false;
            }
        }
        
        protected void onPostExecute(final Boolean b) {
            super.onPostExecute((Object)b);
            this.mypDialog.cancel();
            if (!b) {
                Toast.makeText((Context)HomeActivity.this, (CharSequence)("Initialization failed: " + this.errorMsg), 1).show();
                new Thread(new Runnable() {
                    @Override
                    public void run() {
                        while (true) {
                            try {
                                Thread.sleep(3500L);
                                HomeActivity.this.finish();
                            }
                            catch (Exception ex) {
                                continue;
                            }
                            break;
                        }
                    }
                }).start();
            }
        }
        
        protected void onPreExecute() {
            super.onPreExecute();
            (this.mypDialog = new ProgressDialog((Context)HomeActivity.this)).setProgressStyle(0);
            this.mypDialog.setMessage((CharSequence)"Initializing...");
            this.mypDialog.setCanceledOnTouchOutside(false);
            this.mypDialog.show();
        }
    }
}
