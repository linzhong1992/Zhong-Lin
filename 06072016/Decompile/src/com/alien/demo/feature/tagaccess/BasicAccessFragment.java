package com.alien.demo.feature.tagaccess;

import android.app.*;
import com.alien.demo.rfid.*;
import android.widget.*;
import com.alien.demo.feature.mask.*;
import android.content.*;
import android.util.*;
import com.alien.rfid.*;
import com.alien.demo.system.*;
import com.alien.demo.uibase.*;
import android.os.*;
import android.view.*;

public class BasicAccessFragment extends BaseFragment
{
    private static final String TAG = "AlienRFID-Basic Access";
    private Button btnClearAll;
    private Button btnMask;
    private ImageButton btnReadAPwd;
    private Button btnReadAll;
    private ImageButton btnReadEpc;
    private ImageButton btnReadKPwd;
    private ImageButton btnReadTid;
    private ImageButton btnReadUser;
    private ImageButton btnWriteAPwd;
    private ImageButton btnWriteEpc;
    private ImageButton btnWriteKPwd;
    private ImageButton btnWriteUser;
    private Activity context;
    private EditText etAPwd;
    private EditText etEpc;
    private EditText etKPwd;
    private EditText etPassword;
    private EditText etTid;
    private EditText etUser;
    private TagScanner scanner;
    private Tag tag;
    private TextView txtMaskEpc;
    
    private void checkForTag() throws NoTagFound {
        if (this.tag == null) {
            this.tag = this.scanner.scanSingle();
            if (this.tag == null) {
                throw new NoTagFound("");
            }
        }
        this.scanner.setDefaultAccessPassword(this.getAccessPwd());
    }
    
    private void clearAll() {
        this.tag = null;
        this.etEpc.setText((CharSequence)"");
        this.etKPwd.setText((CharSequence)"");
        this.etAPwd.setText((CharSequence)"");
        this.etTid.setText((CharSequence)"");
        this.etUser.setText((CharSequence)"");
    }
    
    private void configureMask() {
        final Intent intent = new Intent((Context)this.context, (Class)MaskActivity.class);
        intent.putExtra("filter_data", this.scanner.getFilter().convertToString());
        this.startActivityForResult(intent, 1);
    }
    
    private String getAccessPwd() {
        return this.etPassword.getText().toString();
    }
    
    private void markReadFieldError(final EditText editText) {
        this.context.runOnUiThread((Runnable)new Runnable() {
            @Override
            public void run() {
                editText.setText((CharSequence)"");
                editText.setBackgroundResource(2130837577);
            }
        });
    }
    
    private void markReadFieldSuccess(final EditText editText, final String s) {
        this.context.runOnUiThread((Runnable)new Runnable() {
            @Override
            public void run() {
                editText.setText((CharSequence)s);
                editText.setBackgroundResource(2130837578);
                UIHelper.flashingView((View)editText);
            }
        });
    }
    
    private void markWriteFieldError(final EditText editText) {
        this.context.runOnUiThread((Runnable)new Runnable() {
            @Override
            public void run() {
                editText.setBackgroundResource(2130837577);
            }
        });
    }
    
    private void markWriteFieldSuccess(final EditText editText) {
        this.context.runOnUiThread((Runnable)new Runnable() {
            @Override
            public void run() {
                editText.setBackgroundResource(2130837578);
                UIHelper.flashingView((View)editText);
            }
        });
    }
    
    public static BasicAccessFragment newInstance(final TagScanner scanner) {
        final BasicAccessFragment basicAccessFragment = new BasicAccessFragment();
        basicAccessFragment.scanner = scanner;
        return basicAccessFragment;
    }
    
    private boolean readAPwd() throws NoTagFound {
        try {
            this.checkForTag();
            final RFIDResult accessPwd = this.tag.readAccessPwd();
            if (!accessPwd.isSuccess()) {
                this.markReadFieldError(this.etAPwd);
                return false;
            }
            this.markReadFieldSuccess(this.etAPwd, (String)accessPwd.getData());
            return true;
        }
        catch (ReaderException ex) {
            this.markReadFieldError(this.etAPwd);
            Log.e("AlienRFID-Basic Access", "Error reading access password: " + ex);
            ex.printStackTrace();
            return false;
        }
    }
    
    private void readAll() {
        TaskRunner.runTask((Context)this.context, "Reading all fields...", new Runnable() {
            @Override
            public void run() {
                try {
                    final boolean access$1000 = BasicAccessFragment.this.readEpc();
                    final boolean access$1001 = BasicAccessFragment.this.readKPwd();
                    final boolean access$1002 = BasicAccessFragment.this.readAPwd();
                    final boolean access$1003 = BasicAccessFragment.this.readTid();
                    final boolean access$1004 = BasicAccessFragment.this.readUser();
                    if (access$1000 && access$1001 && access$1002 && access$1002 && access$1003 && access$1004) {
                        Sound.playSuccess((Context)BasicAccessFragment.this.context);
                        return;
                    }
                    Sound.playError((Context)BasicAccessFragment.this.context);
                }
                catch (NoTagFound noTagFound) {
                    Sound.playError((Context)BasicAccessFragment.this.context);
                }
            }
        });
    }
    
    private boolean readEpc() throws NoTagFound {
        try {
            this.tag = null;
            this.checkForTag();
            this.markReadFieldSuccess(this.etEpc, this.tag.getEPC());
            return true;
        }
        catch (NoTagFound noTagFound) {
            this.markReadFieldError(this.etEpc);
            Log.e("AlienRFID-Basic Access", "Error reading tag: " + noTagFound);
            noTagFound.printStackTrace();
            throw noTagFound;
        }
    }
    
    private boolean readKPwd() throws NoTagFound {
        try {
            this.checkForTag();
            final RFIDResult killPwd = this.tag.readKillPwd();
            if (!killPwd.isSuccess()) {
                this.markReadFieldError(this.etKPwd);
                return false;
            }
            this.markReadFieldSuccess(this.etKPwd, (String)killPwd.getData());
            return true;
        }
        catch (ReaderException ex) {
            this.markReadFieldError(this.etKPwd);
            Log.e("AlienRFID-Basic Access", "Error reading kill password: " + ex);
            ex.printStackTrace();
            return false;
        }
    }
    
    private boolean readTid() throws NoTagFound {
        try {
            this.checkForTag();
            final RFIDResult tid = this.tag.readTID();
            if (!tid.isSuccess()) {
                this.markReadFieldError(this.etTid);
                return false;
            }
            this.markReadFieldSuccess(this.etTid, (String)tid.getData());
            return true;
        }
        catch (ReaderException ex) {
            this.markReadFieldError(this.etTid);
            Log.e("AlienRFID-Basic Access", "Error reading tid: " + ex);
            ex.printStackTrace();
            return false;
        }
    }
    
    private boolean readUser() throws NoTagFound {
        try {
            this.checkForTag();
            final RFIDResult user = this.tag.readUser();
            if (!user.isSuccess()) {
                this.markReadFieldError(this.etUser);
                return false;
            }
            this.markReadFieldSuccess(this.etUser, (String)user.getData());
            return true;
        }
        catch (ReaderException ex) {
            this.markReadFieldError(this.etUser);
            Log.e("AlienRFID-Basic Access", "Error reading user: " + ex);
            ex.printStackTrace();
            return false;
        }
    }
    
    private void setupEvents() {
        this.btnMask.setOnClickListener((View$OnClickListener)new View$OnClickListener() {
            public void onClick(final View view) {
                BasicAccessFragment.this.configureMask();
            }
        });
        this.btnReadAll.setOnClickListener((View$OnClickListener)new View$OnClickListener() {
            public void onClick(final View view) {
                BasicAccessFragment.this.readAll();
            }
        });
        this.btnClearAll.setOnClickListener((View$OnClickListener)new View$OnClickListener() {
            public void onClick(final View view) {
                BasicAccessFragment.this.clearAll();
            }
        });
        this.btnReadKPwd.setOnClickListener((View$OnClickListener)new View$OnClickListener() {
            public void onClick(final View view) {
                TaskRunner.runTask((Context)BasicAccessFragment.this.context, "Read field...", new Runnable() {
                    @Override
                    public void run() {
                        try {
                            if (BasicAccessFragment.this.readKPwd()) {
                                Sound.playSuccess((Context)BasicAccessFragment.this.context);
                                return;
                            }
                            Sound.playError((Context)BasicAccessFragment.this.context);
                        }
                        catch (NoTagFound noTagFound) {
                            Sound.playError((Context)BasicAccessFragment.this.context);
                        }
                    }
                });
            }
        });
        this.btnWriteKPwd.setOnClickListener((View$OnClickListener)new View$OnClickListener() {
            public void onClick(final View view) {
                TaskRunner.runTask((Context)BasicAccessFragment.this.context, "Write field...", new Runnable() {
                    @Override
                    public void run() {
                        try {
                            if (BasicAccessFragment.this.etKPwd.getText().toString().isEmpty()) {
                                return;
                            }
                            if (BasicAccessFragment.this.writeKPwd()) {
                                Sound.playSuccess((Context)BasicAccessFragment.this.context);
                                return;
                            }
                        }
                        catch (NoTagFound noTagFound) {
                            Sound.playError((Context)BasicAccessFragment.this.context);
                            return;
                        }
                        Sound.playError((Context)BasicAccessFragment.this.context);
                    }
                });
            }
        });
        this.btnReadAPwd.setOnClickListener((View$OnClickListener)new View$OnClickListener() {
            public void onClick(final View view) {
                TaskRunner.runTask((Context)BasicAccessFragment.this.context, "Reading field...", new Runnable() {
                    @Override
                    public void run() {
                        try {
                            if (BasicAccessFragment.this.readAPwd()) {
                                Sound.playSuccess((Context)BasicAccessFragment.this.context);
                                return;
                            }
                            Sound.playError((Context)BasicAccessFragment.this.context);
                        }
                        catch (NoTagFound noTagFound) {
                            Sound.playError((Context)BasicAccessFragment.this.context);
                        }
                    }
                });
            }
        });
        this.btnWriteAPwd.setOnClickListener((View$OnClickListener)new View$OnClickListener() {
            public void onClick(final View view) {
                TaskRunner.runTask((Context)BasicAccessFragment.this.context, "Write field...", new Runnable() {
                    @Override
                    public void run() {
                        try {
                            if (BasicAccessFragment.this.etAPwd.getText().toString().isEmpty()) {
                                return;
                            }
                            if (BasicAccessFragment.this.writeAPwd()) {
                                Sound.playSuccess((Context)BasicAccessFragment.this.context);
                                return;
                            }
                        }
                        catch (NoTagFound noTagFound) {
                            Sound.playError((Context)BasicAccessFragment.this.context);
                            return;
                        }
                        Sound.playError((Context)BasicAccessFragment.this.context);
                    }
                });
            }
        });
        this.btnReadEpc.setOnClickListener((View$OnClickListener)new View$OnClickListener() {
            public void onClick(final View view) {
                TaskRunner.runTask((Context)BasicAccessFragment.this.context, "Read field...", new Runnable() {
                    @Override
                    public void run() {
                        try {
                            if (BasicAccessFragment.this.readEpc()) {
                                Sound.playSuccess((Context)BasicAccessFragment.this.context);
                                return;
                            }
                            Sound.playError((Context)BasicAccessFragment.this.context);
                        }
                        catch (NoTagFound noTagFound) {
                            Sound.playError((Context)BasicAccessFragment.this.context);
                        }
                    }
                });
            }
        });
        this.btnWriteEpc.setOnClickListener((View$OnClickListener)new View$OnClickListener() {
            public void onClick(final View view) {
                TaskRunner.runTask((Context)BasicAccessFragment.this.context, "Write field...", new Runnable() {
                    @Override
                    public void run() {
                        try {
                            if (BasicAccessFragment.this.etEpc.getText().toString().isEmpty()) {
                                return;
                            }
                            if (BasicAccessFragment.this.writeEpc()) {
                                Sound.playSuccess((Context)BasicAccessFragment.this.context);
                                return;
                            }
                        }
                        catch (NoTagFound noTagFound) {
                            Sound.playError((Context)BasicAccessFragment.this.context);
                            return;
                        }
                        Sound.playError((Context)BasicAccessFragment.this.context);
                    }
                });
            }
        });
        this.btnReadTid.setOnClickListener((View$OnClickListener)new View$OnClickListener() {
            public void onClick(final View view) {
                TaskRunner.runTask((Context)BasicAccessFragment.this.context, "Read field...", new Runnable() {
                    @Override
                    public void run() {
                        try {
                            if (BasicAccessFragment.this.readTid()) {
                                Sound.playSuccess((Context)BasicAccessFragment.this.context);
                                return;
                            }
                            Sound.playError((Context)BasicAccessFragment.this.context);
                        }
                        catch (NoTagFound noTagFound) {
                            Sound.playError((Context)BasicAccessFragment.this.context);
                        }
                    }
                });
            }
        });
        this.btnReadUser.setOnClickListener((View$OnClickListener)new View$OnClickListener() {
            public void onClick(final View view) {
                TaskRunner.runTask((Context)BasicAccessFragment.this.context, "Read field...", new Runnable() {
                    @Override
                    public void run() {
                        try {
                            if (BasicAccessFragment.this.readUser()) {
                                Sound.playSuccess((Context)BasicAccessFragment.this.context);
                                return;
                            }
                            Sound.playError((Context)BasicAccessFragment.this.context);
                        }
                        catch (NoTagFound noTagFound) {
                            Sound.playError((Context)BasicAccessFragment.this.context);
                        }
                    }
                });
            }
        });
        this.btnWriteUser.setOnClickListener((View$OnClickListener)new View$OnClickListener() {
            public void onClick(final View view) {
                TaskRunner.runTask((Context)BasicAccessFragment.this.context, "Write field...", new Runnable() {
                    @Override
                    public void run() {
                        try {
                            if (BasicAccessFragment.this.etUser.getText().toString().isEmpty()) {
                                return;
                            }
                            if (BasicAccessFragment.this.writeUser()) {
                                Sound.playSuccess((Context)BasicAccessFragment.this.context);
                                return;
                            }
                        }
                        catch (NoTagFound noTagFound) {
                            Sound.playError((Context)BasicAccessFragment.this.context);
                            return;
                        }
                        Sound.playError((Context)BasicAccessFragment.this.context);
                    }
                });
            }
        });
    }
    
