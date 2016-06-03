.class Lcom/lidroid/xutils/util/core/LruDiskCache$1;
.super Ljava/lang/Object;
.source "LruDiskCache.java"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lidroid/xutils/util/core/LruDiskCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable",
        "<",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lidroid/xutils/util/core/LruDiskCache;


# direct methods
.method constructor <init>(Lcom/lidroid/xutils/util/core/LruDiskCache;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/lidroid/xutils/util/core/LruDiskCache$1;->this$0:Lcom/lidroid/xutils/util/core/LruDiskCache;

    .line 158
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic call()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/lidroid/xutils/util/core/LruDiskCache$1;->call()Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method public call()Ljava/lang/Void;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 160
    iget-object v1, p0, Lcom/lidroid/xutils/util/core/LruDiskCache$1;->this$0:Lcom/lidroid/xutils/util/core/LruDiskCache;

    monitor-enter v1

    .line 161
    :try_start_0
    iget-object v0, p0, Lcom/lidroid/xutils/util/core/LruDiskCache$1;->this$0:Lcom/lidroid/xutils/util/core/LruDiskCache;

    # getter for: Lcom/lidroid/xutils/util/core/LruDiskCache;->journalWriter:Ljava/io/Writer;
    invoke-static {v0}, Lcom/lidroid/xutils/util/core/LruDiskCache;->access$0(Lcom/lidroid/xutils/util/core/LruDiskCache;)Ljava/io/Writer;

    move-result-object v0

    if-nez v0, :cond_0

    .line 162
    monitor-exit v1

    .line 170
    :goto_0
    return-object v3

    .line 164
    :cond_0
    iget-object v0, p0, Lcom/lidroid/xutils/util/core/LruDiskCache$1;->this$0:Lcom/lidroid/xutils/util/core/LruDiskCache;

    # invokes: Lcom/lidroid/xutils/util/core/LruDiskCache;->trimToSize()V
    invoke-static {v0}, Lcom/lidroid/xutils/util/core/LruDiskCache;->access$1(Lcom/lidroid/xutils/util/core/LruDiskCache;)V

    .line 165
    iget-object v0, p0, Lcom/lidroid/xutils/util/core/LruDiskCache$1;->this$0:Lcom/lidroid/xutils/util/core/LruDiskCache;

    # invokes: Lcom/lidroid/xutils/util/core/LruDiskCache;->journalRebuildRequired()Z
    invoke-static {v0}, Lcom/lidroid/xutils/util/core/LruDiskCache;->access$2(Lcom/lidroid/xutils/util/core/LruDiskCache;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 166
    iget-object v0, p0, Lcom/lidroid/xutils/util/core/LruDiskCache$1;->this$0:Lcom/lidroid/xutils/util/core/LruDiskCache;

    # invokes: Lcom/lidroid/xutils/util/core/LruDiskCache;->rebuildJournal()V
    invoke-static {v0}, Lcom/lidroid/xutils/util/core/LruDiskCache;->access$3(Lcom/lidroid/xutils/util/core/LruDiskCache;)V

    .line 167
    iget-object v0, p0, Lcom/lidroid/xutils/util/core/LruDiskCache$1;->this$0:Lcom/lidroid/xutils/util/core/LruDiskCache;

    const/4 v2, 0x0

    invoke-static {v0, v2}, Lcom/lidroid/xutils/util/core/LruDiskCache;->access$4(Lcom/lidroid/xutils/util/core/LruDiskCache;I)V

    .line 160
    :cond_1
    monitor-exit v1

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
