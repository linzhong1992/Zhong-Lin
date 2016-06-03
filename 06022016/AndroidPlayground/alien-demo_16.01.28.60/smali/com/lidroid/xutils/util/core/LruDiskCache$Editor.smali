.class public final Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;
.super Ljava/lang/Object;
.source "LruDiskCache.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lidroid/xutils/util/core/LruDiskCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "Editor"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lidroid/xutils/util/core/LruDiskCache$Editor$FaultHidingOutputStream;
    }
.end annotation


# instance fields
.field private committed:Z

.field private final entry:Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;

.field private hasErrors:Z

.field final synthetic this$0:Lcom/lidroid/xutils/util/core/LruDiskCache;

.field private final written:[Z


# direct methods
.method private constructor <init>(Lcom/lidroid/xutils/util/core/LruDiskCache;Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;)V
    .locals 1
    .param p2, "entry"    # Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;

    .prologue
    .line 801
    iput-object p1, p0, Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;->this$0:Lcom/lidroid/xutils/util/core/LruDiskCache;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 802
    iput-object p2, p0, Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;->entry:Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;

    .line 803
    # getter for: Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->readable:Z
    invoke-static {p2}, Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->access$0(Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    iput-object v0, p0, Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;->written:[Z

    .line 804
    return-void

    .line 803
    :cond_0
    # getter for: Lcom/lidroid/xutils/util/core/LruDiskCache;->valueCount:I
    invoke-static {p1}, Lcom/lidroid/xutils/util/core/LruDiskCache;->access$7(Lcom/lidroid/xutils/util/core/LruDiskCache;)I

    move-result v0

    new-array v0, v0, [Z

    goto :goto_0
.end method

.method synthetic constructor <init>(Lcom/lidroid/xutils/util/core/LruDiskCache;Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;)V
    .locals 0

    .prologue
    .line 801
    invoke-direct {p0, p1, p2}, Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;-><init>(Lcom/lidroid/xutils/util/core/LruDiskCache;Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;)V

    return-void
.end method

.method static synthetic access$0(Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;Z)V
    .locals 0

    .prologue
    .line 798
    iput-boolean p1, p0, Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;->hasErrors:Z

    return-void
.end method

.method static synthetic access$2(Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;)Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;
    .locals 1

    .prologue
    .line 796
    iget-object v0, p0, Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;->entry:Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;

    return-object v0
.end method

.method static synthetic access$3(Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;)[Z
    .locals 1

    .prologue
    .line 797
    iget-object v0, p0, Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;->written:[Z

    return-object v0
.end method


# virtual methods
.method public abort()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 904
    iget-object v0, p0, Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;->this$0:Lcom/lidroid/xutils/util/core/LruDiskCache;

    const/4 v1, 0x0

    # invokes: Lcom/lidroid/xutils/util/core/LruDiskCache;->completeEdit(Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;Z)V
    invoke-static {v0, p0, v1}, Lcom/lidroid/xutils/util/core/LruDiskCache;->access$10(Lcom/lidroid/xutils/util/core/LruDiskCache;Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;Z)V

    .line 905
    return-void
.end method

.method public abortUnlessCommitted()V
    .locals 1

    .prologue
    .line 908
    iget-boolean v0, p0, Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;->committed:Z

    if-nez v0, :cond_0

    .line 910
    :try_start_0
    invoke-virtual {p0}, Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;->abort()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 914
    :cond_0
    :goto_0
    return-void

    .line 911
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public commit()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x1

    .line 890
    iget-boolean v0, p0, Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;->hasErrors:Z

    if-eqz v0, :cond_0

    .line 891
    iget-object v0, p0, Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;->this$0:Lcom/lidroid/xutils/util/core/LruDiskCache;

    const/4 v1, 0x0

    # invokes: Lcom/lidroid/xutils/util/core/LruDiskCache;->completeEdit(Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;Z)V
    invoke-static {v0, p0, v1}, Lcom/lidroid/xutils/util/core/LruDiskCache;->access$10(Lcom/lidroid/xutils/util/core/LruDiskCache;Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;Z)V

    .line 892
    iget-object v0, p0, Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;->this$0:Lcom/lidroid/xutils/util/core/LruDiskCache;

    iget-object v1, p0, Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;->entry:Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;

    # getter for: Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->diskKey:Ljava/lang/String;
    invoke-static {v1}, Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->access$3(Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;)Ljava/lang/String;

    move-result-object v1

    # invokes: Lcom/lidroid/xutils/util/core/LruDiskCache;->removeByDiskKey(Ljava/lang/String;)Z
    invoke-static {v0, v1}, Lcom/lidroid/xutils/util/core/LruDiskCache;->access$11(Lcom/lidroid/xutils/util/core/LruDiskCache;Ljava/lang/String;)Z

    .line 896
    :goto_0
    iput-boolean v2, p0, Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;->committed:Z

    .line 897
    return-void

    .line 894
    :cond_0
    iget-object v0, p0, Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;->this$0:Lcom/lidroid/xutils/util/core/LruDiskCache;

    # invokes: Lcom/lidroid/xutils/util/core/LruDiskCache;->completeEdit(Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;Z)V
    invoke-static {v0, p0, v2}, Lcom/lidroid/xutils/util/core/LruDiskCache;->access$10(Lcom/lidroid/xutils/util/core/LruDiskCache;Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;Z)V

    goto :goto_0
.end method

.method public getString(I)Ljava/lang/String;
    .locals 2
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 835
    invoke-virtual {p0, p1}, Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;->newInputStream(I)Ljava/io/InputStream;

    move-result-object v0

    .line 836
    .local v0, "in":Ljava/io/InputStream;
    if-eqz v0, :cond_0

    # invokes: Lcom/lidroid/xutils/util/core/LruDiskCache;->inputStreamToString(Ljava/io/InputStream;)Ljava/lang/String;
    invoke-static {v0}, Lcom/lidroid/xutils/util/core/LruDiskCache;->access$6(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v1

    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public newInputStream(I)Ljava/io/InputStream;
    .locals 5
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 815
    iget-object v3, p0, Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;->this$0:Lcom/lidroid/xutils/util/core/LruDiskCache;

    monitor-enter v3

    .line 816
    :try_start_0
    iget-object v2, p0, Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;->entry:Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;

    # getter for: Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->currentEditor:Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;
    invoke-static {v2}, Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->access$2(Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;)Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;

    move-result-object v2

    if-eq v2, p0, :cond_0

    .line 817
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1}, Ljava/lang/IllegalStateException;-><init>()V

    throw v1

    .line 815
    :catchall_0
    move-exception v1

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 819
    :cond_0
    :try_start_1
    iget-object v2, p0, Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;->entry:Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;

    # getter for: Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->readable:Z
    invoke-static {v2}, Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->access$0(Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 820
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 825
    :goto_0
    return-object v1

    .line 823
    :cond_1
    :try_start_2
    new-instance v2, Ljava/io/FileInputStream;

    iget-object v4, p0, Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;->entry:Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;

    invoke-virtual {v4, p1}, Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->getCleanFile(I)Ljava/io/File;

    move-result-object v4

    invoke-direct {v2, v4}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_2
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :try_start_3
    monitor-exit v3

    move-object v1, v2

    goto :goto_0

    .line 824
    :catch_0
    move-exception v0

    .line 825
    .local v0, "e":Ljava/io/FileNotFoundException;
    monitor-exit v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0
.end method

.method public newOutputStream(I)Ljava/io/OutputStream;
    .locals 7
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 847
    iget-object v5, p0, Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;->this$0:Lcom/lidroid/xutils/util/core/LruDiskCache;

    monitor-enter v5

    .line 848
    :try_start_0
    iget-object v4, p0, Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;->entry:Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;

    # getter for: Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->currentEditor:Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;
    invoke-static {v4}, Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->access$2(Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;)Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;

    move-result-object v4

    if-eq v4, p0, :cond_0

    .line 849
    new-instance v4, Ljava/lang/IllegalStateException;

    invoke-direct {v4}, Ljava/lang/IllegalStateException;-><init>()V

    throw v4

    .line 847
    :catchall_0
    move-exception v4

    monitor-exit v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v4

    .line 851
    :cond_0
    :try_start_1
    iget-object v4, p0, Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;->entry:Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;

    # getter for: Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->readable:Z
    invoke-static {v4}, Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->access$0(Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 852
    iget-object v4, p0, Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;->written:[Z

    const/4 v6, 0x1

    aput-boolean v6, v4, p1

    .line 854
    :cond_1
    iget-object v4, p0, Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;->entry:Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;

    invoke-virtual {v4, p1}, Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->getDirtyFile(I)Ljava/io/File;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v0

    .line 857
    .local v0, "dirtyFile":Ljava/io/File;
    :try_start_2
    new-instance v3, Ljava/io/FileOutputStream;

    invoke-direct {v3, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_2
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 868
    .local v3, "outputStream":Ljava/io/FileOutputStream;
    :goto_0
    :try_start_3
    new-instance v4, Lcom/lidroid/xutils/util/core/LruDiskCache$Editor$FaultHidingOutputStream;

    const/4 v6, 0x0

    invoke-direct {v4, p0, v3, v6}, Lcom/lidroid/xutils/util/core/LruDiskCache$Editor$FaultHidingOutputStream;-><init>(Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;Ljava/io/OutputStream;Lcom/lidroid/xutils/util/core/LruDiskCache$Editor$FaultHidingOutputStream;)V

    monitor-exit v5

    .end local v3    # "outputStream":Ljava/io/FileOutputStream;
    :goto_1
    return-object v4

    .line 858
    :catch_0
    move-exception v1

    .line 860
    .local v1, "e":Ljava/io/FileNotFoundException;
    iget-object v4, p0, Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;->this$0:Lcom/lidroid/xutils/util/core/LruDiskCache;

    # getter for: Lcom/lidroid/xutils/util/core/LruDiskCache;->directory:Ljava/io/File;
    invoke-static {v4}, Lcom/lidroid/xutils/util/core/LruDiskCache;->access$8(Lcom/lidroid/xutils/util/core/LruDiskCache;)Ljava/io/File;

    move-result-object v4

    invoke-virtual {v4}, Ljava/io/File;->mkdirs()Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 862
    :try_start_4
    new-instance v3, Ljava/io/FileOutputStream;

    invoke-direct {v3, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_4
    .catch Ljava/io/FileNotFoundException; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .restart local v3    # "outputStream":Ljava/io/FileOutputStream;
    goto :goto_0

    .line 863
    .end local v3    # "outputStream":Ljava/io/FileOutputStream;
    :catch_1
    move-exception v2

    .line 865
    .local v2, "e2":Ljava/io/FileNotFoundException;
    :try_start_5
    # getter for: Lcom/lidroid/xutils/util/core/LruDiskCache;->NULL_OUTPUT_STREAM:Ljava/io/OutputStream;
    invoke-static {}, Lcom/lidroid/xutils/util/core/LruDiskCache;->access$9()Ljava/io/OutputStream;

    move-result-object v4

    monitor-exit v5
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto :goto_1
.end method

.method public set(ILjava/lang/String;)V
    .locals 4
    .param p1, "index"    # I
    .param p2, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 876
    const/4 v0, 0x0

    .line 878
    .local v0, "writer":Ljava/io/Writer;
    :try_start_0
    new-instance v1, Ljava/io/OutputStreamWriter;

    invoke-virtual {p0, p1}, Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;->newOutputStream(I)Ljava/io/OutputStream;

    move-result-object v2

    const-string v3, "UTF-8"

    invoke-direct {v1, v2, v3}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 879
    .end local v0    # "writer":Ljava/io/Writer;
    .local v1, "writer":Ljava/io/Writer;
    :try_start_1
    invoke-virtual {v1, p2}, Ljava/io/Writer;->write(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 881
    invoke-static {v1}, Lcom/lidroid/xutils/util/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    .line 883
    return-void

    .line 880
    .end local v1    # "writer":Ljava/io/Writer;
    .restart local v0    # "writer":Ljava/io/Writer;
    :catchall_0
    move-exception v2

    .line 881
    :goto_0
    invoke-static {v0}, Lcom/lidroid/xutils/util/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    .line 882
    throw v2

    .line 880
    .end local v0    # "writer":Ljava/io/Writer;
    .restart local v1    # "writer":Ljava/io/Writer;
    :catchall_1
    move-exception v2

    move-object v0, v1

    .end local v1    # "writer":Ljava/io/Writer;
    .restart local v0    # "writer":Ljava/io/Writer;
    goto :goto_0
.end method

.method public setEntryExpiryTimestamp(J)V
    .locals 1
    .param p1, "timestamp"    # J

    .prologue
    .line 807
    iget-object v0, p0, Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;->entry:Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;

    invoke-static {v0, p1, p2}, Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->access$1(Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;J)V

    .line 808
    return-void
.end method
