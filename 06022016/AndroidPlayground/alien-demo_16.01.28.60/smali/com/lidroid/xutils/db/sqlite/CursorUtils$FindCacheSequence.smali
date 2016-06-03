.class public Lcom/lidroid/xutils/db/sqlite/CursorUtils$FindCacheSequence;
.super Ljava/lang/Object;
.source "CursorUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lidroid/xutils/db/sqlite/CursorUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "FindCacheSequence"
.end annotation


# static fields
.field private static final FINDER_LAZY_LOADER_CLASS_NAME:Ljava/lang/String;

.field private static final FOREIGN_LAZY_LOADER_CLASS_NAME:Ljava/lang/String;

.field private static seq:J


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 88
    const-wide/16 v0, 0x0

    sput-wide v0, Lcom/lidroid/xutils/db/sqlite/CursorUtils$FindCacheSequence;->seq:J

    .line 89
    const-class v0, Lcom/lidroid/xutils/db/sqlite/ForeignLazyLoader;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/lidroid/xutils/db/sqlite/CursorUtils$FindCacheSequence;->FOREIGN_LAZY_LOADER_CLASS_NAME:Ljava/lang/String;

    .line 90
    const-class v0, Lcom/lidroid/xutils/db/sqlite/FinderLazyLoader;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/lidroid/xutils/db/sqlite/CursorUtils$FindCacheSequence;->FINDER_LAZY_LOADER_CLASS_NAME:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 87
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getSeq()J
    .locals 6

    .prologue
    .line 93
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v1

    const/4 v2, 0x4

    aget-object v1, v1, v2

    invoke-virtual {v1}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    move-result-object v0

    .line 94
    .local v0, "findMethodCaller":Ljava/lang/String;
    sget-object v1, Lcom/lidroid/xutils/db/sqlite/CursorUtils$FindCacheSequence;->FOREIGN_LAZY_LOADER_CLASS_NAME:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    sget-object v1, Lcom/lidroid/xutils/db/sqlite/CursorUtils$FindCacheSequence;->FINDER_LAZY_LOADER_CLASS_NAME:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 95
    sget-wide v2, Lcom/lidroid/xutils/db/sqlite/CursorUtils$FindCacheSequence;->seq:J

    const-wide/16 v4, 0x1

    add-long/2addr v2, v4

    sput-wide v2, Lcom/lidroid/xutils/db/sqlite/CursorUtils$FindCacheSequence;->seq:J

    .line 97
    :cond_0
    sget-wide v2, Lcom/lidroid/xutils/db/sqlite/CursorUtils$FindCacheSequence;->seq:J

    return-wide v2
.end method
