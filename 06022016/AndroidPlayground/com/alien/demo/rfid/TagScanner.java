package com.alien.demo.rfid;

import android.content.Context;
import android.util.Log;
import com.alien.demo.uibase.TaskRunner;
import com.alien.rfid.Bank;
import com.alien.rfid.LockFields;
import com.alien.rfid.LockType;
import com.alien.rfid.Mask;
import com.alien.rfid.RFID;
import com.alien.rfid.RFIDCallback;
import com.alien.rfid.RFIDReader;
import com.alien.rfid.RFIDResult;
import com.alien.rfid.ReaderException;
import com.alien.rfid.Tag;

public class TagScanner
{
  private static final String TAG = "AlienRFID-Scanner";
  private static RFIDReader reader;
  private TagMask filter = new TagMask();
  private RFIDCallback listener;
  
  public TagScanner(RFIDCallback paramRFIDCallback)
  {
    try
    {
      this.listener = paramRFIDCallback;
      init();
      return;
    }
    catch (Exception paramRFIDCallback)
    {
      Log.e("AlienRFID-Scanner", "Error init reader: " + paramRFIDCallback);
      paramRFIDCallback.printStackTrace();
    }
  }
  
  /* Error */
  public static void deinit()
  {
    // Byte code:
    //   0: ldc 2
    //   2: monitorenter
    //   3: getstatic 62	com/alien/demo/rfid/TagScanner:reader	Lcom/alien/rfid/RFIDReader;
    //   6: astore_0
    //   7: aload_0
    //   8: ifnonnull +7 -> 15
    //   11: ldc 2
    //   13: monitorexit
    //   14: return
    //   15: getstatic 62	com/alien/demo/rfid/TagScanner:reader	Lcom/alien/rfid/RFIDReader;
    //   18: invokevirtual 67	com/alien/rfid/RFIDReader:close	()V
    //   21: aconst_null
    //   22: putstatic 62	com/alien/demo/rfid/TagScanner:reader	Lcom/alien/rfid/RFIDReader;
    //   25: goto -14 -> 11
    //   28: astore_0
    //   29: ldc 2
    //   31: monitorexit
    //   32: aload_0
    //   33: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   6	2	0	localRFIDReader	RFIDReader
    //   28	5	0	localObject	Object
    // Exception table:
    //   from	to	target	type
    //   3	7	28	finally
    //   15	25	28	finally
  }
  
  private Mask getMask()
    throws ReaderException
  {
    TagMask.MaskInfo[] arrayOfMaskInfo = this.filter.getMaskInfos();
    int i = this.filter.getMaskedBank();
    return new Mask(Bank.fromValue(this.filter.getMaskedBank()), arrayOfMaskInfo[i].ptr, arrayOfMaskInfo[i].len, arrayOfMaskInfo[i].data);
  }
  
  public static RFIDReader getRFIDReader()
  {
    try
    {
      RFIDReader localRFIDReader = RFID.open();
      return localRFIDReader;
    }
    catch (Exception localException)
    {
      Log.e("AlienRFID-Scanner", "Error getting reader: " + localException);
      localException.printStackTrace();
    }
    return null;
  }
  
  public static void init()
    throws ReaderException
  {
    try
    {
      if (reader == null)
      {
        reader = RFID.open();
        Log.i("AlienRFID-Scanner", "Reader initialized successfully");
      }
      return;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public TagMask getFilter()
  {
    return this.filter;
  }
  
  public boolean isInitSuccess()
  {
    return reader != null;
  }
  
  public boolean isScanning()
  {
    return reader.isRunning();
  }
  
  public RFIDResult lock(LockFields paramLockFields, String paramString)
    throws ReaderException
  {
    return reader.lock(paramLockFields, LockType.LOCK, getMask(), paramString);
  }
  
  public RFIDResult permaLock(LockFields paramLockFields, String paramString)
    throws ReaderException
  {
    return reader.lock(paramLockFields, LockType.PERMALOCK, getMask(), paramString);
  }
  
  public RFIDResult permaUnlock(LockFields paramLockFields, String paramString)
    throws ReaderException
  {
    return reader.lock(paramLockFields, LockType.PERMAUNLOCK, getMask(), paramString);
  }
  
  public RFIDResult read(Bank paramBank, int paramInt1, int paramInt2, String paramString)
    throws ReaderException
  {
    return reader.read(paramBank, paramInt1, paramInt2, getMask(), paramString);
  }
  
  public void scan()
  {
    try
    {
      if (this.listener != null) {
        reader.inventory(this.listener, getMask());
      }
      return;
    }
    catch (Exception localException)
    {
      Log.e("AlienRFID-Scanner", "Error when scanning tags: " + localException);
      localException.printStackTrace();
    }
  }
  
  public Tag scanSingle()
  {
    try
    {
      Tag localTag = (Tag)reader.read(getMask()).getData();
      return localTag;
    }
    catch (Exception localException)
    {
      Log.e("AlienRFID-Scanner", "Error when scanning single tag: " + localException);
      localException.printStackTrace();
    }
    return null;
  }
  
  public void setDefaultAccessPassword(String paramString)
  {
    reader.setAccessPwd(paramString);
  }
  
  public void setListener(RFIDCallback paramRFIDCallback)
  {
    this.listener = paramRFIDCallback;
  }
  
  public void stop(Context paramContext)
  {
    TaskRunner.runTask(paramContext, "Stop...", "Stop failed", new Runnable()
    {
      public void run()
      {
        TagScanner.this.stop();
      }
    });
  }
  
  public boolean stop()
  {
    try
    {
      reader.stop();
      return true;
    }
    catch (Exception localException)
    {
      Log.e("AlienRFID-Scanner", "Error when stop tags: " + localException);
      localException.printStackTrace();
    }
    return false;
  }
  
  public RFIDResult unlock(LockFields paramLockFields, String paramString)
    throws ReaderException
  {
    return reader.lock(paramLockFields, LockType.UNLOCK, getMask(), paramString);
  }
  
  public RFIDResult write(Bank paramBank, int paramInt, String paramString1, String paramString2)
    throws ReaderException
  {
    return reader.write(paramBank, paramInt, paramString1, getMask(), paramString2);
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\alien\demo\rfid\TagScanner.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */