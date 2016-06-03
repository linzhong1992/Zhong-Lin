.class public Lcom/lidroid/xutils/bitmap/PauseOnScrollListener;
.super Ljava/lang/Object;
.source "PauseOnScrollListener.java"

# interfaces
.implements Landroid/widget/AbsListView$OnScrollListener;


# instance fields
.field private bitmapUtils:Lcom/lidroid/xutils/BitmapUtils;

.field private final externalListener:Landroid/widget/AbsListView$OnScrollListener;

.field private final pauseOnFling:Z

.field private final pauseOnScroll:Z


# direct methods
.method public constructor <init>(Lcom/lidroid/xutils/BitmapUtils;ZZ)V
    .locals 1
    .param p1, "bitmapUtils"    # Lcom/lidroid/xutils/BitmapUtils;
    .param p2, "pauseOnScroll"    # Z
    .param p3, "pauseOnFling"    # Z

    .prologue
    .line 38
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/lidroid/xutils/bitmap/PauseOnScrollListener;-><init>(Lcom/lidroid/xutils/BitmapUtils;ZZLandroid/widget/AbsListView$OnScrollListener;)V

    .line 39
    return-void
.end method

.method public constructor <init>(Lcom/lidroid/xutils/BitmapUtils;ZZLandroid/widget/AbsListView$OnScrollListener;)V
    .locals 0
    .param p1, "bitmapUtils"    # Lcom/lidroid/xutils/BitmapUtils;
    .param p2, "pauseOnScroll"    # Z
    .param p3, "pauseOnFling"    # Z
    .param p4, "customListener"    # Landroid/widget/AbsListView$OnScrollListener;

    .prologue
    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    iput-object p1, p0, Lcom/lidroid/xutils/bitmap/PauseOnScrollListener;->bitmapUtils:Lcom/lidroid/xutils/BitmapUtils;

    .line 52
    iput-boolean p2, p0, Lcom/lidroid/xutils/bitmap/PauseOnScrollListener;->pauseOnScroll:Z

    .line 53
    iput-boolean p3, p0, Lcom/lidroid/xutils/bitmap/PauseOnScrollListener;->pauseOnFling:Z

    .line 54
    iput-object p4, p0, Lcom/lidroid/xutils/bitmap/PauseOnScrollListener;->externalListener:Landroid/widget/AbsListView$OnScrollListener;

    .line 55
    return-void
.end method


# virtual methods
.method public onScroll(Landroid/widget/AbsListView;III)V
    .locals 1
    .param p1, "view"    # Landroid/widget/AbsListView;
    .param p2, "firstVisibleItem"    # I
    .param p3, "visibleItemCount"    # I
    .param p4, "totalItemCount"    # I

    .prologue
    .line 81
    iget-object v0, p0, Lcom/lidroid/xutils/bitmap/PauseOnScrollListener;->externalListener:Landroid/widget/AbsListView$OnScrollListener;

    if-eqz v0, :cond_0

    .line 82
    iget-object v0, p0, Lcom/lidroid/xutils/bitmap/PauseOnScrollListener;->externalListener:Landroid/widget/AbsListView$OnScrollListener;

    invoke-interface {v0, p1, p2, p3, p4}, Landroid/widget/AbsListView$OnScrollListener;->onScroll(Landroid/widget/AbsListView;III)V

    .line 84
    :cond_0
    return-void
.end method

.method public onScrollStateChanged(Landroid/widget/AbsListView;I)V
    .locals 1
    .param p1, "view"    # Landroid/widget/AbsListView;
    .param p2, "scrollState"    # I

    .prologue
    .line 59
    packed-switch p2, :pswitch_data_0

    .line 74
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/lidroid/xutils/bitmap/PauseOnScrollListener;->externalListener:Landroid/widget/AbsListView$OnScrollListener;

    if-eqz v0, :cond_1

    .line 75
    iget-object v0, p0, Lcom/lidroid/xutils/bitmap/PauseOnScrollListener;->externalListener:Landroid/widget/AbsListView$OnScrollListener;

    invoke-interface {v0, p1, p2}, Landroid/widget/AbsListView$OnScrollListener;->onScrollStateChanged(Landroid/widget/AbsListView;I)V

    .line 77
    :cond_1
    return-void

    .line 61
    :pswitch_0
    iget-object v0, p0, Lcom/lidroid/xutils/bitmap/PauseOnScrollListener;->bitmapUtils:Lcom/lidroid/xutils/BitmapUtils;

    invoke-virtual {v0}, Lcom/lidroid/xutils/BitmapUtils;->resumeTasks()V

    goto :goto_0

    .line 64
    :pswitch_1
    iget-boolean v0, p0, Lcom/lidroid/xutils/bitmap/PauseOnScrollListener;->pauseOnScroll:Z

    if-eqz v0, :cond_0

    .line 65
    iget-object v0, p0, Lcom/lidroid/xutils/bitmap/PauseOnScrollListener;->bitmapUtils:Lcom/lidroid/xutils/BitmapUtils;

    invoke-virtual {v0}, Lcom/lidroid/xutils/BitmapUtils;->pauseTasks()V

    goto :goto_0

    .line 69
    :pswitch_2
    iget-boolean v0, p0, Lcom/lidroid/xutils/bitmap/PauseOnScrollListener;->pauseOnFling:Z

    if-eqz v0, :cond_0

    .line 70
    iget-object v0, p0, Lcom/lidroid/xutils/bitmap/PauseOnScrollListener;->bitmapUtils:Lcom/lidroid/xutils/BitmapUtils;

    invoke-virtual {v0}, Lcom/lidroid/xutils/BitmapUtils;->pauseTasks()V

    goto :goto_0

    .line 59
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method
