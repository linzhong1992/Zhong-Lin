package com.alien.demo.rfid;

import android.util.*;
import com.alien.rfid.*;
import android.content.*;
import com.alien.demo.uibase.*;

public class TagScanner
{
    private static final String TAG = "AlienRFID-Scanner";
    private static RFIDReader reader;
    private TagMask filter;
    private RFIDCallback listener;
    
    public TagScanner(final RFIDCallback listener) {
        this.filter = new TagMask();
        try {
            this.listener = listener;
            init();
        }
        catch (Exception ex) {
            Log.e("AlienRFID-Scanner", "Error init reader: " + ex);
            ex.printStackTrace();
        }
    }
    
    public static void deinit() {
        synchronized (TagScanner.class) {
            if (TagScanner.reader != null) {
                TagScanner.reader.close();
                TagScanner.reader = null;
            }
        }
    }
    
    private Mask getMask() throws ReaderException {
        final TagMask.MaskInfo[] maskInfos = this.filter.getMaskInfos();
        final int maskedBank = this.filter.getMaskedBank();
        return new Mask(Bank.fromValue(this.filter.getMaskedBank()), maskInfos[maskedBank].ptr, maskInfos[maskedBank].len, maskInfos[maskedBank].data);
    }
    
    public static RFIDReader getRFIDReader() {
        try {
            return RFID.open();
        }
        catch (Exception ex) {
            Log.e("AlienRFID-Scanner", "Error getting reader: " + ex);
            ex.printStackTrace();
            return null;
        }
    }
    
    public static void init() throws ReaderException {
        synchronized (TagScanner.class) {
            if (TagScanner.reader == null) {
                TagScanner.reader = RFID.open();
                Log.i("AlienRFID-Scanner", "Reader initialized successfully");
            }
        }
    }
    
    public TagMask getFilter() {
        return this.filter;
    }
    
    public boolean isInitSuccess() {
        return TagScanner.reader != null;
    }
    
    public boolean isScanning() {
        return TagScanner.reader.isRunning();
    }
    
    public RFIDResult lock(final LockFields lockFields, final String s) throws ReaderException {
        return TagScanner.reader.lock(lockFields, LockType.LOCK, this.getMask(), s);
    }
    
    public RFIDResult permaLock(final LockFields lockFields, final String s) throws ReaderException {
        return TagScanner.reader.lock(lockFields, LockType.PERMALOCK, this.getMask(), s);
    }
    
    public RFIDResult permaUnlock(final LockFields lockFields, final String s) throws ReaderException {
        return TagScanner.reader.lock(lockFields, LockType.PERMAUNLOCK, this.getMask(), s);
    }
    
    public RFIDResult read(final Bank bank, final int n, final int n2, final String s) throws ReaderException {
        return TagScanner.reader.read(bank, n, n2, this.getMask(), s);
    }
    
    public void scan() {
        try {
            if (this.listener != null) {
                TagScanner.reader.inventory(this.listener, this.getMask());
            }
        }
        catch (Exception ex) {
            Log.e("AlienRFID-Scanner", "Error when scanning tags: " + ex);
            ex.printStackTrace();
        }
    }
    
    public Tag scanSingle() {
        try {
            return (Tag)TagScanner.reader.read(this.getMask()).getData();
        }
        catch (Exception ex) {
            Log.e("AlienRFID-Scanner", "Error when scanning single tag: " + ex);
            ex.printStackTrace();
            return null;
        }
    }
    
    public void setDefaultAccessPassword(final String accessPwd) {
        TagScanner.reader.setAccessPwd(accessPwd);
    }
    
    public void setListener(final RFIDCallback listener) {
        this.listener = listener;
    }
    
    public void stop(final Context context) {
        TaskRunner.runTask(context, "Stop...", "Stop failed", new Runnable() {
            @Override
            public void run() {
                TagScanner.this.stop();
            }
        });
    }
    
    public boolean stop() {
        try {
            TagScanner.reader.stop();
            return true;
        }
        catch (Exception ex) {
            Log.e("AlienRFID-Scanner", "Error when stop tags: " + ex);
            ex.printStackTrace();
            return false;
        }
    }
    
    public RFIDResult unlock(final LockFields lockFields, final String s) throws ReaderException {
        return TagScanner.reader.lock(lockFields, LockType.UNLOCK, this.getMask(), s);
    }
    
    public RFIDResult write(final Bank bank, final int n, final String s, final String s2) throws ReaderException {
        return TagScanner.reader.write(bank, n, s, this.getMask(), s2);
    }
}
