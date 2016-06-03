package com.alien.demo.feature.mask;

import android.app.Activity;
import android.app.AlertDialog.Builder;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.Intent;
import android.content.res.Resources;
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
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.TextView;
import com.alien.demo.data.Asset;
import com.alien.demo.rfid.TagMask;
import com.alien.demo.uibase.BaseFragment;
import com.alien.rfid.Bank;
import java.util.ArrayList;
import java.util.List;

public class AssetsFragment
  extends BaseFragment
{
  private static final String TAG = "AlienRFID-Assets Tab";
  private AssetsAdapter adapAssets;
  private AssetsInfo assetsInfo;
  private ImageButton btnAdd;
  private Button btnClear;
  private ImageButton btnDelete;
  private ImageButton btnEdit;
  private Button btnOk;
  private Activity context;
  private ListView lvAssets;
  private TagMask outputFilter;
  
  private void onClickClear(View paramView)
  {
    this.lvAssets.setItemChecked(this.assetsInfo.getSelectedIndex(), false);
    this.assetsInfo.setSelectedIndex(-1);
  }
  
  private void onClickOk(View paramView)
  {
    Activity localActivity1;
    Activity localActivity2;
    if ((this.assetsInfo.getAssets().size() > 0) && (this.assetsInfo.getSelectedIndex() >= 0))
    {
      paramView = (Asset)this.assetsInfo.getAssets().get(this.assetsInfo.getSelectedIndex());
      this.outputFilter.setMaskedBank(Bank.EPC.getValue());
      this.outputFilter.setMaskInfo(Bank.EPC.getValue(), 32, paramView.getEpc().length() * 4, paramView.getEpc());
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
    this.assetsInfo = ((MaskInterface)this.context).getMaskInfo().getAssetsInfo();
    this.outputFilter = TagMask.createFromString(this.context.getIntent().getStringExtra("filter_data"));
    this.lvAssets = ((ListView)this.context.findViewById(2131493044));
    this.adapAssets = new AssetsAdapter(this.context, 2130903073, this.assetsInfo.getAssets());
    this.lvAssets.setAdapter(this.adapAssets);
    this.lvAssets.setOnItemClickListener(new AdapterView.OnItemClickListener()
    {
      public void onItemClick(AdapterView<?> paramAnonymousAdapterView, View paramAnonymousView, int paramAnonymousInt, long paramAnonymousLong)
      {
        AssetsFragment.this.onAssetItemClick(paramAnonymousAdapterView, paramAnonymousView, paramAnonymousInt, paramAnonymousLong);
      }
    });
    this.lvAssets.setItemChecked(this.assetsInfo.getSelectedIndex(), true);
    this.lvAssets.smoothScrollToPosition(this.assetsInfo.getSelectedIndex());
    this.btnAdd = ((ImageButton)this.context.findViewById(2131493041));
    this.btnAdd.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        AssetsFragment.this.onClickAdd(paramAnonymousView);
      }
    });
    this.btnEdit = ((ImageButton)this.context.findViewById(2131493043));
    this.btnEdit.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        AssetsFragment.this.onClickEdit(paramAnonymousView);
      }
    });
    this.btnDelete = ((ImageButton)this.context.findViewById(2131493042));
    this.btnDelete.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        AssetsFragment.this.onClickDelete(paramAnonymousView);
      }
    });
    this.btnOk = ((Button)this.context.findViewById(2131493039));
    this.btnOk.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        AssetsFragment.this.onClickOk(paramAnonymousView);
      }
    });
    this.btnClear = ((Button)this.context.findViewById(2131493040));
    this.btnClear.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        AssetsFragment.this.onClickClear(paramAnonymousView);
      }
    });
  }
  
  public void onActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    if ((paramInt1 == 4) && (paramInt2 == -1)) {
      paramIntent = Asset.loadFromString(paramIntent.getStringExtra("asset_data"));
    }
    try
    {
      this.assetsInfo.add(paramIntent);
      this.assetsInfo.save();
      this.adapAssets.notifyDataSetChanged();
      return;
    }
    catch (Exception paramIntent)
    {
      Log.e("AlienRFID-Assets Tab", "Error adding asset: " + paramIntent);
      paramIntent.printStackTrace();
    }
  }
  
  public void onAssetItemClick(AdapterView<?> paramAdapterView, View paramView, int paramInt, long paramLong)
  {
    this.assetsInfo.setSelectedIndex(paramInt);
  }
  
  public void onClickAdd(View paramView)
  {
    startActivityForResult(new Intent(this.context, AssetEditorActivity.class), 4);
  }
  
  public void onClickDelete(View paramView)
  {
    if ((this.assetsInfo.getSelectedIndex() >= 0) && (this.assetsInfo.getSelectedIndex() < this.assetsInfo.getAssets().size()))
    {
      paramView = new DialogInterface.OnClickListener()
      {
        public void onClick(DialogInterface paramAnonymousDialogInterface, int paramAnonymousInt)
        {
          switch (paramAnonymousInt)
          {
          default: 
            return;
          }
          try
          {
            AssetsFragment.this.assetsInfo.delete(AssetsFragment.this.assetsInfo.getSelectedIndex());
            AssetsFragment.this.assetsInfo.save();
            AssetsFragment.this.adapAssets.notifyDataSetChanged();
            return;
          }
          catch (Exception paramAnonymousDialogInterface)
          {
            Log.e("AlienRFID-Assets Tab", "Error deleting asset: " + paramAnonymousDialogInterface);
            paramAnonymousDialogInterface.printStackTrace();
          }
        }
      };
      Asset localAsset = (Asset)this.assetsInfo.getAssets().get(this.assetsInfo.getSelectedIndex());
      new AlertDialog.Builder(this.context).setMessage(getResources().getString(2131034145) + " " + localAsset.getEpc()).setPositiveButton(2131034237, paramView).setNegativeButton(2131034196, paramView).show();
    }
  }
  
  public void onClickEdit(View paramView)
  {
    if ((this.assetsInfo.getAssets().size() > 0) && (this.assetsInfo.getSelectedIndex() >= 0))
    {
      paramView = (Asset)this.assetsInfo.getAssets().get(this.assetsInfo.getSelectedIndex());
      Intent localIntent = new Intent(this.context, AssetEditorActivity.class);
      localIntent.putExtra("asset_data", paramView.toString());
      startActivityForResult(localIntent, 4);
    }
  }
  
  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    return paramLayoutInflater.inflate(2130903089, paramViewGroup, false);
  }
  
  class AssetsAdapter
    extends ArrayAdapter<Asset>
  {
    public AssetsAdapter(int paramInt, List<Asset> paramList)
    {
      super(paramList, localList);
    }
    
    public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
    {
      paramView = AssetsFragment.this.context.getLayoutInflater().inflate(2130903073, null);
      paramViewGroup = (TextView)paramView.findViewById(2131493003);
      TextView localTextView = (TextView)paramView.findViewById(2131493004);
      ImageView localImageView = (ImageView)paramView.findViewById(2131492974);
      Asset localAsset = (Asset)AssetsFragment.this.assetsInfo.getAssets().get(paramInt);
      paramViewGroup.setText(localAsset.getEpc());
      localTextView.setText(localAsset.getBarcode());
      localImageView.setImageBitmap(localAsset.getBitmap());
      return paramView;
    }
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\alien\demo\feature\mask\AssetsFragment.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */