package com.alien.demo.feature.mask;

import android.os.Bundle;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.Window;
import com.alien.demo.data.ComplexPreferences;
import com.alien.demo.uibase.BaseTabFragmentActivity;
import java.util.List;

public class MaskActivity
  extends BaseTabFragmentActivity
  implements MaskInterface
{
  private MaskInfo maskInfo;
  private ComplexPreferences ref;
  
  public MaskInfo getMaskInfo()
  {
    return this.maskInfo;
  }
  
  protected void initViewPageData()
  {
    this.lstFrg.add(new ScanFragment());
    this.lstFrg.add(new CustomFragment());
    this.lstFrg.add(new PresetsFragment());
    this.lstFrg.add(new AssetsFragment());
    this.lstTitles.add(getString(2131034183));
    this.lstTitles.add(getString(2131034184));
    this.lstTitles.add(getString(2131034182));
    this.lstTitles.add(getString(2131034181));
  }
  
  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    this.ref = ComplexPreferences.getComplexPreferences(this, "mask_info", 0);
    paramBundle = this.ref.getObject("mask_info", MaskInfo.class);
    if (paramBundle != null) {}
    for (this.maskInfo = ((MaskInfo)paramBundle);; this.maskInfo = new MaskInfo())
    {
      setContentView(2130903070);
      getWindow().addFlags(128);
      initViewPageData();
      initViewPager();
      initTabs();
      return;
    }
  }
  
  public boolean onCreateOptionsMenu(Menu paramMenu)
  {
    getMenuInflater().inflate(2131558405, paramMenu);
    return true;
  }
  
  public boolean onOptionsItemSelected(MenuItem paramMenuItem)
  {
    switch (paramMenuItem.getItemId())
    {
    default: 
      return super.onOptionsItemSelected(paramMenuItem);
    }
    onBackPressed();
    return true;
  }
  
  protected void onPause()
  {
    super.onPause();
    this.ref.putObject("mask_info", this.maskInfo);
    this.ref.commit();
  }
  
  protected void onResume()
  {
    super.onResume();
    selectFragment(this.maskInfo.getMaskMode().getValue());
  }
  
  protected void onTabChanged(int paramInt)
  {
    super.onTabChanged(paramInt);
    this.maskInfo.setMaskMode(MaskInfo.MaskModeEnum.fromInt(paramInt));
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\alien\demo\feature\mask\MaskActivity.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */