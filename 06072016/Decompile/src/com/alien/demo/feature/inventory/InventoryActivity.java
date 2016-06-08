package com.alien.demo.feature.inventory;

import android.app.*;
import com.alien.demo.rfid.*;
import com.dd.processbutton.iml.*;
import com.alien.demo.data.*;
import android.text.*;
import java.io.*;
import com.alien.demo.uibase.*;
import android.util.*;
import android.content.*;
import com.alien.demo.feature.mask.*;
import com.lamerman.*;
import android.os.*;
import java.util.*;
import android.widget.*;
import com.alien.demo.system.*;
import android.view.*;
import com.alien.rfid.*;

public class InventoryActivity extends Activity implements RFIDCallback
{
    private static final String TAG = "AlienRFID-Inventory";
    private static final String TAG_COUNT = "tagCount";
    private static final String TAG_EPC = "tagEpc";
    private static TagScanner scanner;
    private ActionProcessButton btnStartStop;
    private Activity context;
    private Handler handler;
    private LocalSettings localSettings;
    private ListView lvTags;
    private int readCount;
    private long startTime;
    private SimpleAdapter tagAdapter;
    private int tagCount;
    private ArrayList<HashMap<String, String>> tagList;
    private TextView txtMaskEpc;
    private TextView txtReadCount;
    private TextView txtTagCount;
    
    public InventoryActivity() {
        this.tagCount = 0;
        this.readCount = 0;
        this.startTime = 0L;
    }
    
    private void addTag(final String obj) {
        if (TextUtils.isEmpty((CharSequence)obj)) {
            return;
        }
        final Message obtainMessage = this.handler.obtainMessage();
        obtainMessage.obj = obj;
        this.handler.sendMessage(obtainMessage);
    }
    
    private int getTagIndex(final String s) {
        final int n = -1;
        if (s == null || s.isEmpty()) {
            return -1;
        }
        int n2 = 0;
        int n3;
        while (true) {
            n3 = n;
            if (n2 >= this.tagList.size()) {
                break;
            }
            new HashMap();
            if (s.equals(this.tagList.get(n2).get("tagEpc"))) {
                n3 = n2;
                break;
            }
            ++n2;
        }
        return n3;
    }
    
    private void saveToFile(final String s) {
        OutputStreamWriter outputStreamWriter;
        try {
            outputStreamWriter = new OutputStreamWriter(new FileOutputStream(s));
            for (final HashMap<String, String> hashMap : this.tagList) {
                outputStreamWriter.write(hashMap.get("tagEpc") + "," + hashMap.get("tagCount") + "\r\n");
            }
        }
        catch (Exception ex) {
            UIHelper.ToastMessage((Context)this, this.getResources().getString(2131034190) + " " + s);
            Log.e("AlienRFID-Inventory", "Error saving to file: " + ex);
            ex.printStackTrace();
            UIHelper.ToastMessage((Context)this, this.getResources().getString(2131034189) + " " + s);
            return;
        }
        outputStreamWriter.close();
        UIHelper.ToastMessage((Context)this, this.getResources().getString(2131034190) + " " + s);
    }
    
    private void startSearch() {
        if (!InventoryActivity.scanner.isScanning()) {
            this.btnStartStop.setText(2131034220);
            this.btnStartStop.startAnimation();
            this.startTime = System.currentTimeMillis();
            InventoryActivity.scanner.scan();
        }
    }
    
    private void stopSearch() {
        if (InventoryActivity.scanner.isScanning()) {
            this.btnStartStop.setText(2131034219);
            this.btnStartStop.stopAnimation();
            InventoryActivity.scanner.stop((Context)this);
        }
    }
    
    private void updateCounts() {
        if (this.localSettings.isDebugMode() && this.tagCount != 0) {
            this.txtTagCount.setText((CharSequence)("" + this.tagCount + " " + String.format("%.1f", (System.currentTimeMillis() - this.startTime) / 1000.0)));
            this.txtReadCount.setText((CharSequence)("" + this.readCount));
            return;
        }
        this.txtTagCount.setText((CharSequence)("" + this.tagCount));
        this.txtReadCount.setText((CharSequence)("" + this.readCount));
    }
    
    private void updateMask() {
        final String string = InventoryActivity.scanner.getFilter().toString();
        if (string.isEmpty()) {
            this.txtMaskEpc.setText(2131034144);
            return;
        }
        this.txtMaskEpc.setText((CharSequence)string);
    }
    
    private void updateTagInfo(final int n) {
        this.lvTags.getAdapter().getView(n, this.lvTags.getChildAt(n - this.lvTags.getFirstVisiblePosition()), (ViewGroup)this.lvTags);
    }
    
    protected void onActivityResult(final int n, final int n2, final Intent intent) {
        if (n == 1 && n2 == -1) {
            InventoryActivity.scanner.getFilter().loadFromString(intent.getStringExtra("filter_data"));
            Log.i("AlienRFID-Inventory", "Set mask EPC: " + InventoryActivity.scanner.getFilter().toString());
            this.updateMask();
        }
        else if (n == 2 && n2 == -1) {
            this.saveToFile(intent.getStringExtra("RESULT_PATH"));
        }
    }
    
