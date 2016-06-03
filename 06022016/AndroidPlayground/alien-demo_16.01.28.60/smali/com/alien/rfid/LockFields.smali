.class public Lcom/alien/rfid/LockFields;
.super Ljava/lang/Object;


# static fields
.field public static final ACCESS_PWD:I = 0x1

.field public static final EPC:I = 0x4

.field public static final KILL_PWD:I = 0x2

.field public static final USER:I = 0x8


# instance fields
.field private a:I


# direct methods
.method public constructor <init>(I)V
    .locals 1
    .param p1, "fieldBitmap"    # I

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/alien/rfid/LockFields;->a:I

    iput p1, p0, Lcom/alien/rfid/LockFields;->a:I

    return-void
.end method


# virtual methods
.method public getFieldBitmap()I
    .locals 1

    iget v0, p0, Lcom/alien/rfid/LockFields;->a:I

    return v0
.end method
