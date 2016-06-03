package com.alien.rfid;

import com.rscja.utility.a;
import java.util.Arrays;

class ALRH450CusAPI
{
  public static final a a = new a(6, 240, 4);
  public static final a b = new a(6, 15, 0);
  public static final a c = new a(4, 192, 6);
  public static final a d = new a(4, 48, 4);
  public static final a e = new a(4, 8, 3);
  
  static
  {
    System.loadLibrary("aliencus");
  }
  
  public int a(int[] paramArrayOfInt, a parama)
  {
    return (paramArrayOfInt[parama.a] & parama.b) >> parama.c;
  }
  
  public void a(int[] paramArrayOfInt, a parama, int paramInt)
  {
    int i = parama.a;
    paramArrayOfInt[i] &= 0xFFFF & (parama.b ^ 0xFFFFFFFF);
    i = parama.a;
    paramArrayOfInt[i] |= paramInt << parama.c & parama.b;
  }
  
  public boolean a(b paramb)
  {
    return a(singleInventory(), paramb);
  }
  
  public boolean a(byte[] paramArrayOfByte, b paramb)
  {
    if (paramArrayOfByte == null) {
      return false;
    }
    byte[] arrayOfByte1 = Arrays.copyOfRange(paramArrayOfByte, 0, 2);
    int j = (arrayOfByte1[0] & 0xFF) >>> 3;
    byte[] arrayOfByte2 = Arrays.copyOfRange(paramArrayOfByte, 0, j * 2 + 2);
    byte[] arrayOfByte3 = Arrays.copyOfRange(paramArrayOfByte, paramArrayOfByte.length - 3, paramArrayOfByte.length - 1);
    int i = paramArrayOfByte[(paramArrayOfByte.length - 1)];
    paramb.a = a.a(arrayOfByte2, arrayOfByte2.length);
    if (paramArrayOfByte.length - arrayOfByte2.length - arrayOfByte3.length - 1 == 12)
    {
      j = j * 2 + 2;
      Arrays.copyOfRange(paramArrayOfByte, j, j + 12);
      paramb.b = a.a(arrayOfByte1, arrayOfByte1.length);
    }
    paramb.d = i;
    paramb.c = (-(65536 - Integer.parseInt(a.a(arrayOfByte3, arrayOfByte3.length), 16)) / 10.0F);
    return true;
  }
  
  public boolean b(b paramb)
  {
    return a(invGetTagInfo(), paramb);
  }
  
  public native void enableInventory(boolean paramBoolean);
  
  public native int getFirmwareVersion();
  
  public native int getGen2Parameter(int[] paramArrayOfInt);
  
  public native int getHardwareVersion();
  
  public native long getModuleId();
  
  public native int getRegion();
  
  public native byte[] invGetTagInfo();
  
  public native int killTag(String paramString1, int paramInt1, int paramInt2, String paramString2, int paramInt3);
  
  public native int lockUnlockFields(String paramString1, int paramInt1, int paramInt2, String paramString2, int paramInt3, String paramString3);
  
  public native String readData(String paramString1, int paramInt1, int paramInt2, String paramString2, int paramInt3, int paramInt4, int paramInt5, int paramInt6);
  
  public native int setFilter(int paramInt1, int paramInt2, String paramString, int paramInt3);
  
  public native int setGen2Parameter(int[] paramArrayOfInt);
  
  public native void setInvMaxTry(int paramInt);
  
  public native void setInvReadWaitTime(int paramInt);
  
  public native byte[] singleInventory();
  
  public native int writeData(String paramString1, int paramInt1, int paramInt2, String paramString2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, String paramString3);
  
  static class a
  {
    int a;
    int b;
    int c;
    
    a(int paramInt1, int paramInt2, int paramInt3)
    {
      this.a = paramInt1;
      this.b = paramInt2;
      this.c = paramInt3;
    }
  }
  
  static class b
  {
    String a;
    String b;
    double c;
    int d;
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\alien\rfid\ALRH450CusAPI.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */