.class final Lcom/rscja/deviceapi/c;
.super Ljava/lang/Object;


# static fields
.field private static a:Ljava/lang/String;


# instance fields
.field private b:Ljava/lang/String;

.field private c:Ljava/lang/String;

.field private d:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    sget-object v0, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/rscja/deviceapi/c;->a:Ljava/lang/String;

    const-string v1, "C4000"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    sget-object v0, Lcom/rscja/deviceapi/c;->a:Ljava/lang/String;

    const-string v1, "40006577"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    sget-object v0, Lcom/rscja/deviceapi/c;->a:Ljava/lang/String;

    const-string v1, "40006582"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "C40006582"

    sput-object v0, Lcom/rscja/deviceapi/c;->a:Ljava/lang/String;

    :goto_0
    return-void

    :cond_0
    sget-object v0, Lcom/rscja/deviceapi/c;->a:Ljava/lang/String;

    const-string v1, "40506582"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "C40506582"

    sput-object v0, Lcom/rscja/deviceapi/c;->a:Ljava/lang/String;

    goto :goto_0

    :cond_1
    const-string v0, "C4000"

    sput-object v0, Lcom/rscja/deviceapi/c;->a:Ljava/lang/String;

    goto :goto_0
.end method

.method private constructor <init>(Ljava/lang/String;Ljava/lang/String;I)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/rscja/deviceapi/c;->b:Ljava/lang/String;

    iput-object p2, p0, Lcom/rscja/deviceapi/c;->c:Ljava/lang/String;

    iput p3, p0, Lcom/rscja/deviceapi/c;->d:I

    return-void
.end method

.method public static a()Ljava/lang/String;
    .locals 2

    sget-object v0, Lcom/rscja/deviceapi/c;->a:Ljava/lang/String;

    const-string v1, "i760"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "C4000"

    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Lcom/rscja/deviceapi/c;->a:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static b()Lcom/rscja/deviceapi/c;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/rscja/deviceapi/exception/a;
        }
    .end annotation

    new-instance v0, Lcom/rscja/deviceapi/c;

    invoke-static {}, Lcom/rscja/deviceapi/c;->a()Ljava/lang/String;

    move-result-object v1

    const-string v2, "/dev/ttyMT3"

    const v3, 0x1c200

    invoke-direct {v0, v1, v2, v3}, Lcom/rscja/deviceapi/c;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    return-object v0
.end method


# virtual methods
.method public final c()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/rscja/deviceapi/c;->b:Ljava/lang/String;

    return-object v0
.end method

.method public final d()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/rscja/deviceapi/c;->c:Ljava/lang/String;

    return-object v0
.end method
