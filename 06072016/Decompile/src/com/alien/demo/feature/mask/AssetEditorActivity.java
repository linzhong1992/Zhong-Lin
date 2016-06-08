package com.alien.demo.feature.mask;

import android.app.*;
import com.alien.demo.data.*;
import android.widget.*;
import com.alien.demo.rfid.*;
import android.view.inputmethod.*;
import java.io.*;
import android.graphics.*;
import com.alien.barcode.*;
import com.alien.demo.system.*;
import android.content.*;
import android.util.*;
import com.alien.demo.uibase.*;
import android.os.*;
import com.alien.rfid.*;
import android.view.*;

public class AssetEditorActivity extends Activity
{
    private static final String TAG = "AlienRFID-Asset Edit";
    private Asset asset;
    private BarcodeReader barcodeReader;
    private View dummy;
    private EditText etBarcode;
    private EditText etEpc;
    private ImageView ivPhoto;
    private TagScanner tagScanner;
    
    private void clearPhoto() {
        this.ivPhoto.setImageResource(17170445);
        this.asset.clearImage();
    }
    
    private void hideKeyboard() {
        final View currentFocus = this.getCurrentFocus();
        if (currentFocus != null) {
            ((InputMethodManager)this.getSystemService("input_method")).hideSoftInputFromWindow(currentFocus.getWindowToken(), 0);
        }
    }
    
    private void loadPhoto(final InputStream inputStream) throws IOException {
        final byte[] image = new byte[inputStream.available()];
        inputStream.read(image);
        inputStream.close();
        this.asset.setImage(image);
        this.loadPhotoForView(image);
        this.nextFocus();
    }
    
    private void loadPhotoForView(final byte[] array) {
        if (array == null) {
            return;
        }
        final Bitmap decodeByteArray = BitmapFactory.decodeByteArray(array, 0, array.length);
        int width = decodeByteArray.getWidth();
        final int height = decodeByteArray.getHeight();
        if (width >= height) {
            width = height;
        }
        this.ivPhoto.setImageBitmap(Bitmap.createBitmap(decodeByteArray, 0, 0, width, width));
    }
    
    private void nextFocus() {
        if (this.etEpc.getText().toString().isEmpty()) {
            this.etEpc.requestFocus();
        }
        else if (this.etBarcode.getText().toString().isEmpty()) {
            this.etBarcode.requestFocus();
        }
        else if (this.asset.getImage() == null) {
            this.ivPhoto.requestFocus();
        }
        else {
            this.dummy.requestFocus();
        }
        this.hideKeyboard();
    }
    
    private void scanBarcode() {
        if (this.barcodeReader.isRunning()) {
            return;
        }
        this.barcodeReader.start(new BarcodeCallback() {
            @Override
            public void onBarcodeRead(final String text) {
                AssetEditorActivity.this.etBarcode.setText((CharSequence)text);
                Sound.playSuccess((Context)AssetEditorActivity.this);
                AssetEditorActivity.this.nextFocus();
            }
        });
    }
    
    private void scanEpc() {
        final Tag scanSingle = this.tagScanner.scanSingle();
        if (scanSingle != null) {
            this.etEpc.setText((CharSequence)scanSingle.getEPC());
            Sound.playSuccess((Context)this);
            this.nextFocus();
            return;
        }
        Sound.playError((Context)this);
    }
    
    private void selectPhoto() {
        final Intent intent = new Intent("android.intent.action.GET_CONTENT");
        intent.setType("image/*");
        this.startActivityForResult(intent, 3);
    }
    
    public void onActivityResult(final int n, final int n2, final Intent intent) {
        super.onActivityResult(n, n2, intent);
        if (n != 3 || n2 != -1 || intent == null) {
            return;
        }
        try {
            this.loadPhoto(this.getContentResolver().openInputStream(intent.getData()));
        }
        catch (Exception ex) {
            Log.e("AlienRFID-Asset Edit", "Error loading photo: " + ex);
            ex.printStackTrace();
            UIHelper.ToastMessage((Context)this, 2131034188);
        }
    }
    
    public void onClickCancel(final View view) {
        this.finish();
    }
    
    public void onClickSave(final View view) {
        this.asset.setEpc(this.etEpc.getText().toString().trim());
        this.asset.setBarcode(this.etBarcode.getText().toString().trim());
        final Intent intent = new Intent();
        intent.putExtra("asset_data", this.asset.toString());
        this.setResult(-1, intent);
        this.finish();
    }
    
    public boolean onContextItemSelected(final MenuItem menuItem) {
        switch (menuItem.getItemId()) {
            default: {
                return super.onContextItemSelected(menuItem);
            }
            case 2131493109: {
                this.selectPhoto();
                return true;
            }
            case 2131493110: {
                this.clearPhoto();
                return true;
            }
        }
    }
    
    protected void onCreate(final Bundle bundle) {
        super.onCreate(bundle);
        this.setContentView(2130903065);
        this.getActionBar().setDisplayHomeAsUpEnabled(true);
        this.getWindow().addFlags(128);
        this.getWindow().setSoftInputMode(3);
        if (this.getIntent().hasExtra("asset_data")) {
            this.asset = Asset.loadFromString(this.getIntent().getStringExtra("asset_data"));
        }
        else {
            this.asset = new Asset();
        }
        this.etEpc = (EditText)this.findViewById(2131492972);
        this.etBarcode = (EditText)this.findViewById(2131492973);
        (this.ivPhoto = (ImageView)this.findViewById(2131492974)).setOnClickListener((View$OnClickListener)new View$OnClickListener() {
            public void onClick(final View view) {
                AssetEditorActivity.this.selectPhoto();
            }
        });
        this.registerForContextMenu((View)this.ivPhoto);
        this.dummy = this.findViewById(2131492969);
        this.barcodeReader = new BarcodeReader((Context)this);
        this.tagScanner = new TagScanner(null);
        this.etEpc.setText((CharSequence)this.asset.getEpc());
        this.etBarcode.setText((CharSequence)this.asset.getBarcode());
        this.loadPhotoForView(this.asset.getImage());
        this.nextFocus();
    }
    
    public void onCreateContextMenu(final ContextMenu contextMenu, final View view, final ContextMenu$ContextMenuInfo contextMenu$ContextMenuInfo) {
        super.onCreateContextMenu(contextMenu, view, contextMenu$ContextMenuInfo);
        if (view.getId() == 2131492974) {
            this.getMenuInflater().inflate(2131558401, (Menu)contextMenu);
        }
    }
    
    public boolean onCreateOptionsMenu(final Menu menu) {
        this.getMenuInflater().inflate(2131558400, menu);
        return true;
    }
    
    public boolean onKeyDown(final int n, final KeyEvent keyEvent) {
        if (n == 139 && keyEvent.getRepeatCount() == 0) {
            this.hideKeyboard();
            this.scan();
            return true;
        }
        return super.onKeyDown(n, keyEvent);
    }
    
    public boolean onKeyUp(final int n, final KeyEvent keyEvent) {
        if (n == 139) {
            this.stopScan();
            return true;
        }
        return super.onKeyUp(n, keyEvent);
    }
    
    public boolean onOptionsItemSelected(final MenuItem menuItem) {
        switch (menuItem.getItemId()) {
            default: {
                return super.onOptionsItemSelected(menuItem);
            }
            case 16908332: {
                this.onBackPressed();
                return true;
            }
        }
    }
    
    public void scan() {
        if (this.etEpc.isFocused()) {
            this.scanEpc();
        }
        else {
            if (this.etBarcode.isFocused()) {
                this.scanBarcode();
                return;
            }
            if (this.ivPhoto.isFocused()) {
                this.selectPhoto();
            }
        }
    }
    
    public void stopScan() {
        synchronized (this) {
            this.barcodeReader.stop();
        }
    }
}
