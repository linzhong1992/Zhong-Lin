package com.alien.demo.feature.mask;

import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.ContentResolver;
import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.net.Uri;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ListView;
import android.widget.TextView;
import com.alien.demo.rfid.TagMask;
import com.alien.demo.uibase.BaseFragment;
import com.alien.demo.uibase.UIHelper;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

public class PresetsFragment
  extends BaseFragment
{
  private static final int REQUEST_SELECT_FILE = 1;
  private static final String TAG = "AlienRFID-Mask Presets";
  private PresetsAdapter adapPresets;
  private Button btnClear;
  private Button btnLoad;
  private Button btnOk;
  private Activity context;
  private ListView lvPresets;
  private TagMask outputFilter;
  private PresetsInfo presetsInfo;
  
  private void loadPreset(Uri paramUri)
  {
    this.presetsInfo.getItems().clear();
    try
    {
      paramUri = new BufferedReader(new InputStreamReader(this.context.getContentResolver().openInputStream(paramUri)));
      for (;;)
      {
        Object localObject = paramUri.readLine();
        if (localObject == null) {
          break;
        }
        if (!((String)localObject).startsWith("#"))
        {
          localObject = PresetsInfo.PresetItem.fromString((String)localObject);
          this.presetsInfo.getItems().add(localObject);
        }
      }
      return;
    }
    catch (Exception paramUri)
    {
      Log.e("AlienRFID-Mask Presets", "Error load preset files: " + paramUri);
      paramUri.printStackTrace();
      UIHelper.ToastMessage(this.context, 2131034188);
      this.adapPresets.notifyDataSetChanged();
    }
  }
  
  private void onClickClear(View paramView)
  {
    this.lvPresets.setItemChecked(this.presetsInfo.getSelectedItem(), false);
    this.presetsInfo.setSelectedItem(-1);
  }
  
  private void onClickLoad(View paramView)
  {
    paramView = new Intent("android.intent.action.GET_CONTENT");
    paramView.setType("*/*");
    paramView.addCategory("android.intent.category.OPENABLE");
    try
    {
      startActivityForResult(Intent.createChooser(paramView, getResources().getString(2131034186)), 1);
      return;
    }
    catch (ActivityNotFoundException paramView)
    {
      UIHelper.ToastMessage(this.context, 2131034185);
    }
  }
  
  private void onClickOk(View paramView)
  {
    Activity localActivity1;
    Activity localActivity2;
    if ((this.presetsInfo.getItems().size() > 0) && (this.presetsInfo.getSelectedItem() >= 0))
    {
      paramView = (PresetsInfo.PresetItem)this.presetsInfo.getItems().get(this.presetsInfo.getSelectedItem());
      this.outputFilter.setMaskedBank(paramView.getBank());
      this.outputFilter.setMaskInfo(paramView.getBank(), paramView.getPtr(), paramView.getLen(), paramView.getData());
      paramView = new Intent();
      paramView.putExtra("filter_data", this.outputFilter.convertToString());
      localActivity1 = this.context;
      localActivity2 = this.context;
      localActivity1.setResult(-1, paramView);
    }
    for (;;)
    {
      this.context.finish();
      return;
      this.outputFilter.clearMask();
      paramView = new Intent();
      paramView.putExtra("filter_data", this.outputFilter.convertToString());
      localActivity1 = this.context;
      localActivity2 = this.context;
      localActivity1.setResult(-1, paramView);
    }
  }
  
  public void onActivityCreated(Bundle paramBundle)
  {
    super.onActivityCreated(paramBundle);
    this.context = getActivity();
    this.presetsInfo = ((MaskInterface)this.context).getMaskInfo().getPresetsInfo();
    this.outputFilter = TagMask.createFromString(this.context.getIntent().getStringExtra("filter_data"));
    this.lvPresets = ((ListView)this.context.findViewById(2131493080));
    this.adapPresets = new PresetsAdapter(this.context, 2130903104, this.presetsInfo.getItems());
    this.lvPresets.setAdapter(this.adapPresets);
    this.lvPresets.setOnItemClickListener(new AdapterView.OnItemClickListener()
    {
      public void onItemClick(AdapterView<?> paramAnonymousAdapterView, View paramAnonymousView, int paramAnonymousInt, long paramAnonymousLong)
      {
        PresetsFragment.this.onPresetItemClick(paramAnonymousAdapterView, paramAnonymousView, paramAnonymousInt, paramAnonymousLong);
      }
    });
    this.lvPresets.setItemChecked(this.presetsInfo.getSelectedItem(), true);
    this.lvPresets.smoothScrollToPosition(this.presetsInfo.getSelectedItem());
    this.btnLoad = ((Button)this.context.findViewById(2131493077));
    this.btnLoad.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        PresetsFragment.this.onClickLoad(paramAnonymousView);
      }
    });
    this.btnOk = ((Button)this.context.findViewById(2131493078));
    this.btnOk.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        PresetsFragment.this.onClickOk(paramAnonymousView);
      }
    });
    this.btnClear = ((Button)this.context.findViewById(2131493079));
    this.btnClear.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        PresetsFragment.this.onClickClear(paramAnonymousView);
      }
    });
  }
  
  public void onActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    if ((paramInt1 == 1) && (paramInt2 == -1)) {
      loadPreset(paramIntent.getData());
    }
  }
  
  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    return paramLayoutInflater.inflate(2130903092, paramViewGroup, false);
  }
  
  public void onPresetItemClick(AdapterView<?> paramAdapterView, View paramView, int paramInt, long paramLong)
  {
    this.presetsInfo.setSelectedItem(paramInt);
  }
  
  class PresetsAdapter
    extends ArrayAdapter<PresetsInfo.PresetItem>
  {
    public PresetsAdapter(int paramInt, List<PresetsInfo.PresetItem> paramList)
    {
      super(paramList, localList);
    }
    
    public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
    {
      paramView = PresetsFragment.this.context.getLayoutInflater().inflate(2130903104, null);
      paramViewGroup = (TextView)paramView.findViewById(2131493107);
      TextView localTextView = (TextView)paramView.findViewById(2131493108);
      PresetsInfo.PresetItem localPresetItem = (PresetsInfo.PresetItem)PresetsFragment.this.presetsInfo.getItems().get(paramInt);
      paramViewGroup.setText(localPresetItem.getName());
      localTextView.setText(com.alien.demo.Constants.Bank.NAMES[localPresetItem.getBank()] + "," + localPresetItem.getPtr() + "," + localPresetItem.getLen() + "," + localPresetItem.getData());
      return paramView;
    }
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\alien\demo\feature\mask\PresetsFragment.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */