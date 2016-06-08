package com.alien.rfid;

import java.util.*;

public abstract class RFIDReader
{
    private Mask a;
    private String b;
    
    public RFIDReader() {
        this.a = Mask.NONE;
        this.b = "00000000";
    }
    
    public abstract void close();
    
    public String getAccessPwd() {
        return this.b;
    }
    
    public abstract String getInfo(final RFIDInfo p0);
    
    public Map getInfo() {
        final HashMap<RFIDInfo, String> hashMap = new HashMap<RFIDInfo, String>();
        hashMap.put(RFIDInfo.HARDWARE_VER, this.getInfo(RFIDInfo.HARDWARE_VER));
        hashMap.put(RFIDInfo.FIRMWARE_VER, this.getInfo(RFIDInfo.FIRMWARE_VER));
        return hashMap;
    }
    
    public Mask getMask() {
        return this.a;
    }
    
    public abstract int getPower() throws ReaderException;
    
    public abstract int getQ() throws ReaderException;
    
    public abstract Session getSession() throws ReaderException;
    
    public abstract Target getTarget() throws ReaderException;
    
    public void inventory(final RFIDCallback rfidCallback) throws ReaderException {
        this.inventory(rfidCallback, this.a);
    }
    
    public abstract void inventory(final RFIDCallback p0, final Mask p1) throws ReaderException;
    
    public abstract boolean isRunning();
    
    public RFIDResult kill(final String s) throws ReaderException {
        return this.kill(s, this.a);
    }
    
    public abstract RFIDResult kill(final String p0, final Mask p1) throws ReaderException;
    
    public RFIDResult lock(final LockFields lockFields, final LockType lockType) throws ReaderException {
        return this.lock(lockFields, lockType, this.a, this.b);
    }
    
    public RFIDResult lock(final LockFields lockFields, final LockType lockType, final Mask mask) throws ReaderException {
        return this.lock(lockFields, lockType, mask, this.b);
    }
    
    public abstract RFIDResult lock(final LockFields p0, final LockType p1, final Mask p2, final String p3) throws ReaderException;
    
    public RFIDResult lock(final LockFields lockFields, final LockType lockType, final String s) throws ReaderException {
        return this.lock(lockFields, lockType, this.a, s);
    }
    
    public RFIDResult read() throws ReaderException {
        return this.read(this.a);
    }
    
    public RFIDResult read(final Bank bank, final int n, final int n2) throws ReaderException {
        return this.read(bank, n, n2, this.a, this.b);
    }
    
    public RFIDResult read(final Bank bank, final int n, final int n2, final Mask mask) throws ReaderException {
        return this.read(bank, n, n2, mask, this.b);
    }
    
    public abstract RFIDResult read(final Bank p0, final int p1, final int p2, final Mask p3, final String p4) throws ReaderException;
    
    public RFIDResult read(final Bank bank, final int n, final int n2, final String s) throws ReaderException {
        return this.read(bank, n, n2, this.a, s);
    }
    
    public abstract RFIDResult read(final Mask p0) throws ReaderException;
    
    public void setAccessPwd(final String b) {
        this.b = b;
    }
    
    public void setMask(final Mask a) {
        this.a = a;
    }
    
    public abstract void setPower(final int p0) throws ReaderException;
    
    public abstract void setQ(final int p0) throws ReaderException;
    
    public abstract void setSession(final Session p0) throws ReaderException;
    
    public abstract void setTarget(final Target p0) throws ReaderException;
    
    public abstract void stop() throws ReaderException;
    
    public RFIDResult write(final Bank bank, final int n, final String s) throws ReaderException {
        return this.write(bank, n, s, this.a, this.b);
    }
    
    public RFIDResult write(final Bank bank, final int n, final String s, final Mask mask) throws ReaderException {
        return this.write(bank, n, s, mask, this.b);
    }
    
    public abstract RFIDResult write(final Bank p0, final int p1, final String p2, final Mask p3, final String p4) throws ReaderException;
    
    public RFIDResult write(final Bank bank, final int n, final String s, final String s2) throws ReaderException {
        return this.write(bank, n, s, this.a, s2);
    }
}
