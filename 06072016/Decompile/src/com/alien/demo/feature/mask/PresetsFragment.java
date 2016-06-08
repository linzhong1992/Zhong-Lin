package com.alien.demo.feature.mask;

import android.app.*;
import com.alien.demo.rfid.*;
import android.net.*;
import java.io.*;
import android.util.*;
import com.alien.demo.uibase.*;
import android.content.*;
import android.os.*;
import java.util.*;
import android.view.*;
import android.widget.*;
import com.alien.demo.*;

public class PresetsFragment extends BaseFragment
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
    
    private void loadPreset(final Uri uri) {
        this.presetsInfo.getItems().clear();
        try {
            final BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(this.context.getContentResolver().openInputStream(uri)));
            while (true) {
                final String line = bufferedReader.readLine();
                if (line == null) {
                    break;
                }
                if (line.startsWith("#")) {
                    continue;
                }
                this.presetsInfo.getItems().add(PresetsInfo.PresetItem.fromString(line));
            }
        }
        catch (Exception ex) {
            Log.e("AlienRFID-Mask Presets", "Error load preset files: " + ex);
            ex.printStackTrace();
            UIHelper.ToastMessage((Context)this.context, 2131034188);
        }
        this.adapPresets.notifyDataSetChanged();
    }
    
    private void onClickClear(final View view) {
        this.lvPresets.setItemChecked(this.presetsInfo.getSelectedItem(), false);
        this.presetsInfo.setSelectedItem(-1);
    }
    
    private void onClickLoad(final View view) {
        final Intent intent = new Intent("android.intent.action.GET_CONTENT");
        intent.setType("*/*");
        intent.addCategory("android.intent.category.OPENABLE");
        try {
            this.startActivityForResult(Intent.createChooser(intent, (CharSequence)this.getResources().getString(2131034186)), 1);
        }
        catch (ActivityNotFoundException ex) {
            UIHelper.ToastMessage((Context)this.context, 2131034185);
        }
    }
    
    private void onClickOk(final View view) {
        if (this.presetsInfo.getItems().size() > 0 && this.presetsInfo.getSelectedItem() >= 0) {
            final PresetsInfo.PresetItem presetItem = this.presetsInfo.getItems().get(this.presetsInfo.getSelectedItem());
            this.outputFilter.setMaskedBank(presetItem.getBank());
            this.outputFilter.setMaskInfo(presetItem.getBank(), presetItem.getPtr(), presetItem.getLen(), presetItem.getData());
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
        this.presetsInfo = ((MaskInterface)this.context).getMaskInfo().getPresetsInfo();
        this.outputFilter = TagMask.createFromString(this.context.getIntent().getStringExtra("filter_data"));
        this.lvPresets = (ListView)this.context.findViewById(2131493080);
        this.adapPresets = new PresetsAdapter((Context)this.context, 2130903104, this.presetsInfo.getItems());
        this.lvPresets.setAdapter((ListAdapter)this.adapPresets);
        this.lvPresets.setOnItemClickListener((AdapterView$OnItemClickListener)new AdapterView$OnItemClickListener() {
            public void onItemClick(final AdapterView<?> adapterView, final View view, final int n, final long n2) {
                PresetsFragment.this.onPresetItemClick(adapterView, view, n, n2);
            }
        });
        this.lvPresets.setItemChecked(this.presetsInfo.getSelectedItem(), true);
        this.lvPresets.smoothScrollToPosition(this.presetsInfo.getSelectedItem());
        (this.btnLoad = (Button)this.context.findViewById(2131493077)).setOnClickListener((View$OnClickListener)new View$OnClickListener() {
            public void onClick(final View view) {
                PresetsFragment.this.onClickLoad(view);
            }
        });
        (this.btnOk = (Button)this.context.findViewById(2131493078)).setOnClickListener((View$OnClickListener)new View$OnClickListener() {
            public void onClick(final View view) {
                PresetsFragment.this.onClickOk(view);
            }
        });
        (this.btnClear = (Button)this.context.findViewById(2131493079)).setOnClickListener((View$OnClickListener)new View$OnClickListener() {
            public void onClick(final View view) {
                PresetsFragment.this.onClickClear(view);
            }
        });
    }
    
    @Override
    public void onActivityResult(final int n, final int n2, final Intent intent) {
        if (n == 1 && n2 == -1) {
            this.loadPreset(intent.getData());
        }
    }
    
    @Override
    public View onCreateView(final LayoutInflater layoutInflater, final ViewGroup viewGroup, final Bundle bundle) {
        return layoutInflater.inflate(2130903092, viewGroup, false);
    }
    
    public void onPresetItemClick(final AdapterView<?> adapterView, final View view, final int selectedItem, final long n) {
        this.presetsInfo.setSelectedItem(selectedItem);
    }
    
    class PresetsAdapter extends ArrayAdapter<PresetsInfo.PresetItem>
    {
        public PresetsAdapter(final Context context, final int n, final List<PresetsInfo.PresetItem> list) {
            super(context, n, (List)list);
        }
        
        public View getView(final int n, View inflate, final ViewGroup viewGroup) {
            inflate = PresetsFragment.this.context.getLayoutInflater().inflate(2130903104, (ViewGroup)null);
            final TextView textView = (TextView)inflate.findViewById(2131493107);
            final TextView textView2 = (TextView)inflate.findViewById(2131493108);
            final PresetsInfo.PresetItem presetItem = PresetsFragment.this.presetsInfo.getItems().get(n);
            textView.setText((CharSequence)presetItem.getName());
            textView2.setText((CharSequence)(Constants.Bank.NAMES[presetItem.getBank()] + "," + presetItem.getPtr() + "," + presetItem.getLen() + "," + presetItem.getData()));
            return inflate;
        }
    }
}
