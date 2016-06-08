package com.alien.demo.feature.mask;

import com.alien.demo.uibase.*;
import com.alien.demo.rfid.*;
import com.alien.demo.data.*;
import com.alien.rfid.*;
import android.os.*;
import java.util.*;
import android.util.*;
import android.content.*;
import android.app.*;
import android.view.*;
import android.widget.*;

public class AssetsFragment extends BaseFragment
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
    
    private void onClickClear(final View view) {
        this.lvAssets.setItemChecked(this.assetsInfo.getSelectedIndex(), false);
        this.assetsInfo.setSelectedIndex(-1);
    }
    
    private void onClickOk(final View view) {
        if (this.assetsInfo.getAssets().size() > 0 && this.assetsInfo.getSelectedIndex() >= 0) {
            final Asset asset = this.assetsInfo.getAssets().get(this.assetsInfo.getSelectedIndex());
            this.outputFilter.setMaskedBank(Bank.EPC.getValue());
            this.outputFilter.setMaskInfo(Bank.EPC.getValue(), 32, asset.getEpc().length() * 4, asset.getEpc());
            final Intent intent = new Intent();
            intent.putExtra("filter_data", this.outputFilter.convertToString());
            final Activity context = this.context;
            final Activity context2 = this.context;
            context.setResult(-1, intent);
        }
        else {
            this.outputFilter.clearMask();
            final Intent intent2 = new Intent();
            intent2.putExtra("filter_data", this.outputFilter.convertToString());
            final Activity context3 = this.context;
            final Activity context4 = this.context;
            context3.setResult(-1, intent2);
        }
        this.context.finish();
    }
    
    @Override
    public void onActivityCreated(final Bundle bundle) {
        super.onActivityCreated(bundle);
        this.context = this.getActivity();
        this.assetsInfo = ((MaskInterface)this.context).getMaskInfo().getAssetsInfo();
        this.outputFilter = TagMask.createFromString(this.context.getIntent().getStringExtra("filter_data"));
        this.lvAssets = (ListView)this.context.findViewById(2131493044);
        this.adapAssets = new AssetsAdapter((Context)this.context, 2130903073, this.assetsInfo.getAssets());
        this.lvAssets.setAdapter((ListAdapter)this.adapAssets);
        this.lvAssets.setOnItemClickListener((AdapterView$OnItemClickListener)new AdapterView$OnItemClickListener() {
            public void onItemClick(final AdapterView<?> adapterView, final View view, final int n, final long n2) {
                AssetsFragment.this.onAssetItemClick(adapterView, view, n, n2);
            }
        });
        this.lvAssets.setItemChecked(this.assetsInfo.getSelectedIndex(), true);
        this.lvAssets.smoothScrollToPosition(this.assetsInfo.getSelectedIndex());
        (this.btnAdd = (ImageButton)this.context.findViewById(2131493041)).setOnClickListener((View$OnClickListener)new View$OnClickListener() {
            public void onClick(final View view) {
                AssetsFragment.this.onClickAdd(view);
            }
        });
        (this.btnEdit = (ImageButton)this.context.findViewById(2131493043)).setOnClickListener((View$OnClickListener)new View$OnClickListener() {
            public void onClick(final View view) {
                AssetsFragment.this.onClickEdit(view);
            }
        });
        (this.btnDelete = (ImageButton)this.context.findViewById(2131493042)).setOnClickListener((View$OnClickListener)new View$OnClickListener() {
            public void onClick(final View view) {
                AssetsFragment.this.onClickDelete(view);
            }
        });
        (this.btnOk = (Button)this.context.findViewById(2131493039)).setOnClickListener((View$OnClickListener)new View$OnClickListener() {
            public void onClick(final View view) {
                AssetsFragment.this.onClickOk(view);
            }
        });
        (this.btnClear = (Button)this.context.findViewById(2131493040)).setOnClickListener((View$OnClickListener)new View$OnClickListener() {
            public void onClick(final View view) {
                AssetsFragment.this.onClickClear(view);
            }
        });
    }
    
    @Override
    public void onActivityResult(final int n, final int n2, final Intent intent) {
        if (n != 4 || n2 != -1) {
            return;
        }
        final Asset loadFromString = Asset.loadFromString(intent.getStringExtra("asset_data"));
        try {
            this.assetsInfo.add(loadFromString);
            this.assetsInfo.save();
            this.adapAssets.notifyDataSetChanged();
        }
        catch (Exception ex) {
            Log.e("AlienRFID-Assets Tab", "Error adding asset: " + ex);
            ex.printStackTrace();
        }
    }
    
    public void onAssetItemClick(final AdapterView<?> adapterView, final View view, final int selectedIndex, final long n) {
        this.assetsInfo.setSelectedIndex(selectedIndex);
    }
    
    public void onClickAdd(final View view) {
        this.startActivityForResult(new Intent((Context)this.context, (Class)AssetEditorActivity.class), 4);
    }
    
    public void onClickDelete(final View view) {
        if (this.assetsInfo.getSelectedIndex() >= 0 && this.assetsInfo.getSelectedIndex() < this.assetsInfo.getAssets().size()) {
            final DialogInterface$OnClickListener dialogInterface$OnClickListener = (DialogInterface$OnClickListener)new DialogInterface$OnClickListener() {
                public void onClick(final DialogInterface dialogInterface, final int n) {
                    switch (n) {
                        default: {}
                        case -1: {
                            try {
                                AssetsFragment.this.assetsInfo.delete(AssetsFragment.this.assetsInfo.getSelectedIndex());
                                AssetsFragment.this.assetsInfo.save();
                                AssetsFragment.this.adapAssets.notifyDataSetChanged();
                                return;
                            }
                            catch (Exception ex) {
                                Log.e("AlienRFID-Assets Tab", "Error deleting asset: " + ex);
                                ex.printStackTrace();
                                return;
                            }
                            break;
                        }
                    }
                }
            };
            new AlertDialog$Builder((Context)this.context).setMessage((CharSequence)(this.getResources().getString(2131034145) + " " + this.assetsInfo.getAssets().get(this.assetsInfo.getSelectedIndex()).getEpc())).setPositiveButton(2131034237, (DialogInterface$OnClickListener)dialogInterface$OnClickListener).setNegativeButton(2131034196, (DialogInterface$OnClickListener)dialogInterface$OnClickListener).show();
        }
    }
    
    public void onClickEdit(final View view) {
        if (this.assetsInfo.getAssets().size() > 0 && this.assetsInfo.getSelectedIndex() >= 0) {
            final Asset asset = this.assetsInfo.getAssets().get(this.assetsInfo.getSelectedIndex());
            final Intent intent = new Intent((Context)this.context, (Class)AssetEditorActivity.class);
            intent.putExtra("asset_data", asset.toString());
            this.startActivityForResult(intent, 4);
        }
    }
    
    @Override
    public View onCreateView(final LayoutInflater layoutInflater, final ViewGroup viewGroup, final Bundle bundle) {
        return layoutInflater.inflate(2130903089, viewGroup, false);
    }
    
    class AssetsAdapter extends ArrayAdapter<Asset>
    {
        public AssetsAdapter(final Context context, final int n, final List<Asset> list) {
            super(context, n, (List)list);
        }
        
        public View getView(final int n, View inflate, final ViewGroup viewGroup) {
            inflate = AssetsFragment.this.context.getLayoutInflater().inflate(2130903073, (ViewGroup)null);
            final TextView textView = (TextView)inflate.findViewById(2131493003);
            final TextView textView2 = (TextView)inflate.findViewById(2131493004);
            final ImageView imageView = (ImageView)inflate.findViewById(2131492974);
            final Asset asset = AssetsFragment.this.assetsInfo.getAssets().get(n);
            textView.setText((CharSequence)asset.getEpc());
            textView2.setText((CharSequence)asset.getBarcode());
            imageView.setImageBitmap(asset.getBitmap());
            return inflate;
        }
    }
}
