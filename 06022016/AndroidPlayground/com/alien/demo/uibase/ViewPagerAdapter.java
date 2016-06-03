package com.alien.demo.uibase;

import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentPagerAdapter;
import java.util.ArrayList;
import java.util.List;

public class ViewPagerAdapter
  extends FragmentPagerAdapter
{
  private List<BaseFragment> lstFrg = new ArrayList();
  private List<String> lstTitles = new ArrayList();
  
  public ViewPagerAdapter(FragmentManager paramFragmentManager, List<BaseFragment> paramList, List<String> paramList1)
  {
    super(paramFragmentManager);
    this.lstFrg = paramList;
    this.lstTitles = paramList1;
  }
  
  public int getCount()
  {
    return this.lstFrg.size();
  }
  
  public Fragment getItem(int paramInt)
  {
    if (this.lstFrg.size() > 0) {
      return (Fragment)this.lstFrg.get(paramInt);
    }
    throw new IllegalStateException("No fragment at position " + paramInt);
  }
  
  public CharSequence getPageTitle(int paramInt)
  {
    if (this.lstTitles.size() > 0) {
      return (CharSequence)this.lstTitles.get(paramInt);
    }
    return null;
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\alien\demo\uibase\ViewPagerAdapter.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */