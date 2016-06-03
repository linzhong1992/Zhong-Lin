.class public Lcom/lidroid/xutils/http/HttpCache;
.super Ljava/lang/Object;
.source "HttpCache.java"


# static fields
.field private static final DEFAULT_CACHE_SIZE:I = 0x19000

.field private static final DEFAULT_EXPIRY_TIME:J = 0xea60L

.field private static defaultExpiryTime:J

.field private static final httpMethod_enabled_map:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private cacheSize:I

.field private final mMemoryCache:Lcom/lidroid/xutils/util/core/LruMemoryCache;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lidroid/xutils/util/core/LruMemoryCache",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 42
    const-wide/32 v0, 0xea60

    sput-wide v0, Lcom/lidroid/xutils/http/HttpCache;->defaultExpiryTime:J

    .line 115
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    const/16 v1, 0xa

    invoke-direct {v0, v1}, Ljava/util/concurrent/ConcurrentHashMap;-><init>(I)V

    sput-object v0, Lcom/lidroid/xutils/http/HttpCache;->httpMethod_enabled_map:Ljava/util/concurrent/ConcurrentHashMap;

    .line 116
    sget-object v0, Lcom/lidroid/xutils/http/HttpCache;->httpMethod_enabled_map:Ljava/util/concurrent/ConcurrentHashMap;

    sget-object v1, Lcom/lidroid/xutils/http/client/HttpRequest$HttpMethod;->GET:Lcom/lidroid/xutils/http/client/HttpRequest$HttpMethod;

    invoke-virtual {v1}, Lcom/lidroid/xutils/http/client/HttpRequest$HttpMethod;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 117
    return-void
.end method

.method public constructor <init>()V
    .locals 4

    .prologue
    .line 48
    const v0, 0x19000

    const-wide/32 v2, 0xea60

    invoke-direct {p0, v0, v2, v3}, Lcom/lidroid/xutils/http/HttpCache;-><init>(IJ)V

    .line 49
    return-void
.end method

.method public constructor <init>(IJ)V
    .locals 2
    .param p1, "strLength"    # I
    .param p2, "defaultExpiryTime"    # J

    .prologue
    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    const v0, 0x19000

    iput v0, p0, Lcom/lidroid/xutils/http/HttpCache;->cacheSize:I

    .line 52
    iput p1, p0, Lcom/lidroid/xutils/http/HttpCache;->cacheSize:I

    .line 53
    sput-wide p2, Lcom/lidroid/xutils/http/HttpCache;->defaultExpiryTime:J

    .line 55
    new-instance v0, Lcom/lidroid/xutils/http/HttpCache$1;

    iget v1, p0, Lcom/lidroid/xutils/http/HttpCache;->cacheSize:I

    invoke-direct {v0, p0, v1}, Lcom/lidroid/xutils/http/HttpCache$1;-><init>(Lcom/lidroid/xutils/http/HttpCache;I)V

    iput-object v0, p0, Lcom/lidroid/xutils/http/HttpCache;->mMemoryCache:Lcom/lidroid/xutils/util/core/LruMemoryCache;

    .line 62
    return-void
.end method

.method public static getDefaultExpiryTime()J
    .locals 2

    .prologue
    .line 73
    sget-wide v0, Lcom/lidroid/xutils/http/HttpCache;->defaultExpiryTime:J

    return-wide v0
.end method

.method public static setDefaultExpiryTime(J)V
    .locals 0
    .param p0, "defaultExpiryTime"    # J

    .prologue
    .line 69
    sput-wide p0, Lcom/lidroid/xutils/http/HttpCache;->defaultExpiryTime:J

    .line 70
    return-void
.end method


# virtual methods
.method public clear()V
    .locals 1

    .prologue
    .line 91
    iget-object v0, p0, Lcom/lidroid/xutils/http/HttpCache;->mMemoryCache:Lcom/lidroid/xutils/util/core/LruMemoryCache;

    invoke-virtual {v0}, Lcom/lidroid/xutils/util/core/LruMemoryCache;->evictAll()V

    .line 92
    return-void
.end method

.method public get(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 87
    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/lidroid/xutils/http/HttpCache;->mMemoryCache:Lcom/lidroid/xutils/util/core/LruMemoryCache;

    invoke-virtual {v0, p1}, Lcom/lidroid/xutils/util/core/LruMemoryCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isEnabled(Lcom/lidroid/xutils/http/client/HttpRequest$HttpMethod;)Z
    .locals 4
    .param p1, "method"    # Lcom/lidroid/xutils/http/client/HttpRequest$HttpMethod;

    .prologue
    const/4 v1, 0x0

    .line 95
    if-nez p1, :cond_1

    .line 98
    :cond_0
    :goto_0
    return v1

    .line 97
    :cond_1
    sget-object v2, Lcom/lidroid/xutils/http/HttpCache;->httpMethod_enabled_map:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {p1}, Lcom/lidroid/xutils/http/client/HttpRequest$HttpMethod;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    .line 98
    .local v0, "enabled":Ljava/lang/Boolean;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    goto :goto_0
.end method

.method public isEnabled(Ljava/lang/String;)Z
    .locals 4
    .param p1, "method"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 102
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 105
    :cond_0
    :goto_0
    return v1

    .line 104
    :cond_1
    sget-object v2, Lcom/lidroid/xutils/http/HttpCache;->httpMethod_enabled_map:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {p1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    .line 105
    .local v0, "enabled":Ljava/lang/Boolean;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    goto :goto_0
.end method

.method public put(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "result"    # Ljava/lang/String;

    .prologue
    .line 77
    sget-wide v0, Lcom/lidroid/xutils/http/HttpCache;->defaultExpiryTime:J

    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/lidroid/xutils/http/HttpCache;->put(Ljava/lang/String;Ljava/lang/String;J)V

    .line 78
    return-void
.end method

.method public put(Ljava/lang/String;Ljava/lang/String;J)V
    .locals 5
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "result"    # Ljava/lang/String;
    .param p3, "expiry"    # J

    .prologue
    .line 81
    if-eqz p1, :cond_0

    if-eqz p2, :cond_0

    const-wide/16 v0, 0x1

    cmp-long v0, p3, v0

    if-gez v0, :cond_1

    .line 84
    :cond_0
    :goto_0
    return-void

    .line 83
    :cond_1
    iget-object v0, p0, Lcom/lidroid/xutils/http/HttpCache;->mMemoryCache:Lcom/lidroid/xutils/util/core/LruMemoryCache;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    add-long/2addr v2, p3

    invoke-virtual {v0, p1, p2, v2, v3}, Lcom/lidroid/xutils/util/core/LruMemoryCache;->put(Ljava/lang/Object;Ljava/lang/Object;J)Ljava/lang/Object;

    goto :goto_0
.end method

.method public setCacheSize(I)V
    .locals 1
    .param p1, "strLength"    # I

    .prologue
    .line 65
    iget-object v0, p0, Lcom/lidroid/xutils/http/HttpCache;->mMemoryCache:Lcom/lidroid/xutils/util/core/LruMemoryCache;

    invoke-virtual {v0, p1}, Lcom/lidroid/xutils/util/core/LruMemoryCache;->setMaxSize(I)V

    .line 66
    return-void
.end method

.method public setEnabled(Lcom/lidroid/xutils/http/client/HttpRequest$HttpMethod;Z)V
    .locals 3
    .param p1, "method"    # Lcom/lidroid/xutils/http/client/HttpRequest$HttpMethod;
    .param p2, "enabled"    # Z

    .prologue
    .line 109
    sget-object v0, Lcom/lidroid/xutils/http/HttpCache;->httpMethod_enabled_map:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {p1}, Lcom/lidroid/xutils/http/client/HttpRequest$HttpMethod;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 110
    return-void
.end method
