package com.alien.demo.uibase;

import android.support.v4.app.*;
import java.util.*;
import android.app.*;
import android.support.v4.view.*;
import android.os.*;
import android.view.*;

public class BaseTabFragmentActivity extends FragmentActivity
{
    private boolean initFirstTab;
    protected List<BaseFragment> lstFrg;
    protected List<String> lstTitles;
    protected ActionBar mActionBar;
    protected ActionBar$TabListener mTabListener;
    protected NoScrollViewPager mViewPager;
    protected ViewPagerAdapter mViewPagerAdapter;
    
    public BaseTabFragmentActivity() {
        this.initFirstTab = false;
        this.lstFrg = new ArrayList<BaseFragment>();
        this.lstTitles = new ArrayList<String>();
        this.mTabListener = (ActionBar$TabListener)new ActionBar$TabListener() {
            public void onTabReselected(final ActionBar$Tab actionBar$Tab, final FragmentTransaction fragmentTransaction) {
            }
            
            public void onTabSelected(final ActionBar$Tab actionBar$Tab, final FragmentTransaction fragmentTransaction) {
                BaseTabFragmentActivity.this.mViewPager.setCurrentItem(actionBar$Tab.getPosition());
                if (BaseTabFragmentActivity.this.initFirstTab) {
                    BaseTabFragmentActivity.this.onTabChanged(actionBar$Tab.getPosition());
                    return;
                }
                BaseTabFragmentActivity.this.initFirstTab = true;
            }
            
            public void onTabUnselected(final ActionBar$Tab actionBar$Tab, final FragmentTransaction fragmentTransaction) {
            }
        };
    }
    
    private int getCurrentFragment(final int n) {
        return this.mActionBar.getSelectedTab().getPosition();
    }
    
    protected void initTabs() {
        for (int i = 0; i < this.mViewPagerAdapter.getCount(); ++i) {
            this.mActionBar.addTab(this.mActionBar.newTab().setText(this.mViewPagerAdapter.getPageTitle(i)).setTabListener(this.mTabListener));
        }
    }
    
    protected void initViewPageData() {
    }
    
    protected void initViewPager() {
        this.mViewPagerAdapter = new ViewPagerAdapter(this.getSupportFragmentManager(), this.lstFrg, this.lstTitles);
        (this.mViewPager = (NoScrollViewPager)this.findViewById(2131492993)).setOffscreenPageLimit(0);
        this.mViewPager.setAdapter(this.mViewPagerAdapter);
    }
    
    @Override
    protected void onCreate(final Bundle bundle) {
        super.onCreate(bundle);
        (this.mActionBar = this.getActionBar()).setDisplayHomeAsUpEnabled(true);
        this.mActionBar.setNavigationMode(2);
    }
    
    @Override
    public boolean onKeyDown(final int n, final KeyEvent keyEvent) {
        if (this.mViewPager != null) {
            ((BaseFragment)this.mViewPagerAdapter.getItem(this.mViewPager.getCurrentItem())).onKeyDown(n, keyEvent);
        }
        return super.onKeyDown(n, keyEvent);
    }
    
    public boolean onKeyUp(final int n, final KeyEvent keyEvent) {
        if (this.mViewPager != null) {
            ((BaseFragment)this.mViewPagerAdapter.getItem(this.mViewPager.getCurrentItem())).onKeyUp(n, keyEvent);
        }
        return super.onKeyUp(n, keyEvent);
    }
    
    protected void onTabChanged(final int n) {
    }
    
    public void selectFragment(final int n) {
        this.mActionBar.selectTab(this.mActionBar.getTabAt(n));
    }
}
