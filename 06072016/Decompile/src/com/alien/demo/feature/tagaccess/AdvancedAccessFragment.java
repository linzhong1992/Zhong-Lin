package com.alien.demo.feature.tagaccess;

import com.alien.demo.rfid.*;
import com.alien.demo.feature.mask.*;
import android.util.*;
import com.alien.demo.system.*;
import com.alien.demo.uibase.*;
import android.widget.*;
import com.alien.rfid.*;
import android.content.*;
import android.app.*;
import android.os.*;
import android.view.*;

public class AdvancedAccessFragment extends BaseFragment
{
    private static final String TAG = "AlienRFID-Adv Access";
    private ImageButton btnLock;
    private Button btnMask;
    private ImageButton btnRead;
    private ImageButton btnWrite;
    private Activity context;
    private EditText etData;
    private EditText etPassword;
    private EditText etWordLen;
    private EditText etWordOffset;
    private TagScanner scanner;
    private Spinner spLockField;
    private Spinner spLockType;
    private Spinner spRWBank;
    private TextView txtMaskEpc;
    
    private void configureMask() {
        final Intent intent = new Intent((Context)this.context, (Class)MaskActivity.class);
        intent.putExtra("filter_data", this.scanner.getFilter().convertToString());
        this.startActivityForResult(intent, 1);
    }
    
    private String getAccessPwd() {
        return this.etPassword.getText().toString();
    }
    
    public static AdvancedAccessFragment newInstance(final TagScanner scanner) {
        final AdvancedAccessFragment advancedAccessFragment = new AdvancedAccessFragment();
        advancedAccessFragment.scanner = scanner;
        return advancedAccessFragment;
    }
    
    private void readData() {
        RFIDResult read;
        try {
            final Bank fromValue = Bank.fromValue(this.spRWBank.getSelectedItemPosition());
            int int1 = 0;
            final String string = this.etWordOffset.getText().toString();
            if (!string.isEmpty()) {
                int1 = Integer.parseInt(string);
            }
            int int2 = 0;
            final String string2 = this.etWordLen.getText().toString();
            if (!string2.isEmpty()) {
                int2 = Integer.parseInt(string2);
            }
            read = this.scanner.read(fromValue, int1, int2, this.getAccessPwd());
            if (!read.isSuccess()) {
                throw new ReaderException("Operation result is false");
            }
        }
        catch (Exception ex) {
            this.context.runOnUiThread((Runnable)new Runnable() {
                @Override
                public void run() {
                    AdvancedAccessFragment.this.etData.setText((CharSequence)"");
                    AdvancedAccessFragment.this.etData.setBackgroundResource(2130837577);
                }
            });
            Log.e("AlienRFID-Adv Access", "Error reading data: " + ex);
            ex.printStackTrace();
            Sound.playError((Context)this.context);
            return;
        }
        this.context.runOnUiThread((Runnable)new Runnable() {
            @Override
            public void run() {
                AdvancedAccessFragment.this.etData.setText((CharSequence)read.getData());
                AdvancedAccessFragment.this.etData.setBackgroundResource(2130837578);
                UIHelper.flashingView((View)AdvancedAccessFragment.this.etData);
            }
        });
        Sound.playSuccess((Context)this.context);
    }
    
