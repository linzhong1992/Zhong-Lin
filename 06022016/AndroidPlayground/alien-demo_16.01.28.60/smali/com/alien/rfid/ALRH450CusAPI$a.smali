.class Lcom/alien/rfid/ALRH450CusAPI$a;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/alien/rfid/ALRH450CusAPI;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "a"
.end annotation


# instance fields
.field a:I

.field b:I

.field c:I


# direct methods
.method constructor <init>(III)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/alien/rfid/ALRH450CusAPI$a;->a:I

    iput p2, p0, Lcom/alien/rfid/ALRH450CusAPI$a;->b:I

    iput p3, p0, Lcom/alien/rfid/ALRH450CusAPI$a;->c:I

    return-void
.end method
