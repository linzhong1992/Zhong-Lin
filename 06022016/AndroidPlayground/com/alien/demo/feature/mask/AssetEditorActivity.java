package com.alien.demo.feature.mask;

import android.app.ActionBar;
import android.app.Activity;
import android.content.ContentResolver;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.Bundle;
import android.util.Log;
import android.view.ContextMenu;
import android.view.ContextMenu.ContextMenuInfo;
import android.view.KeyEvent;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.Window;
import android.view.inputmethod.InputMethodManager;
import android.widget.EditText;
import android.widget.ImageView;
import com.alien.barcode.BarcodeCallback;
import com.alien.barcode.BarcodeReader;
import com.alien.demo.data.Asset;
import com.alien.demo.rfid.TagScanner;
import com.alien.demo.system.Sound;
import com.alien.demo.uibase.UIHelper;
import com.alien.rfid.Tag;
import java.io.IOException;
import java.io.InputStream;

public class AssetEditorActivity
  extends Activity
{
  private static final String TAG = "AlienRFID-Asset Edit";
  private Asset asset;
  private BarcodeReader barcodeReader;
  private View dummy;
  private EditText etBarcode;
  private EditText etEpc;
  private ImageView ivPhoto;
  private TagScanner tagScanner;
  
  private void clearPhoto()
  {
    this.ivPhoto.setImageResource(17170445);
    this.asset.clearImage();
  }
  
  private void hideKeyboard()
  {
    View localView = getCurrentFocus();
    if (localView != null) {
      ((InputMethodManager)getSystemService("input_method")).hideSoftInputFromWindow(localView.getWindowToken(), 0);
    }
  }
  
  private void loadPhoto(InputStream paramInputStream)
    throws IOException
  {
    byte[] arrayOfByte = new byte[paramInputStream.available()];
    paramInputStream.read(arrayOfByte);
    paramInputStream.close();
    this.asset.setImage(arrayOfByte);
    loadPhotoForView(arrayOfByte);
    nextFocus();
  }
  
  private void loadPhotoForView(byte[] paramArrayOfByte)
  {
    if (paramArrayOfByte == null) {
      return;
    }
    paramArrayOfByte = BitmapFactory.decodeByteArray(paramArrayOfByte, 0, paramArrayOfByte.length);
    int i = paramArrayOfByte.getWidth();
    int j = paramArrayOfByte.getHeight();
    if (i < j) {}
    for (;;)
    {
      this.ivPhoto.setImageBitmap(Bitmap.createBitmap(paramArrayOfByte, 0, 0, i, i));
      return;
      i = j;
    }
  }
  
  private void nextFocus()
  {
    if (this.etEpc.getText().toString().isEmpty()) {
      this.etEpc.requestFocus();
    }
    for (;;)
    {
      hideKeyboard();
      return;
      if (this.etBarcode.getText().toString().isEmpty()) {
        this.etBarcode.requestFocus();
      } else if (this.asset.getImage() == null) {
        this.ivPhoto.requestFocus();
      } else {
        this.dummy.requestFocus();
      }
    }
  }
  
  private void scanBarcode()
  {
    if (this.barcodeReader.isRunning()) {
      return;
    }
    this.barcodeReader.start(new BarcodeCallback()
    {
      public void onBarcodeRead(String paramAnonymousString)
      {
        AssetEditorActivity.this.etBarcode.setText(paramAnonymousString);
        Sound.playSuccess(AssetEditorActivity.this);
        AssetEditorActivity.this.nextFocus();
      }
    });
  }
  
  private void scanEpc()
  {
    Tag localTag = this.tagScanner.scanSingle();
    if (localTag != null)
    {
      this.etEpc.setText(localTag.getEPC());
      Sound.playSuccess(this);
      nextFocus();
      return;
    }
    Sound.playError(this);
  }
  
  private void selectPhoto()
  {
    Intent localIntent = new Intent("android.intent.action.GET_CONTENT");
    localIntent.setType("image/*");
    startActivityForResult(localIntent, 3);
  }
  
  public void onActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    super.onActivityResult(paramInt1, paramInt2, paramIntent);
    if ((paramInt1 != 3) || (paramInt2 != -1) || (paramIntent == null)) {
      return;
    }
    try
    {
      loadPhoto(getContentResolver().openInputStream(paramIntent.getData()));
      return;
    }
    catch (Exception paramIntent)
    {
      Log.e("AlienRFID-Asset Edit", "Error loading photo: " + paramIntent);
      paramIntent.printStackTrace();
      UIHelper.ToastMessage(this, 2131034188);
    }
  }
  
  public void onClickCancel(View paramView)
  {
    finish();
  }
  
  public void onClickSave(View paramView)
  {
    this.asset.setEpc(this.etEpc.getText().toString().trim());
    this.asset.setBarcode(this.etBarcode.getText().toString().trim());
    paramView = new Intent();
    paramView.putExtra("asset_data", this.asset.toString());
    setResult(-1, paramView);
    finish();
  }
  
  public boolean onContextItemSelected(MenuItem paramMenuItem)
  {
    switch (paramMenuItem.getItemId())
    {
    default: 
      return super.onContextItemSelected(paramMenuItem);
    case 2131493109: 
      selectPhoto();
      return true;
    }
    clearPhoto();
    return true;
  }
  
  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    setContentView(2130903065);
    getActionBar().setDisplayHomeAsUpEnabled(true);
    getWindow().addFlags(128);
    getWindow().setSoftInputMode(3);
    if (getIntent().hasExtra("asset_data")) {}
    for (this.asset = Asset.loadFromString(getIntent().getStringExtra("asset_data"));; this.asset = new Asset())
    {
      this.etEpc = ((EditText)findViewById(2131492972));
      this.etBarcode = ((EditText)findViewById(2131492973));
      this.ivPhoto = ((ImageView)findViewById(2131492974));
      this.ivPhoto.setOnClickListener(new View.OnClickListener()
      {
        public void onClick(View paramAnonymousView)
        {
          AssetEditorActivity.this.selectPhoto();
        }
      });
      registerForContextMenu(this.ivPhoto);
      this.dummy = findViewById(2131492969);
      this.barcodeReader = new BarcodeReader(this);
      this.tagScanner = new TagScanner(null);
      this.etEpc.setText(this.asset.getEpc());
      this.etBarcode.setText(this.asset.getBarcode());
      loadPhotoForView(this.asset.getImage());
      nextFocus();
      return;
    }
  }
  
  public void onCreateContextMenu(ContextMenu paramContextMenu, View paramView, ContextMenu.ContextMenuInfo paramContextMenuInfo)
  {
    super.onCreateContextMenu(paramContextMenu, paramView, paramContextMenuInfo);
    if (paramView.getId() == 2131492974) {
      getMenuInflater().inflate(2131558401, paramContextMenu);
    }
  }
  
  public boolean onCreateOptionsMenu(Menu paramMenu)
  {
    getMenuInflater().inflate(2131558400, paramMenu);
    return true;
  }
  
  public boolean onKeyDown(int paramInt, KeyEvent paramKeyEvent)
  {
    if ((paramInt == 139) && (paramKeyEvent.getRepeatCount() == 0))
    {
      hideKeyboard();
      scan();
      return true;
    }
    return super.onKeyDown(paramInt, paramKeyEvent);
  }
  
  public boolean onKeyUp(int paramInt, KeyEvent paramKeyEvent)
  {
    if (paramInt == 139)
    {
      stopScan();
      return true;
    }
    return super.onKeyUp(paramInt, paramKeyEvent);
  }
  
  public boolean onOptionsItemSelected(MenuItem paramMenuItem)
  {
    switch (paramMenuItem.getItemId())
    {
    default: 
      return super.onOptionsItemSelected(paramMenuItem);
    }
    onBackPressed();
    return true;
  }
  
  public void scan()
  {
    if (this.etEpc.isFocused()) {
      scanEpc();
    }
    do
    {
      return;
      if (this.etBarcode.isFocused())
      {
        scanBarcode();
        return;
      }
    } while (!this.ivPhoto.isFocused());
    selectPhoto();
  }
  
  public void stopScan()
  {
    try
    {
      this.barcodeReader.stop();
      return;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\alien\demo\feature\mask\AssetEditorActivity.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */