package com.alien.demo.feature.tagaccess;

import android.app.ActionBar;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.Window;
import com.alien.demo.rfid.TagScanner;
import com.alien.demo.uibase.BaseTabFragmentActivity;
import java.util.List;

public class TagAccessActivity
  extends BaseTabFragmentActivity
{
  private static TagScanner scanner;
  
  protected void initViewPageData()
  {
    this.lstFrg.add(BasicAccessFragment.newInstance(scanner));
    this.lstFrg.add(AdvancedAccessFragment.newInstance(scanner));
    this.lstTitles.add(getString(2131034222));
    this.lstTitles.add(getString(2131034221));
  }
  
  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    getActionBar().setDisplayHomeAsUpEnabled(true);
    setContentView(2130903072);
    getWindow().addFlags(128);
    getWindow().setSoftInputMode(3);
    if (scanner == null) {
      scanner = new TagScanner(null);
    }
    initViewPageData();
    initViewPager();
    initTabs();
  }
  
  public boolean onCreateOptionsMenu(Menu paramMenu)
  {
    getMenuInflater().inflate(2131558407, paramMenu);
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
  }
  
  protected void onTabChanged(int paramInt)
  {
    super.onTabChanged(paramInt);
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\alien\demo\feature\tagaccess\TagAccessActivity.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */