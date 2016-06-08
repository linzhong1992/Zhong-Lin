package com.alien.demo.feature.mask;

import java.util.*;

public class ScanInfo
{
    private String maskedEpc;
    private ArrayList<HashMap<String, String>> tagList;
    
    public ScanInfo() {
        this.maskedEpc = "";
        this.tagList = new ArrayList<HashMap<String, String>>();
    }
    
    public String getMaskedEpc() {
        return this.maskedEpc;
    }
    
    public ArrayList<HashMap<String, String>> getTagList() {
        return this.tagList;
    }
    
    public void setMaskedEpc(final String maskedEpc) {
        this.maskedEpc = maskedEpc;
    }
    
    public void setTagList(final ArrayList<HashMap<String, String>> tagList) {
        this.tagList = tagList;
    }
}
