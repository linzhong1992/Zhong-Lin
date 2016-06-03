.class public Lcom/alien/demo/feature/geiger/TagProximator;
.super Ljava/lang/Object;
.source "TagProximator.java"


# static fields
.field public static RssiHistoryCapacity:I

.field public static final RssiMax:Ljava/lang/Double;

.field public static final RssiMin:Ljava/lang/Double;

.field private static scaledMax:I

.field private static tags:Ljava/util/Hashtable;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 9
    const-wide v0, -0x3fae800000000000L    # -70.0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    sput-object v0, Lcom/alien/demo/feature/geiger/TagProximator;->RssiMin:Ljava/lang/Double;

    .line 10
    const-wide/high16 v0, -0x3fc2000000000000L    # -30.0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    sput-object v0, Lcom/alien/demo/feature/geiger/TagProximator;->RssiMax:Ljava/lang/Double;

    .line 11
    const/16 v0, 0x64

    sput v0, Lcom/alien/demo/feature/geiger/TagProximator;->scaledMax:I

    .line 15
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    sput-object v0, Lcom/alien/demo/feature/geiger/TagProximator;->tags:Ljava/util/Hashtable;

    .line 16
    const/4 v0, 0x5

    sput v0, Lcom/alien/demo/feature/geiger/TagProximator;->RssiHistoryCapacity:I

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static addData(Ljava/lang/String;D)F
    .locals 3
    .param p0, "epc"    # Ljava/lang/String;
    .param p1, "rssi"    # D

    .prologue
    .line 29
    sget-object v1, Lcom/alien/demo/feature/geiger/TagProximator;->tags:Ljava/util/Hashtable;

    invoke-virtual {v1, p0}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Vector;

    .line 30
    .local v0, "tagRSSIs":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/Double;>;"
    if-nez v0, :cond_0

    .line 32
    new-instance v0, Ljava/util/Vector;

    .end local v0    # "tagRSSIs":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/Double;>;"
    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    .line 33
    .restart local v0    # "tagRSSIs":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/Double;>;"
    sget-object v1, Lcom/alien/demo/feature/geiger/TagProximator;->tags:Ljava/util/Hashtable;

    invoke-virtual {v1, p0, v0}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    :cond_0
    invoke-static {p1, p2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 40
    :goto_0
    invoke-virtual {v0}, Ljava/util/Vector;->size()I

    move-result v1

    sget v2, Lcom/alien/demo/feature/geiger/TagProximator;->RssiHistoryCapacity:I

    if-le v1, v2, :cond_1

    .line 41
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/Vector;->remove(I)Ljava/lang/Object;

    goto :goto_0

    .line 44
    :cond_1
    invoke-static {p0}, Lcom/alien/demo/feature/geiger/TagProximator;->getProximity(Ljava/lang/String;)F

    move-result v1

    return v1
.end method

.method public static clear()V
    .locals 1

    .prologue
    .line 104
    sget-object v0, Lcom/alien/demo/feature/geiger/TagProximator;->tags:Ljava/util/Hashtable;

    invoke-virtual {v0}, Ljava/util/Hashtable;->clear()V

    .line 105
    return-void
.end method

.method public static getProximity(Ljava/lang/String;)F
    .locals 8
    .param p0, "tagID"    # Ljava/lang/String;

    .prologue
    .line 54
    const/4 v1, 0x0

    .line 55
    .local v1, "rssiAvg":F
    sget-object v4, Lcom/alien/demo/feature/geiger/TagProximator;->tags:Ljava/util/Hashtable;

    invoke-virtual {v4, p0}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Vector;

    .line 57
    .local v3, "tagRSSIs":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/Double;>;"
    if-nez v3, :cond_0

    const/4 v4, 0x0

    .line 65
    :goto_0
    return v4

    .line 59
    :cond_0
    invoke-virtual {v3}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Double;

    .line 60
    .local v2, "rssiVal":Ljava/lang/Double;
    float-to-double v4, v1

    invoke-virtual {v2}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v6

    add-double/2addr v4, v6

    double-to-float v1, v4

    .line 61
    goto :goto_1

    .line 63
    .end local v2    # "rssiVal":Ljava/lang/Double;
    :cond_1
    invoke-virtual {v3}, Ljava/util/Vector;->size()I

    move-result v4

    int-to-float v4, v4

    div-float/2addr v1, v4

    move v4, v1

    .line 65
    goto :goto_0
.end method

.method public static getScaledProximity(Ljava/lang/String;)I
    .locals 1
    .param p0, "epc"    # Ljava/lang/String;

    .prologue
    .line 75
    invoke-static {p0}, Lcom/alien/demo/feature/geiger/TagProximator;->getProximity(Ljava/lang/String;)F

    move-result v0

    invoke-static {v0}, Lcom/alien/demo/feature/geiger/TagProximator;->scaleRSSI(F)I

    move-result v0

    return v0
.end method

.method private static scaleRSSI(F)I
    .locals 8
    .param p0, "rssi"    # F

    .prologue
    .line 85
    float-to-double v2, p0

    const-wide/16 v4, 0x0

    cmpl-double v1, v2, v4

    if-nez v1, :cond_0

    const/4 v0, 0x0

    .line 91
    :goto_0
    return v0

    .line 88
    :cond_0
    float-to-double v2, p0

    sget-object v1, Lcom/alien/demo/feature/geiger/TagProximator;->RssiMin:Ljava/lang/Double;

    invoke-virtual {v1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v4

    neg-double v4, v4

    add-double/2addr v2, v4

    sget-object v1, Lcom/alien/demo/feature/geiger/TagProximator;->RssiMax:Ljava/lang/Double;

    invoke-virtual {v1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v4

    sget-object v1, Lcom/alien/demo/feature/geiger/TagProximator;->RssiMin:Ljava/lang/Double;

    invoke-virtual {v1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v6

    sub-double/2addr v4, v6

    div-double/2addr v2, v4

    sget v1, Lcom/alien/demo/feature/geiger/TagProximator;->scaledMax:I

    int-to-double v4, v1

    mul-double/2addr v2, v4

    double-to-int v0, v2

    .line 91
    .local v0, "scaled_rssi":I
    goto :goto_0
.end method
