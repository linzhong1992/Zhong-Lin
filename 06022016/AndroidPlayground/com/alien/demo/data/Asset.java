package com.alien.demo.data;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Matrix;
import android.util.Base64;

public class Asset
{
  private String barcode = "";
  private Bitmap bm;
  private String epc = "";
  private byte[] image;
  
  public Asset() {}
  
  public Asset(String paramString1, String paramString2, String paramString3) {}
  
  public Asset(String paramString1, String paramString2, byte[] paramArrayOfByte)
  {
    this.epc = paramString1;
    this.barcode = paramString2;
    setImage(paramArrayOfByte);
  }
  
  public static Asset loadFromString(String paramString)
  {
    Object localObject = paramString.split(",");
    String str;
    if (localObject.length > 0)
    {
      paramString = localObject[0].trim();
      if (localObject.length <= 1) {
        break label62;
      }
      str = localObject[1].trim();
      label32:
      if (localObject.length <= 2) {
        break label68;
      }
    }
    label62:
    label68:
    for (localObject = localObject[2].trim();; localObject = "")
    {
      return new Asset(paramString, str, (String)localObject);
      paramString = "";
      break;
      str = "";
      break label32;
    }
  }
  
  public void clearImage()
  {
    this.bm = null;
    this.image = null;
  }
  
  public String getBarcode()
  {
    return this.barcode;
  }
  
  public Bitmap getBitmap()
  {
    return this.bm;
  }
  
  public String getEpc()
  {
    return this.epc;
  }
  
  public byte[] getImage()
  {
    return this.image;
  }
  
  public Bitmap getResizedBitmap(Bitmap paramBitmap, int paramInt1, int paramInt2)
  {
    int i = paramBitmap.getWidth();
    int j = paramBitmap.getHeight();
    float f1 = paramInt1 / i;
    float f2 = paramInt2 / j;
    Object localObject = new Matrix();
    ((Matrix)localObject).postScale(f1, f2);
    localObject = Bitmap.createBitmap(paramBitmap, 0, 0, i, j, (Matrix)localObject, false);
    paramBitmap.recycle();
    return (Bitmap)localObject;
  }
  
  public void setBarcode(String paramString)
  {
    this.barcode = paramString;
  }
  
  public void setEpc(String paramString)
  {
    this.epc = paramString;
  }
  
  public void setImage(String paramString)
  {
    this.image = Base64.decode(paramString, 0);
  }
  
  public void setImage(byte[] paramArrayOfByte)
  {
    if (paramArrayOfByte == null)
    {
      this.image = null;
      this.bm = null;
      return;
    }
    this.image = paramArrayOfByte;
    paramArrayOfByte = BitmapFactory.decodeByteArray(paramArrayOfByte, 0, paramArrayOfByte.length);
    int i = paramArrayOfByte.getWidth();
    int j = paramArrayOfByte.getHeight();
    if (i < j) {}
    for (;;)
    {
      this.bm = Bitmap.createBitmap(paramArrayOfByte, 0, 0, i, i);
      return;
      i = j;
    }
  }
  
  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder().append(this.epc).append(",").append(this.barcode).append(",");
    if (this.image != null) {}
    for (String str = Base64.encodeToString(this.image, 3);; str = "") {
      return str;
    }
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\alien\demo\data\Asset.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */