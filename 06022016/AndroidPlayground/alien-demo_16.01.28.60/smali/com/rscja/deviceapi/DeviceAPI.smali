.class final Lcom/rscja/deviceapi/DeviceAPI;
.super Ljava/lang/Object;


# static fields
.field private static a:Lcom/rscja/deviceapi/DeviceAPI;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x0

    sput-object v0, Lcom/rscja/deviceapi/DeviceAPI;->a:Lcom/rscja/deviceapi/DeviceAPI;

    const-string v0, "DeviceAPI"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static declared-synchronized a()Lcom/rscja/deviceapi/DeviceAPI;
    .locals 2

    const-class v1, Lcom/rscja/deviceapi/DeviceAPI;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/rscja/deviceapi/DeviceAPI;->a:Lcom/rscja/deviceapi/DeviceAPI;

    if-nez v0, :cond_0

    new-instance v0, Lcom/rscja/deviceapi/DeviceAPI;

    invoke-direct {v0}, Lcom/rscja/deviceapi/DeviceAPI;-><init>()V

    sput-object v0, Lcom/rscja/deviceapi/DeviceAPI;->a:Lcom/rscja/deviceapi/DeviceAPI;

    :cond_0
    sget-object v0, Lcom/rscja/deviceapi/DeviceAPI;->a:Lcom/rscja/deviceapi/DeviceAPI;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method


# virtual methods
.method public final native UHFCloseAndDisconnect()V
.end method

.method public final native UHFFree(Ljava/lang/String;)I
.end method

.method public final native UHFGetPower()[C
.end method

.method public final native UHFInit(Ljava/lang/String;)I
.end method

.method public final native UHFInventory_EX(CC)I
.end method

.method public final native UHFOpenAndConnect(Ljava/lang/String;)I
.end method

.method public final native UHFSetPower(C)I
.end method

.method public final native UHFStopGet()I
.end method
