package com.lamerman;

import android.view.inputmethod.*;
import java.io.*;
import java.util.*;
import android.os.*;
import android.view.*;
import android.widget.*;
import android.app.*;
import android.content.*;

public class FileDialog extends ListActivity
{
    public static final String CAN_SELECT_DIR = "CAN_SELECT_DIR";
    public static final String FORMAT_FILTER = "FORMAT_FILTER";
    private static final String ITEM_IMAGE = "image";
    private static final String ITEM_KEY = "key";
    public static final String RESULT_PATH = "RESULT_PATH";
    private static final String ROOT = "/";
    public static final String SELECTION_MODE = "SELECTION_MODE";
    public static final String START_PATH = "START_PATH";
    private boolean canSelectDir;
    private String currentPath;
    private String[] formatFilter;
    private InputMethodManager inputManager;
    private HashMap<String, Integer> lastPositions;
    private LinearLayout layoutCreate;
    private LinearLayout layoutSelect;
    private EditText mFileName;
    private ArrayList<HashMap<String, Object>> mList;
    private TextView myPath;
    private String parentPath;
    private List<String> path;
    private Button selectButton;
    private File selectedFile;
    private int selectionMode;
    
    public FileDialog() {
        this.path = null;
        this.currentPath = "/";
        this.selectionMode = 0;
        this.formatFilter = null;
        this.canSelectDir = false;
        this.lastPositions = new HashMap<String, Integer>();
    }
    
    private void addItem(final String s, final int n) {
        final HashMap<String, Integer> hashMap = new HashMap<String, Integer>();
        hashMap.put("key", (Integer)s);
        hashMap.put("image", n);
        this.mList.add((HashMap<String, Object>)hashMap);
    }
    
    private void getDir(final String s) {
        boolean b;
        if (s.length() < this.currentPath.length()) {
            b = true;
        }
        else {
            b = false;
        }
        final Integer n = this.lastPositions.get(this.parentPath);
        this.getDirImpl(s);
        if (n != null && b) {
            this.getListView().setSelection((int)n);
        }
    }
    
    private void getDirImpl(final String currentPath) {
        this.currentPath = currentPath;
        final ArrayList<String> list = new ArrayList<String>();
        this.path = new ArrayList<String>();
        this.mList = new ArrayList<HashMap<String, Object>>();
        File file = new File(this.currentPath);
        File[] array;
        if ((array = file.listFiles()) == null) {
            this.currentPath = "/";
            file = new File(this.currentPath);
            array = file.listFiles();
        }
        this.myPath.setText((CharSequence)((Object)this.getText(R.string.location) + ": " + this.currentPath));
        if (!this.currentPath.equals("/")) {
            list.add("/");
            this.addItem("/", R.drawable.folder);
            this.path.add("/");
            list.add("../");
            this.addItem("../", R.drawable.folder);
            this.path.add(file.getParent());
            this.parentPath = file.getParent();
        }
        final TreeMap<String, String> treeMap = new TreeMap<String, String>();
        final TreeMap<String, String> treeMap2 = new TreeMap<String, String>();
        final TreeMap<String, String> treeMap3 = new TreeMap<String, String>();
        final TreeMap<String, String> treeMap4 = new TreeMap<String, String>();
        for (int length = array.length, i = 0; i < length; ++i) {
            final File file2 = array[i];
            if (file2.isDirectory()) {
                final String name = file2.getName();
                treeMap.put(name, name);
                treeMap2.put(name, file2.getPath());
            }
            else {
                final String name2 = file2.getName();
                final String lowerCase = name2.toLowerCase();
                if (this.formatFilter != null) {
                    final boolean b = false;
                    int n = 0;
                    boolean b2;
                    while (true) {
                        b2 = b;
                        if (n >= this.formatFilter.length) {
                            break;
                        }
                        if (lowerCase.endsWith(this.formatFilter[n].toLowerCase())) {
                            b2 = true;
                            break;
                        }
                        ++n;
                    }
                    if (b2) {
                        treeMap3.put(name2, name2);
                        treeMap4.put(name2, file2.getPath());
                    }
                }
                else {
                    treeMap3.put(name2, name2);
                    treeMap4.put(name2, file2.getPath());
                }
            }
        }
        list.addAll((Collection<?>)treeMap.tailMap("").values());
        list.addAll((Collection<?>)treeMap3.tailMap("").values());
        this.path.addAll(treeMap2.tailMap("").values());
        this.path.addAll(treeMap4.tailMap("").values());
        final SimpleAdapter listAdapter = new SimpleAdapter((Context)this, (List)this.mList, R.layout.file_dialog_row, new String[] { "key", "image" }, new int[] { R.id.fdrowtext, R.id.fdrowimage });
        final Iterator<String> iterator = treeMap.tailMap("").values().iterator();
        while (iterator.hasNext()) {
            this.addItem(iterator.next(), R.drawable.folder);
        }
        final Iterator<String> iterator2 = treeMap3.tailMap("").values().iterator();
        while (iterator2.hasNext()) {
            this.addItem(iterator2.next(), R.drawable.file);
        }
        listAdapter.notifyDataSetChanged();
        this.setListAdapter((ListAdapter)listAdapter);
    }
    
    private void setCreateVisible(final View view) {
        this.layoutCreate.setVisibility(0);
        this.layoutSelect.setVisibility(8);
        this.inputManager.hideSoftInputFromWindow(view.getWindowToken(), 0);
        this.selectButton.setEnabled(false);
    }
    
    private void setSelectVisible(final View view) {
        this.layoutCreate.setVisibility(8);
        this.layoutSelect.setVisibility(0);
        this.inputManager.hideSoftInputFromWindow(view.getWindowToken(), 0);
        this.selectButton.setEnabled(false);
    }
    
    public void onCreate(final Bundle bundle) {
        super.onCreate(bundle);
        this.setResult(0, this.getIntent());
        this.setContentView(R.layout.file_dialog_main);
        this.myPath = (TextView)this.findViewById(R.id.path);
        this.mFileName = (EditText)this.findViewById(R.id.fdEditTextFile);
        this.inputManager = (InputMethodManager)this.getSystemService("input_method");
        (this.selectButton = (Button)this.findViewById(R.id.fdButtonSelect)).setEnabled(false);
        this.selectButton.setOnClickListener((View$OnClickListener)new View$OnClickListener() {
            public void onClick(final View view) {
                if (FileDialog.this.selectedFile != null) {
                    FileDialog.this.getIntent().putExtra("RESULT_PATH", FileDialog.this.selectedFile.getPath());
                    FileDialog.this.setResult(-1, FileDialog.this.getIntent());
                    FileDialog.this.finish();
                }
            }
        });
        final Button button = (Button)this.findViewById(R.id.fdButtonNew);
        button.setOnClickListener((View$OnClickListener)new View$OnClickListener() {
            public void onClick(final View view) {
                FileDialog.this.setCreateVisible(view);
                FileDialog.this.mFileName.setText((CharSequence)"");
                FileDialog.this.mFileName.requestFocus();
            }
        });
        this.selectionMode = this.getIntent().getIntExtra("SELECTION_MODE", 0);
        this.formatFilter = this.getIntent().getStringArrayExtra("FORMAT_FILTER");
        this.canSelectDir = this.getIntent().getBooleanExtra("CAN_SELECT_DIR", false);
        if (this.selectionMode == 1) {
            button.setEnabled(false);
        }
        this.layoutSelect = (LinearLayout)this.findViewById(R.id.fdLinearLayoutSelect);
        (this.layoutCreate = (LinearLayout)this.findViewById(R.id.fdLinearLayoutCreate)).setVisibility(8);
        ((Button)this.findViewById(R.id.fdButtonCancel)).setOnClickListener((View$OnClickListener)new View$OnClickListener() {
            public void onClick(final View view) {
                FileDialog.this.setSelectVisible(view);
            }
        });
        ((Button)this.findViewById(R.id.fdButtonCreate)).setOnClickListener((View$OnClickListener)new View$OnClickListener() {
            public void onClick(final View view) {
                if (FileDialog.this.mFileName.getText().length() > 0) {
                    FileDialog.this.getIntent().putExtra("RESULT_PATH", FileDialog.this.currentPath + "/" + FileDialog.this.mFileName.getText());
                    FileDialog.this.setResult(-1, FileDialog.this.getIntent());
                    FileDialog.this.finish();
                }
            }
        });
        String stringExtra = this.getIntent().getStringExtra("START_PATH");
        if (stringExtra == null) {
            stringExtra = "/";
        }
        if (this.canSelectDir) {
            this.selectedFile = new File(stringExtra);
            this.selectButton.setEnabled(true);
        }
        this.getDir(stringExtra);
    }
    
    public boolean onKeyDown(final int n, final KeyEvent keyEvent) {
        if (n == 4) {
            this.selectButton.setEnabled(false);
            if (this.layoutCreate.getVisibility() == 0) {
                this.layoutCreate.setVisibility(8);
                this.layoutSelect.setVisibility(0);
            }
            else {
                if (this.currentPath.equals("/")) {
                    return super.onKeyDown(n, keyEvent);
                }
                this.getDir(this.parentPath);
            }
            return true;
        }
        return super.onKeyDown(n, keyEvent);
    }
    
    protected void onListItemClick(final ListView listView, final View selectVisible, final int n, final long n2) {
        final File file = new File(this.path.get(n));
        this.setSelectVisible(selectVisible);
        if (!file.isDirectory()) {
            this.selectedFile = file;
            selectVisible.setSelected(true);
            this.selectButton.setEnabled(true);
            return;
        }
        this.selectButton.setEnabled(false);
        if (file.canRead()) {
            this.lastPositions.put(this.currentPath, n);
            this.getDir(this.path.get(n));
            if (this.canSelectDir) {
                this.selectedFile = file;
                selectVisible.setSelected(true);
                this.selectButton.setEnabled(true);
            }
            return;
        }
        new AlertDialog$Builder((Context)this).setIcon(R.drawable.icon).setTitle((CharSequence)("[" + file.getName() + "] " + (Object)this.getText(R.string.cant_read_folder))).setPositiveButton((CharSequence)"OK", (DialogInterface$OnClickListener)new DialogInterface$OnClickListener() {
            public void onClick(final DialogInterface dialogInterface, final int n) {
            }
        }).show();
    }
}
