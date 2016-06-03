package com.alien.demo.feature.tagaccess;

import android.app.Activity;
import android.app.AlertDialog.Builder;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemSelectedListener;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.Spinner;
import android.widget.TextView;
import com.alien.demo.feature.mask.MaskActivity;
import com.alien.demo.rfid.TagMask;
import com.alien.demo.rfid.TagScanner;
import com.alien.demo.system.Sound;
import com.alien.demo.uibase.BaseFragment;
import com.alien.demo.uibase.TaskRunner;
import com.alien.demo.uibase.UIHelper;
import com.alien.rfid.Bank;
import com.alien.rfid.LockFields;
import com.alien.rfid.RFIDResult;
import com.alien.rfid.ReaderException;

public class AdvancedAccessFragment
  extends BaseFragment
{
  private static final String TAG = "AlienRFID-Adv Access";
  private ImageButton btnLock;
  private Button btnMask;
  private ImageButton btnRead;
  private ImageButton btnWrite;
  private Activity context;
  private EditText etData;
  private EditText etPassword;
  private EditText etWordLen;
  private EditText etWordOffset;
  private TagScanner scanner;
  private Spinner spLockField;
  private Spinner spLockType;
  private Spinner spRWBank;
  private TextView txtMaskEpc;
  
  private void configureMask()
  {
    Intent localIntent = new Intent(this.context, MaskActivity.class);
    localIntent.putExtra("filter_data", this.scanner.getFilter().convertToString());
    startActivityForResult(localIntent, 1);
  }
  
  private String getAccessPwd()
  {
    return this.etPassword.getText().toString();
  }
  
  public static AdvancedAccessFragment newInstance(TagScanner paramTagScanner)
  {
    AdvancedAccessFragment localAdvancedAccessFragment = new AdvancedAccessFragment();
    localAdvancedAccessFragment.scanner = paramTagScanner;
    return localAdvancedAccessFragment;
  }
  
  private void readData()
  {
    try
    {
      Object localObject = Bank.fromValue(this.spRWBank.getSelectedItemPosition());
      int i = 0;
      String str = this.etWordOffset.getText().toString();
      if (!str.isEmpty()) {
        i = Integer.parseInt(str);
      }
      int j = 0;
      str = this.etWordLen.getText().toString();
      if (!str.isEmpty()) {
        j = Integer.parseInt(str);
      }
      localObject = this.scanner.read((Bank)localObject, i, j, getAccessPwd());
      if (!((RFIDResult)localObject).isSuccess()) {
        throw new ReaderException("Operation result is false");
      }
    }
    catch (Exception localException)
    {
      this.context.runOnUiThread(new Runnable()
      {
        public void run()
        {
          AdvancedAccessFragment.this.etData.setText("");
          AdvancedAccessFragment.this.etData.setBackgroundResource(2130837577);
        }
      });
      Log.e("AlienRFID-Adv Access", "Error reading data: " + localException);
      localException.printStackTrace();
      Sound.playError(this.context);
      return;
    }
    this.context.runOnUiThread(new Runnable()
    {
      public void run()
      {
        AdvancedAccessFragment.this.etData.setText((String)localException.getData());
        AdvancedAccessFragment.this.etData.setBackgroundResource(2130837578);
        UIHelper.flashingView(AdvancedAccessFragment.this.etData);
      }
    });
    Sound.playSuccess(this.context);
  }
  
  private void setupEvents()
  {
    this.btnMask.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        AdvancedAccessFragment.this.configureMask();
      }
    });
    this.btnRead.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        TaskRunner.runTask(AdvancedAccessFragment.this.context, "Reading...", new Runnable()
        {
          public void run()
          {
            AdvancedAccessFragment.this.readData();
          }
        });
      }
    });
    this.btnWrite.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        TaskRunner.runTask(AdvancedAccessFragment.this.context, "Writing...", new Runnable()
        {
          public void run()
          {
            AdvancedAccessFragment.this.writeData();
          }
        });
      }
    });
    this.btnLock.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        AdvancedAccessFragment.this.lockField();
      }
    });
    this.spLockType.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener()
    {
      public void onItemSelected(AdapterView<?> paramAnonymousAdapterView, View paramAnonymousView, int paramAnonymousInt, long paramAnonymousLong)
      {
        if ((paramAnonymousInt == 0) || (paramAnonymousInt == 2))
        {
          AdvancedAccessFragment.this.btnLock.setImageResource(2130837588);
          return;
        }
        AdvancedAccessFragment.this.btnLock.setImageResource(2130837587);
      }
      
      public void onNothingSelected(AdapterView<?> paramAnonymousAdapterView) {}
    });
  }
  
  private void updateMask()
  {
    String str = this.scanner.getFilter().toString();
    if (str.isEmpty())
    {
      this.txtMaskEpc.setText(2131034144);
      return;
    }
    this.txtMaskEpc.setText(str);
  }
  
  private void writeData()
  {
    try
    {
      Bank localBank = Bank.fromValue(this.spRWBank.getSelectedItemPosition());
      int i = 0;
      String str = this.etWordOffset.getText().toString();
      if (!str.isEmpty()) {
        i = Integer.parseInt(str);
      }
      str = this.etWordLen.getText().toString();
      if (!str.isEmpty()) {
        Integer.parseInt(str);
      }
      str = this.etData.getText().toString();
      if (!this.scanner.write(localBank, i, str, getAccessPwd()).isSuccess()) {
        throw new ReaderException("Operation result is false");
      }
    }
    catch (Exception localException)
    {
      this.context.runOnUiThread(new Runnable()
      {
        public void run()
        {
          AdvancedAccessFragment.this.etData.setBackgroundResource(2130837577);
        }
      });
      Log.e("AlienRFID-Adv Access", "Error writing data: " + localException);
      localException.printStackTrace();
      Sound.playError(this.context);
      return;
    }
    this.context.runOnUiThread(new Runnable()
    {
      public void run()
      {
        AdvancedAccessFragment.this.etData.setBackgroundResource(2130837578);
        UIHelper.flashingView(AdvancedAccessFragment.this.etData);
      }
    });
    Sound.playSuccess(this.context);
  }
  
  public LockFields getField(Spinner paramSpinner)
    throws ReaderException
  {
    switch (paramSpinner.getSelectedItemPosition())
    {
    default: 
      throw new ReaderException("Invalid field");
    case 0: 
      return new LockFields(2);
    case 1: 
      return new LockFields(1);
    case 2: 
      return new LockFields(4);
    }
    return new LockFields(8);
  }
  
  public void lockField()
  {
    DialogInterface.OnClickListener local10 = new DialogInterface.OnClickListener()
    {
      public void onClick(DialogInterface paramAnonymousDialogInterface, int paramAnonymousInt)
      {
        switch (paramAnonymousInt)
        {
        default: 
          return;
        }
        for (;;)
        {
          try
          {
            paramAnonymousDialogInterface = AdvancedAccessFragment.this.getField(AdvancedAccessFragment.this.spLockField);
            switch (AdvancedAccessFragment.this.spLockType.getSelectedItemPosition())
            {
            case 0: 
              Sound.playSuccess(AdvancedAccessFragment.this.context);
              return;
            }
          }
          catch (Exception paramAnonymousDialogInterface)
          {
            Log.e("AlienRFID-Adv Access", "Error lock field: " + paramAnonymousDialogInterface);
            paramAnonymousDialogInterface.printStackTrace();
            Sound.playError(AdvancedAccessFragment.this.context);
            return;
          }
          if (!AdvancedAccessFragment.this.scanner.lock(paramAnonymousDialogInterface, AdvancedAccessFragment.this.getAccessPwd()).isSuccess())
          {
            throw new ReaderException("Operation result is false");
            if (!AdvancedAccessFragment.this.scanner.unlock(paramAnonymousDialogInterface, AdvancedAccessFragment.this.getAccessPwd()).isSuccess())
            {
              throw new ReaderException("Operation result is false");
              if (!AdvancedAccessFragment.this.scanner.permaLock(paramAnonymousDialogInterface, AdvancedAccessFragment.this.getAccessPwd()).isSuccess())
              {
                throw new ReaderException("Operation result is false");
                if (!AdvancedAccessFragment.this.scanner.permaUnlock(paramAnonymousDialogInterface, AdvancedAccessFragment.this.getAccessPwd()).isSuccess()) {
                  throw new ReaderException("Operation result is false");
                }
              }
            }
          }
        }
      }
    };
    new AlertDialog.Builder(this.context).setMessage(2131034146).setPositiveButton(2131034237, local10).setNegativeButton(2131034196, local10).show();
  }
  
  public void onActivityCreated(Bundle paramBundle)
  {
    super.onActivityCreated(paramBundle);
    this.context = getActivity();
    this.txtMaskEpc = ((TextView)this.context.findViewById(2131493028));
    this.btnMask = ((Button)this.context.findViewById(2131493027));
    this.etPassword = ((EditText)this.context.findViewById(2131493029));
    this.spRWBank = ((Spinner)this.context.findViewById(2131493030));
    this.spRWBank.setSelection(1);
    this.etWordOffset = ((EditText)this.context.findViewById(2131493031));
    this.etWordLen = ((EditText)this.context.findViewById(2131493032));
    this.etData = ((EditText)this.context.findViewById(2131493033));
    this.btnRead = ((ImageButton)this.context.findViewById(2131493034));
    this.btnWrite = ((ImageButton)this.context.findViewById(2131493035));
    this.spLockField = ((Spinner)this.context.findViewById(2131493036));
    this.spLockField.setSelection(2);
    this.spLockType = ((Spinner)this.context.findViewById(2131493037));
    this.btnLock = ((ImageButton)this.context.findViewById(2131493038));
    setupEvents();
  }
  
  public void onActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    if (paramInt1 == 1)
    {
      Activity localActivity = this.context;
      if (paramInt2 == -1)
      {
        this.scanner.getFilter().loadFromString(paramIntent.getStringExtra("filter_data"));
        updateMask();
      }
    }
  }
  
  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    return paramLayoutInflater.inflate(2130903088, paramViewGroup, false);
  }
  
  public void onKeyDown(int paramInt, KeyEvent paramKeyEvent)
  {
    if ((paramInt == 139) && (paramKeyEvent.getRepeatCount() == 0))
    {
      readData();
      return;
    }
    super.onKeyDown(paramInt, paramKeyEvent);
  }
  
  public void onResume()
  {
    super.onResume();
    updateMask();
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\alien\demo\feature\tagaccess\AdvancedAccessFragment.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */