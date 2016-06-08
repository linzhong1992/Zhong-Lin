package com.alien.demo.uibase;

import java.util.*;
import android.support.v4.app.*;

public class ViewPagerAdapter extends FragmentPagerAdapter
{
    private List<BaseFragment> lstFrg;
    private List<String> lstTitles;
    
    public ViewPagerAdapter(final FragmentManager fragmentManager, final List<BaseFragment> lstFrg, final List<String> lstTitles) {
        super(fragmentManager);
        this.lstFrg = new ArrayList<BaseFragment>();
        this.lstTitles = new ArrayList<String>();
        this.lstFrg = lstFrg;
        this.lstTitles = lstTitles;
    }
    
    @Override
    public int getCount() {
        return this.lstFrg.size();
    }
    
    @Override
    public Fragment getItem(final int n) {
        if (this.lstFrg.size() > 0) {
            return this.lstFrg.get(n);
        }
        throw new IllegalStateException("No fragment at position " + n);
    }
    
    @Override
    public CharSequence getPageTitle(final int n) {
        if (this.lstTitles.size() > 0) {
            return this.lstTitles.get(n);
        }
        return null;
    }
}
