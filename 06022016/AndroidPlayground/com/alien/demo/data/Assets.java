package com.alien.demo.data;

import android.util.Log;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.util.ArrayList;
import java.util.Iterator;

public class Assets
{
  private static final String RFID_ASSETS_DIR = "/sdcard/Alien/";
  private static final String RFID_ASSETS_FILE = "/sdcard/Alien/assets.txt";
  private static final String TAG = "AlienRFID-Assets";
  private static Assets instance = null;
  private ArrayList<Asset> assets = new ArrayList();
  
  private Assets()
  {
    try
    {
      if (!new File("/sdcard/Alien/assets.txt").exists()) {
        return;
      }
      load(new FileInputStream("/sdcard/Alien/assets.txt"));
      return;
    }
    catch (Exception localException)
    {
      Log.e("AlienRFID-Assets", "Error init assets: " + localException);
      localException.printStackTrace();
    }
  }
  
  public static Assets getInstance()
  {
    init();
    return instance;
  }
  
  public static void init()
  {
    if (instance == null) {
      instance = new Assets();
    }
  }
  
  public void add(Asset paramAsset)
  {
    int i = 0;
    while (i < this.assets.size())
    {
      if (((Asset)this.assets.get(i)).getEpc().equals(paramAsset.getEpc()))
      {
        this.assets.set(i, paramAsset);
        return;
      }
      i += 1;
    }
    this.assets.add(paramAsset);
  }
  
  public Asset getAt(int paramInt)
  {
    return (Asset)this.assets.get(paramInt);
  }
  
  public ArrayList<Asset> getList()
  {
    return this.assets;
  }
  
  public void load(InputStream paramInputStream)
    throws IOException
  {
    this.assets.clear();
    paramInputStream = new BufferedReader(new InputStreamReader(paramInputStream));
    for (;;)
    {
      Object localObject = paramInputStream.readLine();
      if (localObject == null) {
        break;
      }
      localObject = Asset.loadFromString((String)localObject);
      this.assets.add(localObject);
    }
    paramInputStream.close();
  }
  
  public void save()
    throws IOException
  {
    new File("/sdcard/Alien/").mkdirs();
    save(new FileOutputStream("/sdcard/Alien/assets.txt"));
  }
  
  public void save(OutputStream paramOutputStream)
    throws IOException
  {
    paramOutputStream = new BufferedWriter(new OutputStreamWriter(paramOutputStream));
    Iterator localIterator = this.assets.iterator();
    while (localIterator.hasNext())
    {
      Asset localAsset = (Asset)localIterator.next();
      paramOutputStream.write(localAsset.toString() + "\n");
    }
    paramOutputStream.close();
  }
  
  public int size()
  {
    return this.assets.size();
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\alien\demo\data\Assets.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */