package com.alien.demo.data;

import android.util.*;
import java.io.*;
import java.util.*;

public class Assets
{
    private static final String RFID_ASSETS_DIR = "/sdcard/Alien/";
    private static final String RFID_ASSETS_FILE = "/sdcard/Alien/assets.txt";
    private static final String TAG = "AlienRFID-Assets";
    private static Assets instance;
    private ArrayList<Asset> assets;
    
    static {
        Assets.instance = null;
    }
    
    private Assets() {
        this.assets = new ArrayList<Asset>();
        try {
            if (!new File("/sdcard/Alien/assets.txt").exists()) {
                return;
            }
            this.load(new FileInputStream("/sdcard/Alien/assets.txt"));
        }
        catch (Exception ex) {
            Log.e("AlienRFID-Assets", "Error init assets: " + ex);
            ex.printStackTrace();
        }
    }
    
    public static Assets getInstance() {
        init();
        return Assets.instance;
    }
    
    public static void init() {
        if (Assets.instance == null) {
            Assets.instance = new Assets();
        }
    }
    
    public void add(final Asset asset) {
        for (int i = 0; i < this.assets.size(); ++i) {
            if (this.assets.get(i).getEpc().equals(asset.getEpc())) {
                this.assets.set(i, asset);
                return;
            }
        }
        this.assets.add(asset);
    }
    
    public Asset getAt(final int n) {
        return this.assets.get(n);
    }
    
    public ArrayList<Asset> getList() {
        return this.assets;
    }
    
    public void load(final InputStream inputStream) throws IOException {
        this.assets.clear();
        final BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStream));
        while (true) {
            final String line = bufferedReader.readLine();
            if (line == null) {
                break;
            }
            this.assets.add(Asset.loadFromString(line));
        }
        bufferedReader.close();
    }
    
    public void save() throws IOException {
        new File("/sdcard/Alien/").mkdirs();
        this.save(new FileOutputStream("/sdcard/Alien/assets.txt"));
    }
    
    public void save(final OutputStream outputStream) throws IOException {
        final BufferedWriter bufferedWriter = new BufferedWriter(new OutputStreamWriter(outputStream));
        final Iterator<Asset> iterator = this.assets.iterator();
        while (iterator.hasNext()) {
            bufferedWriter.write(iterator.next().toString() + "\n");
        }
        bufferedWriter.close();
    }
    
    public int size() {
        return this.assets.size();
    }
}
