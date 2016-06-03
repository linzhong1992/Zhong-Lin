.class public final enum Lcom/lidroid/xutils/db/sqlite/ColumnDbType;
.super Ljava/lang/Enum;
.source "ColumnDbType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/lidroid/xutils/db/sqlite/ColumnDbType;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum BLOB:Lcom/lidroid/xutils/db/sqlite/ColumnDbType;

.field private static final synthetic ENUM$VALUES:[Lcom/lidroid/xutils/db/sqlite/ColumnDbType;

.field public static final enum INTEGER:Lcom/lidroid/xutils/db/sqlite/ColumnDbType;

.field public static final enum REAL:Lcom/lidroid/xutils/db/sqlite/ColumnDbType;

.field public static final enum TEXT:Lcom/lidroid/xutils/db/sqlite/ColumnDbType;


# instance fields
.field private value:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .prologue
    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 8
    new-instance v0, Lcom/lidroid/xutils/db/sqlite/ColumnDbType;

    const-string v1, "INTEGER"

    const-string v2, "INTEGER"

    invoke-direct {v0, v1, v3, v2}, Lcom/lidroid/xutils/db/sqlite/ColumnDbType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/lidroid/xutils/db/sqlite/ColumnDbType;->INTEGER:Lcom/lidroid/xutils/db/sqlite/ColumnDbType;

    new-instance v0, Lcom/lidroid/xutils/db/sqlite/ColumnDbType;

    const-string v1, "REAL"

    const-string v2, "REAL"

    invoke-direct {v0, v1, v4, v2}, Lcom/lidroid/xutils/db/sqlite/ColumnDbType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/lidroid/xutils/db/sqlite/ColumnDbType;->REAL:Lcom/lidroid/xutils/db/sqlite/ColumnDbType;

    new-instance v0, Lcom/lidroid/xutils/db/sqlite/ColumnDbType;

    const-string v1, "TEXT"

    const-string v2, "TEXT"

    invoke-direct {v0, v1, v5, v2}, Lcom/lidroid/xutils/db/sqlite/ColumnDbType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/lidroid/xutils/db/sqlite/ColumnDbType;->TEXT:Lcom/lidroid/xutils/db/sqlite/ColumnDbType;

    new-instance v0, Lcom/lidroid/xutils/db/sqlite/ColumnDbType;

    const-string v1, "BLOB"

    const-string v2, "BLOB"

    invoke-direct {v0, v1, v6, v2}, Lcom/lidroid/xutils/db/sqlite/ColumnDbType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/lidroid/xutils/db/sqlite/ColumnDbType;->BLOB:Lcom/lidroid/xutils/db/sqlite/ColumnDbType;

    .line 6
    const/4 v0, 0x4

    new-array v0, v0, [Lcom/lidroid/xutils/db/sqlite/ColumnDbType;

    sget-object v1, Lcom/lidroid/xutils/db/sqlite/ColumnDbType;->INTEGER:Lcom/lidroid/xutils/db/sqlite/ColumnDbType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/lidroid/xutils/db/sqlite/ColumnDbType;->REAL:Lcom/lidroid/xutils/db/sqlite/ColumnDbType;

    aput-object v1, v0, v4

    sget-object v1, Lcom/lidroid/xutils/db/sqlite/ColumnDbType;->TEXT:Lcom/lidroid/xutils/db/sqlite/ColumnDbType;

    aput-object v1, v0, v5

    sget-object v1, Lcom/lidroid/xutils/db/sqlite/ColumnDbType;->BLOB:Lcom/lidroid/xutils/db/sqlite/ColumnDbType;

    aput-object v1, v0, v6

    sput-object v0, Lcom/lidroid/xutils/db/sqlite/ColumnDbType;->ENUM$VALUES:[Lcom/lidroid/xutils/db/sqlite/ColumnDbType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .param p3, "value"    # Ljava/lang/String;

    .prologue
    .line 12
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 13
    iput-object p3, p0, Lcom/lidroid/xutils/db/sqlite/ColumnDbType;->value:Ljava/lang/String;

    .line 14
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/lidroid/xutils/db/sqlite/ColumnDbType;
    .locals 1

    .prologue
    .line 1
    const-class v0, Lcom/lidroid/xutils/db/sqlite/ColumnDbType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/lidroid/xutils/db/sqlite/ColumnDbType;

    return-object v0
.end method

.method public static values()[Lcom/lidroid/xutils/db/sqlite/ColumnDbType;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lcom/lidroid/xutils/db/sqlite/ColumnDbType;->ENUM$VALUES:[Lcom/lidroid/xutils/db/sqlite/ColumnDbType;

    array-length v1, v0

    new-array v2, v1, [Lcom/lidroid/xutils/db/sqlite/ColumnDbType;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 18
    iget-object v0, p0, Lcom/lidroid/xutils/db/sqlite/ColumnDbType;->value:Ljava/lang/String;

    return-object v0
.end method
