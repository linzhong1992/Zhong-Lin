package com.alien.demo.feature.mask;

import com.alien.demo.data.Asset;
import com.alien.demo.data.Assets;
import java.io.IOException;
import java.util.ArrayList;

public class AssetsInfo
{
  private int selectedIndex;
  
  public void add(Asset paramAsset)
  {
    Assets.getInstance().add(paramAsset);
  }
  
  public void delete(int paramInt)
  {
    Assets.getInstance().getList().remove(paramInt);
  }
  
  public ArrayList<Asset> getAssets()
  {
    return Assets.getInstance().getList();
  }
  
  public int getSelectedIndex()
  {
    return this.selectedIndex;
  }
  
  public void save()
    throws IOException
  {
    Assets.getInstance().save();
  }
  
  public void setSelectedIndex(int paramInt)
  {
    this.selectedIndex = paramInt;
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\alien\demo\feature\mask\AssetsInfo.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */