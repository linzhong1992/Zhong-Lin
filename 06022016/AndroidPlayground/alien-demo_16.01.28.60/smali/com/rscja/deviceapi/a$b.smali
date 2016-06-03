.class public final enum Lcom/rscja/deviceapi/a$b;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rscja/deviceapi/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "b"
.end annotation


# static fields
.field public static final enum a:Lcom/rscja/deviceapi/a$b;

.field public static final enum b:Lcom/rscja/deviceapi/a$b;

.field public static final enum c:Lcom/rscja/deviceapi/a$b;

.field public static final enum d:Lcom/rscja/deviceapi/a$b;

.field public static final enum e:Lcom/rscja/deviceapi/a$b;

.field private static final synthetic g:[Lcom/rscja/deviceapi/a$b;


# instance fields
.field private final f:B


# direct methods
.method static constructor <clinit>()V
    .locals 7

    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    new-instance v0, Lcom/rscja/deviceapi/a$b;

    const-string v1, "HOLD"

    invoke-direct {v0, v1, v2, v2}, Lcom/rscja/deviceapi/a$b;-><init>(Ljava/lang/String;IB)V

    sput-object v0, Lcom/rscja/deviceapi/a$b;->a:Lcom/rscja/deviceapi/a$b;

    new-instance v0, Lcom/rscja/deviceapi/a$b;

    const-string v1, "LOCK"

    invoke-direct {v0, v1, v3, v3}, Lcom/rscja/deviceapi/a$b;-><init>(Ljava/lang/String;IB)V

    sput-object v0, Lcom/rscja/deviceapi/a$b;->b:Lcom/rscja/deviceapi/a$b;

    new-instance v0, Lcom/rscja/deviceapi/a$b;

    const-string v1, "UNLOCK"

    invoke-direct {v0, v1, v4, v4}, Lcom/rscja/deviceapi/a$b;-><init>(Ljava/lang/String;IB)V

    sput-object v0, Lcom/rscja/deviceapi/a$b;->c:Lcom/rscja/deviceapi/a$b;

    new-instance v0, Lcom/rscja/deviceapi/a$b;

    const-string v1, "PLOCK"

    invoke-direct {v0, v1, v5, v5}, Lcom/rscja/deviceapi/a$b;-><init>(Ljava/lang/String;IB)V

    sput-object v0, Lcom/rscja/deviceapi/a$b;->d:Lcom/rscja/deviceapi/a$b;

    new-instance v0, Lcom/rscja/deviceapi/a$b;

    const-string v1, "PUNLOCK"

    invoke-direct {v0, v1, v6, v6}, Lcom/rscja/deviceapi/a$b;-><init>(Ljava/lang/String;IB)V

    sput-object v0, Lcom/rscja/deviceapi/a$b;->e:Lcom/rscja/deviceapi/a$b;

    const/4 v0, 0x5

    new-array v0, v0, [Lcom/rscja/deviceapi/a$b;

    sget-object v1, Lcom/rscja/deviceapi/a$b;->a:Lcom/rscja/deviceapi/a$b;

    aput-object v1, v0, v2

    sget-object v1, Lcom/rscja/deviceapi/a$b;->b:Lcom/rscja/deviceapi/a$b;

    aput-object v1, v0, v3

    sget-object v1, Lcom/rscja/deviceapi/a$b;->c:Lcom/rscja/deviceapi/a$b;

    aput-object v1, v0, v4

    sget-object v1, Lcom/rscja/deviceapi/a$b;->d:Lcom/rscja/deviceapi/a$b;

    aput-object v1, v0, v5

    sget-object v1, Lcom/rscja/deviceapi/a$b;->e:Lcom/rscja/deviceapi/a$b;

    aput-object v1, v0, v6

    sput-object v0, Lcom/rscja/deviceapi/a$b;->g:[Lcom/rscja/deviceapi/a$b;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IB)V
    .locals 0

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-byte p3, p0, Lcom/rscja/deviceapi/a$b;->f:B

    return-void
.end method

.method static synthetic a(Lcom/rscja/deviceapi/a$b;)B
    .locals 1

    iget-byte v0, p0, Lcom/rscja/deviceapi/a$b;->f:B

    return v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/rscja/deviceapi/a$b;
    .locals 1

    const-class v0, Lcom/rscja/deviceapi/a$b;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/rscja/deviceapi/a$b;

    return-object v0
.end method

.method public static values()[Lcom/rscja/deviceapi/a$b;
    .locals 4

    const/4 v3, 0x0

    sget-object v0, Lcom/rscja/deviceapi/a$b;->g:[Lcom/rscja/deviceapi/a$b;

    array-length v1, v0

    new-array v2, v1, [Lcom/rscja/deviceapi/a$b;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method
