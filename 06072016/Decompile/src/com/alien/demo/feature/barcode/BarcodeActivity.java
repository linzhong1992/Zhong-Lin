package com.alien.demo.feature.barcode;

import android.app.*;
import com.dd.processbutton.iml.*;
import com.alien.barcode.*;
import com.alien.demo.system.*;
import android.content.*;
import android.os.*;
import java.util.*;
import android.widget.*;
import android.view.*;

public class BarcodeActivity extends Activity
{
    private static final String BARCODE_NUM = "barcodeNum";
    private static final String BARCODE_VALUE = "barcodeValue";
    private SimpleAdapter barcodeAdapter;
    private ArrayList<HashMap<String, String>> barcodeList;
    private BarcodeReader barcodeReader;
    private ActionProcessButton btnStartStop;
    private ListView lvBarcodes;
    
    private void startScan() {
        if (this.barcodeReader.isRunning()) {
            return;
        }
        this.btnStartStop.setText(2131034162);
        this.btnStartStop.startAnimation();
        this.barcodeReader.start(new BarcodeCallback() {
            @Override
            public void onBarcodeRead(final String s) {
                final HashMap<String, String> hashMap = new HashMap<String, String>();
                hashMap.put("barcodeNum", "" + (BarcodeActivity.this.barcodeList.size() + 1));
                hashMap.put("barcodeValue", s);
                BarcodeActivity.this.barcodeList.add(hashMap);
                BarcodeActivity.this.barcodeAdapter.notifyDataSetChanged();
                BarcodeActivity.this.lvBarcodes.smoothScrollToPosition(BarcodeActivity.this.barcodeList.size() - 1);
                Sound.playSuccess((Context)BarcodeActivity.this);
                BarcodeActivity.this.btnStartStop.setText(2131034161);
                BarcodeActivity.this.btnStartStop.stopAnimation();
            }
        });
    }
    
    public void onClickClear(final View view) {
        this.barcodeList.clear();
        this.barcodeAdapter.notifyDataSetChanged();
    }
    
    public void onClickStartStop(final View view) {
        if (!this.barcodeReader.isRunning()) {
            this.startScan();
            return;
        }
        this.stopScan();
    }
    
    protected void onCreate(final Bundle bundle) {
        super.onCreate(bundle);
        this.getActionBar().setDisplayHomeAsUpEnabled(true);
        this.setContentView(2130903066);
        this.getWindow().addFlags(128);
        this.btnStartStop = (ActionProcessButton)this.findViewById(2131492975);
        this.barcodeList = new ArrayList<HashMap<String, String>>();
        this.lvBarcodes = (ListView)this.findViewById(2131492976);
        this.barcodeAdapter = new SimpleAdapter((Context)this, (List)this.barcodeList, 2130903074, new String[] { "barcodeNum", "barcodeValue" }, new int[] { 2131493005, 2131493006 });
        this.lvBarcodes.setAdapter((ListAdapter)this.barcodeAdapter);
        this.barcodeReader = new BarcodeReader((Context)this);
    }
    
    public boolean onKeyDown(final int n, final KeyEvent keyEvent) {
        if (n == 139 && keyEvent.getRepeatCount() == 0) {
            this.startScan();
            return true;
        }
        return super.onKeyDown(n, keyEvent);
    }
    
    public boolean onKeyUp(final int n, final KeyEvent keyEvent) {
        if (n == 139) {
            this.stopScan();
            return true;
        }
        return super.onKeyUp(n, keyEvent);
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
    
    public void stopScan() {
        synchronized (this) {
            if (this.barcodeReader.isRunning()) {
                this.barcodeReader.stop();
                this.btnStartStop.setText(2131034161);
                this.btnStartStop.stopAnimation();
            }
        }
    }
}
