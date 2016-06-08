package com.alien.demo.feature.geiger;

import android.app.*;
import com.alien.demo.rfid.*;
import com.dd.processbutton.iml.*;
import android.widget.*;
import android.content.*;
import android.util.*;
import com.alien.demo.feature.mask.*;
import android.os.*;
import android.view.*;
import com.alien.rfid.*;
import android.media.*;
import android.content.res.*;

public class GeigerActivity extends Activity implements RFIDCallback
{
    private static final long INTERVAL_STATUS = 100L;
    private static final int REQUEST_MASK = 1;
    private static final String TAG = "AlienRFID-Geiger";
    private static final long TAG_TIME_OUT = 1000L;
    private static TagScanner scanner;
    private Activity activity;
    private ActionProcessButton btnStartStop;
    private boolean closing;
    private int currentRangeLevel;
    private Handler handler;
    private ProgressBar progressBar;
    private RangeLevel[] ranges;
    private String tagEpc;
    private long tagLastSeen;
    private int tagRange;
    private String tagRssi;
    private TextView txtEpc;
    private TextView txtMaskEpc;
    private TextView txtRssi;
    
    public GeigerActivity() {
        this.currentRangeLevel = 0;
        this.tagEpc = "";
        this.tagRssi = "0";
        this.tagRange = 0;
        this.tagLastSeen = 0L;
        this.closing = false;
    }
    
    private void refreshDetection() {
        if (System.currentTimeMillis() - this.tagLastSeen > 1000L && !"0".equals(this.txtRssi.getText())) {
            this.resetDetection();
        }
    }
    
    private void refreshTagInfo() {
        this.handler.sendEmptyMessage(0);
    }
    
    private void resetDetection() {
        this.tagEpc = "";
        this.tagRssi = "0";
        this.tagRange = 0;
        this.ranges[this.currentRangeLevel].pause();
        this.currentRangeLevel = 0;
        this.refreshTagInfo();
    }
    
    private void startSearch() {
        if (!GeigerActivity.scanner.isScanning()) {
            this.btnStartStop.setText(2131034171);
            this.btnStartStop.startAnimation();
            GeigerActivity.scanner.scan();
        }
    }
    
    private void startSoundFeedbackThread() {
        new Thread(new Runnable() {
            @Override
            public void run() {
                while (!GeigerActivity.this.closing) {
                    GeigerActivity.this.refreshDetection();
                    final int access$900 = GeigerActivity.this.currentRangeLevel;
                    for (int i = 0; i < GeigerActivity.this.ranges.length; ++i) {
                        if (GeigerActivity.this.tagRange <= GeigerActivity.this.ranges[i].value) {
                            GeigerActivity.this.currentRangeLevel = i;
                            break;
                        }
                    }
                    if (access$900 != GeigerActivity.this.currentRangeLevel) {
                        GeigerActivity.this.ranges[access$900].pause();
                        GeigerActivity.this.ranges[GeigerActivity.this.currentRangeLevel].play();
                    }
                    try {
                        Thread.sleep(100L);
                    }
                    catch (InterruptedException ex) {}
                }
            }
        }).start();
    }
    
    private void stopSearch() {
        if (GeigerActivity.scanner.isScanning()) {
            this.btnStartStop.setText(2131034170);
            this.btnStartStop.stopAnimation();
            GeigerActivity.scanner.stop((Context)this);
        }
        this.resetDetection();
    }
    
    private void updateMask() {
        final String string = GeigerActivity.scanner.getFilter().toString();
        if (string.isEmpty()) {
            this.txtMaskEpc.setText(2131034172);
            return;
        }
        this.txtMaskEpc.setText((CharSequence)string);
    }
    
    protected void onActivityResult(final int n, final int n2, final Intent intent) {
        if (n == 1 && n2 == -1) {
            GeigerActivity.scanner.getFilter().loadFromString(intent.getStringExtra("filter_data"));
            Log.i("AlienRFID-Geiger", "Set mask EPC: " + GeigerActivity.scanner.getFilter().toString());
            this.updateMask();
        }
    }
    
    public void onClickMask(final View view) {
        final Intent intent = new Intent((Context)this, (Class)MaskActivity.class);
        intent.putExtra("filter_data", GeigerActivity.scanner.getFilter().convertToString());
        this.startActivityForResult(intent, 1);
    }
    
