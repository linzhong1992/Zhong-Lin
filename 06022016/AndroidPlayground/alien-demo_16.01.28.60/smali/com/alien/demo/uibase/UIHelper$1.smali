.class final Lcom/alien/demo/uibase/UIHelper$1;
.super Landroid/os/CountDownTimer;
.source "UIHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/alien/demo/uibase/UIHelper;->flashingView(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$v:Landroid/view/View;


# direct methods
.method constructor <init>(JJLandroid/view/View;)V
    .locals 1
    .param p1, "x0"    # J
    .param p3, "x1"    # J

    .prologue
    .line 33
    iput-object p5, p0, Lcom/alien/demo/uibase/UIHelper$1;->val$v:Landroid/view/View;

    invoke-direct {p0, p1, p2, p3, p4}, Landroid/os/CountDownTimer;-><init>(JJ)V

    return-void
.end method


# virtual methods
.method public onFinish()V
    .locals 1

    .prologue
    .line 37
    iget-object v0, p0, Lcom/alien/demo/uibase/UIHelper$1;->val$v:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->clearAnimation()V

    .line 38
    return-void
.end method

.method public onTick(J)V
    .locals 0
    .param p1, "millisUntilFinished"    # J

    .prologue
    .line 35
    return-void
.end method
