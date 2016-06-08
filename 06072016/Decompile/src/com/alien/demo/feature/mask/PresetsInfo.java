package com.alien.demo.feature.mask;

import java.util.*;

public class PresetsInfo
{
    private ArrayList<PresetItem> items;
    private int selectedItem;
    
    public PresetsInfo() {
        this.selectedItem = 0;
        this.items = new ArrayList<PresetItem>();
    }
    
    public ArrayList<PresetItem> getItems() {
        return this.items;
    }
    
    public int getSelectedItem() {
        return this.selectedItem;
    }
    
    public void setItems(final ArrayList<PresetItem> items) {
        this.items = items;
    }
    
    public void setSelectedItem(final int selectedItem) {
        this.selectedItem = selectedItem;
    }
    
    public static class PresetItem
    {
        private int bank;
        private String data;
        private int len;
        private String name;
        private int ptr;
        
        private PresetItem() {
            this.name = "";
            this.bank = 1;
            this.ptr = 0;
            this.len = 0;
            this.data = "";
        }
        
        public PresetItem(final String name, final int bank, final int ptr, final int len, final String data) {
            this.name = name;
            this.bank = bank;
            this.ptr = ptr;
            this.len = len;
            this.data = data;
        }
        
        public static PresetItem fromString(final String s) {
            final PresetItem presetItem = new PresetItem();
            final String[] split = s.split(",");
            for (int i = 0; i < split.length; ++i) {
                split[i] = split[i].trim();
                switch (i) {
                    case 0: {
                        if (!split[i].isEmpty()) {
                            presetItem.setBank(Integer.parseInt(split[i]));
                            break;
                        }
                        break;
                    }
                    case 1: {
                        if (!split[i].isEmpty()) {
                            presetItem.setPtr(Integer.parseInt(split[i]));
                            break;
                        }
                        break;
                    }
                    case 2: {
                        if (!split[i].isEmpty()) {
                            presetItem.setLen(Integer.parseInt(split[i]));
                            break;
                        }
                        break;
                    }
                    case 3: {
                        presetItem.setData(split[i] = split[i].replace(" ", ""));
                        break;
                    }
                    case 4: {
                        presetItem.setName(split[i]);
                        break;
                    }
                }
            }
            return presetItem;
        }
        
        public int getBank() {
            return this.bank;
        }
        
        public String getData() {
            return this.data;
        }
        
        public int getLen() {
            return this.len;
        }
        
        public String getName() {
            if (this.name != null && !this.name.isEmpty()) {
                return this.name;
            }
            if (this.data == null || this.data.isEmpty()) {
                return "Preset";
            }
            return this.data;
        }
        
        public int getPtr() {
            return this.ptr;
        }
        
        public void setBank(final int bank) {
            this.bank = bank;
        }
        
        public void setData(final String data) {
            this.data = data;
        }
        
        public void setLen(final int len) {
            this.len = len;
        }
        
        public void setName(final String name) {
            this.name = name;
        }
        
        public void setPtr(final int ptr) {
            this.ptr = ptr;
        }
    }
}
