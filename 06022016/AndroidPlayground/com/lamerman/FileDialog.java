package com.lamerman;

import android.app.AlertDialog.Builder;
import android.app.ListActivity;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.Intent;
import android.os.Bundle;
import android.text.Editable;
import android.view.KeyEvent;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.inputmethod.InputMethodManager;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.SimpleAdapter;
import android.widget.TextView;
import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.SortedMap;
import java.util.TreeMap;

public class FileDialog
  extends ListActivity
{
  public static final String CAN_SELECT_DIR = "CAN_SELECT_DIR";
  public static final String FORMAT_FILTER = "FORMAT_FILTER";
  private static final String ITEM_IMAGE = "image";
  private static final String ITEM_KEY = "key";
  public static final String RESULT_PATH = "RESULT_PATH";
  private static final String ROOT = "/";
  public static final String SELECTION_MODE = "SELECTION_MODE";
  public static final String START_PATH = "START_PATH";
  private boolean canSelectDir = false;
  private String currentPath = "/";
  private String[] formatFilter = null;
  private InputMethodManager inputManager;
  private HashMap<String, Integer> lastPositions = new HashMap();
  private LinearLayout layoutCreate;
  private LinearLayout layoutSelect;
  private EditText mFileName;
  private ArrayList<HashMap<String, Object>> mList;
  private TextView myPath;
  private String parentPath;
  private List<String> path = null;
  private Button selectButton;
  private File selectedFile;
  private int selectionMode = 0;
  
  private void addItem(String paramString, int paramInt)
  {
    HashMap localHashMap = new HashMap();
    localHashMap.put("key", paramString);
    localHashMap.put("image", Integer.valueOf(paramInt));
    this.mList.add(localHashMap);
  }
  
  private void getDir(String paramString)
  {
    if (paramString.length() < this.currentPath.length()) {}
    for (int i = 1;; i = 0)
    {
      Integer localInteger = (Integer)this.lastPositions.get(this.parentPath);
      getDirImpl(paramString);
      if ((localInteger != null) && (i != 0)) {
        getListView().setSelection(localInteger.intValue());
      }
      return;
    }
  }
  
  private void getDirImpl(String paramString)
  {
    this.currentPath = paramString;
    ArrayList localArrayList = new ArrayList();
    this.path = new ArrayList();
    this.mList = new ArrayList();
    Object localObject1 = new File(this.currentPath);
    Object localObject2 = ((File)localObject1).listFiles();
    paramString = (String)localObject2;
    if (localObject2 == null)
    {
      this.currentPath = "/";
      localObject1 = new File(this.currentPath);
      paramString = ((File)localObject1).listFiles();
    }
    this.myPath.setText(getText(R.string.location) + ": " + this.currentPath);
    if (!this.currentPath.equals("/"))
    {
      localArrayList.add("/");
      addItem("/", R.drawable.folder);
      this.path.add("/");
      localArrayList.add("../");
      addItem("../", R.drawable.folder);
      this.path.add(((File)localObject1).getParent());
      this.parentPath = ((File)localObject1).getParent();
    }
    localObject2 = new TreeMap();
    TreeMap localTreeMap1 = new TreeMap();
    localObject1 = new TreeMap();
    TreeMap localTreeMap2 = new TreeMap();
    int n = paramString.length;
    int i = 0;
    if (i < n)
    {
      Object localObject3 = paramString[i];
      String str1;
      if (((File)localObject3).isDirectory())
      {
        str1 = ((File)localObject3).getName();
        ((TreeMap)localObject2).put(str1, str1);
        localTreeMap1.put(str1, ((File)localObject3).getPath());
      }
      for (;;)
      {
        i += 1;
        break;
        str1 = ((File)localObject3).getName();
        String str2 = str1.toLowerCase();
        if (this.formatFilter != null)
        {
          int m = 0;
          j = 0;
          for (;;)
          {
            k = m;
            if (j < this.formatFilter.length)
            {
              if (str2.endsWith(this.formatFilter[j].toLowerCase())) {
                k = 1;
              }
            }
            else
            {
              if (k == 0) {
                break;
              }
              ((TreeMap)localObject1).put(str1, str1);
              localTreeMap2.put(str1, ((File)localObject3).getPath());
              break;
            }
            j += 1;
          }
        }
        ((TreeMap)localObject1).put(str1, str1);
        localTreeMap2.put(str1, ((File)localObject3).getPath());
      }
    }
    localArrayList.addAll(((TreeMap)localObject2).tailMap("").values());
    localArrayList.addAll(((TreeMap)localObject1).tailMap("").values());
    this.path.addAll(localTreeMap1.tailMap("").values());
    this.path.addAll(localTreeMap2.tailMap("").values());
    paramString = this.mList;
    i = R.layout.file_dialog_row;
    int j = R.id.fdrowtext;
    int k = R.id.fdrowimage;
    paramString = new SimpleAdapter(this, paramString, i, new String[] { "key", "image" }, new int[] { j, k });
    localObject2 = ((TreeMap)localObject2).tailMap("").values().iterator();
    while (((Iterator)localObject2).hasNext()) {
      addItem((String)((Iterator)localObject2).next(), R.drawable.folder);
    }
    localObject1 = ((TreeMap)localObject1).tailMap("").values().iterator();
    while (((Iterator)localObject1).hasNext()) {
      addItem((String)((Iterator)localObject1).next(), R.drawable.file);
    }
    paramString.notifyDataSetChanged();
    setListAdapter(paramString);
  }
  
  private void setCreateVisible(View paramView)
  {
    this.layoutCreate.setVisibility(0);
    this.layoutSelect.setVisibility(8);
    this.inputManager.hideSoftInputFromWindow(paramView.getWindowToken(), 0);
    this.selectButton.setEnabled(false);
  }
  
  private void setSelectVisible(View paramView)
  {
    this.layoutCreate.setVisibility(8);
    this.layoutSelect.setVisibility(0);
    this.inputManager.hideSoftInputFromWindow(paramView.getWindowToken(), 0);
    this.selectButton.setEnabled(false);
  }
  
  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    setResult(0, getIntent());
    setContentView(R.layout.file_dialog_main);
    this.myPath = ((TextView)findViewById(R.id.path));
    this.mFileName = ((EditText)findViewById(R.id.fdEditTextFile));
    this.inputManager = ((InputMethodManager)getSystemService("input_method"));
    this.selectButton = ((Button)findViewById(R.id.fdButtonSelect));
    this.selectButton.setEnabled(false);
    this.selectButton.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        if (FileDialog.this.selectedFile != null)
        {
          FileDialog.this.getIntent().putExtra("RESULT_PATH", FileDialog.this.selectedFile.getPath());
          FileDialog.this.setResult(-1, FileDialog.this.getIntent());
          FileDialog.this.finish();
        }
      }
    });
    paramBundle = (Button)findViewById(R.id.fdButtonNew);
    paramBundle.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        FileDialog.this.setCreateVisible(paramAnonymousView);
        FileDialog.this.mFileName.setText("");
        FileDialog.this.mFileName.requestFocus();
      }
    });
    this.selectionMode = getIntent().getIntExtra("SELECTION_MODE", 0);
    this.formatFilter = getIntent().getStringArrayExtra("FORMAT_FILTER");
    this.canSelectDir = getIntent().getBooleanExtra("CAN_SELECT_DIR", false);
    if (this.selectionMode == 1) {
      paramBundle.setEnabled(false);
    }
    this.layoutSelect = ((LinearLayout)findViewById(R.id.fdLinearLayoutSelect));
    this.layoutCreate = ((LinearLayout)findViewById(R.id.fdLinearLayoutCreate));
    this.layoutCreate.setVisibility(8);
    ((Button)findViewById(R.id.fdButtonCancel)).setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        FileDialog.this.setSelectVisible(paramAnonymousView);
      }
    });
    ((Button)findViewById(R.id.fdButtonCreate)).setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        if (FileDialog.this.mFileName.getText().length() > 0)
        {
          FileDialog.this.getIntent().putExtra("RESULT_PATH", FileDialog.this.currentPath + "/" + FileDialog.this.mFileName.getText());
          FileDialog.this.setResult(-1, FileDialog.this.getIntent());
          FileDialog.this.finish();
        }
      }
    });
    paramBundle = getIntent().getStringExtra("START_PATH");
    if (paramBundle != null) {}
    for (;;)
    {
      if (this.canSelectDir)
      {
        this.selectedFile = new File(paramBundle);
        this.selectButton.setEnabled(true);
      }
      getDir(paramBundle);
      return;
      paramBundle = "/";
    }
  }
  
  public boolean onKeyDown(int paramInt, KeyEvent paramKeyEvent)
  {
    if (paramInt == 4)
    {
      this.selectButton.setEnabled(false);
      if (this.layoutCreate.getVisibility() == 0)
      {
        this.layoutCreate.setVisibility(8);
        this.layoutSelect.setVisibility(0);
      }
      for (;;)
      {
        return true;
        if (this.currentPath.equals("/")) {
          break;
        }
        getDir(this.parentPath);
      }
      return super.onKeyDown(paramInt, paramKeyEvent);
    }
    return super.onKeyDown(paramInt, paramKeyEvent);
  }
  
  protected void onListItemClick(ListView paramListView, View paramView, int paramInt, long paramLong)
  {
    paramListView = new File((String)this.path.get(paramInt));
    setSelectVisible(paramView);
    if (paramListView.isDirectory())
    {
      this.selectButton.setEnabled(false);
      if (paramListView.canRead())
      {
        this.lastPositions.put(this.currentPath, Integer.valueOf(paramInt));
        getDir((String)this.path.get(paramInt));
        if (this.canSelectDir)
        {
          this.selectedFile = paramListView;
          paramView.setSelected(true);
          this.selectButton.setEnabled(true);
        }
        return;
      }
      new AlertDialog.Builder(this).setIcon(R.drawable.icon).setTitle("[" + paramListView.getName() + "] " + getText(R.string.cant_read_folder)).setPositiveButton("OK", new DialogInterface.OnClickListener()
      {
        public void onClick(DialogInterface paramAnonymousDialogInterface, int paramAnonymousInt) {}
      }).show();
      return;
    }
    this.selectedFile = paramListView;
    paramView.setSelected(true);
    this.selectButton.setEnabled(true);
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\lamerman\FileDialog.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */