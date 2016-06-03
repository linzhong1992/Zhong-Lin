.class public final Lcom/lidroid/xutils/util/core/LruDiskCache;
.super Ljava/lang/Object;
.source "LruDiskCache.java"

# interfaces
.implements Ljava/io/Closeable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lidroid/xutils/util/core/LruDiskCache$DiskCacheFileNameGenerator;,
        Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;,
        Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;,
        Lcom/lidroid/xutils/util/core/LruDiskCache$MD5DiskCacheFileNameGenerator;,
        Lcom/lidroid/xutils/util/core/LruDiskCache$Snapshot;,
        Lcom/lidroid/xutils/util/core/LruDiskCache$StrictLineReader;
    }
.end annotation


# static fields
.field static final ANY_SEQUENCE_NUMBER:J = -0x1L

.field private static final CLEAN:Ljava/lang/String; = "CLEAN"

.field private static final DIRTY:Ljava/lang/String; = "DIRTY"

.field static final JOURNAL_FILE:Ljava/lang/String; = "journal"

.field static final JOURNAL_FILE_BACKUP:Ljava/lang/String; = "journal.bkp"

.field static final JOURNAL_FILE_TEMP:Ljava/lang/String; = "journal.tmp"

.field static final LEGAL_KEY_PATTERN:Ljava/util/regex/Pattern;

.field static final MAGIC:Ljava/lang/String; = "libcore.io.DiskLruCache"

.field private static final NULL_OUTPUT_STREAM:Ljava/io/OutputStream;

.field private static final READ:Ljava/lang/String; = "READ"

.field private static final REMOVE:Ljava/lang/String; = "REMOVE"

.field static final VERSION_1:Ljava/lang/String; = "1"


# instance fields
.field private final appVersion:I

.field private final cleanupCallable:Ljava/util/concurrent/Callable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/Callable",
            "<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation
.end field

.field private final directory:Ljava/io/File;

.field private diskCacheFileNameGenerator:Lcom/lidroid/xutils/util/core/LruDiskCache$DiskCacheFileNameGenerator;

.field final executorService:Ljava/util/concurrent/ThreadPoolExecutor;

.field private final journalFile:Ljava/io/File;

.field private final journalFileBackup:Ljava/io/File;

.field private final journalFileTmp:Ljava/io/File;

.field private journalWriter:Ljava/io/Writer;

.field private final lruEntries:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;",
            ">;"
        }
    .end annotation
.end field

.field private maxSize:J

.field private nextSequenceNumber:J

.field private redundantOpCount:I

.field private size:J

.field private final valueCount:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 87
    const-string v0, "[a-z0-9_-]{1,64}"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/lidroid/xutils/util/core/LruDiskCache;->LEGAL_KEY_PATTERN:Ljava/util/regex/Pattern;

    .line 785
    new-instance v0, Lcom/lidroid/xutils/util/core/LruDiskCache$2;

    invoke-direct {v0}, Lcom/lidroid/xutils/util/core/LruDiskCache$2;-><init>()V

    sput-object v0, Lcom/lidroid/xutils/util/core/LruDiskCache;->NULL_OUTPUT_STREAM:Ljava/io/OutputStream;

    .line 790
    return-void
.end method

.method private constructor <init>(Ljava/io/File;IIJ)V
    .locals 8
    .param p1, "directory"    # Ljava/io/File;
    .param p2, "appVersion"    # I
    .param p3, "valueCount"    # I
    .param p4, "maxSize"    # J

    .prologue
    const-wide/16 v4, 0x0

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 174
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 140
    iput-wide v4, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->size:J

    .line 143
    new-instance v0, Ljava/util/LinkedHashMap;

    const/high16 v1, 0x3f400000    # 0.75f

    invoke-direct {v0, v2, v1, v3}, Ljava/util/LinkedHashMap;-><init>(IFZ)V

    iput-object v0, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->lruEntries:Ljava/util/LinkedHashMap;

    .line 151
    iput-wide v4, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->nextSequenceNumber:J

    .line 157
    new-instance v1, Ljava/util/concurrent/ThreadPoolExecutor;

    const-wide/16 v4, 0x3c

    sget-object v6, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    new-instance v7, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {v7}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    invoke-direct/range {v1 .. v7}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;)V

    iput-object v1, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->executorService:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 158
    new-instance v0, Lcom/lidroid/xutils/util/core/LruDiskCache$1;

    invoke-direct {v0, p0}, Lcom/lidroid/xutils/util/core/LruDiskCache$1;-><init>(Lcom/lidroid/xutils/util/core/LruDiskCache;)V

    iput-object v0, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->cleanupCallable:Ljava/util/concurrent/Callable;

    .line 1241
    new-instance v0, Lcom/lidroid/xutils/util/core/LruDiskCache$MD5DiskCacheFileNameGenerator;

    invoke-direct {v0, p0}, Lcom/lidroid/xutils/util/core/LruDiskCache$MD5DiskCacheFileNameGenerator;-><init>(Lcom/lidroid/xutils/util/core/LruDiskCache;)V

    iput-object v0, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->diskCacheFileNameGenerator:Lcom/lidroid/xutils/util/core/LruDiskCache$DiskCacheFileNameGenerator;

    .line 175
    iput-object p1, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->directory:Ljava/io/File;

    .line 176
    iput p2, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->appVersion:I

    .line 177
    new-instance v0, Ljava/io/File;

    const-string v1, "journal"

    invoke-direct {v0, p1, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->journalFile:Ljava/io/File;

    .line 178
    new-instance v0, Ljava/io/File;

    const-string v1, "journal.tmp"

    invoke-direct {v0, p1, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->journalFileTmp:Ljava/io/File;

    .line 179
    new-instance v0, Ljava/io/File;

    const-string v1, "journal.bkp"

    invoke-direct {v0, p1, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->journalFileBackup:Ljava/io/File;

    .line 180
    iput p3, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->valueCount:I

    .line 181
    iput-wide p4, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->maxSize:J

    .line 182
    return-void
.end method

.method static synthetic access$0(Lcom/lidroid/xutils/util/core/LruDiskCache;)Ljava/io/Writer;
    .locals 1

    .prologue
    .line 141
    iget-object v0, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->journalWriter:Ljava/io/Writer;

    return-object v0
.end method

.method static synthetic access$1(Lcom/lidroid/xutils/util/core/LruDiskCache;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 703
    invoke-direct {p0}, Lcom/lidroid/xutils/util/core/LruDiskCache;->trimToSize()V

    return-void
.end method

.method static synthetic access$10(Lcom/lidroid/xutils/util/core/LruDiskCache;Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 559
    invoke-direct {p0, p1, p2}, Lcom/lidroid/xutils/util/core/LruDiskCache;->completeEdit(Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;Z)V

    return-void
.end method

.method static synthetic access$11(Lcom/lidroid/xutils/util/core/LruDiskCache;Ljava/lang/String;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 635
    invoke-direct {p0, p1}, Lcom/lidroid/xutils/util/core/LruDiskCache;->removeByDiskKey(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$2(Lcom/lidroid/xutils/util/core/LruDiskCache;)Z
    .locals 1

    .prologue
    .line 618
    invoke-direct {p0}, Lcom/lidroid/xutils/util/core/LruDiskCache;->journalRebuildRequired()Z

    move-result v0

    return v0
.end method

.method static synthetic access$3(Lcom/lidroid/xutils/util/core/LruDiskCache;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 351
    invoke-direct {p0}, Lcom/lidroid/xutils/util/core/LruDiskCache;->rebuildJournal()V

    return-void
.end method

.method static synthetic access$4(Lcom/lidroid/xutils/util/core/LruDiskCache;I)V
    .locals 0

    .prologue
    .line 144
    iput p1, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->redundantOpCount:I

    return-void
.end method

.method static synthetic access$5(Lcom/lidroid/xutils/util/core/LruDiskCache;Ljava/lang/String;J)Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 502
    invoke-direct {p0, p1, p2, p3}, Lcom/lidroid/xutils/util/core/LruDiskCache;->editByDiskKey(Ljava/lang/String;J)Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$6(Ljava/io/InputStream;)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 727
    invoke-static {p0}, Lcom/lidroid/xutils/util/core/LruDiskCache;->inputStreamToString(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$7(Lcom/lidroid/xutils/util/core/LruDiskCache;)I
    .locals 1

    .prologue
    .line 139
    iget v0, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->valueCount:I

    return v0
.end method

.method static synthetic access$8(Lcom/lidroid/xutils/util/core/LruDiskCache;)Ljava/io/File;
    .locals 1

    .prologue
    .line 133
    iget-object v0, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->directory:Ljava/io/File;

    return-object v0
.end method

.method static synthetic access$9()Ljava/io/OutputStream;
    .locals 1

    .prologue
    .line 785
    sget-object v0, Lcom/lidroid/xutils/util/core/LruDiskCache;->NULL_OUTPUT_STREAM:Ljava/io/OutputStream;

    return-object v0
.end method

.method private checkNotClosed()V
    .locals 2

    .prologue
    .line 671
    iget-object v0, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->journalWriter:Ljava/io/Writer;

    if-nez v0, :cond_0

    .line 672
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "cache is closed"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 674
    :cond_0
    return-void
.end method

.method private declared-synchronized completeEdit(Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;Z)V
    .locals 12
    .param p1, "editor"    # Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;
    .param p2, "success"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 560
    monitor-enter p0

    :try_start_0
    # getter for: Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;->entry:Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;
    invoke-static {p1}, Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;->access$2(Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;)Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;

    move-result-object v2

    .line 561
    .local v2, "entry":Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;
    # getter for: Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->currentEditor:Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;
    invoke-static {v2}, Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->access$2(Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;)Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;

    move-result-object v8

    if-eq v8, p1, :cond_0

    .line 562
    new-instance v8, Ljava/lang/IllegalStateException;

    invoke-direct {v8}, Ljava/lang/IllegalStateException;-><init>()V

    throw v8
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 560
    .end local v2    # "entry":Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;
    :catchall_0
    move-exception v8

    monitor-exit p0

    throw v8

    .line 566
    .restart local v2    # "entry":Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;
    :cond_0
    if-eqz p2, :cond_1

    :try_start_1
    # getter for: Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->readable:Z
    invoke-static {v2}, Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->access$0(Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;)Z

    move-result v8

    if-nez v8, :cond_1

    .line 567
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    iget v8, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->valueCount:I

    if-lt v3, v8, :cond_5

    .line 579
    .end local v3    # "i":I
    :cond_1
    const/4 v3, 0x0

    .restart local v3    # "i":I
    :goto_1
    iget v8, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->valueCount:I

    if-lt v3, v8, :cond_8

    .line 595
    iget v8, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->redundantOpCount:I

    add-int/lit8 v8, v8, 0x1

    iput v8, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->redundantOpCount:I

    .line 596
    const/4 v8, 0x0

    invoke-static {v2, v8}, Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->access$6(Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;)V

    .line 597
    # getter for: Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->readable:Z
    invoke-static {v2}, Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->access$0(Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;)Z

    move-result v8

    or-int/2addr v8, p2

    if-eqz v8, :cond_b

    .line 598
    const/4 v8, 0x1

    invoke-static {v2, v8}, Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->access$5(Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;Z)V

    .line 599
    iget-object v8, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->journalWriter:Ljava/io/Writer;

    new-instance v9, Ljava/lang/StringBuilder;

    const-string v10, "CLEAN "

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    # getter for: Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->diskKey:Ljava/lang/String;
    invoke-static {v2}, Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->access$3(Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " t_"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    # getter for: Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->expiryTimestamp:J
    invoke-static {v2}, Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->access$9(Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;)J

    move-result-wide v10

    invoke-virtual {v9, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v2}, Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->getLengths()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const/16 v10, 0xa

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 600
    if-eqz p2, :cond_2

    .line 601
    iget-wide v8, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->nextSequenceNumber:J

    const-wide/16 v10, 0x1

    add-long/2addr v10, v8

    iput-wide v10, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->nextSequenceNumber:J

    invoke-static {v2, v8, v9}, Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->access$11(Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;J)V

    .line 607
    :cond_2
    :goto_2
    iget-object v8, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->journalWriter:Ljava/io/Writer;

    invoke-virtual {v8}, Ljava/io/Writer;->flush()V

    .line 609
    iget-wide v8, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->size:J

    iget-wide v10, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->maxSize:J

    cmp-long v8, v8, v10

    if-gtz v8, :cond_3

    invoke-direct {p0}, Lcom/lidroid/xutils/util/core/LruDiskCache;->journalRebuildRequired()Z

    move-result v8

    if-eqz v8, :cond_4

    .line 610
    :cond_3
    iget-object v8, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->executorService:Ljava/util/concurrent/ThreadPoolExecutor;

    iget-object v9, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->cleanupCallable:Ljava/util/concurrent/Callable;

    invoke-virtual {v8, v9}, Ljava/util/concurrent/ThreadPoolExecutor;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 612
    :cond_4
    :goto_3
    monitor-exit p0

    return-void

    .line 568
    :cond_5
    :try_start_2
    # getter for: Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;->written:[Z
    invoke-static {p1}, Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;->access$3(Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;)[Z

    move-result-object v8

    aget-boolean v8, v8, v3

    if-nez v8, :cond_6

    .line 569
    invoke-virtual {p1}, Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;->abort()V

    .line 570
    new-instance v8, Ljava/lang/IllegalStateException;

    new-instance v9, Ljava/lang/StringBuilder;

    const-string v10, "Newly created entry didn\'t create value for index "

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 572
    :cond_6
    invoke-virtual {v2, v3}, Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->getDirtyFile(I)Ljava/io/File;

    move-result-object v8

    invoke-virtual {v8}, Ljava/io/File;->exists()Z

    move-result v8

    if-nez v8, :cond_7

    .line 573
    invoke-virtual {p1}, Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;->abort()V

    goto :goto_3

    .line 567
    :cond_7
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_0

    .line 580
    :cond_8
    invoke-virtual {v2, v3}, Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->getDirtyFile(I)Ljava/io/File;

    move-result-object v1

    .line 581
    .local v1, "dirty":Ljava/io/File;
    if-eqz p2, :cond_a

    .line 582
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v8

    if-eqz v8, :cond_9

    .line 583
    invoke-virtual {v2, v3}, Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->getCleanFile(I)Ljava/io/File;

    move-result-object v0

    .line 584
    .local v0, "clean":Ljava/io/File;
    invoke-virtual {v1, v0}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    .line 585
    # getter for: Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->lengths:[J
    invoke-static {v2}, Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->access$8(Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;)[J

    move-result-object v8

    aget-wide v6, v8, v3

    .line 586
    .local v6, "oldLength":J
    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v4

    .line 587
    .local v4, "newLength":J
    # getter for: Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->lengths:[J
    invoke-static {v2}, Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->access$8(Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;)[J

    move-result-object v8

    aput-wide v4, v8, v3

    .line 588
    iget-wide v8, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->size:J

    sub-long/2addr v8, v6

    add-long/2addr v8, v4

    iput-wide v8, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->size:J

    .line 579
    .end local v0    # "clean":Ljava/io/File;
    .end local v4    # "newLength":J
    .end local v6    # "oldLength":J
    :cond_9
    :goto_4
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_1

    .line 591
    :cond_a
    invoke-static {v1}, Lcom/lidroid/xutils/util/core/LruDiskCache;->deleteIfExists(Ljava/io/File;)V

    goto :goto_4

    .line 604
    .end local v1    # "dirty":Ljava/io/File;
    :cond_b
    iget-object v8, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->lruEntries:Ljava/util/LinkedHashMap;

    # getter for: Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->diskKey:Ljava/lang/String;
    invoke-static {v2}, Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->access$3(Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/util/LinkedHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 605
    iget-object v8, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->journalWriter:Ljava/io/Writer;

    new-instance v9, Ljava/lang/StringBuilder;

    const-string v10, "REMOVE "

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    # getter for: Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->diskKey:Ljava/lang/String;
    invoke-static {v2}, Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->access$3(Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const/16 v10, 0xa

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/io/Writer;->write(Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto/16 :goto_2
.end method

.method private static deleteContents(Ljava/io/File;)V
    .locals 5
    .param p0, "dir"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1050
    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v1

    .line 1051
    .local v1, "files":[Ljava/io/File;
    if-nez v1, :cond_0

    .line 1052
    new-instance v2, Ljava/io/IOException;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "not a readable directory: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1054
    :cond_0
    array-length v3, v1

    const/4 v2, 0x0

    :goto_0
    if-lt v2, v3, :cond_1

    .line 1062
    return-void

    .line 1054
    :cond_1
    aget-object v0, v1, v2

    .line 1055
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 1056
    invoke-static {v0}, Lcom/lidroid/xutils/util/core/LruDiskCache;->deleteContents(Ljava/io/File;)V

    .line 1058
    :cond_2
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    move-result v4

    if-nez v4, :cond_3

    .line 1059
    new-instance v2, Ljava/io/IOException;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "failed to delete file: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1054
    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method private static deleteIfExists(Ljava/io/File;)V
    .locals 1
    .param p0, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 392
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    move-result v0

    if-nez v0, :cond_0

    .line 393
    new-instance v0, Ljava/io/IOException;

    invoke-direct {v0}, Ljava/io/IOException;-><init>()V

    throw v0

    .line 395
    :cond_0
    return-void
.end method

.method private declared-synchronized editByDiskKey(Ljava/lang/String;J)Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;
    .locals 6
    .param p1, "diskKey"    # Ljava/lang/String;
    .param p2, "expectedSequenceNumber"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 503
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/lidroid/xutils/util/core/LruDiskCache;->checkNotClosed()V

    .line 504
    invoke-direct {p0, p1}, Lcom/lidroid/xutils/util/core/LruDiskCache;->validateKey(Ljava/lang/String;)V

    .line 505
    iget-object v2, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v2, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;

    .line 506
    .local v1, "entry":Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;
    const-wide/16 v2, -0x1

    cmp-long v2, p2, v2

    if-eqz v2, :cond_1

    .line 507
    if-eqz v1, :cond_0

    # getter for: Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->sequenceNumber:J
    invoke-static {v1}, Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->access$10(Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;)J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-wide v2

    cmp-long v2, v2, p2

    if-eqz v2, :cond_1

    .line 523
    :cond_0
    :goto_0
    monitor-exit p0

    return-object v0

    .line 510
    :cond_1
    if-nez v1, :cond_3

    .line 511
    :try_start_1
    new-instance v1, Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;

    .end local v1    # "entry":Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;
    const/4 v2, 0x0

    invoke-direct {v1, p0, p1, v2}, Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;-><init>(Lcom/lidroid/xutils/util/core/LruDiskCache;Ljava/lang/String;Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;)V

    .line 512
    .restart local v1    # "entry":Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;
    iget-object v2, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v2, p1, v1}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 517
    :cond_2
    new-instance v0, Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;

    const/4 v2, 0x0

    invoke-direct {v0, p0, v1, v2}, Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;-><init>(Lcom/lidroid/xutils/util/core/LruDiskCache;Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;)V

    .line 518
    .local v0, "editor":Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;
    invoke-static {v1, v0}, Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->access$6(Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;)V

    .line 521
    iget-object v2, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->journalWriter:Ljava/io/Writer;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "DIRTY "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const/16 v4, 0xa

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 522
    iget-object v2, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->journalWriter:Ljava/io/Writer;

    invoke-virtual {v2}, Ljava/io/Writer;->flush()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 503
    .end local v0    # "editor":Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;
    .end local v1    # "entry":Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2

    .line 513
    .restart local v1    # "entry":Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;
    :cond_3
    :try_start_2
    # getter for: Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->currentEditor:Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;
    invoke-static {v1}, Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->access$2(Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;)Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-object v2

    if-eqz v2, :cond_2

    goto :goto_0
.end method

.method private declared-synchronized getByDiskKey(Ljava/lang/String;)Lcom/lidroid/xutils/util/core/LruDiskCache$Snapshot;
    .locals 12
    .param p1, "diskKey"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 434
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/lidroid/xutils/util/core/LruDiskCache;->checkNotClosed()V

    .line 435
    invoke-direct {p0, p1}, Lcom/lidroid/xutils/util/core/LruDiskCache;->validateKey(Ljava/lang/String;)V

    .line 436
    iget-object v2, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v2, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 437
    .local v9, "entry":Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;
    if-nez v9, :cond_1

    .line 490
    :cond_0
    :goto_0
    monitor-exit p0

    return-object v1

    .line 441
    :cond_1
    :try_start_1
    # getter for: Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->readable:Z
    invoke-static {v9}, Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->access$0(Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 446
    # getter for: Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->expiryTimestamp:J
    invoke-static {v9}, Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->access$9(Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;)J

    move-result-wide v2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    cmp-long v2, v2, v4

    if-gez v2, :cond_4

    .line 447
    const/4 v11, 0x0

    .local v11, "i":I
    :goto_1
    iget v2, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->valueCount:I

    if-lt v11, v2, :cond_2

    .line 455
    iget v2, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->redundantOpCount:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->redundantOpCount:I

    .line 456
    iget-object v2, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->journalWriter:Ljava/io/Writer;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "REMOVE "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const/16 v4, 0xa

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/Writer;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    .line 457
    iget-object v2, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v2, p1}, Ljava/util/LinkedHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 458
    invoke-direct {p0}, Lcom/lidroid/xutils/util/core/LruDiskCache;->journalRebuildRequired()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 459
    iget-object v2, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->executorService:Ljava/util/concurrent/ThreadPoolExecutor;

    iget-object v3, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->cleanupCallable:Ljava/util/concurrent/Callable;

    invoke-virtual {v2, v3}, Ljava/util/concurrent/ThreadPoolExecutor;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 434
    .end local v9    # "entry":Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;
    .end local v11    # "i":I
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1

    .line 448
    .restart local v9    # "entry":Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;
    .restart local v11    # "i":I
    :cond_2
    :try_start_2
    invoke-virtual {v9, v11}, Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->getCleanFile(I)Ljava/io/File;

    move-result-object v10

    .line 449
    .local v10, "file":Ljava/io/File;
    invoke-virtual {v10}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-virtual {v10}, Ljava/io/File;->delete()Z

    move-result v2

    if-nez v2, :cond_3

    .line 450
    new-instance v1, Ljava/io/IOException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "failed to delete "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 452
    :cond_3
    iget-wide v2, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->size:J

    # getter for: Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->lengths:[J
    invoke-static {v9}, Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->access$8(Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;)[J

    move-result-object v4

    aget-wide v4, v4, v11

    sub-long/2addr v2, v4

    iput-wide v2, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->size:J

    .line 453
    # getter for: Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->lengths:[J
    invoke-static {v9}, Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->access$8(Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;)[J

    move-result-object v2

    const-wide/16 v4, 0x0

    aput-wide v4, v2, v11

    .line 447
    add-int/lit8 v11, v11, 0x1

    goto :goto_1

    .line 467
    .end local v10    # "file":Ljava/io/File;
    .end local v11    # "i":I
    :cond_4
    iget v2, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->valueCount:I

    new-array v6, v2, [Ljava/io/FileInputStream;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 469
    .local v6, "ins":[Ljava/io/FileInputStream;
    const/4 v11, 0x0

    .restart local v11    # "i":I
    :goto_2
    :try_start_3
    iget v2, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->valueCount:I
    :try_end_3
    .catch Ljava/io/FileNotFoundException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    if-lt v11, v2, :cond_6

    .line 484
    :try_start_4
    iget v1, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->redundantOpCount:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->redundantOpCount:I

    .line 485
    iget-object v1, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->journalWriter:Ljava/io/Writer;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "READ "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const/16 v3, 0xa

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/Writer;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    .line 486
    invoke-direct {p0}, Lcom/lidroid/xutils/util/core/LruDiskCache;->journalRebuildRequired()Z

    move-result v1

    if-eqz v1, :cond_5

    .line 487
    iget-object v1, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->executorService:Ljava/util/concurrent/ThreadPoolExecutor;

    iget-object v2, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->cleanupCallable:Ljava/util/concurrent/Callable;

    invoke-virtual {v1, v2}, Ljava/util/concurrent/ThreadPoolExecutor;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    .line 490
    :cond_5
    new-instance v1, Lcom/lidroid/xutils/util/core/LruDiskCache$Snapshot;

    # getter for: Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->sequenceNumber:J
    invoke-static {v9}, Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->access$10(Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;)J

    move-result-wide v4

    # getter for: Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->lengths:[J
    invoke-static {v9}, Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->access$8(Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;)[J

    move-result-object v7

    const/4 v8, 0x0

    move-object v2, p0

    move-object v3, p1

    invoke-direct/range {v1 .. v8}, Lcom/lidroid/xutils/util/core/LruDiskCache$Snapshot;-><init>(Lcom/lidroid/xutils/util/core/LruDiskCache;Ljava/lang/String;J[Ljava/io/FileInputStream;[JLcom/lidroid/xutils/util/core/LruDiskCache$Snapshot;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto/16 :goto_0

    .line 470
    :cond_6
    :try_start_5
    new-instance v2, Ljava/io/FileInputStream;

    invoke-virtual {v9, v11}, Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->getCleanFile(I)Ljava/io/File;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    aput-object v2, v6, v11
    :try_end_5
    .catch Ljava/io/FileNotFoundException; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 469
    add-int/lit8 v11, v11, 0x1

    goto :goto_2

    .line 472
    :catch_0
    move-exception v0

    .line 474
    .local v0, "e":Ljava/io/FileNotFoundException;
    const/4 v11, 0x0

    :goto_3
    :try_start_6
    iget v2, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->valueCount:I

    if-ge v11, v2, :cond_0

    .line 475
    aget-object v2, v6, v11

    if-eqz v2, :cond_0

    .line 476
    aget-object v2, v6, v11

    invoke-static {v2}, Lcom/lidroid/xutils/util/IOUtils;->closeQuietly(Ljava/io/Closeable;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 474
    add-int/lit8 v11, v11, 0x1

    goto :goto_3
.end method

.method private static inputStreamToString(Ljava/io/InputStream;)Ljava/lang/String;
    .locals 2
    .param p0, "in"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 728
    new-instance v0, Ljava/io/InputStreamReader;

    const-string v1, "UTF-8"

    invoke-direct {v0, p0, v1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    invoke-static {v0}, Lcom/lidroid/xutils/util/core/LruDiskCache;->readFully(Ljava/io/Reader;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private journalRebuildRequired()Z
    .locals 3

    .prologue
    .line 619
    const/16 v0, 0x7d0

    .line 620
    .local v0, "redundantOpCompactThreshold":I
    iget v1, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->redundantOpCount:I

    const/16 v2, 0x7d0

    if-lt v1, v2, :cond_0

    .line 621
    iget v1, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->redundantOpCount:I

    iget-object v2, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v2}, Ljava/util/LinkedHashMap;->size()I

    move-result v2

    .line 620
    if-lt v1, v2, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static open(Ljava/io/File;IIJ)Lcom/lidroid/xutils/util/core/LruDiskCache;
    .locals 11
    .param p0, "directory"    # Ljava/io/File;
    .param p1, "appVersion"    # I
    .param p2, "valueCount"    # I
    .param p3, "maxSize"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 195
    const-wide/16 v2, 0x0

    cmp-long v1, p3, v2

    if-gtz v1, :cond_0

    .line 196
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "maxSize <= 0"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 198
    :cond_0
    if-gtz p2, :cond_1

    .line 199
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "valueCount <= 0"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 203
    :cond_1
    new-instance v6, Ljava/io/File;

    const-string v1, "journal.bkp"

    invoke-direct {v6, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 204
    .local v6, "backupFile":Ljava/io/File;
    invoke-virtual {v6}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 205
    new-instance v8, Ljava/io/File;

    const-string v1, "journal"

    invoke-direct {v8, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 207
    .local v8, "journalFile":Ljava/io/File;
    invoke-virtual {v8}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 208
    invoke-virtual {v6}, Ljava/io/File;->delete()Z

    .line 215
    .end local v8    # "journalFile":Ljava/io/File;
    :cond_2
    :goto_0
    new-instance v0, Lcom/lidroid/xutils/util/core/LruDiskCache;

    move-object v1, p0

    move v2, p1

    move v3, p2

    move-wide v4, p3

    invoke-direct/range {v0 .. v5}, Lcom/lidroid/xutils/util/core/LruDiskCache;-><init>(Ljava/io/File;IIJ)V

    .line 216
    .local v0, "cache":Lcom/lidroid/xutils/util/core/LruDiskCache;
    iget-object v1, v0, Lcom/lidroid/xutils/util/core/LruDiskCache;->journalFile:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 218
    :try_start_0
    invoke-direct {v0}, Lcom/lidroid/xutils/util/core/LruDiskCache;->readJournal()V

    .line 219
    invoke-direct {v0}, Lcom/lidroid/xutils/util/core/LruDiskCache;->processJournal()V

    .line 220
    new-instance v1, Ljava/io/BufferedWriter;

    .line 221
    new-instance v2, Ljava/io/OutputStreamWriter;

    new-instance v3, Ljava/io/FileOutputStream;

    iget-object v4, v0, Lcom/lidroid/xutils/util/core/LruDiskCache;->journalFile:Ljava/io/File;

    const/4 v5, 0x1

    invoke-direct {v3, v4, v5}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;Z)V

    const-string v4, "US-ASCII"

    invoke-direct {v2, v3, v4}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V

    invoke-direct {v1, v2}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V

    .line 220
    iput-object v1, v0, Lcom/lidroid/xutils/util/core/LruDiskCache;->journalWriter:Ljava/io/Writer;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-object v7, v0

    .line 237
    .end local v0    # "cache":Lcom/lidroid/xutils/util/core/LruDiskCache;
    .local v7, "cache":Ljava/lang/Object;
    :goto_1
    return-object v7

    .line 210
    .end local v7    # "cache":Ljava/lang/Object;
    .restart local v8    # "journalFile":Ljava/io/File;
    :cond_3
    const/4 v1, 0x0

    invoke-static {v6, v8, v1}, Lcom/lidroid/xutils/util/core/LruDiskCache;->renameTo(Ljava/io/File;Ljava/io/File;Z)V

    goto :goto_0

    .line 223
    .end local v8    # "journalFile":Ljava/io/File;
    .restart local v0    # "cache":Lcom/lidroid/xutils/util/core/LruDiskCache;
    :catch_0
    move-exception v9

    .line 224
    .local v9, "journalIsCorrupt":Ljava/lang/Throwable;
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "DiskLruCache "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 225
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 226
    const-string v2, " is corrupt: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 227
    invoke-virtual {v9}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 228
    const-string v2, ", removing"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 224
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v9}, Lcom/lidroid/xutils/util/LogUtils;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 229
    invoke-virtual {v0}, Lcom/lidroid/xutils/util/core/LruDiskCache;->delete()V

    .line 234
    .end local v9    # "journalIsCorrupt":Ljava/lang/Throwable;
    :cond_4
    invoke-virtual {p0}, Ljava/io/File;->mkdirs()Z

    .line 235
    new-instance v0, Lcom/lidroid/xutils/util/core/LruDiskCache;

    .end local v0    # "cache":Lcom/lidroid/xutils/util/core/LruDiskCache;
    move-object v1, p0

    move v2, p1

    move v3, p2

    move-wide v4, p3

    invoke-direct/range {v0 .. v5}, Lcom/lidroid/xutils/util/core/LruDiskCache;-><init>(Ljava/io/File;IIJ)V

    .line 236
    .restart local v0    # "cache":Lcom/lidroid/xutils/util/core/LruDiskCache;
    invoke-direct {v0}, Lcom/lidroid/xutils/util/core/LruDiskCache;->rebuildJournal()V

    move-object v7, v0

    .line 237
    .restart local v7    # "cache":Ljava/lang/Object;
    goto :goto_1
.end method

.method private processJournal()V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 329
    iget-object v3, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->journalFileTmp:Ljava/io/File;

    invoke-static {v3}, Lcom/lidroid/xutils/util/core/LruDiskCache;->deleteIfExists(Ljava/io/File;)V

    .line 330
    iget-object v3, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v3}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;>;"
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_1

    .line 345
    return-void

    .line 331
    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;

    .line 332
    .local v0, "entry":Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;
    # getter for: Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->currentEditor:Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;
    invoke-static {v0}, Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->access$2(Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;)Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;

    move-result-object v3

    if-nez v3, :cond_2

    .line 333
    const/4 v2, 0x0

    .local v2, "t":I
    :goto_1
    iget v3, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->valueCount:I

    if-ge v2, v3, :cond_0

    .line 334
    iget-wide v4, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->size:J

    # getter for: Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->lengths:[J
    invoke-static {v0}, Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->access$8(Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;)[J

    move-result-object v3

    aget-wide v6, v3, v2

    add-long/2addr v4, v6

    iput-wide v4, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->size:J

    .line 333
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 337
    .end local v2    # "t":I
    :cond_2
    const/4 v3, 0x0

    invoke-static {v0, v3}, Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->access$6(Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;)V

    .line 338
    const/4 v2, 0x0

    .restart local v2    # "t":I
    :goto_2
    iget v3, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->valueCount:I

    if-lt v2, v3, :cond_3

    .line 342
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    .line 339
    :cond_3
    invoke-virtual {v0, v2}, Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->getCleanFile(I)Ljava/io/File;

    move-result-object v3

    invoke-static {v3}, Lcom/lidroid/xutils/util/core/LruDiskCache;->deleteIfExists(Ljava/io/File;)V

    .line 340
    invoke-virtual {v0, v2}, Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->getDirtyFile(I)Ljava/io/File;

    move-result-object v3

    invoke-static {v3}, Lcom/lidroid/xutils/util/core/LruDiskCache;->deleteIfExists(Ljava/io/File;)V

    .line 338
    add-int/lit8 v2, v2, 0x1

    goto :goto_2
.end method

.method private static readFully(Ljava/io/Reader;)Ljava/lang/String;
    .locals 5
    .param p0, "reader"    # Ljava/io/Reader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1030
    const/4 v2, 0x0

    .line 1032
    .local v2, "writer":Ljava/io/StringWriter;
    :try_start_0
    new-instance v3, Ljava/io/StringWriter;

    invoke-direct {v3}, Ljava/io/StringWriter;-><init>()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 1033
    .end local v2    # "writer":Ljava/io/StringWriter;
    .local v3, "writer":Ljava/io/StringWriter;
    const/16 v4, 0x400

    :try_start_1
    new-array v0, v4, [C

    .line 1035
    .local v0, "buffer":[C
    :goto_0
    invoke-virtual {p0, v0}, Ljava/io/Reader;->read([C)I

    move-result v1

    .local v1, "count":I
    const/4 v4, -0x1

    if-ne v1, v4, :cond_0

    .line 1038
    invoke-virtual {v3}, Ljava/io/StringWriter;->toString()Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v4

    .line 1040
    invoke-static {p0}, Lcom/lidroid/xutils/util/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    .line 1041
    invoke-static {v3}, Lcom/lidroid/xutils/util/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    .line 1038
    return-object v4

    .line 1036
    :cond_0
    const/4 v4, 0x0

    :try_start_2
    invoke-virtual {v3, v0, v4, v1}, Ljava/io/StringWriter;->write([CII)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 1039
    .end local v0    # "buffer":[C
    .end local v1    # "count":I
    :catchall_0
    move-exception v4

    move-object v2, v3

    .line 1040
    .end local v3    # "writer":Ljava/io/StringWriter;
    .restart local v2    # "writer":Ljava/io/StringWriter;
    :goto_1
    invoke-static {p0}, Lcom/lidroid/xutils/util/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    .line 1041
    invoke-static {v2}, Lcom/lidroid/xutils/util/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    .line 1042
    throw v4

    .line 1039
    :catchall_1
    move-exception v4

    goto :goto_1
.end method

.method private readJournal()V
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 241
    const/4 v4, 0x0

    .line 243
    .local v4, "reader":Lcom/lidroid/xutils/util/core/LruDiskCache$StrictLineReader;
    :try_start_0
    new-instance v5, Lcom/lidroid/xutils/util/core/LruDiskCache$StrictLineReader;

    new-instance v8, Ljava/io/FileInputStream;

    iget-object v9, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->journalFile:Ljava/io/File;

    invoke-direct {v8, v9}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v5, p0, v8}, Lcom/lidroid/xutils/util/core/LruDiskCache$StrictLineReader;-><init>(Lcom/lidroid/xutils/util/core/LruDiskCache;Ljava/io/InputStream;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 244
    .end local v4    # "reader":Lcom/lidroid/xutils/util/core/LruDiskCache$StrictLineReader;
    .local v5, "reader":Lcom/lidroid/xutils/util/core/LruDiskCache$StrictLineReader;
    :try_start_1
    invoke-virtual {v5}, Lcom/lidroid/xutils/util/core/LruDiskCache$StrictLineReader;->readLine()Ljava/lang/String;

    move-result-object v3

    .line 245
    .local v3, "magic":Ljava/lang/String;
    invoke-virtual {v5}, Lcom/lidroid/xutils/util/core/LruDiskCache$StrictLineReader;->readLine()Ljava/lang/String;

    move-result-object v7

    .line 246
    .local v7, "version":Ljava/lang/String;
    invoke-virtual {v5}, Lcom/lidroid/xutils/util/core/LruDiskCache$StrictLineReader;->readLine()Ljava/lang/String;

    move-result-object v0

    .line 247
    .local v0, "appVersionString":Ljava/lang/String;
    invoke-virtual {v5}, Lcom/lidroid/xutils/util/core/LruDiskCache$StrictLineReader;->readLine()Ljava/lang/String;

    move-result-object v6

    .line 248
    .local v6, "valueCountString":Ljava/lang/String;
    invoke-virtual {v5}, Lcom/lidroid/xutils/util/core/LruDiskCache$StrictLineReader;->readLine()Ljava/lang/String;

    move-result-object v1

    .line 249
    .local v1, "blank":Ljava/lang/String;
    const-string v8, "libcore.io.DiskLruCache"

    invoke-virtual {v8, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 250
    const-string v8, "1"

    invoke-virtual {v8, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 251
    iget v8, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->appVersion:I

    invoke-static {v8}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 252
    iget v8, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->valueCount:I

    invoke-static {v8}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 253
    const-string v8, ""

    invoke-virtual {v8, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_1

    .line 254
    :cond_0
    new-instance v8, Ljava/io/IOException;

    new-instance v9, Ljava/lang/StringBuilder;

    const-string v10, "unexpected journal header: ["

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ", "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ", "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    .line 255
    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ", "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "]"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 254
    invoke-direct {v8, v9}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v8
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 268
    .end local v0    # "appVersionString":Ljava/lang/String;
    .end local v1    # "blank":Ljava/lang/String;
    .end local v3    # "magic":Ljava/lang/String;
    .end local v6    # "valueCountString":Ljava/lang/String;
    .end local v7    # "version":Ljava/lang/String;
    :catchall_0
    move-exception v8

    move-object v4, v5

    .line 269
    .end local v5    # "reader":Lcom/lidroid/xutils/util/core/LruDiskCache$StrictLineReader;
    .restart local v4    # "reader":Lcom/lidroid/xutils/util/core/LruDiskCache$StrictLineReader;
    :goto_0
    invoke-static {v4}, Lcom/lidroid/xutils/util/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    .line 270
    throw v8

    .line 258
    .end local v4    # "reader":Lcom/lidroid/xutils/util/core/LruDiskCache$StrictLineReader;
    .restart local v0    # "appVersionString":Ljava/lang/String;
    .restart local v1    # "blank":Ljava/lang/String;
    .restart local v3    # "magic":Ljava/lang/String;
    .restart local v5    # "reader":Lcom/lidroid/xutils/util/core/LruDiskCache$StrictLineReader;
    .restart local v6    # "valueCountString":Ljava/lang/String;
    .restart local v7    # "version":Ljava/lang/String;
    :cond_1
    const/4 v2, 0x0

    .line 261
    .local v2, "lineCount":I
    :goto_1
    :try_start_2
    invoke-virtual {v5}, Lcom/lidroid/xutils/util/core/LruDiskCache$StrictLineReader;->readLine()Ljava/lang/String;

    move-result-object v8

    invoke-direct {p0, v8}, Lcom/lidroid/xutils/util/core/LruDiskCache;->readJournalLine(Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/io/EOFException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 262
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 263
    :catch_0
    move-exception v8

    .line 267
    :try_start_3
    iget-object v8, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v8}, Ljava/util/LinkedHashMap;->size()I

    move-result v8

    sub-int v8, v2, v8

    iput v8, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->redundantOpCount:I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 269
    invoke-static {v5}, Lcom/lidroid/xutils/util/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    .line 271
    return-void

    .line 268
    .end local v0    # "appVersionString":Ljava/lang/String;
    .end local v1    # "blank":Ljava/lang/String;
    .end local v2    # "lineCount":I
    .end local v3    # "magic":Ljava/lang/String;
    .end local v5    # "reader":Lcom/lidroid/xutils/util/core/LruDiskCache$StrictLineReader;
    .end local v6    # "valueCountString":Ljava/lang/String;
    .end local v7    # "version":Ljava/lang/String;
    .restart local v4    # "reader":Lcom/lidroid/xutils/util/core/LruDiskCache$StrictLineReader;
    :catchall_1
    move-exception v8

    goto :goto_0
.end method

.method private readJournalLine(Ljava/lang/String;)V
    .locals 11
    .param p1, "line"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v7, 0x20

    const/4 v10, 0x1

    const/4 v9, 0x0

    const/4 v8, -0x1

    .line 274
    invoke-virtual {p1, v7}, Ljava/lang/String;->indexOf(I)I

    move-result v3

    .line 275
    .local v3, "firstSpace":I
    if-ne v3, v8, :cond_0

    .line 276
    new-instance v7, Ljava/io/IOException;

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "unexpected journal line: "

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 279
    :cond_0
    add-int/lit8 v4, v3, 0x1

    .line 280
    .local v4, "keyBegin":I
    invoke-virtual {p1, v7, v4}, Ljava/lang/String;->indexOf(II)I

    move-result v6

    .line 282
    .local v6, "secondSpace":I
    if-ne v6, v8, :cond_2

    .line 283
    invoke-virtual {p1, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 284
    .local v0, "diskKey":Ljava/lang/String;
    const-string v7, "REMOVE"

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v7

    if-ne v3, v7, :cond_3

    const-string v7, "REMOVE"

    invoke-virtual {p1, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 285
    iget-object v7, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v7, v0}, Ljava/util/LinkedHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 322
    :cond_1
    :goto_0
    return-void

    .line 289
    .end local v0    # "diskKey":Ljava/lang/String;
    :cond_2
    invoke-virtual {p1, v4, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 292
    .restart local v0    # "diskKey":Ljava/lang/String;
    :cond_3
    iget-object v7, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v7, v0}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;

    .line 293
    .local v2, "entry":Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;
    if-nez v2, :cond_4

    .line 294
    new-instance v2, Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;

    .end local v2    # "entry":Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;
    invoke-direct {v2, p0, v0, v9}, Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;-><init>(Lcom/lidroid/xutils/util/core/LruDiskCache;Ljava/lang/String;Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;)V

    .line 295
    .restart local v2    # "entry":Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;
    iget-object v7, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v7, v0, v2}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 298
    :cond_4
    if-eq v6, v8, :cond_6

    const-string v7, "CLEAN"

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v7

    if-ne v3, v7, :cond_6

    const-string v7, "CLEAN"

    invoke-virtual {p1, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_6

    .line 299
    invoke-static {v2, v10}, Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->access$5(Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;Z)V

    .line 300
    invoke-static {v2, v9}, Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->access$6(Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;)V

    .line 301
    add-int/lit8 v7, v6, 0x1

    invoke-virtual {p1, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v7

    const-string v8, " "

    invoke-virtual {v7, v8}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    .line 302
    .local v5, "parts":[Ljava/lang/String;
    array-length v7, v5

    if-lez v7, :cond_1

    .line 304
    const/4 v7, 0x0

    :try_start_0
    aget-object v7, v5, v7

    const-string v8, "t_"

    invoke-virtual {v7, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_5

    .line 305
    const/4 v7, 0x0

    aget-object v7, v5, v7

    const/4 v8, 0x2

    invoke-virtual {v7, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Long;->longValue()J

    move-result-wide v8

    invoke-static {v2, v8, v9}, Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->access$1(Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;J)V

    .line 306
    const/4 v7, 0x1

    # invokes: Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->setLengths([Ljava/lang/String;I)V
    invoke-static {v2, v5, v7}, Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->access$7(Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;[Ljava/lang/String;I)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 311
    :catch_0
    move-exception v1

    .line 312
    .local v1, "e":Ljava/lang/Throwable;
    new-instance v7, Ljava/io/IOException;

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "unexpected journal line: "

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 308
    .end local v1    # "e":Ljava/lang/Throwable;
    :cond_5
    const-wide v8, 0x7fffffffffffffffL

    :try_start_1
    invoke-static {v2, v8, v9}, Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->access$1(Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;J)V

    .line 309
    const/4 v7, 0x0

    # invokes: Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->setLengths([Ljava/lang/String;I)V
    invoke-static {v2, v5, v7}, Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->access$7(Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;[Ljava/lang/String;I)V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0

    .line 315
    .end local v5    # "parts":[Ljava/lang/String;
    :cond_6
    if-ne v6, v8, :cond_7

    const-string v7, "DIRTY"

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v7

    if-ne v3, v7, :cond_7

    const-string v7, "DIRTY"

    invoke-virtual {p1, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_7

    .line 316
    new-instance v7, Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;

    invoke-direct {v7, p0, v2, v9}, Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;-><init>(Lcom/lidroid/xutils/util/core/LruDiskCache;Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;)V

    invoke-static {v2, v7}, Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->access$6(Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;)V

    goto/16 :goto_0

    .line 317
    :cond_7
    if-ne v6, v8, :cond_8

    const-string v7, "READ"

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v7

    if-ne v3, v7, :cond_8

    const-string v7, "READ"

    invoke-virtual {p1, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_1

    .line 320
    :cond_8
    new-instance v7, Ljava/io/IOException;

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "unexpected journal line: "

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v7
.end method

.method private declared-synchronized rebuildJournal()V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 352
    monitor-enter p0

    :try_start_0
    iget-object v3, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->journalWriter:Ljava/io/Writer;

    if-eqz v3, :cond_0

    .line 353
    iget-object v3, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->journalWriter:Ljava/io/Writer;

    invoke-static {v3}, Lcom/lidroid/xutils/util/IOUtils;->closeQuietly(Ljava/io/Closeable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 356
    :cond_0
    const/4 v1, 0x0

    .line 358
    .local v1, "writer":Ljava/io/Writer;
    :try_start_1
    new-instance v2, Ljava/io/BufferedWriter;

    .line 359
    new-instance v3, Ljava/io/OutputStreamWriter;

    new-instance v4, Ljava/io/FileOutputStream;

    iget-object v5, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->journalFileTmp:Ljava/io/File;

    invoke-direct {v4, v5}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    const-string v5, "US-ASCII"

    invoke-direct {v3, v4, v5}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V

    .line 358
    invoke-direct {v2, v3}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 360
    .end local v1    # "writer":Ljava/io/Writer;
    .local v2, "writer":Ljava/io/Writer;
    :try_start_2
    const-string v3, "libcore.io.DiskLruCache"

    invoke-virtual {v2, v3}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 361
    const-string v3, "\n"

    invoke-virtual {v2, v3}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 362
    const-string v3, "1"

    invoke-virtual {v2, v3}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 363
    const-string v3, "\n"

    invoke-virtual {v2, v3}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 364
    iget v3, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->appVersion:I

    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 365
    const-string v3, "\n"

    invoke-virtual {v2, v3}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 366
    iget v3, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->valueCount:I

    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 367
    const-string v3, "\n"

    invoke-virtual {v2, v3}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 368
    const-string v3, "\n"

    invoke-virtual {v2, v3}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 370
    iget-object v3, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v3}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result v4

    if-nez v4, :cond_2

    .line 378
    :try_start_3
    invoke-static {v2}, Lcom/lidroid/xutils/util/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    .line 381
    iget-object v3, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->journalFile:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 382
    iget-object v3, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->journalFile:Ljava/io/File;

    iget-object v4, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->journalFileBackup:Ljava/io/File;

    const/4 v5, 0x1

    invoke-static {v3, v4, v5}, Lcom/lidroid/xutils/util/core/LruDiskCache;->renameTo(Ljava/io/File;Ljava/io/File;Z)V

    .line 384
    :cond_1
    iget-object v3, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->journalFileTmp:Ljava/io/File;

    iget-object v4, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->journalFile:Ljava/io/File;

    const/4 v5, 0x0

    invoke-static {v3, v4, v5}, Lcom/lidroid/xutils/util/core/LruDiskCache;->renameTo(Ljava/io/File;Ljava/io/File;Z)V

    .line 385
    iget-object v3, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->journalFileBackup:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    .line 387
    new-instance v3, Ljava/io/BufferedWriter;

    .line 388
    new-instance v4, Ljava/io/OutputStreamWriter;

    new-instance v5, Ljava/io/FileOutputStream;

    iget-object v6, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->journalFile:Ljava/io/File;

    const/4 v7, 0x1

    invoke-direct {v5, v6, v7}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;Z)V

    const-string v6, "US-ASCII"

    invoke-direct {v4, v5, v6}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V

    invoke-direct {v3, v4}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V

    .line 387
    iput-object v3, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->journalWriter:Ljava/io/Writer;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 389
    monitor-exit p0

    return-void

    .line 370
    :cond_2
    :try_start_4
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;

    .line 371
    .local v0, "entry":Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;
    # getter for: Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->currentEditor:Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;
    invoke-static {v0}, Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->access$2(Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;)Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;

    move-result-object v4

    if-eqz v4, :cond_3

    .line 372
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "DIRTY "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    # getter for: Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->diskKey:Ljava/lang/String;
    invoke-static {v0}, Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->access$3(Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/16 v5, 0xa

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/io/Writer;->write(Ljava/lang/String;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_0

    .line 377
    .end local v0    # "entry":Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;
    :catchall_0
    move-exception v3

    move-object v1, v2

    .line 378
    .end local v2    # "writer":Ljava/io/Writer;
    .restart local v1    # "writer":Ljava/io/Writer;
    :goto_1
    :try_start_5
    invoke-static {v1}, Lcom/lidroid/xutils/util/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    .line 379
    throw v3
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 352
    .end local v1    # "writer":Ljava/io/Writer;
    :catchall_1
    move-exception v3

    monitor-exit p0

    throw v3

    .line 374
    .restart local v0    # "entry":Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;
    .restart local v2    # "writer":Ljava/io/Writer;
    :cond_3
    :try_start_6
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "CLEAN "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    # getter for: Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->diskKey:Ljava/lang/String;
    invoke-static {v0}, Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->access$3(Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " t_"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    # getter for: Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->expiryTimestamp:J
    invoke-static {v0}, Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->access$9(Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;)J

    move-result-wide v6

    invoke-virtual {v4, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->getLengths()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/16 v5, 0xa

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/io/Writer;->write(Ljava/lang/String;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    goto/16 :goto_0

    .line 377
    .end local v0    # "entry":Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;
    .end local v2    # "writer":Ljava/io/Writer;
    .restart local v1    # "writer":Ljava/io/Writer;
    :catchall_2
    move-exception v3

    goto :goto_1
.end method

.method private declared-synchronized removeByDiskKey(Ljava/lang/String;)Z
    .locals 8
    .param p1, "diskKey"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 636
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/lidroid/xutils/util/core/LruDiskCache;->checkNotClosed()V

    .line 637
    invoke-direct {p0, p1}, Lcom/lidroid/xutils/util/core/LruDiskCache;->validateKey(Ljava/lang/String;)V

    .line 638
    iget-object v3, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v3, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;

    .line 639
    .local v0, "entry":Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;
    if-eqz v0, :cond_0

    # getter for: Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->currentEditor:Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;
    invoke-static {v0}, Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->access$2(Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;)Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v3

    if-eqz v3, :cond_1

    .line 640
    :cond_0
    const/4 v3, 0x0

    .line 660
    :goto_0
    monitor-exit p0

    return v3

    .line 643
    :cond_1
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    :try_start_1
    iget v3, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->valueCount:I

    if-lt v2, v3, :cond_3

    .line 652
    iget v3, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->redundantOpCount:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->redundantOpCount:I

    .line 653
    iget-object v3, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->journalWriter:Ljava/io/Writer;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "REMOVE "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/16 v5, 0xa

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/Writer;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    .line 654
    iget-object v3, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v3, p1}, Ljava/util/LinkedHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 656
    invoke-direct {p0}, Lcom/lidroid/xutils/util/core/LruDiskCache;->journalRebuildRequired()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 657
    iget-object v3, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->executorService:Ljava/util/concurrent/ThreadPoolExecutor;

    iget-object v4, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->cleanupCallable:Ljava/util/concurrent/Callable;

    invoke-virtual {v3, v4}, Ljava/util/concurrent/ThreadPoolExecutor;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    .line 660
    :cond_2
    const/4 v3, 0x1

    goto :goto_0

    .line 644
    :cond_3
    invoke-virtual {v0, v2}, Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->getCleanFile(I)Ljava/io/File;

    move-result-object v1

    .line 645
    .local v1, "file":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_4

    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    move-result v3

    if-nez v3, :cond_4

    .line 646
    new-instance v3, Ljava/io/IOException;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "failed to delete "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 636
    .end local v0    # "entry":Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;
    .end local v1    # "file":Ljava/io/File;
    .end local v2    # "i":I
    :catchall_0
    move-exception v3

    monitor-exit p0

    throw v3

    .line 648
    .restart local v0    # "entry":Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;
    .restart local v1    # "file":Ljava/io/File;
    .restart local v2    # "i":I
    :cond_4
    :try_start_2
    iget-wide v4, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->size:J

    # getter for: Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->lengths:[J
    invoke-static {v0}, Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->access$8(Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;)[J

    move-result-object v3

    aget-wide v6, v3, v2

    sub-long/2addr v4, v6

    iput-wide v4, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->size:J

    .line 649
    # getter for: Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->lengths:[J
    invoke-static {v0}, Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->access$8(Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;)[J

    move-result-object v3

    const-wide/16 v4, 0x0

    aput-wide v4, v3, v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 643
    add-int/lit8 v2, v2, 0x1

    goto :goto_1
.end method

.method private static renameTo(Ljava/io/File;Ljava/io/File;Z)V
    .locals 1
    .param p0, "from"    # Ljava/io/File;
    .param p1, "to"    # Ljava/io/File;
    .param p2, "deleteDestination"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 398
    if-eqz p2, :cond_0

    .line 399
    invoke-static {p1}, Lcom/lidroid/xutils/util/core/LruDiskCache;->deleteIfExists(Ljava/io/File;)V

    .line 401
    :cond_0
    invoke-virtual {p0, p1}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 402
    new-instance v0, Ljava/io/IOException;

    invoke-direct {v0}, Ljava/io/IOException;-><init>()V

    throw v0

    .line 404
    :cond_1
    return-void
.end method

.method private trimToSize()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 704
    :goto_0
    iget-wide v2, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->size:J

    iget-wide v4, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->maxSize:J

    cmp-long v1, v2, v4

    if-gtz v1, :cond_0

    .line 708
    return-void

    .line 705
    :cond_0
    iget-object v1, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 706
    .local v0, "toEvict":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-direct {p0, v1}, Lcom/lidroid/xutils/util/core/LruDiskCache;->removeByDiskKey(Ljava/lang/String;)Z

    goto :goto_0
.end method

.method private validateKey(Ljava/lang/String;)V
    .locals 4
    .param p1, "diskKey"    # Ljava/lang/String;

    .prologue
    .line 721
    sget-object v1, Lcom/lidroid/xutils/util/core/LruDiskCache;->LEGAL_KEY_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v1, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 722
    .local v0, "matcher":Ljava/util/regex/Matcher;
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v1

    if-nez v1, :cond_0

    .line 723
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "keys must match regex [a-z0-9_-]{1,64}: \""

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 725
    :cond_0
    return-void
.end method


# virtual methods
.method public declared-synchronized close()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 690
    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->journalWriter:Ljava/io/Writer;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v1, :cond_0

    .line 701
    :goto_0
    monitor-exit p0

    return-void

    .line 693
    :cond_0
    :try_start_1
    new-instance v1, Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v2}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_1
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_2

    .line 698
    invoke-direct {p0}, Lcom/lidroid/xutils/util/core/LruDiskCache;->trimToSize()V

    .line 699
    iget-object v1, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->journalWriter:Ljava/io/Writer;

    invoke-virtual {v1}, Ljava/io/Writer;->close()V

    .line 700
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->journalWriter:Ljava/io/Writer;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 690
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1

    .line 693
    :cond_2
    :try_start_2
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;

    .line 694
    .local v0, "entry":Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;
    # getter for: Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->currentEditor:Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;
    invoke-static {v0}, Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->access$2(Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;)Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 695
    # getter for: Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->currentEditor:Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;
    invoke-static {v0}, Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->access$2(Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;)Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;

    move-result-object v2

    invoke-virtual {v2}, Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;->abort()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1
.end method

.method public delete()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 716
    invoke-static {p0}, Lcom/lidroid/xutils/util/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    .line 717
    iget-object v0, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->directory:Ljava/io/File;

    invoke-static {v0}, Lcom/lidroid/xutils/util/core/LruDiskCache;->deleteContents(Ljava/io/File;)V

    .line 718
    return-void
.end method

.method public edit(Ljava/lang/String;)Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;
    .locals 4
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 498
    iget-object v1, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->diskCacheFileNameGenerator:Lcom/lidroid/xutils/util/core/LruDiskCache$DiskCacheFileNameGenerator;

    invoke-interface {v1, p1}, Lcom/lidroid/xutils/util/core/LruDiskCache$DiskCacheFileNameGenerator;->generate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 499
    .local v0, "diskKey":Ljava/lang/String;
    const-wide/16 v2, -0x1

    invoke-direct {p0, v0, v2, v3}, Lcom/lidroid/xutils/util/core/LruDiskCache;->editByDiskKey(Ljava/lang/String;J)Lcom/lidroid/xutils/util/core/LruDiskCache$Editor;

    move-result-object v1

    return-object v1
.end method

.method public declared-synchronized flush()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 680
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/lidroid/xutils/util/core/LruDiskCache;->checkNotClosed()V

    .line 681
    invoke-direct {p0}, Lcom/lidroid/xutils/util/core/LruDiskCache;->trimToSize()V

    .line 682
    iget-object v0, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->journalWriter:Ljava/io/Writer;

    invoke-virtual {v0}, Ljava/io/Writer;->flush()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 683
    monitor-exit p0

    return-void

    .line 680
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public get(Ljava/lang/String;)Lcom/lidroid/xutils/util/core/LruDiskCache$Snapshot;
    .locals 2
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 424
    iget-object v1, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->diskCacheFileNameGenerator:Lcom/lidroid/xutils/util/core/LruDiskCache$DiskCacheFileNameGenerator;

    invoke-interface {v1, p1}, Lcom/lidroid/xutils/util/core/LruDiskCache$DiskCacheFileNameGenerator;->generate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 425
    .local v0, "diskKey":Ljava/lang/String;
    invoke-direct {p0, v0}, Lcom/lidroid/xutils/util/core/LruDiskCache;->getByDiskKey(Ljava/lang/String;)Lcom/lidroid/xutils/util/core/LruDiskCache$Snapshot;

    move-result-object v1

    return-object v1
.end method

.method public getCacheFile(Ljava/lang/String;I)Ljava/io/File;
    .locals 5
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "index"    # I

    .prologue
    .line 419
    iget-object v1, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->diskCacheFileNameGenerator:Lcom/lidroid/xutils/util/core/LruDiskCache$DiskCacheFileNameGenerator;

    invoke-interface {v1, p1}, Lcom/lidroid/xutils/util/core/LruDiskCache$DiskCacheFileNameGenerator;->generate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 420
    .local v0, "diskKey":Ljava/lang/String;
    new-instance v1, Ljava/io/File;

    iget-object v2, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->directory:Ljava/io/File;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, "."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v1
.end method

.method public getDirectory()Ljava/io/File;
    .locals 1

    .prologue
    .line 530
    iget-object v0, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->directory:Ljava/io/File;

    return-object v0
.end method

.method public getDiskCacheFileNameGenerator()Lcom/lidroid/xutils/util/core/LruDiskCache$DiskCacheFileNameGenerator;
    .locals 1

    .prologue
    .line 1244
    iget-object v0, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->diskCacheFileNameGenerator:Lcom/lidroid/xutils/util/core/LruDiskCache$DiskCacheFileNameGenerator;

    return-object v0
.end method

.method public declared-synchronized getExpiryTimestamp(Ljava/lang/String;)J
    .locals 4
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 407
    monitor-enter p0

    :try_start_0
    iget-object v2, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->diskCacheFileNameGenerator:Lcom/lidroid/xutils/util/core/LruDiskCache$DiskCacheFileNameGenerator;

    invoke-interface {v2, p1}, Lcom/lidroid/xutils/util/core/LruDiskCache$DiskCacheFileNameGenerator;->generate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 408
    .local v0, "diskKey":Ljava/lang/String;
    invoke-direct {p0}, Lcom/lidroid/xutils/util/core/LruDiskCache;->checkNotClosed()V

    .line 409
    invoke-direct {p0, v0}, Lcom/lidroid/xutils/util/core/LruDiskCache;->validateKey(Ljava/lang/String;)V

    .line 410
    iget-object v2, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v2, v0}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 411
    .local v1, "entry":Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;
    if-nez v1, :cond_0

    .line 412
    const-wide/16 v2, 0x0

    .line 414
    :goto_0
    monitor-exit p0

    return-wide v2

    :cond_0
    :try_start_1
    # getter for: Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->expiryTimestamp:J
    invoke-static {v1}, Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;->access$9(Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;)J
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-wide v2

    goto :goto_0

    .line 407
    .end local v0    # "diskKey":Ljava/lang/String;
    .end local v1    # "entry":Lcom/lidroid/xutils/util/core/LruDiskCache$Entry;
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method public declared-synchronized getMaxSize()J
    .locals 2

    .prologue
    .line 538
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->maxSize:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-wide v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized isClosed()Z
    .locals 1

    .prologue
    .line 667
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->journalWriter:Ljava/io/Writer;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    monitor-exit p0

    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public remove(Ljava/lang/String;)Z
    .locals 2
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 625
    iget-object v1, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->diskCacheFileNameGenerator:Lcom/lidroid/xutils/util/core/LruDiskCache$DiskCacheFileNameGenerator;

    invoke-interface {v1, p1}, Lcom/lidroid/xutils/util/core/LruDiskCache$DiskCacheFileNameGenerator;->generate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 626
    .local v0, "diskKey":Ljava/lang/String;
    invoke-direct {p0, v0}, Lcom/lidroid/xutils/util/core/LruDiskCache;->removeByDiskKey(Ljava/lang/String;)Z

    move-result v1

    return v1
.end method

.method public setDiskCacheFileNameGenerator(Lcom/lidroid/xutils/util/core/LruDiskCache$DiskCacheFileNameGenerator;)V
    .locals 0
    .param p1, "diskCacheFileNameGenerator"    # Lcom/lidroid/xutils/util/core/LruDiskCache$DiskCacheFileNameGenerator;

    .prologue
    .line 1248
    if-eqz p1, :cond_0

    .line 1249
    iput-object p1, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->diskCacheFileNameGenerator:Lcom/lidroid/xutils/util/core/LruDiskCache$DiskCacheFileNameGenerator;

    .line 1251
    :cond_0
    return-void
.end method

.method public declared-synchronized setMaxSize(J)V
    .locals 3
    .param p1, "maxSize"    # J

    .prologue
    .line 546
    monitor-enter p0

    :try_start_0
    iput-wide p1, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->maxSize:J

    .line 547
    iget-object v0, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->executorService:Ljava/util/concurrent/ThreadPoolExecutor;

    iget-object v1, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->cleanupCallable:Ljava/util/concurrent/Callable;

    invoke-virtual {v0, v1}, Ljava/util/concurrent/ThreadPoolExecutor;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 548
    monitor-exit p0

    return-void

    .line 546
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized size()J
    .locals 2

    .prologue
    .line 556
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lcom/lidroid/xutils/util/core/LruDiskCache;->size:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-wide v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
