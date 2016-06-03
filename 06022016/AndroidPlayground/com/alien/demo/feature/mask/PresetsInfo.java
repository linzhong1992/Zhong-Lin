package com.alien.demo.feature.mask;

import java.util.ArrayList;

public class PresetsInfo
{
  private ArrayList<PresetItem> items = new ArrayList();
  private int selectedItem = 0;
  
  public ArrayList<PresetItem> getItems()
  {
    return this.items;
  }
  
  public int getSelectedItem()
  {
    return this.selectedItem;
  }
  
  public void setItems(ArrayList<PresetItem> paramArrayList)
  {
    this.items = paramArrayList;
  }
  
  public void setSelectedItem(int paramInt)
  {
    this.selectedItem = paramInt;
  }
  
  public static class PresetItem
  {
    private int bank;
    private String data;
    private int len;
    private String name;
    private int ptr;
    
    private PresetItem()
    {
      this.name = "";
      this.bank = 1;
      this.ptr = 0;
      this.len = 0;
      this.data = "";
    }
    
    public PresetItem(String paramString1, int paramInt1, int paramInt2, int paramInt3, String paramString2)
    {
      this.name = paramString1;
      this.bank = paramInt1;
      this.ptr = paramInt2;
      this.len = paramInt3;
      this.data = paramString2;
    }
    
    public static PresetItem fromString(String paramString)
    {
      PresetItem localPresetItem = new PresetItem();
      paramString = paramString.split(",");
      int i = 0;
      if (i < paramString.length)
      {
        paramString[i] = paramString[i].trim();
        switch (i)
        {
        }
        for (;;)
        {
          i += 1;
          break;
          if (!paramString[i].isEmpty())
          {
            localPresetItem.setBank(Integer.parseInt(paramString[i]));
            continue;
            if (!paramString[i].isEmpty())
            {
              localPresetItem.setPtr(Integer.parseInt(paramString[i]));
              continue;
              if (!paramString[i].isEmpty())
              {
                localPresetItem.setLen(Integer.parseInt(paramString[i]));
                continue;
                paramString[i] = paramString[i].replace(" ", "");
                localPresetItem.setData(paramString[i]);
                continue;
                localPresetItem.setName(paramString[i]);
              }
            }
          }
        }
      }
      return localPresetItem;
    }
    
    public int getBank()
    {
      return this.bank;
    }
    
    public String getData()
    {
      return this.data;
    }
    
    public int getLen()
    {
      return this.len;
    }
    
    public String getName()
    {
      if ((this.name == null) || (this.name.isEmpty()))
      {
        if ((this.data == null) || (this.data.isEmpty())) {
          return "Preset";
        }
        return this.data;
      }
      return this.name;
    }
    
    public int getPtr()
    {
      return this.ptr;
    }
    
    public void setBank(int paramInt)
    {
      this.bank = paramInt;
    }
    
    public void setData(String paramString)
    {
      this.data = paramString;
    }
    
    public void setLen(int paramInt)
    {
      this.len = paramInt;
    }
    
    public void setName(String paramString)
    {
      this.name = paramString;
    }
    
    public void setPtr(int paramInt)
    {
      this.ptr = paramInt;
    }
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\alien\demo\feature\mask\PresetsInfo.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */