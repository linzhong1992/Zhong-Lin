package com.alien.demo.uibase;

import android.app.ProgressDialog;
import android.content.Context;
import android.os.AsyncTask;
import android.widget.Toast;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;

public class TaskRunner
{
  public static void runTask(Context paramContext, String paramString, Runnable paramRunnable)
  {
    runTask(paramContext, paramString, null, paramRunnable);
  }
  
  public static void runTask(Context paramContext, String paramString1, String paramString2, Runnable paramRunnable)
  {
    final CountDownLatch localCountDownLatch = new CountDownLatch(1);
    new Thread(new Runnable()
    {
      public void run()
      {
        this.val$runnable.run();
        localCountDownLatch.countDown();
      }
    }).start();
    try
    {
      if (!localCountDownLatch.await(500L, TimeUnit.MILLISECONDS)) {
        new TaskChk(paramContext, paramString1, paramString2, localCountDownLatch).execute(new String[0]);
      }
      return;
    }
    catch (InterruptedException paramContext) {}
  }
  
  public static class TaskChk
    extends AsyncTask<String, Integer, Boolean>
  {
    Context context;
    String failMsg;
    CountDownLatch latch;
    String msg;
    ProgressDialog mypDialog;
    
    TaskChk(Context paramContext, String paramString1, String paramString2, CountDownLatch paramCountDownLatch)
    {
      this.msg = paramString1;
      this.failMsg = paramString2;
      this.context = paramContext;
      this.latch = paramCountDownLatch;
    }
    
    protected Boolean doInBackground(String... paramVarArgs)
    {
      int i = 0;
      for (;;)
      {
        boolean bool;
        if ((i >= 100) || (this.latch.getCount() == 0L))
        {
          if (this.latch.getCount() != 0L) {
            break label52;
          }
          bool = true;
          return Boolean.valueOf(bool);
        }
        try
        {
          Thread.sleep(100L);
          i += 1;
          continue;
          label52:
          bool = false;
        }
        catch (InterruptedException paramVarArgs)
        {
          for (;;) {}
        }
      }
    }
    
    protected void onPostExecute(Boolean paramBoolean)
    {
      super.onPostExecute(paramBoolean);
      this.mypDialog.cancel();
      if ((!paramBoolean.booleanValue()) && (this.failMsg != null)) {
        Toast.makeText(this.context, this.failMsg, 0).show();
      }
    }
    
    protected void onPreExecute()
    {
      super.onPreExecute();
      this.mypDialog = new ProgressDialog(this.context);
      this.mypDialog.setProgressStyle(0);
      this.mypDialog.setMessage(this.msg);
      this.mypDialog.setCanceledOnTouchOutside(false);
      this.mypDialog.show();
    }
  }
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\alien\demo\uibase\TaskRunner.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */