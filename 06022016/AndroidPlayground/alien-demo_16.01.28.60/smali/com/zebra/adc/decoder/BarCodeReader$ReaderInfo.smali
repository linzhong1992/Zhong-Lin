.class Lcom/zebra/adc/decoder/BarCodeReader$ReaderInfo;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zebra/adc/decoder/BarCodeReader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ReaderInfo"
.end annotation


# static fields
.field static final BCRDR_FACING_BACK:I = 0x0

.field static final BCRDR_FACING_FRONT:I = 0x1


# instance fields
.field public facing:I

.field public orientation:I


# direct methods
.method constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
