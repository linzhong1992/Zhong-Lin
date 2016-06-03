package com.alien.demo.feature.mask;

import android.app.Activity;
import android.content.Intent;
import android.content.res.AssetFileDescriptor;
import android.content.res.AssetManager;
import android.media.MediaPlayer;
import android.media.MediaPlayer.OnCompletionListener;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.text.TextUtils;
import android.util.Log;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.Button;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.SimpleAdapter;
import android.widget.TextView;
import com.alien.demo.rfid.TagMask;
import com.alien.demo.rfid.TagScanner;
import com.alien.demo.uibase.BaseFragment;
import com.alien.rfid.RFIDCallback;
import com.alien.rfid.Tag;
import com.dd.processbutton.iml.ActionProcessButton;
import java.util.ArrayList;
import java.util.HashMap;

public class ScanFragment
  extends BaseFragment
  implements RFIDCallback
{
  private static final String DETECT_SOUND = "detect_snd.mp3";
  public static final String FILTER_DATA = "filter_data";
  private static final String TAG = "AlienRFID-Mask Scan";
  private static final String TAG_COUNT = "tagCount";
  private static final String TAG_EPC = "tagEpc";
  private static final String TAG_LEN = "tagLen";
  private static final String TAG_RSSI = "tagRssi";
  private Button btnClear;
  private Button btnOK;
  private ActionProcessButton btnStartStop;
  private Activity context;
  private Handler handler;
  private ListView lvTags;
  private TagMask outputFilter;
  private ScanInfo scanInfo;
  private TagScanner scanner;
  private SimpleAdapter tagAdapter;
  private ArrayList<HashMap<String, String>> tagList;
  private TextView txtMask;
  
  private void addTag(String paramString1, String paramString2)
  {
    if (TextUtils.isEmpty(paramString1)) {
      return;
    }
    Message localMessage = this.handler.obtainMessage();
    localMessage.obj = (paramString1 + "@" + paramString2);
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
  
  private void playDetectSound()
  {
    try
    {
      MediaPlayer localMediaPlayer = new MediaPlayer();
      AssetFileDescriptor localAssetFileDescriptor = this.context.getAssets().openFd("detect_snd.mp3");
      localMediaPlayer.setDataSource(localAssetFileDescriptor.getFileDescriptor(), localAssetFileDescriptor.getStartOffset(), localAssetFileDescriptor.getLength());
      localAssetFileDescriptor.close();
      localMediaPlayer.prepare();
      localMediaPlayer.start();
      localMediaPlayer.setOnCompletionListener(new MediaPlayer.OnCompletionListener()
      {
        public void onCompletion(MediaPlayer paramAnonymousMediaPlayer)
        {
          paramAnonymousMediaPlayer.release();
        }
      });
      return;
    }
    catch (Exception localException)
    {
      Log.e("AlienRFID-Mask Scan", "Error play sound: " + localException);
      localException.printStackTrace();
    }
  }
  
  private void refreshMask()
  {
    if (this.scanInfo.getMaskedEpc().isEmpty())
    {
      this.txtMask.setText(2131034144);
      return;
    }
    this.txtMask.setText(this.scanInfo.getMaskedEpc());
  }
  
  private void startScan()
  {
    if (!this.scanner.isScanning())
    {
      this.btnStartStop.setText(2131034177);
      this.btnStartStop.startAnimation();
      this.scanner.scan();
    }
  }
  
  private void startStopScan()
  {
    if (!this.scanner.isScanning())
    {
      startScan();
      return;
    }
    stopScan();
  }
  
  private void stopScan()
  {
    if (this.scanner.isScanning())
    {
      this.btnStartStop.setText(2131034176);
      this.btnStartStop.stopAnimation();
      this.scanner.stop(getContext());
    }
  }
  
  private void updateMaskEpc(String paramString)
  {
    this.scanInfo.setMaskedEpc(paramString);
    refreshMask();
  }
  
  private void updateTagInfo(int paramInt)
  {
    int i = this.lvTags.getFirstVisiblePosition();
    View localView = this.lvTags.getChildAt(paramInt - i);
    this.lvTags.getAdapter().getView(paramInt, localView, this.lvTags);
  }
  
  public void onActivityCreated(Bundle paramBundle)
  {
    super.onActivityCreated(paramBundle);
    this.context = getActivity();
    this.scanInfo = ((MaskInterface)this.context).getMaskInfo().getScanInfo();
    this.tagList = this.scanInfo.getTagList();
    this.btnStartStop = ((ActionProcessButton)this.context.findViewById(2131493082));
    this.btnStartStop.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        ScanFragment.this.onClickStartStopScan(paramAnonymousView);
      }
    });
    this.btnClear = ((Button)this.context.findViewById(2131493084));
    this.btnClear.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        ScanFragment.this.onClickClear(paramAnonymousView);
      }
    });
    this.btnOK = ((Button)this.context.findViewById(2131493083));
    this.btnOK.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        ScanFragment.this.onClickOk(paramAnonymousView);
      }
    });
    this.outputFilter = TagMask.createFromString(this.context.getIntent().getStringExtra("filter_data"));
    this.txtMask = ((TextView)this.context.findViewById(2131492978));
    this.txtMask.setText(this.scanInfo.getMaskedEpc());
    if (this.tagList == null) {
      this.tagList = new ArrayList();
    }
    this.lvTags = ((ListView)this.context.findViewById(2131493089));
    this.tagAdapter = new SimpleAdapter(this.context, this.tagList, 2130903095, new String[] { "tagEpc", "tagLen", "tagCount", "tagRssi" }, new int[] { 2131493090, 2131493092, 2131493091, 2131493093 });
    this.lvTags.setAdapter(this.tagAdapter);
    this.lvTags.setOnItemClickListener(new AdapterView.OnItemClickListener()
    {
      public void onItemClick(AdapterView<?> paramAnonymousAdapterView, View paramAnonymousView, int paramAnonymousInt, long paramAnonymousLong)
      {
        paramAnonymousAdapterView = (HashMap)ScanFragment.this.tagList.get(paramAnonymousInt);
        ScanFragment.this.updateMaskEpc((String)paramAnonymousAdapterView.get("tagEpc"));
      }
    });
    this.handler = new Handler()
    {
      public void handleMessage(Message paramAnonymousMessage)
      {
        Object localObject = (paramAnonymousMessage.obj + "").split("@");
        paramAnonymousMessage = localObject[0];
        localObject = localObject[1];
        int i = ScanFragment.this.getTagIndex(paramAnonymousMessage);
        HashMap localHashMap = new HashMap();
        localHashMap.put("tagEpc", paramAnonymousMessage);
        localHashMap.put("tagCount", String.valueOf(1));
        localHashMap.put("tagRssi", localObject);
        if (i == -1)
        {
          ScanFragment.this.tagList.add(localHashMap);
          ScanFragment.this.lvTags.setAdapter(ScanFragment.this.tagAdapter);
          ScanFragment.this.playDetectSound();
        }
        do
        {
          return;
          localHashMap.put("tagCount", String.valueOf(Integer.parseInt((String)((HashMap)ScanFragment.this.tagList.get(i)).get("tagCount"), 10) + 1));
          ScanFragment.this.tagList.set(i, localHashMap);
        } while ((i < ScanFragment.this.lvTags.getFirstVisiblePosition()) || (i > ScanFragment.this.lvTags.getLastVisiblePosition()));
        ScanFragment.this.updateTagInfo(i);
      }
    };
    this.scanner = new TagScanner(this);
    refreshMask();
  }
  
  public void onClickClear(View paramView)
  {
    updateMaskEpc("");
    this.tagList.clear();
    this.tagAdapter.notifyDataSetChanged();
  }
  
  public void onClickOk(View paramView)
  {
    paramView = new Intent();
    this.outputFilter.setMaskedBank(1);
    this.outputFilter.setMaskInfo(1, 32, this.scanInfo.getMaskedEpc().length() * 4, this.scanInfo.getMaskedEpc());
    paramView.putExtra("filter_data", this.outputFilter.convertToString());
    Activity localActivity1 = this.context;
    Activity localActivity2 = this.context;
    localActivity1.setResult(-1, paramView);
    this.context.finish();
  }
  
  public void onClickStartStopScan(View paramView)
  {
    startStopScan();
  }
  
  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    return paramLayoutInflater.inflate(2130903093, paramViewGroup, false);
  }
  
  public void onKeyDown(int paramInt, KeyEvent paramKeyEvent)
  {
    if ((paramInt == 139) && (paramKeyEvent.getRepeatCount() == 0)) {
      startScan();
    }
    super.onKeyDown(paramInt, paramKeyEvent);
  }
  
  public void onKeyUp(int paramInt, KeyEvent paramKeyEvent)
  {
    if (paramInt == 139) {
      stopScan();
    }
    super.onKeyUp(paramInt, paramKeyEvent);
  }
  
  public void onPause()
  {
    super.onPause();
    stopScan();
  }
  
  public void onTagRead(Tag paramTag)
  {
    String str = String.format("%1$,.1f", new Object[] { Double.valueOf(paramTag.getRSSI()) });
    addTag(paramTag.getEPC(), str);
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\alien\demo\feature\mask\ScanFragment.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */