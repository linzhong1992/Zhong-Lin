package com.alien.demo.rfid;

import com.google.gson.*;
import com.alien.demo.*;

public class TagMask
{
    private final String FIELD_SEP;
    private int maskedBank;
    private MaskInfo[] masks;
    
    public TagMask() {
        this.FIELD_SEP = ",";
        this.masks = new MaskInfo[] { new MaskInfo(), new MaskInfo(), new MaskInfo(), new MaskInfo() };
        this.maskedBank = 1;
    }
    
    public static TagMask createFromString(final String s) {
        final TagMask tagMask = new TagMask();
        tagMask.loadFromString(s);
        return tagMask;
    }
    
    public void clearMask() {
        this.setMaskInfo(this.maskedBank = 1, 0, 0, "");
    }
    
    public String convertToString() {
        return new Gson().toJson(this);
    }
    
    public MaskInfo[] getMaskInfos() {
        return this.masks;
    }
    
    public int getMaskedBank() {
        return this.maskedBank;
    }
    
    public void loadFromString(final String s) {
        final TagMask tagMask = new Gson().fromJson(s, TagMask.class);
        this.maskedBank = tagMask.maskedBank;
        this.masks = tagMask.masks;
    }
    
    public boolean setMaskInfo(final int n, final int ptr, final int len, final String data) {
        if (n == 0) {
            return false;
        }
        final MaskInfo maskInfo = this.masks[n];
        maskInfo.ptr = ptr;
        maskInfo.len = len;
        maskInfo.data = data;
        return true;
    }
    
    public void setMaskedBank(final int maskedBank) {
        this.maskedBank = maskedBank;
    }
    
    @Override
    public String toString() {
        final MaskInfo maskInfo = this.masks[this.maskedBank];
        if (maskInfo.isNotSet()) {
            return "";
        }
        return Constants.Bank.NAMES[this.maskedBank] + ":" + maskInfo.toString();
    }
    
    public class MaskInfo
    {
        String data;
        int len;
        int ptr;
        
        public MaskInfo() {
            this.ptr = 0;
            this.len = 0;
            this.data = "";
        }
        
        public void clear() {
            this.ptr = 0;
            this.len = 0;
            this.data = "";
        }
        
        public boolean isNotSet() {
            return this.data.isEmpty();
        }
        
        @Override
        public String toString() {
            return "" + this.ptr + "," + this.len + "\n" + this.data;
        }
    }
}
