.class public final enum Lcom/lidroid/xutils/http/client/multipart/HttpMultipartMode;
.super Ljava/lang/Enum;
.source "HttpMultipartMode.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/lidroid/xutils/http/client/multipart/HttpMultipartMode;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum BROWSER_COMPATIBLE:Lcom/lidroid/xutils/http/client/multipart/HttpMultipartMode;

.field private static final synthetic ENUM$VALUES:[Lcom/lidroid/xutils/http/client/multipart/HttpMultipartMode;

.field public static final enum STRICT:Lcom/lidroid/xutils/http/client/multipart/HttpMultipartMode;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 23
    new-instance v0, Lcom/lidroid/xutils/http/client/multipart/HttpMultipartMode;

    const-string v1, "STRICT"

    invoke-direct {v0, v1, v2}, Lcom/lidroid/xutils/http/client/multipart/HttpMultipartMode;-><init>(Ljava/lang/String;I)V

    .line 26
    sput-object v0, Lcom/lidroid/xutils/http/client/multipart/HttpMultipartMode;->STRICT:Lcom/lidroid/xutils/http/client/multipart/HttpMultipartMode;

    .line 27
    new-instance v0, Lcom/lidroid/xutils/http/client/multipart/HttpMultipartMode;

    const-string v1, "BROWSER_COMPATIBLE"

    invoke-direct {v0, v1, v3}, Lcom/lidroid/xutils/http/client/multipart/HttpMultipartMode;-><init>(Ljava/lang/String;I)V

    .line 30
    sput-object v0, Lcom/lidroid/xutils/http/client/multipart/HttpMultipartMode;->BROWSER_COMPATIBLE:Lcom/lidroid/xutils/http/client/multipart/HttpMultipartMode;

    .line 21
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/lidroid/xutils/http/client/multipart/HttpMultipartMode;

    sget-object v1, Lcom/lidroid/xutils/http/client/multipart/HttpMultipartMode;->STRICT:Lcom/lidroid/xutils/http/client/multipart/HttpMultipartMode;

    aput-object v1, v0, v2

    sget-object v1, Lcom/lidroid/xutils/http/client/multipart/HttpMultipartMode;->BROWSER_COMPATIBLE:Lcom/lidroid/xutils/http/client/multipart/HttpMultipartMode;

    aput-object v1, v0, v3

    sput-object v0, Lcom/lidroid/xutils/http/client/multipart/HttpMultipartMode;->ENUM$VALUES:[Lcom/lidroid/xutils/http/client/multipart/HttpMultipartMode;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .prologue
    .line 21
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/lidroid/xutils/http/client/multipart/HttpMultipartMode;
    .locals 1

    .prologue
    .line 1
    const-class v0, Lcom/lidroid/xutils/http/client/multipart/HttpMultipartMode;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/lidroid/xutils/http/client/multipart/HttpMultipartMode;

    return-object v0
.end method

.method public static values()[Lcom/lidroid/xutils/http/client/multipart/HttpMultipartMode;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lcom/lidroid/xutils/http/client/multipart/HttpMultipartMode;->ENUM$VALUES:[Lcom/lidroid/xutils/http/client/multipart/HttpMultipartMode;

    array-length v1, v0

    new-array v2, v1, [Lcom/lidroid/xutils/http/client/multipart/HttpMultipartMode;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method
