package com.alien.demo.feature.tagaccess;

import com.alien.demo.uibase.*;
import com.alien.demo.rfid.*;
import android.os.*;
import com.alien.rfid.*;
import android.view.*;

public class TagAccessActivity extends BaseTabFragmentActivity
{
    private static TagScanner scanner;
    
    @Override
    protected void initViewPageData() {
        this.lstFrg.add(BasicAccessFragment.newInstance(TagAccessActivity.scanner));
        this.lstFrg.add(AdvancedAccessFragment.newInstance(TagAccessActivity.scanner));
        this.lstTitles.add(this.getString(2131034222));
        this.lstTitles.add(this.getString(2131034221));
    }
    
    @Override
    protected void onCreate(final Bundle bundle) {
        super.onCreate(bundle);
        this.getActionBar().setDisplayHomeAsUpEnabled(true);
        this.setContentView(2130903072);
        this.getWindow().addFlags(128);
        this.getWindow().setSoftInputMode(3);
        if (TagAccessActivity.scanner == null) {
            TagAccessActivity.scanner = new TagScanner(null);
        }
        this.initViewPageData();
        this.initViewPager();
        this.initTabs();
    }
    
    public boolean onCreateOptionsMenu(final Menu menu) {
        this.getMenuInflater().inflate(2131558407, menu);
        return true;
    }
    
    public boolean onOptionsItemSelected(final MenuItem menuItem) {
        switch (menuItem.getItemId()) {
            default: {
                return super.onOptionsItemSelected(menuItem);
            }
            case 16908332: {
                this.onBackPressed();
                return true;
            }
        }
    }
    
    @Override
    protected void onPause() {
        super.onPause();
    }
    
    @Override
    protected void onTabChanged(final int n) {
        super.onTabChanged(n);
    }
}
