package com.alien.demo.feature.mask;

import com.alien.demo.uibase.*;
import com.dd.processbutton.iml.*;
import android.app.*;
import com.alien.demo.rfid.*;
import android.text.*;
import android.media.*;
import android.util.*;
import android.content.res.*;
import android.os.*;
import java.util.*;
import android.widget.*;
import android.content.*;
import android.view.*;
import com.alien.rfid.*;

public class ScanFragment extends BaseFragment implements RFIDCallback
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
    
    private void addTag(final String s, final String s2) {
        if (TextUtils.isEmpty((CharSequence)s)) {
            return;
        }
        final Message obtainMessage = this.handler.obtainMessage();
        obtainMessage.obj = s + "@" + s2;
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
    
    private void playDetectSound() {
        try {
            final MediaPlayer mediaPlayer = new MediaPlayer();
            final AssetFileDescriptor openFd = this.context.getAssets().openFd("detect_snd.mp3");
            mediaPlayer.setDataSource(openFd.getFileDescriptor(), openFd.getStartOffset(), openFd.getLength());
            openFd.close();
            mediaPlayer.prepare();
            mediaPlayer.start();
            mediaPlayer.setOnCompletionListener((MediaPlayer$OnCompletionListener)new MediaPlayer$OnCompletionListener() {
                public void onCompletion(final MediaPlayer mediaPlayer) {
                    mediaPlayer.release();
                }
            });
        }
        catch (Exception ex) {
            Log.e("AlienRFID-Mask Scan", "Error play sound: " + ex);
            ex.printStackTrace();
        }
    }
    
    private void refreshMask() {
        if (this.scanInfo.getMaskedEpc().isEmpty()) {
            this.txtMask.setText(2131034144);
            return;
        }
        this.txtMask.setText((CharSequence)this.scanInfo.getMaskedEpc());
    }
    
    private void startScan() {
        if (!this.scanner.isScanning()) {
            this.btnStartStop.setText(2131034177);
            this.btnStartStop.startAnimation();
            this.scanner.scan();
        }
    }
    
    private void startStopScan() {
        if (!this.scanner.isScanning()) {
            this.startScan();
            return;
        }
        this.stopScan();
    }
    
    private void stopScan() {
        if (this.scanner.isScanning()) {
            this.btnStartStop.setText(2131034176);
            this.btnStartStop.stopAnimation();
            this.scanner.stop(this.getContext());
        }
    }
    
    private void updateMaskEpc(final String maskedEpc) {
        this.scanInfo.setMaskedEpc(maskedEpc);
        this.refreshMask();
    }
    
    private void updateTagInfo(final int n) {
        this.lvTags.getAdapter().getView(n, this.lvTags.getChildAt(n - this.lvTags.getFirstVisiblePosition()), (ViewGroup)this.lvTags);
    }
    
    @Override
    public void onActivityCreated(final Bundle bundle) {
        super.onActivityCreated(bundle);
        this.context = this.getActivity();
        this.scanInfo = ((MaskInterface)this.context).getMaskInfo().getScanInfo();
        this.tagList = this.scanInfo.getTagList();
        (this.btnStartStop = (ActionProcessButton)this.context.findViewById(2131493082)).setOnClickListener((View$OnClickListener)new View$OnClickListener() {
            public void onClick(final View view) {
                ScanFragment.this.onClickStartStopScan(view);
            }
        });
        (this.btnClear = (Button)this.context.findViewById(2131493084)).setOnClickListener((View$OnClickListener)new View$OnClickListener() {
            public void onClick(final View view) {
                ScanFragment.this.onClickClear(view);
            }
        });
        (this.btnOK = (Button)this.context.findViewById(2131493083)).setOnClickListener((View$OnClickListener)new View$OnClickListener() {
            public void onClick(final View view) {
                ScanFragment.this.onClickOk(view);
            }
        });
        this.outputFilter = TagMask.createFromString(this.context.getIntent().getStringExtra("filter_data"));
        (this.txtMask = (TextView)this.context.findViewById(2131492978)).setText((CharSequence)this.scanInfo.getMaskedEpc());
        if (this.tagList == null) {
            this.tagList = new ArrayList<HashMap<String, String>>();
        }
        this.lvTags = (ListView)this.context.findViewById(2131493089);
        this.tagAdapter = new SimpleAdapter((Context)this.context, (List)this.tagList, 2130903095, new String[] { "tagEpc", "tagLen", "tagCount", "tagRssi" }, new int[] { 2131493090, 2131493092, 2131493091, 2131493093 });
        this.lvTags.setAdapter((ListAdapter)this.tagAdapter);
        this.lvTags.setOnItemClickListener((AdapterView$OnItemClickListener)new AdapterView$OnItemClickListener() {
            public void onItemClick(final AdapterView<?> adapterView, final View view, final int n, final long n2) {
                ScanFragment.this.updateMaskEpc(ScanFragment.this.tagList.get(n).get("tagEpc"));
            }
        });
        this.handler = new Handler() {
            public void handleMessage(final Message message) {
                final String[] split = (message.obj + "").split("@");
                final String s = split[0];
                final String s2 = split[1];
                final int access$200 = ScanFragment.this.getTagIndex(s);
                final HashMap<String, String> hashMap = new HashMap<String, String>();
                hashMap.put("tagEpc", s);
                hashMap.put("tagCount", String.valueOf(1));
                hashMap.put("tagRssi", s2);
                if (access$200 == -1) {
                    ScanFragment.this.tagList.add(hashMap);
                    ScanFragment.this.lvTags.setAdapter((ListAdapter)ScanFragment.this.tagAdapter);
                    ScanFragment.this.playDetectSound();
                }
                else {
                    hashMap.put("tagCount", String.valueOf(Integer.parseInt(ScanFragment.this.tagList.get(access$200).get("tagCount"), 10) + 1));
                    ScanFragment.this.tagList.set(access$200, hashMap);
                    if (access$200 >= ScanFragment.this.lvTags.getFirstVisiblePosition() && access$200 <= ScanFragment.this.lvTags.getLastVisiblePosition()) {
                        ScanFragment.this.updateTagInfo(access$200);
                    }
                }
            }
        };
        this.scanner = new TagScanner(this);
        this.refreshMask();
    }
    
    public void onClickClear(final View view) {
        this.updateMaskEpc("");
        this.tagList.clear();
        this.tagAdapter.notifyDataSetChanged();
    }
    
    public void onClickOk(final View view) {
        final Intent intent = new Intent();
        this.outputFilter.setMaskedBank(1);
        this.outputFilter.setMaskInfo(1, 32, this.scanInfo.getMaskedEpc().length() * 4, this.scanInfo.getMaskedEpc());
        intent.putExtra("filter_data", this.outputFilter.convertToString());
        final Activity context = this.context;
        final Activity context2 = this.context;
        context.setResult(-1, intent);
        this.context.finish();
    }
    
    public void onClickStartStopScan(final View view) {
        this.startStopScan();
    }
    
    @Override
    public View onCreateView(final LayoutInflater layoutInflater, final ViewGroup viewGroup, final Bundle bundle) {
        return layoutInflater.inflate(2130903093, viewGroup, false);
    }
    
    @Override
    public void onKeyDown(final int n, final KeyEvent keyEvent) {
        if (n == 139 && keyEvent.getRepeatCount() == 0) {
            this.startScan();
        }
        super.onKeyDown(n, keyEvent);
    }
    
    @Override
    public void onKeyUp(final int n, final KeyEvent keyEvent) {
        if (n == 139) {
            this.stopScan();
        }
        super.onKeyUp(n, keyEvent);
    }
    
    @Override
    public void onPause() {
        super.onPause();
        this.stopScan();
    }
    
    @Override
    public void onTagRead(final Tag tag) {
        this.addTag(tag.getEPC(), String.format("%1$,.1f", tag.getRSSI()));
    }
}
