package com.alien.demo.feature.mask;

import com.alien.demo.data.*;
import java.util.*;
import java.io.*;

public class AssetsInfo
{
    private int selectedIndex;
    
    public void add(final Asset asset) {
        Assets.getInstance().add(asset);
    }
    
    public void delete(final int n) {
        Assets.getInstance().getList().remove(n);
    }
    
    public ArrayList<Asset> getAssets() {
        return Assets.getInstance().getList();
    }
    
    public int getSelectedIndex() {
        return this.selectedIndex;
    }
    
    public void save() throws IOException {
        Assets.getInstance().save();
    }
    
    public void setSelectedIndex(final int selectedIndex) {
        this.selectedIndex = selectedIndex;
    }
}