    public void onClickStartStopSearch(final View view) {
        if (!GeigerActivity.scanner.isScanning()) {
            this.startSearch();
            return;
        }
        this.stopSearch();
    }
    
    protected void onCreate(final Bundle bundle) {
        super.onCreate(bundle);
        this.getActionBar().setDisplayHomeAsUpEnabled(true);
        ((GeigerActivity)(this.activity = this)).setContentView(2130903067);
        this.getWindow().addFlags(128);
        this.progressBar = (ProgressBar)this.findViewById(2131492981);
        this.txtMaskEpc = (TextView)this.findViewById(2131492978);
        this.txtRssi = (TextView)this.findViewById(2131492979);
        this.txtEpc = (TextView)this.findViewById(2131492982);
        (this.btnStartStop = (ActionProcessButton)this.findViewById(2131492980)).setMode(ActionProcessButton.Mode.ENDLESS);
        this.ranges = new RangeLevel[] { new RangeLevel(0, null), new RangeLevel(30, "quietest_snd.mp3"), new RangeLevel(40, "default_snd.mp3"), new RangeLevel(60, "loudest_snd.mp3"), new RangeLevel(100, "success_snd.mp3") };
        this.handler = new Handler() {
            public void handleMessage(final Message message) {
                final String access$100 = GeigerActivity.this.tagEpc;
                final String access$101 = GeigerActivity.this.tagRssi;
                final int access$102 = GeigerActivity.this.tagRange;
                int i = 0;
                String string = "";
                while (i < access$100.length()) {
                    final String string2 = string + access$100.substring(i, Math.min(i + 4, access$100.length()));
                    i += 4;
                    final StringBuilder append = new StringBuilder().append(string2);
                    String s;
                    if (i % 12 != 0) {
                        s = " ";
                    }
                    else {
                        s = "\n";
                    }
                    string = append.append(s).toString();
                }
                GeigerActivity.this.txtEpc.setText((CharSequence)string);
                GeigerActivity.this.txtRssi.setText((CharSequence)access$101);
                GeigerActivity.this.progressBar.setProgress(access$102);
            }
        };
        if (GeigerActivity.scanner == null) {
            GeigerActivity.scanner = new TagScanner(this);
        }
        else {
            GeigerActivity.scanner.setListener(this);
            this.updateMask();
        }
        this.startSoundFeedbackThread();
    }
    
    public boolean onCreateOptionsMenu(final Menu menu) {
        this.getMenuInflater().inflate(2131558402, menu);
        return true;
    }
    
    protected void onDestroy() {
        super.onDestroy();
        this.closing = true;
        GeigerActivity.scanner.stop();
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
        TagProximator.addData(tag.getEPC(), tag.getRSSI());
        final double n = TagProximator.getProximity(tag.getEPC());
        final int scaledProximity = TagProximator.getScaledProximity(tag.getEPC());
        this.tagLastSeen = System.currentTimeMillis();
        this.tagEpc = tag.getEPC();
        this.tagRssi = String.format("%1$,.1f", n);
        this.tagRange = Math.min(scaledProximity, 100);
        this.tagRange = Math.max(scaledProximity, 0);
        this.refreshTagInfo();
    }
    
    class RangeLevel
    {
        MediaPlayer mp;
        String sound;
        int value;
        
        RangeLevel(final int value, final String sound) {
            this.value = value;
            this.sound = sound;
            if (sound == null) {
                return;
            }
            try {
                this.mp = new MediaPlayer();
                final AssetFileDescriptor openFd = GeigerActivity.this.activity.getAssets().openFd(sound);
                this.mp.setDataSource(openFd.getFileDescriptor(), openFd.getStartOffset(), openFd.getLength());
                openFd.close();
                this.mp.setLooping(true);
                this.mp.prepare();
            }
            catch (Exception ex) {
                Log.e("AlienRFID-Geiger", "Error play range audio : " + ex);
                ex.printStackTrace();
            }
        }
        
        void pause() {
            if (this.mp == null) {
                return;
            }
            this.mp.pause();
        }
        
        void play() {
            if (this.mp == null) {
                return;
            }
            this.mp.start();
        }
    }
}
