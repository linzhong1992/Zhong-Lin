.class Lcom/lidroid/xutils/DbUtils$FindTempCache;
.super Ljava/lang/Object;
.source "DbUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lidroid/xutils/DbUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "FindTempCache"
.end annotation


# instance fields
.field private final cache:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private seq:J

.field final synthetic this$0:Lcom/lidroid/xutils/DbUtils;


# direct methods
.method private constructor <init>(Lcom/lidroid/xutils/DbUtils;)V
    .locals 2

    .prologue
    .line 913
    iput-object p1, p0, Lcom/lidroid/xutils/DbUtils$FindTempCache;->this$0:Lcom/lidroid/xutils/DbUtils;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 920
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lcom/lidroid/xutils/DbUtils$FindTempCache;->cache:Ljava/util/concurrent/ConcurrentHashMap;

    .line 922
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/lidroid/xutils/DbUtils$FindTempCache;->seq:J

    .line 914
    return-void
.end method

.method synthetic constructor <init>(Lcom/lidroid/xutils/DbUtils;Lcom/lidroid/xutils/DbUtils$FindTempCache;)V
    .locals 0

    .prologue
    .line 913
    invoke-direct {p0, p1}, Lcom/lidroid/xutils/DbUtils$FindTempCache;-><init>(Lcom/lidroid/xutils/DbUtils;)V

    return-void
.end method


# virtual methods
.method public get(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .param p1, "sql"    # Ljava/lang/String;

    .prologue
    .line 931
    iget-object v0, p0, Lcom/lidroid/xutils/DbUtils$FindTempCache;->cache:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public put(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 1
    .param p1, "sql"    # Ljava/lang/String;
    .param p2, "result"    # Ljava/lang/Object;

    .prologue
    .line 925
    if-eqz p1, :cond_0

    if-eqz p2, :cond_0

    .line 926
    iget-object v0, p0, Lcom/lidroid/xutils/DbUtils$FindTempCache;->cache:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, p1, p2}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 928
    :cond_0
    return-void
.end method

.method public setSeq(J)V
    .locals 3
    .param p1, "seq"    # J

    .prologue
    .line 935
    iget-wide v0, p0, Lcom/lidroid/xutils/DbUtils$FindTempCache;->seq:J

    cmp-long v0, v0, p1

    if-eqz v0, :cond_0

    .line 936
    iget-object v0, p0, Lcom/lidroid/xutils/DbUtils$FindTempCache;->cache:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->clear()V

    .line 937
    iput-wide p1, p0, Lcom/lidroid/xutils/DbUtils$FindTempCache;->seq:J

    .line 939
    :cond_0
    return-void
.end method
