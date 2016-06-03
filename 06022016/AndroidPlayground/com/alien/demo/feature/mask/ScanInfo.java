package com.alien.demo.feature.mask;

import java.util.ArrayList;
import java.util.HashMap;

public class ScanInfo
{
  private String maskedEpc = "";
  private ArrayList<HashMap<String, String>> tagList = new ArrayList();
  
  public String getMaskedEpc()
  {
    return this.maskedEpc;
  }
  
  public ArrayList<HashMap<String, String>> getTagList()
  {
    return this.tagList;
  }
  
  public void setMaskedEpc(String paramString)
  {
    this.maskedEpc = paramString;
  }
  
  public void setTagList(ArrayList<HashMap<String, String>> paramArrayList)
  {
    this.tagList = paramArrayList;
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\alien\demo\feature\mask\ScanInfo.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */