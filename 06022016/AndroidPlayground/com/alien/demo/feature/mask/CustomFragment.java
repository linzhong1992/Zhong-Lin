package com.alien.demo.feature.mask;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemSelectedListener;
import android.widget.Button;
import android.widget.EditText;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.RadioGroup.OnCheckedChangeListener;
import android.widget.Spinner;
import com.alien.demo.rfid.TagMask;
import com.alien.demo.uibase.BaseFragment;

public class CustomFragment
  extends BaseFragment
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
  
  private void onArbitraryBankChanged(AdapterView<?> paramAdapterView, View paramView, int paramInt, long paramLong)
  {
    this.specifyInfo.setArbitraryBank(paramInt);
  }
  
  private void onArbitraryDataChanged(CharSequence paramCharSequence)
  {
    this.specifyInfo.setArbitraryData(paramCharSequence.toString());
  }
  
  private void onArbitraryLenChanged(CharSequence paramCharSequence)
  {
    if (paramCharSequence.toString().isEmpty())
    {
      this.specifyInfo.setArbitraryLen(0);
      return;
    }
    this.specifyInfo.setArbitraryLen(Integer.parseInt(paramCharSequence.toString()));
  }
  
  private void onArbitraryPtrChanged(CharSequence paramCharSequence)
  {
    if (paramCharSequence.toString().isEmpty())
    {
      this.specifyInfo.setArbitraryPtr(0);
      return;
    }
    this.specifyInfo.setArbitraryPtr(Integer.parseInt(paramCharSequence.toString()));
  }
  
  private void onClickClear(View paramView)
  {
    this.specifyInfo.setEpcStartWithData("");
    this.specifyInfo.setArbitraryBank(1);
    this.specifyInfo.setArbitraryPtr(0);
    this.specifyInfo.setArbitraryLen(0);
    this.specifyInfo.setArbitraryData("");
    reloadUI();
  }
  
  private void onClickOk(View paramView)
  {
    paramView = new Intent();
    if (this.groups.getCheckedRadioButtonId() == this.rbEpcStartWith.getId())
    {
      this.outputFilter.setMaskedBank(1);
      this.outputFilter.setMaskInfo(1, 32, this.etEpcStartWithData.getText().toString().length() * 4, this.etEpcStartWithData.getText().toString());
      paramView.putExtra("filter_data", this.outputFilter.convertToString());
    }
    for (;;)
    {
      Activity localActivity1 = this.context;
      Activity localActivity2 = this.context;
      localActivity1.setResult(-1, paramView);
      this.context.finish();
      return;
      if (this.groups.getCheckedRadioButtonId() == this.rbArbitrary.getId())
      {
        this.outputFilter.setMaskedBank(this.specifyInfo.getArbitraryBank());
        this.outputFilter.setMaskInfo(this.specifyInfo.getArbitraryBank(), this.specifyInfo.getArbitraryPtr(), this.specifyInfo.getArbitraryLen(), this.specifyInfo.getArbitraryData());
        paramView.putExtra("filter_data", this.outputFilter.convertToString());
      }
    }
  }
  
  private void onSpecifyGroupChanged(RadioGroup paramRadioGroup, int paramInt)
  {
    this.groupEpcStartWith.setVisibility(8);
    this.groupArbitrary.setVisibility(8);
    if (paramInt == this.rbEpcStartWith.getId())
    {
      this.groupEpcStartWith.setVisibility(0);
      this.specifyInfo.setSpecifyMode(SpecifyInfo.SpecifyModeEnum.START_WITH_EPC);
      return;
    }
    this.groupArbitrary.setVisibility(0);
    this.specifyInfo.setSpecifyMode(SpecifyInfo.SpecifyModeEnum.ARBITRATY);
  }
  
  private void onStartWithEpcDataChanged(CharSequence paramCharSequence)
  {
    this.specifyInfo.setEpcStartWithData(paramCharSequence.toString());
  }
  
  private void reloadUI()
  {
    this.etEpcStartWithData.setText(this.specifyInfo.getEpcStartWithData());
    this.spBank.setSelection(this.specifyInfo.getArbitraryBank());
    this.etPtr.setText("" + this.specifyInfo.getArbitraryPtr());
    this.etLen.setText("" + this.specifyInfo.getArbitraryLen());
    this.etData.setText(this.specifyInfo.getArbitraryData());
    if (this.specifyInfo.getSpecifyMode() == SpecifyInfo.SpecifyModeEnum.START_WITH_EPC)
    {
      this.groups.check(this.rbEpcStartWith.getId());
      return;
    }
    this.groups.check(this.rbArbitrary.getId());
  }
  
  public void onActivityCreated(Bundle paramBundle)
  {
    super.onActivityCreated(paramBundle);
    this.context = getActivity();
    this.specifyInfo = ((MaskInterface)this.context).getMaskInfo().getSpecifyInfo();
    this.outputFilter = TagMask.createFromString(this.context.getIntent().getStringExtra("filter_data"));
    this.groups = ((RadioGroup)this.context.findViewById(2131493066));
    this.groups.setOnCheckedChangeListener(new RadioGroup.OnCheckedChangeListener()
    {
      public void onCheckedChanged(RadioGroup paramAnonymousRadioGroup, int paramAnonymousInt)
      {
        CustomFragment.this.onSpecifyGroupChanged(paramAnonymousRadioGroup, paramAnonymousInt);
      }
    });
    this.groupEpcStartWith = this.context.findViewById(2131493070);
    this.rbEpcStartWith = ((RadioButton)this.context.findViewById(2131493067));
    this.etEpcStartWithData = ((EditText)this.context.findViewById(2131493071));
    this.etEpcStartWithData.addTextChangedListener(new TextWatcher()
    {
      public void afterTextChanged(Editable paramAnonymousEditable) {}
      
      public void beforeTextChanged(CharSequence paramAnonymousCharSequence, int paramAnonymousInt1, int paramAnonymousInt2, int paramAnonymousInt3) {}
      
      public void onTextChanged(CharSequence paramAnonymousCharSequence, int paramAnonymousInt1, int paramAnonymousInt2, int paramAnonymousInt3)
      {
        CustomFragment.this.onStartWithEpcDataChanged(paramAnonymousCharSequence);
      }
    });
    this.groupArbitrary = this.context.findViewById(2131493072);
    this.rbArbitrary = ((RadioButton)this.context.findViewById(2131493068));
    this.spBank = ((Spinner)this.context.findViewById(2131493073));
    this.spBank.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener()
    {
      public void onItemSelected(AdapterView<?> paramAnonymousAdapterView, View paramAnonymousView, int paramAnonymousInt, long paramAnonymousLong)
      {
        CustomFragment.this.onArbitraryBankChanged(paramAnonymousAdapterView, paramAnonymousView, paramAnonymousInt, paramAnonymousLong);
      }
      
      public void onNothingSelected(AdapterView<?> paramAnonymousAdapterView) {}
    });
    this.etPtr = ((EditText)this.context.findViewById(2131493074));
    this.etPtr.addTextChangedListener(new TextWatcher()
    {
      public void afterTextChanged(Editable paramAnonymousEditable) {}
      
      public void beforeTextChanged(CharSequence paramAnonymousCharSequence, int paramAnonymousInt1, int paramAnonymousInt2, int paramAnonymousInt3) {}
      
      public void onTextChanged(CharSequence paramAnonymousCharSequence, int paramAnonymousInt1, int paramAnonymousInt2, int paramAnonymousInt3)
      {
        CustomFragment.this.onArbitraryPtrChanged(paramAnonymousCharSequence);
      }
    });
    this.etLen = ((EditText)this.context.findViewById(2131493075));
    this.etLen.addTextChangedListener(new TextWatcher()
    {
      public void afterTextChanged(Editable paramAnonymousEditable) {}
      
      public void beforeTextChanged(CharSequence paramAnonymousCharSequence, int paramAnonymousInt1, int paramAnonymousInt2, int paramAnonymousInt3) {}
      
      public void onTextChanged(CharSequence paramAnonymousCharSequence, int paramAnonymousInt1, int paramAnonymousInt2, int paramAnonymousInt3)
      {
        CustomFragment.this.onArbitraryLenChanged(paramAnonymousCharSequence);
      }
    });
    this.etData = ((EditText)this.context.findViewById(2131493076));
    this.etData.addTextChangedListener(new TextWatcher()
    {
      public void afterTextChanged(Editable paramAnonymousEditable) {}
      
      public void beforeTextChanged(CharSequence paramAnonymousCharSequence, int paramAnonymousInt1, int paramAnonymousInt2, int paramAnonymousInt3) {}
      
      public void onTextChanged(CharSequence paramAnonymousCharSequence, int paramAnonymousInt1, int paramAnonymousInt2, int paramAnonymousInt3)
      {
        CustomFragment.this.onArbitraryDataChanged(paramAnonymousCharSequence);
      }
    });
    this.btnOK = ((Button)this.context.findViewById(2131493064));
    this.btnOK.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        CustomFragment.this.onClickOk(paramAnonymousView);
      }
    });
    this.btnClear = ((Button)this.context.findViewById(2131493065));
    this.btnClear.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        CustomFragment.this.onClickClear(paramAnonymousView);
      }
    });
  }
  
  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    return paramLayoutInflater.inflate(2130903091, paramViewGroup, false);
  }
  
  public void onResume()
  {
    super.onResume();
    reloadUI();
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\alien\demo\feature\mask\CustomFragment.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */