package com.alien.demo.uibase;

import android.app.ActionBar;
import android.app.ActionBar.Tab;
import android.app.ActionBar.TabListener;
import android.app.FragmentTransaction;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.view.KeyEvent;
import java.util.ArrayList;
import java.util.List;

public class BaseTabFragmentActivity
  extends FragmentActivity
{
  private boolean initFirstTab = false;
  protected List<BaseFragment> lstFrg = new ArrayList();
  protected List<String> lstTitles = new ArrayList();
  protected ActionBar mActionBar;
  protected ActionBar.TabListener mTabListener = new ActionBar.TabListener()
  {
    public void onTabReselected(ActionBar.Tab paramAnonymousTab, FragmentTransaction paramAnonymousFragmentTransaction) {}
    
    public void onTabSelected(ActionBar.Tab paramAnonymousTab, FragmentTransaction paramAnonymousFragmentTransaction)
    {
      BaseTabFragmentActivity.this.mViewPager.setCurrentItem(paramAnonymousTab.getPosition());
      if (BaseTabFragmentActivity.this.initFirstTab)
      {
        BaseTabFragmentActivity.this.onTabChanged(paramAnonymousTab.getPosition());
        return;
      }
      BaseTabFragmentActivity.access$002(BaseTabFragmentActivity.this, true);
    }
    
    public void onTabUnselected(ActionBar.Tab paramAnonymousTab, FragmentTransaction paramAnonymousFragmentTransaction) {}
  };
  protected NoScrollViewPager mViewPager;
  protected ViewPagerAdapter mViewPagerAdapter;
  
  private int getCurrentFragment(int paramInt)
  {
    return this.mActionBar.getSelectedTab().getPosition();
  }
  
  protected void initTabs()
  {
    int i = 0;
    while (i < this.mViewPagerAdapter.getCount())
    {
      this.mActionBar.addTab(this.mActionBar.newTab().setText(this.mViewPagerAdapter.getPageTitle(i)).setTabListener(this.mTabListener));
      i += 1;
    }
  }
  
  protected void initViewPageData() {}
  
  protected void initViewPager()
  {
    this.mViewPagerAdapter = new ViewPagerAdapter(getSupportFragmentManager(), this.lstFrg, this.lstTitles);
    this.mViewPager = ((NoScrollViewPager)findViewById(2131492993));
    this.mViewPager.setOffscreenPageLimit(0);
    this.mViewPager.setAdapter(this.mViewPagerAdapter);
  }
  
  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    this.mActionBar = getActionBar();
    this.mActionBar.setDisplayHomeAsUpEnabled(true);
    this.mActionBar.setNavigationMode(2);
  }
  
  public boolean onKeyDown(int paramInt, KeyEvent paramKeyEvent)
  {
    if (this.mViewPager != null) {
      ((BaseFragment)this.mViewPagerAdapter.getItem(this.mViewPager.getCurrentItem())).onKeyDown(paramInt, paramKeyEvent);
    }
    return super.onKeyDown(paramInt, paramKeyEvent);
  }
  
  public boolean onKeyUp(int paramInt, KeyEvent paramKeyEvent)
  {
    if (this.mViewPager != null) {
      ((BaseFragment)this.mViewPagerAdapter.getItem(this.mViewPager.getCurrentItem())).onKeyUp(paramInt, paramKeyEvent);
    }
    return super.onKeyUp(paramInt, paramKeyEvent);
  }
  
  protected void onTabChanged(int paramInt) {}
  
  public void selectFragment(int paramInt)
  {
    this.mActionBar.selectTab(this.mActionBar.getTabAt(paramInt));
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\alien\demo\uibase\BaseTabFragmentActivity.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */