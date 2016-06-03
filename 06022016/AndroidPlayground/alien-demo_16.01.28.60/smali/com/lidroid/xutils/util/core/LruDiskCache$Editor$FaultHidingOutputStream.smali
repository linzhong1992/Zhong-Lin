.class Lcom/lidroid/xutils/util/core/LruDiskCache$Editor$FaultHidingOutputStream;
.super Ljava/io/FilterOutputStream;
.source "LruDiskCache.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "FaultHidingOutputStream"
.end annotation


# instance fields
.field final synthetic this$1:Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;


# direct methods
.method private constructor <init>(Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;Ljava/io/OutputStream;)V
    .locals 0
    .param p2, "out"    # Ljava/io/OutputStream;

    .prologue
    .line 917
    iput-object p1, p0, Lcom/lidroid/xutils/util/core/LruDiskCache$Editor$FaultHidingOutputStream;->this$1:Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;

    .line 918
    invoke-direct {p0, p2}, Ljava/io/FilterOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 919
    return-void
.end method

.method synthetic constructor <init>(Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;Ljava/io/OutputStream;Lcom/lidroid/xutils/util/core/LruDiskCache$Editor$FaultHidingOutputStream;)V
    .locals 0

    .prologue
    .line 917
    invoke-direct {p0, p1, p2}, Lcom/lidroid/xutils/util/core/LruDiskCache$Editor$FaultHidingOutputStream;-><init>(Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;Ljava/io/OutputStream;)V

    return-void
.end method


# virtual methods
.method public close()V
    .locals 3

    .prologue
    .line 943
    :try_start_0
    iget-object v1, p0, Lcom/lidroid/xutils/util/core/LruDiskCache$Editor$FaultHidingOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 947
    :goto_0
    return-void

    .line 944
    :catch_0
    move-exception v0

    .line 945
    .local v0, "e":Ljava/lang/Throwable;
    iget-object v1, p0, Lcom/lidroid/xutils/util/core/LruDiskCache$Editor$FaultHidingOutputStream;->this$1:Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;

    const/4 v2, 0x1

    invoke-static {v1, v2}, Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;->access$0(Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;Z)V

    goto :goto_0
.end method

.method public flush()V
    .locals 3

    .prologue
    .line 952
    :try_start_0
    iget-object v1, p0, Lcom/lidroid/xutils/util/core/LruDiskCache$Editor$FaultHidingOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v1}, Ljava/io/OutputStream;->flush()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 956
    :goto_0
    return-void

    .line 953
    :catch_0
    move-exception v0

    .line 954
    .local v0, "e":Ljava/lang/Throwable;
    iget-object v1, p0, Lcom/lidroid/xutils/util/core/LruDiskCache$Editor$FaultHidingOutputStream;->this$1:Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;

    const/4 v2, 0x1

    invoke-static {v1, v2}, Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;->access$0(Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;Z)V

    goto :goto_0
.end method

.method public write(I)V
    .locals 3
    .param p1, "oneByte"    # I

    .prologue
    .line 924
    :try_start_0
    iget-object v1, p0, Lcom/lidroid/xutils/util/core/LruDiskCache$Editor$FaultHidingOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v1, p1}, Ljava/io/OutputStream;->write(I)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 928
    :goto_0
    return-void

    .line 925
    :catch_0
    move-exception v0

    .line 926
    .local v0, "e":Ljava/lang/Throwable;
    iget-object v1, p0, Lcom/lidroid/xutils/util/core/LruDiskCache$Editor$FaultHidingOutputStream;->this$1:Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;

    const/4 v2, 0x1

    invoke-static {v1, v2}, Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;->access$0(Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;Z)V

    goto :goto_0
.end method

.method public write([BII)V
    .locals 3
    .param p1, "buffer"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I

    .prologue
    .line 933
    :try_start_0
    iget-object v1, p0, Lcom/lidroid/xutils/util/core/LruDiskCache$Editor$FaultHidingOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v1, p1, p2, p3}, Ljava/io/OutputStream;->write([BII)V

    .line 934
    iget-object v1, p0, Lcom/lidroid/xutils/util/core/LruDiskCache$Editor$FaultHidingOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v1}, Ljava/io/OutputStream;->flush()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 938
    :goto_0
    return-void

    .line 935
    :catch_0
    move-exception v0

    .line 936
    .local v0, "e":Ljava/lang/Throwable;
    iget-object v1, p0, Lcom/lidroid/xutils/util/core/LruDiskCache$Editor$FaultHidingOutputStream;->this$1:Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;

    const/4 v2, 0x1

    invoke-static {v1, v2}, Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;->access$0(Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;Z)V

    goto :goto_0
.end method
