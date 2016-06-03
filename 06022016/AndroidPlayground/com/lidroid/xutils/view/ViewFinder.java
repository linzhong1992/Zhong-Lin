package com.lidroid.xutils.view;

import android.app.Activity;
import android.content.Context;
import android.preference.Preference;
import android.preference.PreferenceActivity;
import android.preference.PreferenceGroup;
import android.view.View;

public class ViewFinder
{
  private Activity activity;
  private PreferenceActivity preferenceActivity;
  private PreferenceGroup preferenceGroup;
  private View view;
  
  public ViewFinder(Activity paramActivity)
  {
    this.activity = paramActivity;
  }
  
  public ViewFinder(PreferenceActivity paramPreferenceActivity)
  {
    this.preferenceActivity = paramPreferenceActivity;
    this.activity = paramPreferenceActivity;
  }
  
  public ViewFinder(PreferenceGroup paramPreferenceGroup)
  {
    this.preferenceGroup = paramPreferenceGroup;
  }
  
  public ViewFinder(View paramView)
  {
    this.view = paramView;
  }
  
  public Preference findPreference(CharSequence paramCharSequence)
  {
    if (this.preferenceGroup == null) {
      return this.preferenceActivity.findPreference(paramCharSequence);
    }
    return this.preferenceGroup.findPreference(paramCharSequence);
  }
  
  public View findViewById(int paramInt)
  {
    if (this.activity == null) {
      return this.view.findViewById(paramInt);
    }
    return this.activity.findViewById(paramInt);
  }
  
  public View findViewById(int paramInt1, int paramInt2)
  {
    View localView = null;
    if (paramInt2 > 0) {
      localView = findViewById(paramInt2);
    }
    if (localView != null) {
      return localView.findViewById(paramInt1);
    }
    return findViewById(paramInt1);
  }
  
  public View findViewByInfo(ViewInjectInfo paramViewInjectInfo)
  {
    return findViewById(((Integer)paramViewInjectInfo.value).intValue(), paramViewInjectInfo.parentId);
  }
  
  public Context getContext()
  {
    if (this.view != null) {
      return this.view.getContext();
    }
    if (this.activity != null) {
      return this.activity;
    }
    if (this.preferenceActivity != null) {
      return this.preferenceActivity;
    }
    return null;
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\lidroid\xutils\view\ViewFinder.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */