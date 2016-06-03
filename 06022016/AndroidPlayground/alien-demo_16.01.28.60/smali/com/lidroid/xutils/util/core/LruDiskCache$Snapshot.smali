.class public final Lcom/lidroid/xutils/util/core/LruDiskCache$Snapshot;
.super Ljava/lang/Object;
.source "LruDiskCache.java"

# interfaces
.implements Ljava/io/Closeable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lidroid/xutils/util/core/LruDiskCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "Snapshot"
.end annotation


# instance fields
.field private final diskKey:Ljava/lang/String;

.field private final ins:[Ljava/io/FileInputStream;

.field private final lengths:[J

.field private final sequenceNumber:J

.field final synthetic this$0:Lcom/lidroid/xutils/util/core/LruDiskCache;


# direct methods
.method private constructor <init>(Lcom/lidroid/xutils/util/core/LruDiskCache;Ljava/lang/String;J[Ljava/io/FileInputStream;[J)V
    .locals 1
    .param p2, "diskKey"    # Ljava/lang/String;
    .param p3, "sequenceNumber"    # J
    .param p5, "ins"    # [Ljava/io/FileInputStream;
    .param p6, "lengths"    # [J

    .prologue
    .line 740
    iput-object p1, p0, Lcom/lidroid/xutils/util/core/LruDiskCache$Snapshot;->this$0:Lcom/lidroid/xutils/util/core/LruDiskCache;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 741
    iput-object p2, p0, Lcom/lidroid/xutils/util/core/LruDiskCache$Snapshot;->diskKey:Ljava/lang/String;

    .line 742
    iput-wide p3, p0, Lcom/lidroid/xutils/util/core/LruDiskCache$Snapshot;->sequenceNumber:J

    .line 743
    iput-object p5, p0, Lcom/lidroid/xutils/util/core/LruDiskCache$Snapshot;->ins:[Ljava/io/FileInputStream;

    .line 744
    iput-object p6, p0, Lcom/lidroid/xutils/util/core/LruDiskCache$Snapshot;->lengths:[J

    .line 745
    return-void
.end method

.method synthetic constructor <init>(Lcom/lidroid/xutils/util/core/LruDiskCache;Ljava/lang/String;J[Ljava/io/FileInputStream;[JLcom/lidroid/xutils/util/core/LruDiskCache$Snapshot;)V
    .locals 1

    .prologue
    .line 740
    invoke-direct/range {p0 .. p6}, Lcom/lidroid/xutils/util/core/LruDiskCache$Snapshot;-><init>(Lcom/lidroid/xutils/util/core/LruDiskCache;Ljava/lang/String;J[Ljava/io/FileInputStream;[J)V

    return-void
.end method


# virtual methods
.method public close()V
    .locals 4

    .prologue
    .line 779
    iget-object v2, p0, Lcom/lidroid/xutils/util/core/LruDiskCache$Snapshot;->ins:[Ljava/io/FileInputStream;

    array-length v3, v2

    const/4 v1, 0x0

    :goto_0
    if-lt v1, v3, :cond_0

    .line 782
    return-void

    .line 779
    :cond_0
    aget-object v0, v2, v1

    .line 780
    .local v0, "in":Ljava/io/InputStream;
    invoke-static {v0}, Lcom/lidroid/xutils/util/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    .line 779
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method public edit()Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 753
    iget-object v0, p0, Lcom/lidroid/xutils/util/core/LruDiskCache$Snapshot;->this$0:Lcom/lidroid/xutils/util/core/LruDiskCache;

    iget-object v1, p0, Lcom/lidroid/xutils/util/core/LruDiskCache$Snapshot;->diskKey:Ljava/lang/String;

    iget-wide v2, p0, Lcom/lidroid/xutils/util/core/LruDiskCache$Snapshot;->sequenceNumber:J

    # invokes: Lcom/lidroid/xutils/util/core/LruDiskCache;->editByDiskKey(Ljava/lang/String;J)Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;
    invoke-static {v0, v1, v2, v3}, Lcom/lidroid/xutils/util/core/LruDiskCache;->access$5(Lcom/lidroid/xutils/util/core/LruDiskCache;Ljava/lang/String;J)Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;

    move-result-object v0

    return-object v0
.end method

.method public getInputStream(I)Ljava/io/FileInputStream;
    .locals 1
    .param p1, "index"    # I

    .prologue
    .line 760
    iget-object v0, p0, Lcom/lidroid/xutils/util/core/LruDiskCache$Snapshot;->ins:[Ljava/io/FileInputStream;

    aget-object v0, v0, p1

    return-object v0
.end method

.method public getLength(I)J
    .locals 2
    .param p1, "index"    # I

    .prologue
    .line 774
    iget-object v0, p0, Lcom/lidroid/xutils/util/core/LruDiskCache$Snapshot;->lengths:[J

    aget-wide v0, v0, p1

    return-wide v0
.end method

.method public getString(I)Ljava/lang/String;
    .locals 1
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 767
    invoke-virtual {p0, p1}, Lcom/lidroid/xutils/util/core/LruDiskCache$Snapshot;->getInputStream(I)Ljava/io/FileInputStream;

    move-result-object v0

    # invokes: Lcom/lidroid/xutils/util/core/LruDiskCache;->inputStreamToString(Ljava/io/InputStream;)Ljava/lang/String;
    invoke-static {v0}, Lcom/lidroid/xutils/util/core/LruDiskCache;->access$6(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
