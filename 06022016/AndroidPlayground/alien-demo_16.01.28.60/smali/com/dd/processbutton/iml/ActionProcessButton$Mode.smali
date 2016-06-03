.class public final enum Lcom/dd/processbutton/iml/ActionProcessButton$Mode;
.super Ljava/lang/Enum;
.source "ActionProcessButton.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dd/processbutton/iml/ActionProcessButton;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Mode"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/dd/processbutton/iml/ActionProcessButton$Mode;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/dd/processbutton/iml/ActionProcessButton$Mode;

.field public static final enum ENDLESS:Lcom/dd/processbutton/iml/ActionProcessButton$Mode;

.field public static final enum PROGRESS:Lcom/dd/processbutton/iml/ActionProcessButton$Mode;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 55
    new-instance v0, Lcom/dd/processbutton/iml/ActionProcessButton$Mode;

    const-string v1, "PROGRESS"

    invoke-direct {v0, v1, v2}, Lcom/dd/processbutton/iml/ActionProcessButton$Mode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/dd/processbutton/iml/ActionProcessButton$Mode;->PROGRESS:Lcom/dd/processbutton/iml/ActionProcessButton$Mode;

    new-instance v0, Lcom/dd/processbutton/iml/ActionProcessButton$Mode;

    const-string v1, "ENDLESS"

    invoke-direct {v0, v1, v3}, Lcom/dd/processbutton/iml/ActionProcessButton$Mode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/dd/processbutton/iml/ActionProcessButton$Mode;->ENDLESS:Lcom/dd/processbutton/iml/ActionProcessButton$Mode;

    .line 54
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/dd/processbutton/iml/ActionProcessButton$Mode;

    sget-object v1, Lcom/dd/processbutton/iml/ActionProcessButton$Mode;->PROGRESS:Lcom/dd/processbutton/iml/ActionProcessButton$Mode;

    aput-object v1, v0, v2

    sget-object v1, Lcom/dd/processbutton/iml/ActionProcessButton$Mode;->ENDLESS:Lcom/dd/processbutton/iml/ActionProcessButton$Mode;

    aput-object v1, v0, v3

    sput-object v0, Lcom/dd/processbutton/iml/ActionProcessButton$Mode;->$VALUES:[Lcom/dd/processbutton/iml/ActionProcessButton$Mode;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 54
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/dd/processbutton/iml/ActionProcessButton$Mode;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 54
    const-class v0, Lcom/dd/processbutton/iml/ActionProcessButton$Mode;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/dd/processbutton/iml/ActionProcessButton$Mode;

    return-object v0
.end method

.method public static values()[Lcom/dd/processbutton/iml/ActionProcessButton$Mode;
    .locals 1

    .prologue
    .line 54
    sget-object v0, Lcom/dd/processbutton/iml/ActionProcessButton$Mode;->$VALUES:[Lcom/dd/processbutton/iml/ActionProcessButton$Mode;

    invoke-virtual {v0}, [Lcom/dd/processbutton/iml/ActionProcessButton$Mode;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/dd/processbutton/iml/ActionProcessButton$Mode;

    return-object v0
.end method
