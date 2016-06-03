.class public Lcom/alien/demo/uibase/UIHelper;
.super Ljava/lang/Object;
.source "UIHelper.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static ToastMessage(Landroid/content/Context;I)V
    .locals 1
    .param p0, "cont"    # Landroid/content/Context;
    .param p1, "msg"    # I

    .prologue
    .line 18
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 19
    return-void
.end method

.method public static ToastMessage(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1
    .param p0, "cont"    # Landroid/content/Context;
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 14
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 15
    return-void
.end method

.method public static ToastMessage(Landroid/content/Context;Ljava/lang/String;I)V
    .locals 1
    .param p0, "cont"    # Landroid/content/Context;
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "time"    # I

    .prologue
    .line 22
    invoke-static {p0, p1, p2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 23
    return-void
.end method

.method public static flashingView(Landroid/view/View;)V
    .locals 7
    .param p0, "v"    # Landroid/view/View;

    .prologue
    const-wide/16 v2, 0x3e8

    .line 26
    new-instance v0, Landroid/view/animation/AlphaAnimation;

    const/high16 v1, 0x3f800000    # 1.0f

    const/4 v4, 0x0

    invoke-direct {v0, v1, v4}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    .line 27
    .local v0, "animation":Landroid/view/animation/Animation;
    const-wide/16 v4, 0x1f4

    invoke-virtual {v0, v4, v5}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 28
    new-instance v1, Landroid/view/animation/LinearInterpolator;

    invoke-direct {v1}, Landroid/view/animation/LinearInterpolator;-><init>()V

    invoke-virtual {v0, v1}, Landroid/view/animation/Animation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 29
    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/view/animation/Animation;->setRepeatCount(I)V

    .line 30
    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/view/animation/Animation;->setRepeatMode(I)V

    .line 32
    invoke-virtual {p0, v0}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 33
    new-instance v1, Lcom/alien/demo/uibase/UIHelper$1;

    move-wide v4, v2

    move-object v6, p0

    invoke-direct/range {v1 .. v6}, Lcom/alien/demo/uibase/UIHelper$1;-><init>(JJLandroid/view/View;)V

    invoke-virtual {v1}, Lcom/alien/demo/uibase/UIHelper$1;->start()Landroid/os/CountDownTimer;

    .line 40
    return-void
.end method
