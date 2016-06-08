package com.lidroid.xutils.view;

import android.app.*;
import android.view.*;
import android.preference.*;
import android.content.*;

public class ViewFinder
{
    private Activity activity;
    private PreferenceActivity preferenceActivity;
    private PreferenceGroup preferenceGroup;
    private View view;
    
    public ViewFinder(final Activity activity) {
        this.activity = activity;
    }
    
    public ViewFinder(final PreferenceActivity preferenceActivity) {
        this.preferenceActivity = preferenceActivity;
        this.activity = (Activity)preferenceActivity;
    }
    
    public ViewFinder(final PreferenceGroup preferenceGroup) {
        this.preferenceGroup = preferenceGroup;
    }
    
    public ViewFinder(final View view) {
        this.view = view;
    }
    
    public Preference findPreference(final CharSequence charSequence) {
        if (this.preferenceGroup == null) {
            return this.preferenceActivity.findPreference(charSequence);
        }
        return this.preferenceGroup.findPreference(charSequence);
    }
    
    public View findViewById(final int n) {
        if (this.activity == null) {
            return this.view.findViewById(n);
        }
        return this.activity.findViewById(n);
    }
    
    public View findViewById(final int n, final int n2) {
        View viewById = null;
        if (n2 > 0) {
            viewById = this.findViewById(n2);
        }
        if (viewById != null) {
            return viewById.findViewById(n);
        }
        return this.findViewById(n);
    }
    
    public View findViewByInfo(final ViewInjectInfo viewInjectInfo) {
        return this.findViewById((int)viewInjectInfo.value, viewInjectInfo.parentId);
    }
    
    public Context getContext() {
        if (this.view != null) {
            return this.view.getContext();
        }
        if (this.activity != null) {
            return (Context)this.activity;
        }
        if (this.preferenceActivity != null) {
            return (Context)this.preferenceActivity;
        }
        return null;
    }
}