    private void updateMask() {
        final String string = this.scanner.getFilter().toString();
        if (string.isEmpty()) {
            this.txtMaskEpc.setText(2131034144);
            return;
        }
        this.txtMaskEpc.setText((CharSequence)string);
    }
    
    private boolean writeAPwd() throws NoTagFound {
        try {
            if (this.etAPwd.getText().toString().isEmpty()) {
                return false;
            }
            this.checkForTag();
            if (!this.tag.writeAccessPwd(this.etAPwd.getText().toString()).isSuccess()) {
                this.markWriteFieldError(this.etAPwd);
                return false;
            }
        }
        catch (ReaderException ex) {
            this.markWriteFieldError(this.etAPwd);
            Log.e("AlienRFID-Basic Access", "Error writing access password: " + ex);
            ex.printStackTrace();
            return false;
        }
        this.markWriteFieldSuccess(this.etAPwd);
        return true;
    }
    
    private boolean writeEpc() throws NoTagFound {
        try {
            if (this.etEpc.getText().toString().isEmpty()) {
                return false;
            }
            this.checkForTag();
            if (!this.tag.writeEPC(this.etEpc.getText().toString()).isSuccess()) {
                this.markWriteFieldError(this.etEpc);
                return false;
            }
        }
        catch (ReaderException ex) {
            this.markWriteFieldError(this.etEpc);
            Log.e("AlienRFID-Basic Access", "Error writing epc: " + ex);
            ex.printStackTrace();
            return false;
        }
        this.markWriteFieldSuccess(this.etEpc);
        return true;
    }
    
