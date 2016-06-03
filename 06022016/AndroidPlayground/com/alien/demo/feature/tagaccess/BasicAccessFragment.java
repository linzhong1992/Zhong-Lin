package com.alien.demo.feature.tagaccess;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.TextView;
import com.alien.demo.feature.mask.MaskActivity;
import com.alien.demo.rfid.TagMask;
import com.alien.demo.rfid.TagScanner;
import com.alien.demo.system.Sound;
import com.alien.demo.uibase.BaseFragment;
import com.alien.demo.uibase.TaskRunner;
import com.alien.demo.uibase.UIHelper;
import com.alien.rfid.RFIDResult;
import com.alien.rfid.ReaderException;
import com.alien.rfid.Tag;

public class BasicAccessFragment
  extends BaseFragment
{
  private static final String TAG = "AlienRFID-Basic Access";
  private Button btnClearAll;
  private Button btnMask;
  private ImageButton btnReadAPwd;
  private Button btnReadAll;
  private ImageButton btnReadEpc;
  private ImageButton btnReadKPwd;
  private ImageButton btnReadTid;
  private ImageButton btnReadUser;
  private ImageButton btnWriteAPwd;
  private ImageButton btnWriteEpc;
  private ImageButton btnWriteKPwd;
  private ImageButton btnWriteUser;
  private Activity context;
  private EditText etAPwd;
  private EditText etEpc;
  private EditText etKPwd;
  private EditText etPassword;
  private EditText etTid;
  private EditText etUser;
  private TagScanner scanner;
  private Tag tag;
  private TextView txtMaskEpc;
  
  private void checkForTag()
    throws BasicAccessFragment.NoTagFound
  {
    if (this.tag == null)
    {
      this.tag = this.scanner.scanSingle();
      if (this.tag == null) {
        throw new NoTagFound("");
      }
    }
    this.scanner.setDefaultAccessPassword(getAccessPwd());
  }
  
  private void clearAll()
  {
    this.tag = null;
    this.etEpc.setText("");
    this.etKPwd.setText("");
    this.etAPwd.setText("");
    this.etTid.setText("");
    this.etUser.setText("");
  }
  
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
  
  private void markReadFieldError(final EditText paramEditText)
  {
    this.context.runOnUiThread(new Runnable()
    {
      public void run()
      {
        paramEditText.setText("");
        paramEditText.setBackgroundResource(2130837577);
      }
    });
  }
  
  private void markReadFieldSuccess(final EditText paramEditText, final String paramString)
  {
    this.context.runOnUiThread(new Runnable()
    {
      public void run()
      {
        paramEditText.setText(paramString);
        paramEditText.setBackgroundResource(2130837578);
        UIHelper.flashingView(paramEditText);
      }
    });
  }
  
  private void markWriteFieldError(final EditText paramEditText)
  {
    this.context.runOnUiThread(new Runnable()
    {
      public void run()
      {
        paramEditText.setBackgroundResource(2130837577);
      }
    });
  }
  
  private void markWriteFieldSuccess(final EditText paramEditText)
  {
    this.context.runOnUiThread(new Runnable()
    {
      public void run()
      {
        paramEditText.setBackgroundResource(2130837578);
        UIHelper.flashingView(paramEditText);
      }
    });
  }
  
  public static BasicAccessFragment newInstance(TagScanner paramTagScanner)
  {
    BasicAccessFragment localBasicAccessFragment = new BasicAccessFragment();
    localBasicAccessFragment.scanner = paramTagScanner;
    return localBasicAccessFragment;
  }
  
  private boolean readAPwd()
    throws BasicAccessFragment.NoTagFound
  {
    try
    {
      checkForTag();
      RFIDResult localRFIDResult = this.tag.readAccessPwd();
      if (!localRFIDResult.isSuccess())
      {
        markReadFieldError(this.etAPwd);
        return false;
      }
      markReadFieldSuccess(this.etAPwd, (String)localRFIDResult.getData());
      return true;
    }
    catch (ReaderException localReaderException)
    {
      markReadFieldError(this.etAPwd);
      Log.e("AlienRFID-Basic Access", "Error reading access password: " + localReaderException);
      localReaderException.printStackTrace();
    }
    return false;
  }
  
  private void readAll()
  {
    TaskRunner.runTask(this.context, "Reading all fields...", new Runnable()
    {
      public void run()
      {
        try
        {
          boolean bool1 = BasicAccessFragment.this.readEpc();
          boolean bool2 = BasicAccessFragment.this.readKPwd();
          boolean bool3 = BasicAccessFragment.this.readAPwd();
          boolean bool4 = BasicAccessFragment.this.readTid();
          boolean bool5 = BasicAccessFragment.this.readUser();
          if ((bool1) && (bool2) && (bool3) && (bool3) && (bool4) && (bool5))
          {
            Sound.playSuccess(BasicAccessFragment.this.context);
            return;
          }
          Sound.playError(BasicAccessFragment.this.context);
          return;
        }
        catch (BasicAccessFragment.NoTagFound localNoTagFound)
        {
          Sound.playError(BasicAccessFragment.this.context);
        }
      }
    });
  }
  
  private boolean readEpc()
    throws BasicAccessFragment.NoTagFound
  {
    try
    {
      this.tag = null;
      checkForTag();
      markReadFieldSuccess(this.etEpc, this.tag.getEPC());
      return true;
    }
    catch (NoTagFound localNoTagFound)
    {
      markReadFieldError(this.etEpc);
      Log.e("AlienRFID-Basic Access", "Error reading tag: " + localNoTagFound);
      localNoTagFound.printStackTrace();
      throw localNoTagFound;
    }
  }
  
  private boolean readKPwd()
    throws BasicAccessFragment.NoTagFound
  {
    try
    {
      checkForTag();
      RFIDResult localRFIDResult = this.tag.readKillPwd();
      if (!localRFIDResult.isSuccess())
      {
        markReadFieldError(this.etKPwd);
        return false;
      }
      markReadFieldSuccess(this.etKPwd, (String)localRFIDResult.getData());
      return true;
    }
    catch (ReaderException localReaderException)
    {
      markReadFieldError(this.etKPwd);
      Log.e("AlienRFID-Basic Access", "Error reading kill password: " + localReaderException);
      localReaderException.printStackTrace();
    }
    return false;
  }
  
  private boolean readTid()
    throws BasicAccessFragment.NoTagFound
  {
    try
    {
      checkForTag();
      RFIDResult localRFIDResult = this.tag.readTID();
      if (!localRFIDResult.isSuccess())
      {
        markReadFieldError(this.etTid);
        return false;
      }
      markReadFieldSuccess(this.etTid, (String)localRFIDResult.getData());
      return true;
    }
    catch (ReaderException localReaderException)
    {
      markReadFieldError(this.etTid);
      Log.e("AlienRFID-Basic Access", "Error reading tid: " + localReaderException);
      localReaderException.printStackTrace();
    }
    return false;
  }
  
  private boolean readUser()
    throws BasicAccessFragment.NoTagFound
  {
    try
    {
      checkForTag();
      RFIDResult localRFIDResult = this.tag.readUser();
      if (!localRFIDResult.isSuccess())
      {
        markReadFieldError(this.etUser);
        return false;
      }
      markReadFieldSuccess(this.etUser, (String)localRFIDResult.getData());
      return true;
    }
    catch (ReaderException localReaderException)
    {
      markReadFieldError(this.etUser);
      Log.e("AlienRFID-Basic Access", "Error reading user: " + localReaderException);
      localReaderException.printStackTrace();
    }
    return false;
  }
  
  private void setupEvents()
  {
    this.btnMask.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        BasicAccessFragment.this.configureMask();
      }
    });
    this.btnReadAll.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        BasicAccessFragment.this.readAll();
      }
    });
    this.btnClearAll.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        BasicAccessFragment.this.clearAll();
      }
    });
    this.btnReadKPwd.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        TaskRunner.runTask(BasicAccessFragment.this.context, "Read field...", new Runnable()
        {
          public void run()
          {
            try
            {
              if (BasicAccessFragment.this.readKPwd())
              {
                Sound.playSuccess(BasicAccessFragment.this.context);
                return;
              }
              Sound.playError(BasicAccessFragment.this.context);
              return;
            }
            catch (BasicAccessFragment.NoTagFound localNoTagFound)
            {
              Sound.playError(BasicAccessFragment.this.context);
            }
          }
        });
      }
    });
    this.btnWriteKPwd.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        TaskRunner.runTask(BasicAccessFragment.this.context, "Write field...", new Runnable()
        {
          public void run()
          {
            try
            {
              if (BasicAccessFragment.this.etKPwd.getText().toString().isEmpty()) {
                return;
              }
              if (BasicAccessFragment.this.writeKPwd())
              {
                Sound.playSuccess(BasicAccessFragment.this.context);
                return;
              }
            }
            catch (BasicAccessFragment.NoTagFound localNoTagFound)
            {
              Sound.playError(BasicAccessFragment.this.context);
              return;
            }
            Sound.playError(BasicAccessFragment.this.context);
          }
        });
      }
    });
    this.btnReadAPwd.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        TaskRunner.runTask(BasicAccessFragment.this.context, "Reading field...", new Runnable()
        {
          public void run()
          {
            try
            {
              if (BasicAccessFragment.this.readAPwd())
              {
                Sound.playSuccess(BasicAccessFragment.this.context);
                return;
              }
              Sound.playError(BasicAccessFragment.this.context);
              return;
            }
            catch (BasicAccessFragment.NoTagFound localNoTagFound)
            {
              Sound.playError(BasicAccessFragment.this.context);
            }
          }
        });
      }
    });
    this.btnWriteAPwd.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        TaskRunner.runTask(BasicAccessFragment.this.context, "Write field...", new Runnable()
        {
          public void run()
          {
            try
            {
              if (BasicAccessFragment.this.etAPwd.getText().toString().isEmpty()) {
                return;
              }
              if (BasicAccessFragment.this.writeAPwd())
              {
                Sound.playSuccess(BasicAccessFragment.this.context);
                return;
              }
            }
            catch (BasicAccessFragment.NoTagFound localNoTagFound)
            {
              Sound.playError(BasicAccessFragment.this.context);
              return;
            }
            Sound.playError(BasicAccessFragment.this.context);
          }
        });
      }
    });
    this.btnReadEpc.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        TaskRunner.runTask(BasicAccessFragment.this.context, "Read field...", new Runnable()
        {
          public void run()
          {
            try
            {
              if (BasicAccessFragment.this.readEpc())
              {
                Sound.playSuccess(BasicAccessFragment.this.context);
                return;
              }
              Sound.playError(BasicAccessFragment.this.context);
              return;
            }
            catch (BasicAccessFragment.NoTagFound localNoTagFound)
            {
              Sound.playError(BasicAccessFragment.this.context);
            }
          }
        });
      }
    });
    this.btnWriteEpc.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        TaskRunner.runTask(BasicAccessFragment.this.context, "Write field...", new Runnable()
        {
          public void run()
          {
            try
            {
              if (BasicAccessFragment.this.etEpc.getText().toString().isEmpty()) {
                return;
              }
              if (BasicAccessFragment.this.writeEpc())
              {
                Sound.playSuccess(BasicAccessFragment.this.context);
                return;
              }
            }
            catch (BasicAccessFragment.NoTagFound localNoTagFound)
            {
              Sound.playError(BasicAccessFragment.this.context);
              return;
            }
            Sound.playError(BasicAccessFragment.this.context);
          }
        });
      }
    });
    this.btnReadTid.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        TaskRunner.runTask(BasicAccessFragment.this.context, "Read field...", new Runnable()
        {
          public void run()
          {
            try
            {
              if (BasicAccessFragment.this.readTid())
              {
                Sound.playSuccess(BasicAccessFragment.this.context);
                return;
              }
              Sound.playError(BasicAccessFragment.this.context);
              return;
            }
            catch (BasicAccessFragment.NoTagFound localNoTagFound)
            {
              Sound.playError(BasicAccessFragment.this.context);
            }
          }
        });
      }
    });
    this.btnReadUser.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        TaskRunner.runTask(BasicAccessFragment.this.context, "Read field...", new Runnable()
        {
          public void run()
          {
            try
            {
              if (BasicAccessFragment.this.readUser())
              {
                Sound.playSuccess(BasicAccessFragment.this.context);
                return;
              }
              Sound.playError(BasicAccessFragment.this.context);
              return;
            }
            catch (BasicAccessFragment.NoTagFound localNoTagFound)
            {
              Sound.playError(BasicAccessFragment.this.context);
            }
          }
        });
      }
    });
    this.btnWriteUser.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        TaskRunner.runTask(BasicAccessFragment.this.context, "Write field...", new Runnable()
        {
          public void run()
          {
            try
            {
              if (BasicAccessFragment.this.etUser.getText().toString().isEmpty()) {
                return;
              }
              if (BasicAccessFragment.this.writeUser())
              {
                Sound.playSuccess(BasicAccessFragment.this.context);
                return;
              }
            }
            catch (BasicAccessFragment.NoTagFound localNoTagFound)
            {
              Sound.playError(BasicAccessFragment.this.context);
              return;
            }
            Sound.playError(BasicAccessFragment.this.context);
          }
        });
      }
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
  
  private boolean writeAPwd()
    throws BasicAccessFragment.NoTagFound
  {
    try
    {
      if (this.etAPwd.getText().toString().isEmpty()) {
        return false;
      }
      checkForTag();
      String str = this.etAPwd.getText().toString();
      if (!this.tag.writeAccessPwd(str).isSuccess())
      {
        markWriteFieldError(this.etAPwd);
        return false;
      }
    }
    catch (ReaderException localReaderException)
    {
      markWriteFieldError(this.etAPwd);
      Log.e("AlienRFID-Basic Access", "Error writing access password: " + localReaderException);
      localReaderException.printStackTrace();
      return false;
    }
    markWriteFieldSuccess(this.etAPwd);
    return true;
  }
  
  private boolean writeEpc()
    throws BasicAccessFragment.NoTagFound
  {
    try
    {
      if (this.etEpc.getText().toString().isEmpty()) {
        return false;
      }
      checkForTag();
      if (!this.tag.writeEPC(this.etEpc.getText().toString()).isSuccess())
      {
        markWriteFieldError(this.etEpc);
        return false;
      }
    }
    catch (ReaderException localReaderException)
    {
      markWriteFieldError(this.etEpc);
      Log.e("AlienRFID-Basic Access", "Error writing epc: " + localReaderException);
      localReaderException.printStackTrace();
      return false;
    }
    markWriteFieldSuccess(this.etEpc);
    return true;
  }
  
  private boolean writeKPwd()
    throws BasicAccessFragment.NoTagFound
  {
    try
    {
      if (this.etKPwd.getText().toString().isEmpty()) {
        return false;
      }
      checkForTag();
      String str = this.etKPwd.getText().toString();
      if (!this.tag.writeKillPwd(str).isSuccess())
      {
        markWriteFieldError(this.etKPwd);
        return false;
      }
    }
    catch (ReaderException localReaderException)
    {
      markWriteFieldError(this.etKPwd);
      Log.e("AlienRFID-Basic Access", "Error writing kill password: " + localReaderException);
      localReaderException.printStackTrace();
      return false;
    }
    markWriteFieldSuccess(this.etKPwd);
    return true;
  }
  
  private boolean writeUser()
    throws BasicAccessFragment.NoTagFound
  {
    try
    {
      if (this.etUser.getText().toString().isEmpty()) {
        return false;
      }
      if (!this.tag.writeUser(this.etUser.getText().toString()).isSuccess())
      {
        markWriteFieldError(this.etUser);
        return false;
      }
    }
    catch (ReaderException localReaderException)
    {
      markWriteFieldError(this.etUser);
      Log.e("AlienRFID-Basic Access", "Error writing user: " + localReaderException);
      localReaderException.printStackTrace();
      return false;
    }
    markWriteFieldSuccess(this.etUser);
    return true;
  }
  
  public void onActivityCreated(Bundle paramBundle)
  {
    super.onActivityCreated(paramBundle);
    this.context = getActivity();
    this.txtMaskEpc = ((TextView)this.context.findViewById(2131493046));
    this.btnMask = ((Button)this.context.findViewById(2131493045));
    this.btnReadAll = ((Button)this.context.findViewById(2131493047));
    this.btnClearAll = ((Button)this.context.findViewById(2131493048));
    this.btnReadKPwd = ((ImageButton)this.context.findViewById(2131493051));
    this.btnWriteKPwd = ((ImageButton)this.context.findViewById(2131493052));
    this.btnReadAPwd = ((ImageButton)this.context.findViewById(2131493054));
    this.btnWriteAPwd = ((ImageButton)this.context.findViewById(2131493055));
    this.btnReadEpc = ((ImageButton)this.context.findViewById(2131493057));
    this.btnWriteEpc = ((ImageButton)this.context.findViewById(2131493058));
    this.btnReadTid = ((ImageButton)this.context.findViewById(2131493060));
    this.btnReadUser = ((ImageButton)this.context.findViewById(2131493062));
    this.btnWriteUser = ((ImageButton)this.context.findViewById(2131493063));
    this.etPassword = ((EditText)this.context.findViewById(2131493049));
    this.etKPwd = ((EditText)this.context.findViewById(2131493050));
    this.etAPwd = ((EditText)this.context.findViewById(2131493053));
    this.etEpc = ((EditText)this.context.findViewById(2131493056));
    this.etTid = ((EditText)this.context.findViewById(2131493059));
    this.etTid.setFocusable(false);
    this.etUser = ((EditText)this.context.findViewById(2131493061));
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
        clearAll();
        updateMask();
      }
    }
  }
  
  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    return paramLayoutInflater.inflate(2130903090, paramViewGroup, false);
  }
  
  public void onKeyDown(int paramInt, KeyEvent paramKeyEvent)
  {
    if ((paramInt == 139) && (paramKeyEvent.getRepeatCount() == 0))
    {
      readAll();
      return;
    }
    super.onKeyDown(paramInt, paramKeyEvent);
  }
  
  public void onResume()
  {
    super.onResume();
    updateMask();
  }
  
  class NoTagFound
    extends Exception
  {
    NoTagFound(String paramString)
    {
      super();
    }
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\alien\demo\feature\tagaccess\BasicAccessFragment.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */