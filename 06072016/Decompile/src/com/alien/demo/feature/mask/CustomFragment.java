package com.alien.demo.feature.mask;

import com.alien.demo.uibase.*;
import android.app.*;
import com.alien.demo.rfid.*;
import android.content.*;
import android.os.*;
import android.text.*;
import android.widget.*;
import android.view.*;

public class CustomFragment extends BaseFragment
{
    private static final String TAG = "AlienRFID-Mask Specify";
    private Button btnClear;
    private Button btnOK;
    private Activity context;
    private EditText etData;
    private EditText etEpcStartWithData;
    private EditText etLen;
    private EditText etPtr;
    private View groupArbitrary;
    private View groupEpcStartWith;
    private RadioGroup groups;
    private TagMask outputFilter;
    private RadioButton rbArbitrary;
    private RadioButton rbEpcStartWith;
    private Spinner spBank;
    private SpecifyInfo specifyInfo;
    
    private void onArbitraryBankChanged(final AdapterView<?> adapterView, final View view, final int arbitraryBank, final long n) {
        this.specifyInfo.setArbitraryBank(arbitraryBank);
    }
    
    private void onArbitraryDataChanged(final CharSequence charSequence) {
        this.specifyInfo.setArbitraryData(charSequence.toString());
    }
    
    private void onArbitraryLenChanged(final CharSequence charSequence) {
        if (charSequence.toString().isEmpty()) {
            this.specifyInfo.setArbitraryLen(0);
            return;
        }
        this.specifyInfo.setArbitraryLen(Integer.parseInt(charSequence.toString()));
    }
    
    private void onArbitraryPtrChanged(final CharSequence charSequence) {
        if (charSequence.toString().isEmpty()) {
            this.specifyInfo.setArbitraryPtr(0);
            return;
        }
        this.specifyInfo.setArbitraryPtr(Integer.parseInt(charSequence.toString()));
    }
    
    private void onClickClear(final View view) {
        this.specifyInfo.setEpcStartWithData("");
        this.specifyInfo.setArbitraryBank(1);
        this.specifyInfo.setArbitraryPtr(0);
        this.specifyInfo.setArbitraryLen(0);
        this.specifyInfo.setArbitraryData("");
        this.reloadUI();
    }
    
    private void onClickOk(final View view) {
        final Intent intent = new Intent();
        if (this.groups.getCheckedRadioButtonId() == this.rbEpcStartWith.getId()) {
            this.outputFilter.setMaskedBank(1);
            this.outputFilter.setMaskInfo(1, 32, this.etEpcStartWithData.getText().toString().length() * 4, this.etEpcStartWithData.getText().toString());
            intent.putExtra("filter_data", this.outputFilter.convertToString());
        }
        else if (this.groups.getCheckedRadioButtonId() == this.rbArbitrary.getId()) {
            this.outputFilter.setMaskedBank(this.specifyInfo.getArbitraryBank());
            this.outputFilter.setMaskInfo(this.specifyInfo.getArbitraryBank(), this.specifyInfo.getArbitraryPtr(), this.specifyInfo.getArbitraryLen(), this.specifyInfo.getArbitraryData());
            intent.putExtra("filter_data", this.outputFilter.convertToString());
        }
        final Activity context = this.context;
        final Activity context2 = this.context;
        context.setResult(-1, intent);
        this.context.finish();
    }
    
    private void onSpecifyGroupChanged(final RadioGroup radioGroup, final int n) {
        this.groupEpcStartWith.setVisibility(8);
        this.groupArbitrary.setVisibility(8);
        if (n == this.rbEpcStartWith.getId()) {
            this.groupEpcStartWith.setVisibility(0);
            this.specifyInfo.setSpecifyMode(SpecifyInfo.SpecifyModeEnum.START_WITH_EPC);
            return;
        }
        this.groupArbitrary.setVisibility(0);
        this.specifyInfo.setSpecifyMode(SpecifyInfo.SpecifyModeEnum.ARBITRATY);
    }
    
    private void onStartWithEpcDataChanged(final CharSequence charSequence) {
        this.specifyInfo.setEpcStartWithData(charSequence.toString());
    }
    
    private void reloadUI() {
        this.etEpcStartWithData.setText((CharSequence)this.specifyInfo.getEpcStartWithData());
        this.spBank.setSelection(this.specifyInfo.getArbitraryBank());
        this.etPtr.setText((CharSequence)("" + this.specifyInfo.getArbitraryPtr()));
        this.etLen.setText((CharSequence)("" + this.specifyInfo.getArbitraryLen()));
        this.etData.setText((CharSequence)this.specifyInfo.getArbitraryData());
        if (this.specifyInfo.getSpecifyMode() == SpecifyInfo.SpecifyModeEnum.START_WITH_EPC) {
            this.groups.check(this.rbEpcStartWith.getId());
            return;
        }
        this.groups.check(this.rbArbitrary.getId());
    }
    
