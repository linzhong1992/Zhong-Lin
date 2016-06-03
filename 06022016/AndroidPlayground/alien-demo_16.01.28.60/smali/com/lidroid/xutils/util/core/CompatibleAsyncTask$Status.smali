.class public final enum Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$Status;
.super Ljava/lang/Enum;
.source "CompatibleAsyncTask.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Status"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$Status;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic ENUM$VALUES:[Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$Status;

.field public static final enum FINISHED:Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$Status;

.field public static final enum PENDING:Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$Status;

.field public static final enum RUNNING:Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$Status;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 243
    new-instance v0, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$Status;

    const-string v1, "PENDING"

    invoke-direct {v0, v1, v2}, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$Status;-><init>(Ljava/lang/String;I)V

    .line 246
    sput-object v0, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$Status;->PENDING:Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$Status;

    .line 247
    new-instance v0, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$Status;

    const-string v1, "RUNNING"

    invoke-direct {v0, v1, v3}, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$Status;-><init>(Ljava/lang/String;I)V

    .line 250
    sput-object v0, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$Status;->RUNNING:Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$Status;

    .line 251
    new-instance v0, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$Status;

    const-string v1, "FINISHED"

    invoke-direct {v0, v1, v4}, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$Status;-><init>(Ljava/lang/String;I)V

    .line 254
    sput-object v0, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$Status;->FINISHED:Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$Status;

    .line 242
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$Status;

    sget-object v1, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$Status;->PENDING:Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$Status;

    aput-object v1, v0, v2

    sget-object v1, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$Status;->RUNNING:Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$Status;

    aput-object v1, v0, v3

    sget-object v1, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$Status;->FINISHED:Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$Status;

    aput-object v1, v0, v4

    sput-object v0, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$Status;->ENUM$VALUES:[Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$Status;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .prologue
    .line 242
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$Status;
    .locals 1

    .prologue
    .line 1
    const-class v0, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$Status;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$Status;

    return-object v0
.end method

.method public static values()[Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$Status;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$Status;->ENUM$VALUES:[Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$Status;

    array-length v1, v0

    new-array v2, v1, [Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$Status;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method
