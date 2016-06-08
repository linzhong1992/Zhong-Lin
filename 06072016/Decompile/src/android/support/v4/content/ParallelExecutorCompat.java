package android.support.v4.content;

import java.util.concurrent.*;
import android.os.*;

public class ParallelExecutorCompat
{
    public static Executor getParallelExecutor() {
        if (Build$VERSION.SDK_INT >= 11) {
            return ExecutorCompatHoneycomb.getParallelExecutor();
        }
        return ModernAsyncTask.THREAD_POOL_EXECUTOR;
    }
}
