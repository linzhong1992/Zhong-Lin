package com.lidroid.xutils.bitmap;

import com.lidroid.xutils.*;
import android.widget.*;

public class PauseOnScrollListener implements AbsListView$OnScrollListener
{
    private BitmapUtils bitmapUtils;
    private final AbsListView$OnScrollListener externalListener;
    private final boolean pauseOnFling;
    private final boolean pauseOnScroll;
    
    public PauseOnScrollListener(final BitmapUtils bitmapUtils, final boolean b, final boolean b2) {
        this(bitmapUtils, b, b2, null);
    }
    
    public PauseOnScrollListener(final BitmapUtils bitmapUtils, final boolean pauseOnScroll, final boolean pauseOnFling, final AbsListView$OnScrollListener externalListener) {
        this.bitmapUtils = bitmapUtils;
        this.pauseOnScroll = pauseOnScroll;
        this.pauseOnFling = pauseOnFling;
        this.externalListener = externalListener;
    }
    
    public void onScroll(final AbsListView absListView, final int n, final int n2, final int n3) {
        if (this.externalListener != null) {
            this.externalListener.onScroll(absListView, n, n2, n3);
        }
    }
    
    public void onScrollStateChanged(final AbsListView absListView, final int n) {
        switch (n) {
            case 0: {
                this.bitmapUtils.resumeTasks();
                break;
            }
            case 1: {
                if (this.pauseOnScroll) {
                    this.bitmapUtils.pauseTasks();
                    break;
                }
                break;
            }
            case 2: {
                if (this.pauseOnFling) {
                    this.bitmapUtils.pauseTasks();
                    break;
                }
                break;
            }
        }
        if (this.externalListener != null) {
            this.externalListener.onScrollStateChanged(absListView, n);
        }
    }
}
