.class public final enum Lcom/alien/rfid/LockType;
.super Ljava/lang/Enum;


# static fields
.field public static final enum LOCK:Lcom/alien/rfid/LockType;

.field public static final enum PERMALOCK:Lcom/alien/rfid/LockType;

.field public static final enum PERMAUNLOCK:Lcom/alien/rfid/LockType;

.field public static final enum UNLOCK:Lcom/alien/rfid/LockType;

.field private static final synthetic b:[Lcom/alien/rfid/LockType;


# instance fields
.field private a:I


# direct methods
.method static constructor <clinit>()V
    .locals 6

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    new-instance v0, Lcom/alien/rfid/LockType;

    const-string v1, "LOCK"

    invoke-direct {v0, v1, v2, v2}, Lcom/alien/rfid/LockType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/alien/rfid/LockType;->LOCK:Lcom/alien/rfid/LockType;

    new-instance v0, Lcom/alien/rfid/LockType;

    const-string v1, "UNLOCK"

    invoke-direct {v0, v1, v3, v3}, Lcom/alien/rfid/LockType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/alien/rfid/LockType;->UNLOCK:Lcom/alien/rfid/LockType;

    new-instance v0, Lcom/alien/rfid/LockType;

    const-string v1, "PERMALOCK"

    invoke-direct {v0, v1, v4, v4}, Lcom/alien/rfid/LockType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/alien/rfid/LockType;->PERMALOCK:Lcom/alien/rfid/LockType;

    new-instance v0, Lcom/alien/rfid/LockType;

    const-string v1, "PERMAUNLOCK"

    invoke-direct {v0, v1, v5, v5}, Lcom/alien/rfid/LockType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/alien/rfid/LockType;->PERMAUNLOCK:Lcom/alien/rfid/LockType;

    const/4 v0, 0x4

    new-array v0, v0, [Lcom/alien/rfid/LockType;

    sget-object v1, Lcom/alien/rfid/LockType;->LOCK:Lcom/alien/rfid/LockType;

    aput-object v1, v0, v2

    sget-object v1, Lcom/alien/rfid/LockType;->UNLOCK:Lcom/alien/rfid/LockType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/alien/rfid/LockType;->PERMALOCK:Lcom/alien/rfid/LockType;

    aput-object v1, v0, v4

    sget-object v1, Lcom/alien/rfid/LockType;->PERMAUNLOCK:Lcom/alien/rfid/LockType;

    aput-object v1, v0, v5

    sput-object v0, Lcom/alien/rfid/LockType;->b:[Lcom/alien/rfid/LockType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .param p3, "value"    # I

    .prologue
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lcom/alien/rfid/LockType;->a:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/alien/rfid/LockType;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    const-class v0, Lcom/alien/rfid/LockType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/alien/rfid/LockType;

    return-object v0
.end method

.method public static values()[Lcom/alien/rfid/LockType;
    .locals 1

    sget-object v0, Lcom/alien/rfid/LockType;->b:[Lcom/alien/rfid/LockType;

    invoke-virtual {v0}, [Lcom/alien/rfid/LockType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/alien/rfid/LockType;

    return-object v0
.end method