    private boolean writeKPwd() throws NoTagFound {
        try {
            if (this.etKPwd.getText().toString().isEmpty()) {
                return false;
            }
            this.checkForTag();
            if (!this.tag.writeKillPwd(this.etKPwd.getText().toString()).isSuccess()) {
                this.markWriteFieldError(this.etKPwd);
                return false;
            }
        }
        catch (ReaderException ex) {
            this.markWriteFieldError(this.etKPwd);
            Log.e("AlienRFID-Basic Access", "Error writing kill password: " + ex);
            ex.printStackTrace();
            return false;
        }
        this.markWriteFieldSuccess(this.etKPwd);
        return true;
    }
    
    private boolean writeUser() throws NoTagFound {
        try {
            if (this.etUser.getText().toString().isEmpty()) {
                return false;
            }
            if (!this.tag.writeUser(this.etUser.getText().toString()).isSuccess()) {
                this.markWriteFieldError(this.etUser);
                return false;
            }
        }
        catch (ReaderException ex) {
            this.markWriteFieldError(this.etUser);
            Log.e("AlienRFID-Basic Access", "Error writing user: " + ex);
            ex.printStackTrace();
            return false;
        }
        this.markWriteFieldSuccess(this.etUser);
        return true;
    }
    
    @Override
    public void onActivityCreated(final Bundle bundle) {
        super.onActivityCreated(bundle);
        this.context = this.getActivity();
        this.txtMaskEpc = (TextView)this.context.findViewById(2131493046);
        this.btnMask = (Button)this.context.findViewById(2131493045);
        this.btnReadAll = (Button)this.context.findViewById(2131493047);
        this.btnClearAll = (Button)this.context.findViewById(2131493048);
        this.btnReadKPwd = (ImageButton)this.context.findViewById(2131493051);
        this.btnWriteKPwd = (ImageButton)this.context.findViewById(2131493052);
        this.btnReadAPwd = (ImageButton)this.context.findViewById(2131493054);
        this.btnWriteAPwd = (ImageButton)this.context.findViewById(2131493055);
        this.btnReadEpc = (ImageButton)this.context.findViewById(2131493057);
        this.btnWriteEpc = (ImageButton)this.context.findViewById(2131493058);
        this.btnReadTid = (ImageButton)this.context.findViewById(2131493060);
        this.btnReadUser = (ImageButton)this.context.findViewById(2131493062);
        this.btnWriteUser = (ImageButton)this.context.findViewById(2131493063);
        this.etPassword = (EditText)this.context.findViewById(2131493049);
        this.etKPwd = (EditText)this.context.findViewById(2131493050);
        this.etAPwd = (EditText)this.context.findViewById(2131493053);
        this.etEpc = (EditText)this.context.findViewById(2131493056);
        (this.etTid = (EditText)this.context.findViewById(2131493059)).setFocusable(false);
        this.etUser = (EditText)this.context.findViewById(2131493061);
        this.setupEvents();
    }
    
    @Override
    public void onActivityResult(final int n, final int n2, final Intent intent) {
        if (n == 1) {
            final Activity context = this.context;
            if (n2 == -1) {
                this.scanner.getFilter().loadFromString(intent.getStringExtra("filter_data"));
                this.clearAll();
                this.updateMask();
            }
        }
    }
    
    @Override
    public View onCreateView(final LayoutInflater layoutInflater, final ViewGroup viewGroup, final Bundle bundle) {
        return layoutInflater.inflate(2130903090, viewGroup, false);
    }
    
    @Override
    public void onKeyDown(final int n, final KeyEvent keyEvent) {
        if (n == 139 && keyEvent.getRepeatCount() == 0) {
            this.readAll();
            return;
        }
        super.onKeyDown(n, keyEvent);
    }
    
    @Override
    public void onResume() {
        super.onResume();
        this.updateMask();
    }
    
    class NoTagFound extends Exception
    {
        NoTagFound(final String s) {
            super(s);
        }
    }
}
