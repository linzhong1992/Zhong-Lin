package com.alien.demo.feature.mask;

import com.alien.demo.uibase.*;
import com.alien.demo.data.*;
import android.os.*;
import android.content.*;
import android.view.*;

public class MaskActivity extends BaseTabFragmentActivity implements MaskInterface
{
    private MaskInfo maskInfo;
    private ComplexPreferences ref;
    
    @Override
    public MaskInfo getMaskInfo() {
        return this.maskInfo;
    }
    
    @Override
    protected void initViewPageData() {
        this.lstFrg.add(new ScanFragment());
        this.lstFrg.add(new CustomFragment());
        this.lstFrg.add(new PresetsFragment());
        this.lstFrg.add(new AssetsFragment());
        this.lstTitles.add(this.getString(2131034183));
        this.lstTitles.add(this.getString(2131034184));
        this.lstTitles.add(this.getString(2131034182));
        this.lstTitles.add(this.getString(2131034181));
    }
    
    @Override
    protected void onCreate(final Bundle bundle) {
        super.onCreate(bundle);
        this.ref = ComplexPreferences.getComplexPreferences((Context)this, "mask_info", 0);
        final MaskInfo object = this.ref.getObject("mask_info", MaskInfo.class);
        if (object != null) {
            this.maskInfo = object;
        }
        else {
            this.maskInfo = new MaskInfo();
        }
        this.setContentView(2130903070);
        this.getWindow().addFlags(128);
        this.initViewPageData();
        this.initViewPager();
        this.initTabs();
    }
    
    public boolean onCreateOptionsMenu(final Menu menu) {
        this.getMenuInflater().inflate(2131558405, menu);
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
        this.ref.putObject("mask_info", this.maskInfo);
        this.ref.commit();
    }
    
    @Override
    protected void onResume() {
        super.onResume();
        this.selectFragment(this.maskInfo.getMaskMode().getValue());
    }
    
    @Override
    protected void onTabChanged(final int n) {
        super.onTabChanged(n);
        this.maskInfo.setMaskMode(MaskInfo.MaskModeEnum.fromInt(n));
    }
}
