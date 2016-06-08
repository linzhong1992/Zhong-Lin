package com.alien.demo.uibase;

import android.content.*;
import java.util.concurrent.*;
import android.os.*;
import android.app.*;
import android.widget.*;

public class TaskRunner
{
    public static void runTask(final Context context, final String s, final Runnable runnable) {
        runTask(context, s, null, runnable);
    }
    
    public static void runTask(final Context context, final String s, final String s2, final Runnable runnable) {
        final CountDownLatch countDownLatch = new CountDownLatch(1);
        new Thread(new Runnable() {
            @Override
            public void run() {
                runnable.run();
                countDownLatch.countDown();
            }
        }).start();
        try {
            if (!countDownLatch.await(500L, TimeUnit.MILLISECONDS)) {
                new TaskChk(context, s, s2, countDownLatch).execute((Object[])new String[0]);
            }
        }
        catch (InterruptedException ex) {}
    }
    
    public static class TaskChk extends AsyncTask<String, Integer, Boolean>
    {
        Context context;
        String failMsg;
        CountDownLatch latch;
        String msg;
        ProgressDialog mypDialog;
        
        TaskChk(final Context context, final String msg, final String failMsg, final CountDownLatch latch) {
            this.msg = msg;
            this.failMsg = failMsg;
            this.context = context;
            this.latch = latch;
        }
        
        protected Boolean doInBackground(final String... array) {
            int n = 0;
            boolean b = false;
        Label_0045_Outer:
            while (true) {
                Label_0052: {
                    if (n >= 100 || this.latch.getCount() == 0L) {
                        if (this.latch.getCount() == 0L) {
                            b = true;
                            break;
                        }
                        break Label_0052;
                    }
                    while (true) {
                        try {
                            Thread.sleep(100L);
                            ++n;
                            continue Label_0045_Outer;
                            b = false;
                            break;
                        }
                        catch (InterruptedException ex) {
                            continue;
                        }
                        break;
                    }
                }
            }
            return b;
        }
        
        protected void onPostExecute(final Boolean b) {
            super.onPostExecute((Object)b);
            this.mypDialog.cancel();
            if (!b && this.failMsg != null) {
                Toast.makeText(this.context, (CharSequence)this.failMsg, 0).show();
            }
        }
        
        protected void onPreExecute() {
            super.onPreExecute();
            (this.mypDialog = new ProgressDialog(this.context)).setProgressStyle(0);
            this.mypDialog.setMessage((CharSequence)this.msg);
            this.mypDialog.setCanceledOnTouchOutside(false);
            this.mypDialog.show();
        }
    }
}
