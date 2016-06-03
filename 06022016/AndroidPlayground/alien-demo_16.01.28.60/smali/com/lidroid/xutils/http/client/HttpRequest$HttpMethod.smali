.class public final enum Lcom/lidroid/xutils/http/client/HttpRequest$HttpMethod;
.super Ljava/lang/Enum;
.source "HttpRequest.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lidroid/xutils/http/client/HttpRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "HttpMethod"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/lidroid/xutils/http/client/HttpRequest$HttpMethod;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum CONNECT:Lcom/lidroid/xutils/http/client/HttpRequest$HttpMethod;

.field public static final enum COPY:Lcom/lidroid/xutils/http/client/HttpRequest$HttpMethod;

.field public static final enum DELETE:Lcom/lidroid/xutils/http/client/HttpRequest$HttpMethod;

.field private static final synthetic ENUM$VALUES:[Lcom/lidroid/xutils/http/client/HttpRequest$HttpMethod;

.field public static final enum GET:Lcom/lidroid/xutils/http/client/HttpRequest$HttpMethod;

.field public static final enum HEAD:Lcom/lidroid/xutils/http/client/HttpRequest$HttpMethod;

.field public static final enum MOVE:Lcom/lidroid/xutils/http/client/HttpRequest$HttpMethod;

.field public static final enum OPTIONS:Lcom/lidroid/xutils/http/client/HttpRequest$HttpMethod;

.field public static final enum POST:Lcom/lidroid/xutils/http/client/HttpRequest$HttpMethod;

.field public static final enum PUT:Lcom/lidroid/xutils/http/client/HttpRequest$HttpMethod;

.field public static final enum TRACE:Lcom/lidroid/xutils/http/client/HttpRequest$HttpMethod;


# instance fields
.field private final value:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .prologue
    const/4 v8, 0x4

    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 190
    new-instance v0, Lcom/lidroid/xutils/http/client/HttpRequest$HttpMethod;

    const-string v1, "GET"

    const-string v2, "GET"

    invoke-direct {v0, v1, v4, v2}, Lcom/lidroid/xutils/http/client/HttpRequest$HttpMethod;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/lidroid/xutils/http/client/HttpRequest$HttpMethod;->GET:Lcom/lidroid/xutils/http/client/HttpRequest$HttpMethod;

    .line 191
    new-instance v0, Lcom/lidroid/xutils/http/client/HttpRequest$HttpMethod;

    const-string v1, "POST"

    const-string v2, "POST"

    invoke-direct {v0, v1, v5, v2}, Lcom/lidroid/xutils/http/client/HttpRequest$HttpMethod;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/lidroid/xutils/http/client/HttpRequest$HttpMethod;->POST:Lcom/lidroid/xutils/http/client/HttpRequest$HttpMethod;

    .line 192
    new-instance v0, Lcom/lidroid/xutils/http/client/HttpRequest$HttpMethod;

    const-string v1, "PUT"

    const-string v2, "PUT"

    invoke-direct {v0, v1, v6, v2}, Lcom/lidroid/xutils/http/client/HttpRequest$HttpMethod;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/lidroid/xutils/http/client/HttpRequest$HttpMethod;->PUT:Lcom/lidroid/xutils/http/client/HttpRequest$HttpMethod;

    .line 193
    new-instance v0, Lcom/lidroid/xutils/http/client/HttpRequest$HttpMethod;

    const-string v1, "HEAD"

    const-string v2, "HEAD"

    invoke-direct {v0, v1, v7, v2}, Lcom/lidroid/xutils/http/client/HttpRequest$HttpMethod;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/lidroid/xutils/http/client/HttpRequest$HttpMethod;->HEAD:Lcom/lidroid/xutils/http/client/HttpRequest$HttpMethod;

    .line 194
    new-instance v0, Lcom/lidroid/xutils/http/client/HttpRequest$HttpMethod;

    const-string v1, "MOVE"

    const-string v2, "MOVE"

    invoke-direct {v0, v1, v8, v2}, Lcom/lidroid/xutils/http/client/HttpRequest$HttpMethod;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/lidroid/xutils/http/client/HttpRequest$HttpMethod;->MOVE:Lcom/lidroid/xutils/http/client/HttpRequest$HttpMethod;

    .line 195
    new-instance v0, Lcom/lidroid/xutils/http/client/HttpRequest$HttpMethod;

    const-string v1, "COPY"

    const/4 v2, 0x5

    const-string v3, "COPY"

    invoke-direct {v0, v1, v2, v3}, Lcom/lidroid/xutils/http/client/HttpRequest$HttpMethod;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/lidroid/xutils/http/client/HttpRequest$HttpMethod;->COPY:Lcom/lidroid/xutils/http/client/HttpRequest$HttpMethod;

    .line 196
    new-instance v0, Lcom/lidroid/xutils/http/client/HttpRequest$HttpMethod;

    const-string v1, "DELETE"

    const/4 v2, 0x6

    const-string v3, "DELETE"

    invoke-direct {v0, v1, v2, v3}, Lcom/lidroid/xutils/http/client/HttpRequest$HttpMethod;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/lidroid/xutils/http/client/HttpRequest$HttpMethod;->DELETE:Lcom/lidroid/xutils/http/client/HttpRequest$HttpMethod;

    .line 197
    new-instance v0, Lcom/lidroid/xutils/http/client/HttpRequest$HttpMethod;

    const-string v1, "OPTIONS"

    const/4 v2, 0x7

    const-string v3, "OPTIONS"

    invoke-direct {v0, v1, v2, v3}, Lcom/lidroid/xutils/http/client/HttpRequest$HttpMethod;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/lidroid/xutils/http/client/HttpRequest$HttpMethod;->OPTIONS:Lcom/lidroid/xutils/http/client/HttpRequest$HttpMethod;

    .line 198
    new-instance v0, Lcom/lidroid/xutils/http/client/HttpRequest$HttpMethod;

    const-string v1, "TRACE"

    const/16 v2, 0x8

    const-string v3, "TRACE"

    invoke-direct {v0, v1, v2, v3}, Lcom/lidroid/xutils/http/client/HttpRequest$HttpMethod;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/lidroid/xutils/http/client/HttpRequest$HttpMethod;->TRACE:Lcom/lidroid/xutils/http/client/HttpRequest$HttpMethod;

    .line 199
    new-instance v0, Lcom/lidroid/xutils/http/client/HttpRequest$HttpMethod;

    const-string v1, "CONNECT"

    const/16 v2, 0x9

    const-string v3, "CONNECT"

    invoke-direct {v0, v1, v2, v3}, Lcom/lidroid/xutils/http/client/HttpRequest$HttpMethod;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/lidroid/xutils/http/client/HttpRequest$HttpMethod;->CONNECT:Lcom/lidroid/xutils/http/client/HttpRequest$HttpMethod;

    .line 189
    const/16 v0, 0xa

    new-array v0, v0, [Lcom/lidroid/xutils/http/client/HttpRequest$HttpMethod;

    sget-object v1, Lcom/lidroid/xutils/http/client/HttpRequest$HttpMethod;->GET:Lcom/lidroid/xutils/http/client/HttpRequest$HttpMethod;

    aput-object v1, v0, v4

    sget-object v1, Lcom/lidroid/xutils/http/client/HttpRequest$HttpMethod;->POST:Lcom/lidroid/xutils/http/client/HttpRequest$HttpMethod;

    aput-object v1, v0, v5

    sget-object v1, Lcom/lidroid/xutils/http/client/HttpRequest$HttpMethod;->PUT:Lcom/lidroid/xutils/http/client/HttpRequest$HttpMethod;

    aput-object v1, v0, v6

    sget-object v1, Lcom/lidroid/xutils/http/client/HttpRequest$HttpMethod;->HEAD:Lcom/lidroid/xutils/http/client/HttpRequest$HttpMethod;

    aput-object v1, v0, v7

    sget-object v1, Lcom/lidroid/xutils/http/client/HttpRequest$HttpMethod;->MOVE:Lcom/lidroid/xutils/http/client/HttpRequest$HttpMethod;

    aput-object v1, v0, v8

    const/4 v1, 0x5

    sget-object v2, Lcom/lidroid/xutils/http/client/HttpRequest$HttpMethod;->COPY:Lcom/lidroid/xutils/http/client/HttpRequest$HttpMethod;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/lidroid/xutils/http/client/HttpRequest$HttpMethod;->DELETE:Lcom/lidroid/xutils/http/client/HttpRequest$HttpMethod;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/lidroid/xutils/http/client/HttpRequest$HttpMethod;->OPTIONS:Lcom/lidroid/xutils/http/client/HttpRequest$HttpMethod;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lcom/lidroid/xutils/http/client/HttpRequest$HttpMethod;->TRACE:Lcom/lidroid/xutils/http/client/HttpRequest$HttpMethod;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Lcom/lidroid/xutils/http/client/HttpRequest$HttpMethod;->CONNECT:Lcom/lidroid/xutils/http/client/HttpRequest$HttpMethod;

    aput-object v2, v0, v1

    sput-object v0, Lcom/lidroid/xutils/http/client/HttpRequest$HttpMethod;->ENUM$VALUES:[Lcom/lidroid/xutils/http/client/HttpRequest$HttpMethod;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .param p3, "value"    # Ljava/lang/String;

    .prologue
    .line 203
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 204
    iput-object p3, p0, Lcom/lidroid/xutils/http/client/HttpRequest$HttpMethod;->value:Ljava/lang/String;

    .line 205
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/lidroid/xutils/http/client/HttpRequest$HttpMethod;
    .locals 1

    .prologue
    .line 1
    const-class v0, Lcom/lidroid/xutils/http/client/HttpRequest$HttpMethod;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/lidroid/xutils/http/client/HttpRequest$HttpMethod;

    return-object v0
.end method

.method public static values()[Lcom/lidroid/xutils/http/client/HttpRequest$HttpMethod;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lcom/lidroid/xutils/http/client/HttpRequest$HttpMethod;->ENUM$VALUES:[Lcom/lidroid/xutils/http/client/HttpRequest$HttpMethod;

    array-length v1, v0

    new-array v2, v1, [Lcom/lidroid/xutils/http/client/HttpRequest$HttpMethod;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 209
    iget-object v0, p0, Lcom/lidroid/xutils/http/client/HttpRequest$HttpMethod;->value:Ljava/lang/String;

    return-object v0
.end method