    @Override
    public void onActivityCreated(final Bundle bundle) {
        super.onActivityCreated(bundle);
        this.context = this.getActivity();
        this.specifyInfo = ((MaskInterface)this.context).getMaskInfo().getSpecifyInfo();
        this.outputFilter = TagMask.createFromString(this.context.getIntent().getStringExtra("filter_data"));
        (this.groups = (RadioGroup)this.context.findViewById(2131493066)).setOnCheckedChangeListener((RadioGroup$OnCheckedChangeListener)new RadioGroup$OnCheckedChangeListener() {
            public void onCheckedChanged(final RadioGroup radioGroup, final int n) {
                CustomFragment.this.onSpecifyGroupChanged(radioGroup, n);
            }
        });
        this.groupEpcStartWith = this.context.findViewById(2131493070);
        this.rbEpcStartWith = (RadioButton)this.context.findViewById(2131493067);
        (this.etEpcStartWithData = (EditText)this.context.findViewById(2131493071)).addTextChangedListener((TextWatcher)new TextWatcher() {
            public void afterTextChanged(final Editable editable) {
            }
            
            public void beforeTextChanged(final CharSequence charSequence, final int n, final int n2, final int n3) {
            }
            
            public void onTextChanged(final CharSequence charSequence, final int n, final int n2, final int n3) {
                CustomFragment.this.onStartWithEpcDataChanged(charSequence);
            }
        });
        this.groupArbitrary = this.context.findViewById(2131493072);
        this.rbArbitrary = (RadioButton)this.context.findViewById(2131493068);
        (this.spBank = (Spinner)this.context.findViewById(2131493073)).setOnItemSelectedListener((AdapterView$OnItemSelectedListener)new AdapterView$OnItemSelectedListener() {
            public void onItemSelected(final AdapterView<?> adapterView, final View view, final int n, final long n2) {
                CustomFragment.this.onArbitraryBankChanged(adapterView, view, n, n2);
            }
            
            public void onNothingSelected(final AdapterView<?> adapterView) {
            }
        });
        (this.etPtr = (EditText)this.context.findViewById(2131493074)).addTextChangedListener((TextWatcher)new TextWatcher() {
            public void afterTextChanged(final Editable editable) {
            }
            
            public void beforeTextChanged(final CharSequence charSequence, final int n, final int n2, final int n3) {
            }
            
            public void onTextChanged(final CharSequence charSequence, final int n, final int n2, final int n3) {
                CustomFragment.this.onArbitraryPtrChanged(charSequence);
            }
        });
        (this.etLen = (EditText)this.context.findViewById(2131493075)).addTextChangedListener((TextWatcher)new TextWatcher() {
            public void afterTextChanged(final Editable editable) {
            }
            
            public void beforeTextChanged(final CharSequence charSequence, final int n, final int n2, final int n3) {
            }
            
            public void onTextChanged(final CharSequence charSequence, final int n, final int n2, final int n3) {
                CustomFragment.this.onArbitraryLenChanged(charSequence);
            }
        });
        (this.etData = (EditText)this.context.findViewById(2131493076)).addTextChangedListener((TextWatcher)new TextWatcher() {
            public void afterTextChanged(final Editable editable) {
            }
            
            public void beforeTextChanged(final CharSequence charSequence, final int n, final int n2, final int n3) {
            }
            
            public void onTextChanged(final CharSequence charSequence, final int n, final int n2, final int n3) {
                CustomFragment.this.onArbitraryDataChanged(charSequence);
            }
        });
        (this.btnOK = (Button)this.context.findViewById(2131493064)).setOnClickListener((View$OnClickListener)new View$OnClickListener() {
            public void onClick(final View view) {
                CustomFragment.this.onClickOk(view);
            }
        });
        (this.btnClear = (Button)this.context.findViewById(2131493065)).setOnClickListener((View$OnClickListener)new View$OnClickListener() {
            public void onClick(final View view) {
                CustomFragment.this.onClickClear(view);
            }
        });
    }
    
    @Override
    public View onCreateView(final LayoutInflater layoutInflater, final ViewGroup viewGroup, final Bundle bundle) {
        return layoutInflater.inflate(2130903091, viewGroup, false);
    }
    
    @Override
    public void onResume() {
        super.onResume();
        this.reloadUI();
    }
}
