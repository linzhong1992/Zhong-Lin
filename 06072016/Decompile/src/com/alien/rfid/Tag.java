package com.alien.rfid;

import com.rscja.utility.*;

public class Tag
{
    private RFIDReader a;
    private String b;
    private double c;
    
    Tag(final RFIDReader a, final String b, final double c) {
        this.a = a;
        this.b = b;
        this.c = c;
    }
    
    private void a() throws ReaderException {
        if (this.getEPC() == null || this.getEPC().isEmpty()) {
            throw new ReaderException("epc is empty!!");
        }
    }
    
    private Mask b() {
        try {
            final String epc = this.getEPC();
            return new Mask(Bank.EPC, 32, epc.length() * 4, epc);
        }
        catch (ReaderException ex) {
            return null;
        }
    }
    
    public String getEPC() {
        if (this.b == null) {
            return "";
        }
        return this.b.substring(4);
    }
    
    public String getPC() {
        if (this.b == null) {
            return "";
        }
        return this.b.substring(0, 4);
    }
    
    public double getRSSI() {
        return this.c;
    }
    
    public RFIDResult kill(final String s) throws ReaderException {
        this.a();
        return this.a.kill(s, this.b());
    }
    
    public RFIDResult lock(final LockFields lockFields, final LockType lockType) throws ReaderException {
        this.a();
        return this.a.lock(lockFields, lockType, this.b());
    }
    
    public RFIDResult lock(final LockFields lockFields, final LockType lockType, final String s) throws ReaderException {
        this.a();
        return this.a.lock(lockFields, lockType, this.b(), s);
    }
    
    public RFIDResult read(final Bank bank, final int n, final int n2) throws ReaderException {
        this.a();
        return this.a.read(bank, n, n2, this.b());
    }
    
    public RFIDResult read(final Bank bank, final int n, final int n2, final String s) throws ReaderException {
        this.a();
        return this.a.read(bank, n, n2, this.b(), s);
    }
    
    public RFIDResult readAccessPwd() throws ReaderException {
        this.a();
        return this.a.read(Bank.RESERVED, 2, 2, this.b());
    }
    
    public RFIDResult readKillPwd() throws ReaderException {
        this.a();
        return this.a.read(Bank.RESERVED, 0, 2, this.b());
    }
    
    public RFIDResult readTID() throws ReaderException {
        this.a();
        final RFIDResult read = this.a.read(Bank.TID, 0, 2, this.b());
        if (!read.isSuccess()) {
            return read;
        }
        String string = (String)read.getData();
        if (string.startsWith("E2003411")) {
            return this.a.read(Bank.TID, 0, 5, this.b());
        }
        if (string.startsWith("E2003412") || string.startsWith("E2003414")) {
            return this.a.read(Bank.TID, 0, 12, this.b());
        }
        if (string.startsWith("E2003811")) {
            return this.a.read(Bank.TID, 0, 21, this.b());
        }
        int n = 2;
        while (true) {
            final RFIDResult read2 = this.a.read(Bank.TID, n, 2, this.b());
            if (!read2.isSuccess()) {
                break;
            }
            string += (String)read2.getData();
            n += 2;
        }
        return new RFIDResult(true, string);
    }
    
    public RFIDResult readUser() throws ReaderException {
        boolean b = false;
        this.a();
        String string = "";
        int n = 0;
        while (true) {
            final RFIDResult read = this.a.read(Bank.USER, n, 2, this.b());
            if (!read.isSuccess()) {
                break;
            }
            string += (String)read.getData();
            n += 2;
        }
        if (string.length() > 0) {
            b = true;
        }
        if (!b) {
            string = null;
        }
        return new RFIDResult(b, string);
    }
    
    public RFIDResult write(final Bank bank, final int n, final String s) throws ReaderException {
        this.a();
        return this.a.write(bank, n, s, this.b());
    }
    
    public RFIDResult write(final Bank bank, final int n, final String s, final String s2) throws ReaderException {
        this.a();
        return this.a.write(bank, n, s, this.b(), s2);
    }
    
    public RFIDResult writeAccessPwd(final String s) throws ReaderException {
        this.a();
        return this.a.write(Bank.RESERVED, 2, s, this.b());
    }
    
    public RFIDResult writeEPC(String string) throws ReaderException {
        this.a();
        if (string.length() % 4 != 0) {
            throw new InvalidParamException("EPC parameter value must be in WORD units.");
        }
        final String pc = this.getPC();
        string = com.rscja.utility.a.a((byte)(((Integer.parseInt(pc.substring(0, 2), 16) & 0x1) | string.length() / 4 << 3) & 0xFF)) + pc.substring(2) + string;
        final RFIDResult write = this.a.write(Bank.EPC, 1, string, this.b());
        if (write.isSuccess()) {
            this.b = string;
        }
        return write;
    }
    
    public RFIDResult writeKillPwd(final String s) throws ReaderException {
        this.a();
        return this.a.write(Bank.RESERVED, 0, s, this.b());
    }
    
    public RFIDResult writeUser(final String s) throws ReaderException {
        this.a();
        if (s.length() % 4 != 0) {
            throw new InvalidParamException("Invalid USER data. USER data must be word units");
        }
        int length;
        for (int i = 0; i < s.length(); i = length) {
            if ((length = i + 8) > s.length()) {
                length = s.length();
            }
            final RFIDResult write = this.a.write(Bank.USER, i / 4, s.substring(i, length), this.b());
            if (!write.isSuccess()) {
                return write;
            }
        }
        return new RFIDResult(true);
    }
}