    public void onClickClear(final View view) {
        this.startTime = System.currentTimeMillis();
        this.readCount = 0;
        this.tagCount = 0;
        this.tagList.clear();
        this.tagAdapter.notifyDataSetChanged();
        this.updateCounts();
    }
    
    public void onClickMask(final View view) {
        final Intent intent = new Intent((Context)this, (Class)MaskActivity.class);
        intent.putExtra("filter_data", InventoryActivity.scanner.getFilter().convertToString());
        this.startActivityForResult(intent, 1);
    }
    
    public void onClickSave(final View view) {
        final Intent intent = new Intent((Context)this, (Class)FileDialog.class);
        intent.putExtra("START_PATH", "/sdcard");
        intent.putExtra("CAN_SELECT_DIR", true);
        this.startActivityForResult(intent, 2);
    }
    
    public void onClickStartStop(final View view) {
        if (!InventoryActivity.scanner.isScanning()) {
            this.startSearch();
            return;
        }
        this.stopSearch();
    }
    
    protected void onCreate(final Bundle bundle) {
        (this.context = this).onCreate(bundle);
        this.setContentView(2130903069);
        this.getActionBar().setDisplayHomeAsUpEnabled(true);
        this.getWindow().addFlags(128);
        this.localSettings = new LocalSettings();
        this.txtTagCount = (TextView)this.findViewById(2131492990);
        this.txtReadCount = (TextView)this.findViewById(2131492991);
        this.txtMaskEpc = (TextView)this.findViewById(2131492978);
        this.btnStartStop = (ActionProcessButton)this.findViewById(2131492975);
        if (this.tagList == null) {
            this.tagList = new ArrayList<HashMap<String, String>>();
        }
        this.lvTags = (ListView)this.context.findViewById(2131492992);
        this.tagAdapter = new SimpleAdapter((Context)this.context, (List)this.tagList, 2130903094, new String[] { "tagEpc", "tagCount" }, new int[] { 2131493090, 2131493091 });
        this.lvTags.setAdapter((ListAdapter)this.tagAdapter);
        this.lvTags.setOnItemClickListener((AdapterView$OnItemClickListener)new AdapterView$OnItemClickListener() {
            public void onItemClick(final AdapterView<?> adapterView, final View view, final int n, final long n2) {
            }
        });
        this.handler = new Handler() {
            public void handleMessage(final Message message) {
                if (InventoryActivity.this.localSettings.isDebugMode() && InventoryActivity.this.tagCount >= 50) {
                    return;
                }
                final String s = (String)message.obj;
                final int access$200 = InventoryActivity.this.getTagIndex(s);
                final HashMap<String, String> hashMap = new HashMap<String, String>();
                hashMap.put("tagEpc", s);
                hashMap.put("tagCount", "1");
                if (access$200 == -1) {
                    InventoryActivity.this.tagList.add(hashMap);
                    InventoryActivity.this.lvTags.setAdapter((ListAdapter)InventoryActivity.this.tagAdapter);
                    InventoryActivity.this.tagCount++;
                    InventoryActivity.this.readCount++;
                    Sound.playSuccess((Context)InventoryActivity.this.context);
                }
                else {
                    hashMap.put("tagCount", String.valueOf(Integer.parseInt(InventoryActivity.this.tagList.get(access$200).get("tagCount"), 10) + 1));
                    InventoryActivity.this.tagList.set(access$200, hashMap);
                    InventoryActivity.this.readCount++;
                    if (access$200 >= InventoryActivity.this.lvTags.getFirstVisiblePosition() && access$200 <= InventoryActivity.this.lvTags.getLastVisiblePosition()) {
                        InventoryActivity.this.updateTagInfo(access$200);
                    }
                }
                InventoryActivity.this.updateCounts();
            }
        };
        if (InventoryActivity.scanner == null) {
            InventoryActivity.scanner = new TagScanner(this);
        }
        else {
            InventoryActivity.scanner.setListener(this);
        }
        this.updateMask();
    }
    
    public boolean onCreateOptionsMenu(final Menu menu) {
        this.getMenuInflater().inflate(2131558404, menu);
        return true;
    }
    
    public boolean onKeyDown(final int n, final KeyEvent keyEvent) {
        if (n == 139 && keyEvent.getRepeatCount() == 0) {
            this.startSearch();
            return true;
        }
        return super.onKeyDown(n, keyEvent);
    }
    
    public boolean onKeyUp(final int n, final KeyEvent keyEvent) {
        if (n == 139) {
            this.stopSearch();
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
    
    public void onPause() {
        super.onPause();
        this.stopSearch();
    }
    
    public void onTagRead(final Tag tag) {
        this.addTag(tag.getEPC());
    }
}