    private void setupEvents() {
        this.btnMask.setOnClickListener((View$OnClickListener)new View$OnClickListener() {
            public void onClick(final View view) {
                AdvancedAccessFragment.this.configureMask();
            }
        });
        this.btnRead.setOnClickListener((View$OnClickListener)new View$OnClickListener() {
            public void onClick(final View view) {
                TaskRunner.runTask((Context)AdvancedAccessFragment.this.context, "Reading...", new Runnable() {
                    @Override
                    public void run() {
                        AdvancedAccessFragment.this.readData();
                    }
                });
            }
        });
        this.btnWrite.setOnClickListener((View$OnClickListener)new View$OnClickListener() {
            public void onClick(final View view) {
                TaskRunner.runTask((Context)AdvancedAccessFragment.this.context, "Writing...", new Runnable() {
                    @Override
                    public void run() {
                        AdvancedAccessFragment.this.writeData();
                    }
                });
            }
        });
        this.btnLock.setOnClickListener((View$OnClickListener)new View$OnClickListener() {
            public void onClick(final View view) {
                AdvancedAccessFragment.this.lockField();
            }
        });
        this.spLockType.setOnItemSelectedListener((AdapterView$OnItemSelectedListener)new AdapterView$OnItemSelectedListener() {
            public void onItemSelected(final AdapterView<?> adapterView, final View view, final int n, final long n2) {
                if (n == 0 || n == 2) {
                    AdvancedAccessFragment.this.btnLock.setImageResource(2130837588);
                    return;
                }
                AdvancedAccessFragment.this.btnLock.setImageResource(2130837587);
            }
            
            public void onNothingSelected(final AdapterView<?> adapterView) {
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
    
    private void writeData() {
        try {
            final Bank fromValue = Bank.fromValue(this.spRWBank.getSelectedItemPosition());
            int int1 = 0;
            final String string = this.etWordOffset.getText().toString();
            if (!string.isEmpty()) {
                int1 = Integer.parseInt(string);
            }
            final String string2 = this.etWordLen.getText().toString();
            if (!string2.isEmpty()) {
                Integer.parseInt(string2);
            }
            if (!this.scanner.write(fromValue, int1, this.etData.getText().toString(), this.getAccessPwd()).isSuccess()) {
                throw new ReaderException("Operation result is false");
            }
        }
        catch (Exception ex) {
            this.context.runOnUiThread((Runnable)new Runnable() {
                @Override
                public void run() {
                    AdvancedAccessFragment.this.etData.setBackgroundResource(2130837577);
                }
            });
            Log.e("AlienRFID-Adv Access", "Error writing data: " + ex);
            ex.printStackTrace();
            Sound.playError((Context)this.context);
            return;
        }
        this.context.runOnUiThread((Runnable)new Runnable() {
            @Override
            public void run() {
                AdvancedAccessFragment.this.etData.setBackgroundResource(2130837578);
                UIHelper.flashingView((View)AdvancedAccessFragment.this.etData);
            }
        });
        Sound.playSuccess((Context)this.context);
    }
    
    public LockFields getField(final Spinner spinner) throws ReaderException {
        switch (spinner.getSelectedItemPosition()) {
            default: {
                throw new ReaderException("Invalid field");
            }
            case 0: {
                return new LockFields(2);
            }
            case 1: {
                return new LockFields(1);
            }
            case 2: {
                return new LockFields(4);
            }
            case 3: {
                return new LockFields(8);
            }
        }
    }
    
    public void lockField() {
        final DialogInterface$OnClickListener dialogInterface$OnClickListener = (DialogInterface$OnClickListener)new DialogInterface$OnClickListener() {
            public void onClick(final DialogInterface dialogInterface, final int n) {
                switch (n) {
                    default: {}
                    case -1: {
                        while (true) {
                            while (true) {
                                Label_0264: {
                                    LockFields field = null;
                                    Label_0230: {
                                        Label_0196: {
                                            Label_0162: {
                                                Label_0128: {
                                                    try {
                                                        field = AdvancedAccessFragment.this.getField(AdvancedAccessFragment.this.spLockField);
                                                        switch (AdvancedAccessFragment.this.spLockType.getSelectedItemPosition()) {
                                                            case 0: {
                                                                break Label_0128;
                                                            }
                                                            case 1: {
                                                                break Label_0162;
                                                            }
                                                            case 2: {
                                                                break Label_0196;
                                                            }
                                                            case 3: {
                                                                break Label_0230;
                                                            }
                                                            default: {
                                                                break Label_0264;
                                                            }
                                                        }
                                                        Sound.playSuccess((Context)AdvancedAccessFragment.this.context);
                                                        return;
                                                    }
                                                    catch (Exception ex) {
                                                        Log.e("AlienRFID-Adv Access", "Error lock field: " + ex);
                                                        ex.printStackTrace();
                                                        Sound.playError((Context)AdvancedAccessFragment.this.context);
                                                        return;
                                                    }
                                                }
                                                if (!AdvancedAccessFragment.this.scanner.lock(field, AdvancedAccessFragment.this.getAccessPwd()).isSuccess()) {
                                                    throw new ReaderException("Operation result is false");
                                                }
                                                continue;
                                            }
                                            if (!AdvancedAccessFragment.this.scanner.unlock(field, AdvancedAccessFragment.this.getAccessPwd()).isSuccess()) {
                                                throw new ReaderException("Operation result is false");
                                            }
                                            continue;
                                        }
                                        if (!AdvancedAccessFragment.this.scanner.permaLock(field, AdvancedAccessFragment.this.getAccessPwd()).isSuccess()) {
                                            throw new ReaderException("Operation result is false");
                                        }
                                        continue;
                                    }
                                    if (!AdvancedAccessFragment.this.scanner.permaUnlock(field, AdvancedAccessFragment.this.getAccessPwd()).isSuccess()) {
                                        throw new ReaderException("Operation result is false");
                                    }
                                    continue;
                                }
                                continue;
                            }
                        }
                        break;
                    }
                }
            }
        };
        new AlertDialog$Builder((Context)this.context).setMessage(2131034146).setPositiveButton(2131034237, (DialogInterface$OnClickListener)dialogInterface$OnClickListener).setNegativeButton(2131034196, (DialogInterface$OnClickListener)dialogInterface$OnClickListener).show();
    }
    
    @Override
    public void onActivityCreated(final Bundle bundle) {
        super.onActivityCreated(bundle);
        this.context = this.getActivity();
        this.txtMaskEpc = (TextView)this.context.findViewById(2131493028);
        this.btnMask = (Button)this.context.findViewById(2131493027);
        this.etPassword = (EditText)this.context.findViewById(2131493029);
        (this.spRWBank = (Spinner)this.context.findViewById(2131493030)).setSelection(1);
        this.etWordOffset = (EditText)this.context.findViewById(2131493031);
        this.etWordLen = (EditText)this.context.findViewById(2131493032);
        this.etData = (EditText)this.context.findViewById(2131493033);
        this.btnRead = (ImageButton)this.context.findViewById(2131493034);
        this.btnWrite = (ImageButton)this.context.findViewById(2131493035);
        (this.spLockField = (Spinner)this.context.findViewById(2131493036)).setSelection(2);
        this.spLockType = (Spinner)this.context.findViewById(2131493037);
        this.btnLock = (ImageButton)this.context.findViewById(2131493038);
        this.setupEvents();
    }
    
    @Override
    public void onActivityResult(final int n, final int n2, final Intent intent) {
        if (n == 1) {
            final Activity context = this.context;
            if (n2 == -1) {
                this.scanner.getFilter().loadFromString(intent.getStringExtra("filter_data"));
                this.updateMask();
            }
        }
    }
    
    @Override
    public View onCreateView(final LayoutInflater layoutInflater, final ViewGroup viewGroup, final Bundle bundle) {
        return layoutInflater.inflate(2130903088, viewGroup, false);
    }
    
    @Override
    public void onKeyDown(final int n, final KeyEvent keyEvent) {
        if (n == 139 && keyEvent.getRepeatCount() == 0) {
            this.readData();
            return;
        }
        super.onKeyDown(n, keyEvent);
    }
    
    @Override
    public void onResume() {
        super.onResume();
        this.updateMask();
    }
}
