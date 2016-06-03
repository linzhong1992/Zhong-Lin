.class public final enum Lcom/rscja/deviceapi/a$a;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rscja/deviceapi/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "a"
.end annotation


# static fields
.field public static final enum a:Lcom/rscja/deviceapi/a$a;

.field public static final enum b:Lcom/rscja/deviceapi/a$a;

.field public static final enum c:Lcom/rscja/deviceapi/a$a;

.field public static final enum d:Lcom/rscja/deviceapi/a$a;

.field private static final synthetic f:[Lcom/rscja/deviceapi/a$a;


# instance fields
.field private final e:B


# direct methods
.method static constructor <clinit>()V
    .locals 6

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    new-instance v0, Lcom/rscja/deviceapi/a$a;

    const-string v1, "RESERVED"

    invoke-direct {v0, v1, v2, v2}, Lcom/rscja/deviceapi/a$a;-><init>(Ljava/lang/String;IB)V

    sput-object v0, Lcom/rscja/deviceapi/a$a;->a:Lcom/rscja/deviceapi/a$a;

    new-instance v0, Lcom/rscja/deviceapi/a$a;

    const-string v1, "UII"

    invoke-direct {v0, v1, v3, v3}, Lcom/rscja/deviceapi/a$a;-><init>(Ljava/lang/String;IB)V

    sput-object v0, Lcom/rscja/deviceapi/a$a;->b:Lcom/rscja/deviceapi/a$a;

    new-instance v0, Lcom/rscja/deviceapi/a$a;

    const-string v1, "TID"

    invoke-direct {v0, v1, v4, v4}, Lcom/rscja/deviceapi/a$a;-><init>(Ljava/lang/String;IB)V

    sput-object v0, Lcom/rscja/deviceapi/a$a;->c:Lcom/rscja/deviceapi/a$a;

    new-instance v0, Lcom/rscja/deviceapi/a$a;

    const-string v1, "USER"

    invoke-direct {v0, v1, v5, v5}, Lcom/rscja/deviceapi/a$a;-><init>(Ljava/lang/String;IB)V

    sput-object v0, Lcom/rscja/deviceapi/a$a;->d:Lcom/rscja/deviceapi/a$a;

    const/4 v0, 0x4

    new-array v0, v0, [Lcom/rscja/deviceapi/a$a;

    sget-object v1, Lcom/rscja/deviceapi/a$a;->a:Lcom/rscja/deviceapi/a$a;

    aput-object v1, v0, v2

    sget-object v1, Lcom/rscja/deviceapi/a$a;->b:Lcom/rscja/deviceapi/a$a;

    aput-object v1, v0, v3

    sget-object v1, Lcom/rscja/deviceapi/a$a;->c:Lcom/rscja/deviceapi/a$a;

    aput-object v1, v0, v4

    sget-object v1, Lcom/rscja/deviceapi/a$a;->d:Lcom/rscja/deviceapi/a$a;

    aput-object v1, v0, v5

    sput-object v0, Lcom/rscja/deviceapi/a$a;->f:[Lcom/rscja/deviceapi/a$a;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IB)V
    .locals 0

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-byte p3, p0, Lcom/rscja/deviceapi/a$a;->e:B

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/rscja/deviceapi/a$a;
    .locals 1

    const-class v0, Lcom/rscja/deviceapi/a$a;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/rscja/deviceapi/a$a;

    return-object v0
.end method

.method public static values()[Lcom/rscja/deviceapi/a$a;
    .locals 4

    const/4 v3, 0x0

    sget-object v0, Lcom/rscja/deviceapi/a$a;->f:[Lcom/rscja/deviceapi/a$a;

    array-length v1, v0

    new-array v2, v1, [Lcom/rscja/deviceapi/a$a;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method
