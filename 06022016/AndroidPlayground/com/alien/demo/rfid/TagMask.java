package com.alien.demo.rfid;

import com.google.gson.Gson;

public class TagMask
{
  private final String FIELD_SEP = ",";
  private int maskedBank = 1;
  private MaskInfo[] masks = { new MaskInfo(), new MaskInfo(), new MaskInfo(), new MaskInfo() };
  
  public static TagMask createFromString(String paramString)
  {
    TagMask localTagMask = new TagMask();
    localTagMask.loadFromString(paramString);
    return localTagMask;
  }
  
  public void clearMask()
  {
    this.maskedBank = 1;
    setMaskInfo(this.maskedBank, 0, 0, "");
  }
  
  public String convertToString()
  {
    return new Gson().toJson(this);
  }
  
  public MaskInfo[] getMaskInfos()
  {
    return this.masks;
  }
  
  public int getMaskedBank()
  {
    return this.maskedBank;
  }
  
  public void loadFromString(String paramString)
  {
    paramString = (TagMask)new Gson().fromJson(paramString, TagMask.class);
    this.maskedBank = paramString.maskedBank;
    this.masks = paramString.masks;
  }
  
  public boolean setMaskInfo(int paramInt1, int paramInt2, int paramInt3, String paramString)
  {
    if (paramInt1 == 0) {
      return false;
    }
    MaskInfo localMaskInfo = this.masks[paramInt1];
    localMaskInfo.ptr = paramInt2;
    localMaskInfo.len = paramInt3;
    localMaskInfo.data = paramString;
    return true;
  }
  
  public void setMaskedBank(int paramInt)
  {
    this.maskedBank = paramInt;
  }
  
  public String toString()
  {
    MaskInfo localMaskInfo = this.masks[this.maskedBank];
    if (localMaskInfo.isNotSet()) {
      return "";
    }
    return com.alien.demo.Constants.Bank.NAMES[this.maskedBank] + ":" + localMaskInfo.toString();
  }
  
  public class MaskInfo
  {
    String data = "";
    int len = 0;
    int ptr = 0;
    
    public MaskInfo() {}
    
    public void clear()
    {
      this.ptr = 0;
      this.len = 0;
      this.data = "";
    }
    
    public boolean isNotSet()
    {
      return this.data.isEmpty();
    }
    
    public String toString()
    {
      return "" + this.ptr + "," + this.len + "\n" + this.data;
    }
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\alien\demo\rfid\TagMask.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */