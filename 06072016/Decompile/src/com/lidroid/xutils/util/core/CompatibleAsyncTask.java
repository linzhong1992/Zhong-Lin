package com.lidroid.xutils.util.core;

import java.util.concurrent.atomic.*;
import com.lidroid.xutils.util.*;
import java.util.concurrent.*;
import android.os.*;
import com.lidroid.xutils.util.core.compatible.*;

public abstract class CompatibleAsyncTask<Params, Progress, Result>
{
    private static final int CORE_POOL_SIZE = 5;
    private static final int KEEP_ALIVE = 1;
    private static final int MAXIMUM_POOL_SIZE = 128;
    private static final int MESSAGE_POST_PROGRESS = 2;
    private static final int MESSAGE_POST_RESULT = 1;
    public static final Executor SERIAL_EXECUTOR;
    public static final Executor THREAD_POOL_EXECUTOR;
    private static volatile Executor sDefaultExecutor;
    private static final InternalHandler sHandler;
    private static final BlockingQueue<Runnable> sPoolWorkQueue;
    private static final ThreadFactory sThreadFactory;
    private final AtomicBoolean mCancelled;
    private final FutureTask<Result> mFuture;
    private volatile Status mStatus;
    private final AtomicBoolean mTaskInvoked;
    private final WorkerRunnable<Params, Result> mWorker;
    
    static /* synthetic */ int[] $SWITCH_TABLE$com$lidroid$xutils$util$core$CompatibleAsyncTask$Status() {
        final int[] $switch_TABLE$com$lidroid$xutils$util$core$CompatibleAsyncTask$Status = CompatibleAsyncTask.$SWITCH_TABLE$com$lidroid$xutils$util$core$CompatibleAsyncTask$Status;
        if ($switch_TABLE$com$lidroid$xutils$util$core$CompatibleAsyncTask$Status != null) {
            return $switch_TABLE$com$lidroid$xutils$util$core$CompatibleAsyncTask$Status;
        }
        final int[] $switch_TABLE$com$lidroid$xutils$util$core$CompatibleAsyncTask$Status2 = new int[Status.values().length];
        while (true) {
            try {
                $switch_TABLE$com$lidroid$xutils$util$core$CompatibleAsyncTask$Status2[Status.FINISHED.ordinal()] = 3;
                try {
                    $switch_TABLE$com$lidroid$xutils$util$core$CompatibleAsyncTask$Status2[Status.PENDING.ordinal()] = 1;
                    try {
                        $switch_TABLE$com$lidroid$xutils$util$core$CompatibleAsyncTask$Status2[Status.RUNNING.ordinal()] = 2;
                        return CompatibleAsyncTask.$SWITCH_TABLE$com$lidroid$xutils$util$core$CompatibleAsyncTask$Status = $switch_TABLE$com$lidroid$xutils$util$core$CompatibleAsyncTask$Status2;
                    }
                    catch (NoSuchFieldError noSuchFieldError) {}
                }
                catch (NoSuchFieldError noSuchFieldError2) {}
            }
            catch (NoSuchFieldError noSuchFieldError3) {
                continue;
            }
            break;
        }
    }
    
    static {
        sThreadFactory = new ThreadFactory() {
            private final AtomicInteger mCount = new AtomicInteger(1);
            
            @Override
            public Thread newThread(final Runnable runnable) {
                return new Thread(runnable, "CompatibleAsyncTask #" + this.mCount.getAndIncrement());
            }
        };
        sPoolWorkQueue = new LinkedBlockingQueue<Runnable>(10);
        THREAD_POOL_EXECUTOR = new ThreadPoolExecutor(5, 128, 1L, TimeUnit.SECONDS, CompatibleAsyncTask.sPoolWorkQueue, CompatibleAsyncTask.sThreadFactory);
        SERIAL_EXECUTOR = new SerialExecutor(null);
        sHandler = new InternalHandler(null);
        CompatibleAsyncTask.sDefaultExecutor = CompatibleAsyncTask.SERIAL_EXECUTOR;
    }
    
    public CompatibleAsyncTask() {
        this.mStatus = Status.PENDING;
        this.mCancelled = new AtomicBoolean();
        this.mTaskInvoked = new AtomicBoolean();
        this.mWorker = (WorkerRunnable<Params, Result>)new WorkerRunnable<Params, Result>() {
            @Override
            public Result call() throws Exception {
                CompatibleAsyncTask.this.mTaskInvoked.set(true);
                Process.setThreadPriority(10);
                return (Result)CompatibleAsyncTask.this.postResult(CompatibleAsyncTask.this.doInBackground(this.mParams));
            }
        };
        this.mFuture = new FutureTask<Result>(this.mWorker) {
            @Override
            protected void done() {
                try {
                    CompatibleAsyncTask.this.postResultIfNotInvoked(((FutureTask<Object>)this).get());
                }
                catch (InterruptedException ex) {
                    LogUtils.w(ex);
                }
                catch (ExecutionException ex2) {
                    throw new RuntimeException("An error occured while executing doInBackground()", ex2.getCause());
                }
                catch (CancellationException ex3) {
                    CompatibleAsyncTask.this.postResultIfNotInvoked(null);
                }
            }
        };
    }
    
    public static void execute(final Runnable runnable) {
        CompatibleAsyncTask.sDefaultExecutor.execute(runnable);
    }
    
    private void finish(final Result result) {
        if (this.isCancelled()) {
            this.onCancelled(result);
        }
        else {
            this.onPostExecute(result);
        }
        this.mStatus = Status.FINISHED;
    }
    
    public static void init() {
        CompatibleAsyncTask.sHandler.getLooper();
    }
    
    private Result postResult(final Result result) {
        CompatibleAsyncTask.sHandler.obtainMessage(1, (Object)new AsyncTaskResult(this, new Object[] { result })).sendToTarget();
        return result;
    }
    
    private void postResultIfNotInvoked(final Result result) {
        if (!this.mTaskInvoked.get()) {
            this.postResult(result);
        }
    }
    
    public static void setDefaultExecutor(final Executor sDefaultExecutor) {
        CompatibleAsyncTask.sDefaultExecutor = sDefaultExecutor;
    }
    
    public final boolean cancel(final boolean b) {
        this.mCancelled.set(true);
        return this.mFuture.cancel(b);
    }
    
    protected abstract Result doInBackground(final Params... p0);
    
    public final CompatibleAsyncTask<Params, Progress, Result> execute(final Params... array) {
        return this.executeOnExecutor(CompatibleAsyncTask.sDefaultExecutor, array);
    }
    
    public final CompatibleAsyncTask<Params, Progress, Result> executeOnExecutor(final Executor executor, final Params... mParams) {
        if (this.mStatus != Status.PENDING) {
            switch ($SWITCH_TABLE$com$lidroid$xutils$util$core$CompatibleAsyncTask$Status()[this.mStatus.ordinal()]) {
                case 2: {
                    throw new IllegalStateException("Cannot execute task: the task is already running.");
                }
                case 3: {
                    throw new IllegalStateException("Cannot execute task: the task has already been executed (a task can be executed only once)");
                }
            }
        }
        this.mStatus = Status.RUNNING;
        this.onPreExecute();
        this.mWorker.mParams = mParams;
        executor.execute(this.mFuture);
        return this;
    }
    
    public final Result get() throws InterruptedException, ExecutionException {
        return this.mFuture.get();
    }
    
    public final Result get(final long n, final TimeUnit timeUnit) throws InterruptedException, ExecutionException, TimeoutException {
        return this.mFuture.get(n, timeUnit);
    }
    
    public final Status getStatus() {
        return this.mStatus;
    }
    
    public final boolean isCancelled() {
        return this.mCancelled.get();
    }
    
    protected void onCancelled() {
    }
    
    protected void onCancelled(final Result result) {
        this.onCancelled();
    }
    
    protected void onPostExecute(final Result result) {
    }
    
    protected void onPreExecute() {
    }
    
    protected void onProgressUpdate(final Progress... array) {
    }
    
    protected final void publishProgress(final Progress... array) {
        if (!this.isCancelled()) {
            CompatibleAsyncTask.sHandler.obtainMessage(2, (Object)new AsyncTaskResult(this, (Object[])array)).sendToTarget();
        }
    }
    
    private static class AsyncTaskResult<Data>
    {
        final Data[] mData;
        final CompatibleAsyncTask mTask;
        
        AsyncTaskResult(final CompatibleAsyncTask mTask, final Data... mData) {
            this.mTask = mTask;
            this.mData = mData;
        }
    }
    
    private static class InternalHandler extends Handler
    {
        public void handleMessage(final Message message) {
            final AsyncTaskResult asyncTaskResult = (AsyncTaskResult)message.obj;
            switch (message.what) {
                default: {}
                case 1: {
                    asyncTaskResult.mTask.finish(asyncTaskResult.mData[0]);
                }
                case 2: {
                    asyncTaskResult.mTask.onProgressUpdate(asyncTaskResult.mData);
                }
            }
        }
    }
    
    private static class SerialExecutor implements Executor
    {
        Runnable mActive;
        final ArrayDeque<Runnable> mTasks;
        
        private SerialExecutor() {
            this.mTasks = new ArrayDeque<Runnable>();
        }
        
        @Override
        public void execute(final Runnable runnable) {
            synchronized (this) {
                this.mTasks.offer(new Runnable() {
                    @Override
                    public void run() {
                        try {
                            runnable.run();
                        }
                        finally {
                            SerialExecutor.this.scheduleNext();
                        }
                    }
                });
                if (this.mActive == null) {
                    this.scheduleNext();
                }
            }
        }
        
        protected void scheduleNext() {
            synchronized (this) {
                final Runnable mActive = this.mTasks.poll();
                this.mActive = mActive;
                if (mActive != null) {
                    CompatibleAsyncTask.THREAD_POOL_EXECUTOR.execute(this.mActive);
                }
            }
        }
    }
    
    public enum Status
    {
        FINISHED("FINISHED", 2), 
        PENDING("PENDING", 0), 
        RUNNING("RUNNING", 1);
        
        private Status(final String s, final int n) {
        }
    }
    
    private abstract static class WorkerRunnable<Params, Result> implements Callable<Result>
    {
        Params[] mParams;
    }
}
