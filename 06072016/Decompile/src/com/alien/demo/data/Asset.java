package com.alien.demo.data;

import android.util.*;
import android.graphics.*;

public class Asset
{
    private String barcode;
    private Bitmap bm;
    private String epc;
    private byte[] image;
    
    public Asset() {
        this.epc = "";
        this.barcode = "";
    }
    
    public Asset(final String s, final String s2, final String s3) {
        byte[] decode;
        if (s3.length() > 0) {
            decode = Base64.decode(s3, 0);
        }
        else {
            decode = null;
        }
        this(s, s2, decode);
    }
    
    public Asset(final String epc, final String barcode, final byte[] image) {
        this.epc = "";
        this.barcode = "";
        this.epc = epc;
        this.barcode = barcode;
        this.setImage(image);
    }
    
    public static Asset loadFromString(String trim) {
        final String[] split = trim.split(",");
        if (split.length > 0) {
            trim = split[0].trim();
        }
        else {
            trim = "";
        }
        String trim2;
        if (split.length > 1) {
            trim2 = split[1].trim();
        }
        else {
            trim2 = "";
        }
        String trim3;
        if (split.length > 2) {
            trim3 = split[2].trim();
        }
        else {
            trim3 = "";
        }
        return new Asset(trim, trim2, trim3);
    }
    
    public void clearImage() {
        this.bm = null;
        this.image = null;
    }
    
    public String getBarcode() {
        return this.barcode;
    }
    
    public Bitmap getBitmap() {
        return this.bm;
    }
    
    public String getEpc() {
        return this.epc;
    }
    
    public byte[] getImage() {
        return this.image;
    }
    
    public Bitmap getResizedBitmap(final Bitmap bitmap, final int n, final int n2) {
        final int width = bitmap.getWidth();
        final int height = bitmap.getHeight();
        final float n3 = n / width;
        final float n4 = n2 / height;
        final Matrix matrix = new Matrix();
        matrix.postScale(n3, n4);
        final Bitmap bitmap2 = Bitmap.createBitmap(bitmap, 0, 0, width, height, matrix, false);
        bitmap.recycle();
        return bitmap2;
    }
    
    public void setBarcode(final String barcode) {
        this.barcode = barcode;
    }
    
    public void setEpc(final String epc) {
        this.epc = epc;
    }
    
    public void setImage(final String s) {
        this.image = Base64.decode(s, 0);
    }
    
    public void setImage(final byte[] image) {
        if (image == null) {
            this.image = null;
            this.bm = null;
            return;
        }
        this.image = image;
        final Bitmap decodeByteArray = BitmapFactory.decodeByteArray(image, 0, image.length);
        int width = decodeByteArray.getWidth();
        final int height = decodeByteArray.getHeight();
        if (width >= height) {
            width = height;
        }
        this.bm = Bitmap.createBitmap(decodeByteArray, 0, 0, width, width);
    }
    
    @Override
    public String toString() {
        final StringBuilder append = new StringBuilder().append(this.epc).append(",").append(this.barcode).append(",");
        String encodeToString;
        if (this.image != null) {
            encodeToString = Base64.encodeToString(this.image, 3);
        }
        else {
            encodeToString = "";
        }
        return append.append(encodeToString).toString();
    }
}
