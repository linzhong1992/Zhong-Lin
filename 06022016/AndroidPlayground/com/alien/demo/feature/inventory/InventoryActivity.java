package com.alien.demo.feature.inventory;

import android.app.ActionBar;
import android.app.Activity;
import android.content.Intent;
import android.content.res.Resources;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.text.TextUtils;
import android.util.Log;
import android.view.KeyEvent;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.Window;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.SimpleAdapter;
import android.widget.TextView;
import com.alien.demo.data.LocalSettings;
import com.alien.demo.feature.mask.MaskActivity;
import com.alien.demo.rfid.TagMask;
import com.alien.demo.rfid.TagScanner;
import com.alien.demo.system.Sound;
import com.alien.demo.uibase.UIHelper;
import com.alien.rfid.RFIDCallback;
import com.alien.rfid.Tag;
import com.dd.processbutton.iml.ActionProcessButton;
import com.lamerman.FileDialog;
import java.io.FileOutputStream;
import java.io.OutputStreamWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

public class InventoryActivity
  extends Activity
  implements RFIDCallback
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
  private int readCount = 0;
  private long startTime = 0L;
  private SimpleAdapter tagAdapter;
  private int tagCount = 0;
  private ArrayList<HashMap<String, String>> tagList;
  private TextView txtMaskEpc;
  private TextView txtReadCount;
  private TextView txtTagCount;
  
  private void addTag(String paramString)
  {
    if (TextUtils.isEmpty(paramString)) {
      return;
    }
    Message localMessage = this.handler.obtainMessage();
    localMessage.obj = paramString;
    this.handler.sendMessage(localMessage);
  }
  
  private int getTagIndex(String paramString)
  {
    int k = -1;
    if ((paramString == null) || (paramString.isEmpty())) {
      return -1;
    }
    int i = 0;
    for (;;)
    {
      int j = k;
      if (i < this.tagList.size())
      {
        new HashMap();
        if (paramString.equals((String)((HashMap)this.tagList.get(i)).get("tagEpc"))) {
          j = i;
        }
      }
      else
      {
        return j;
      }
      i += 1;
    }
  }
  
  private void saveToFile(String paramString)
  {
    try
    {
      OutputStreamWriter localOutputStreamWriter = new OutputStreamWriter(new FileOutputStream(paramString));
      Iterator localIterator = this.tagList.iterator();
      while (localIterator.hasNext())
      {
        Object localObject = (HashMap)localIterator.next();
        String str = (String)((HashMap)localObject).get("tagEpc");
        localObject = (String)((HashMap)localObject).get("tagCount");
        localOutputStreamWriter.write(str + "," + (String)localObject + "\r\n");
      }
      localException.close();
    }
    catch (Exception localException)
    {
      UIHelper.ToastMessage(this, getResources().getString(2131034190) + " " + paramString);
      Log.e("AlienRFID-Inventory", "Error saving to file: " + localException);
      localException.printStackTrace();
      UIHelper.ToastMessage(this, getResources().getString(2131034189) + " " + paramString);
      return;
    }
    UIHelper.ToastMessage(this, getResources().getString(2131034190) + " " + paramString);
  }
  
  private void startSearch()
  {
    if (!scanner.isScanning())
    {
      this.btnStartStop.setText(2131034220);
      this.btnStartStop.startAnimation();
      this.startTime = System.currentTimeMillis();
      scanner.scan();
    }
  }
  
  private void stopSearch()
  {
    if (scanner.isScanning())
    {
      this.btnStartStop.setText(2131034219);
      this.btnStartStop.stopAnimation();
      scanner.stop(this);
    }
  }
  
  private void updateCounts()
  {
    if ((this.localSettings.isDebugMode()) && (this.tagCount != 0))
    {
      long l1 = System.currentTimeMillis();
      long l2 = this.startTime;
      this.txtTagCount.setText("" + this.tagCount + " " + String.format("%.1f", new Object[] { Double.valueOf((l1 - l2) / 1000.0D) }));
      this.txtReadCount.setText("" + this.readCount);
      return;
    }
    this.txtTagCount.setText("" + this.tagCount);
    this.txtReadCount.setText("" + this.readCount);
  }
  
  private void updateMask()
  {
    String str = scanner.getFilter().toString();
    if (str.isEmpty())
    {
      this.txtMaskEpc.setText(2131034144);
      return;
    }
    this.txtMaskEpc.setText(str);
  }
  
  private void updateTagInfo(int paramInt)
  {
    int i = this.lvTags.getFirstVisiblePosition();
    View localView = this.lvTags.getChildAt(paramInt - i);
    this.lvTags.getAdapter().getView(paramInt, localView, this.lvTags);
  }
  
  protected void onActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    if ((paramInt1 == 1) && (paramInt2 == -1))
    {
      scanner.getFilter().loadFromString(paramIntent.getStringExtra("filter_data"));
      Log.i("AlienRFID-Inventory", "Set mask EPC: " + scanner.getFilter().toString());
      updateMask();
    }
    while ((paramInt1 != 2) || (paramInt2 != -1)) {
      return;
    }
    saveToFile(paramIntent.getStringExtra("RESULT_PATH"));
  }
  
  public void onClickClear(View paramView)
  {
    this.startTime = System.currentTimeMillis();
    this.readCount = 0;
    this.tagCount = 0;
    this.tagList.clear();
    this.tagAdapter.notifyDataSetChanged();
    updateCounts();
  }
  
  public void onClickMask(View paramView)
  {
    paramView = new Intent(this, MaskActivity.class);
    paramView.putExtra("filter_data", scanner.getFilter().convertToString());
    startActivityForResult(paramView, 1);
  }
  
  public void onClickSave(View paramView)
  {
    paramView = new Intent(this, FileDialog.class);
    paramView.putExtra("START_PATH", "/sdcard");
    paramView.putExtra("CAN_SELECT_DIR", true);
    startActivityForResult(paramView, 2);
  }
  
  public void onClickStartStop(View paramView)
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
    this.context = this;
    super.onCreate(paramBundle);
    setContentView(2130903069);
    getActionBar().setDisplayHomeAsUpEnabled(true);
    getWindow().addFlags(128);
    this.localSettings = new LocalSettings();
    this.txtTagCount = ((TextView)findViewById(2131492990));
    this.txtReadCount = ((TextView)findViewById(2131492991));
    this.txtMaskEpc = ((TextView)findViewById(2131492978));
    this.btnStartStop = ((ActionProcessButton)findViewById(2131492975));
    if (this.tagList == null) {
      this.tagList = new ArrayList();
    }
    this.lvTags = ((ListView)this.context.findViewById(2131492992));
    this.tagAdapter = new SimpleAdapter(this.context, this.tagList, 2130903094, new String[] { "tagEpc", "tagCount" }, new int[] { 2131493090, 2131493091 });
    this.lvTags.setAdapter(this.tagAdapter);
    this.lvTags.setOnItemClickListener(new AdapterView.OnItemClickListener()
    {
      public void onItemClick(AdapterView<?> paramAnonymousAdapterView, View paramAnonymousView, int paramAnonymousInt, long paramAnonymousLong) {}
    });
    this.handler = new Handler()
    {
      public void handleMessage(Message paramAnonymousMessage)
      {
        if ((InventoryActivity.this.localSettings.isDebugMode()) && (InventoryActivity.this.tagCount >= 50)) {
          return;
        }
        paramAnonymousMessage = (String)paramAnonymousMessage.obj;
        int i = InventoryActivity.this.getTagIndex(paramAnonymousMessage);
        HashMap localHashMap = new HashMap();
        localHashMap.put("tagEpc", paramAnonymousMessage);
        localHashMap.put("tagCount", "1");
        if (i == -1)
        {
          InventoryActivity.this.tagList.add(localHashMap);
          InventoryActivity.this.lvTags.setAdapter(InventoryActivity.this.tagAdapter);
          InventoryActivity.access$108(InventoryActivity.this);
          InventoryActivity.access$608(InventoryActivity.this);
          Sound.playSuccess(InventoryActivity.this.context);
        }
        for (;;)
        {
          InventoryActivity.this.updateCounts();
          return;
          localHashMap.put("tagCount", String.valueOf(Integer.parseInt((String)((HashMap)InventoryActivity.this.tagList.get(i)).get("tagCount"), 10) + 1));
          InventoryActivity.this.tagList.set(i, localHashMap);
          InventoryActivity.access$608(InventoryActivity.this);
          if ((i >= InventoryActivity.this.lvTags.getFirstVisiblePosition()) && (i <= InventoryActivity.this.lvTags.getLastVisiblePosition())) {
            InventoryActivity.this.updateTagInfo(i);
          }
        }
      }
    };
    if (scanner == null) {
      scanner = new TagScanner(this);
    }
    for (;;)
    {
      updateMask();
      return;
      scanner.setListener(this);
    }
  }
  
  public boolean onCreateOptionsMenu(Menu paramMenu)
  {
    getMenuInflater().inflate(2131558404, paramMenu);
    return true;
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
    addTag(paramTag.getEPC());
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\alien\demo\feature\inventory\InventoryActivity.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */