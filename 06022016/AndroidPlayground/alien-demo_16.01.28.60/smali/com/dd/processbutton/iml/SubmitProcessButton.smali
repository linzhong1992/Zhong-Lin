.class public Lcom/dd/processbutton/iml/SubmitProcessButton;
.super Lcom/dd/processbutton/ProcessButton;
.source "SubmitProcessButton.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 36
    invoke-direct {p0, p1}, Lcom/dd/processbutton/ProcessButton;-><init>(Landroid/content/Context;)V

    .line 37
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 40
    invoke-direct {p0, p1, p2}, Lcom/dd/processbutton/ProcessButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 41
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 44
    invoke-direct {p0, p1, p2, p3}, Lcom/dd/processbutton/ProcessButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 45
    return-void
.end method


# virtual methods
.method public drawProgress(Landroid/graphics/Canvas;)V
    .locals 6
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/4 v5, 0x0

    .line 49
    invoke-virtual {p0}, Lcom/dd/processbutton/iml/SubmitProcessButton;->getProgress()I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {p0}, Lcom/dd/processbutton/iml/SubmitProcessButton;->getMaxProgress()I

    move-result v3

    int-to-float v3, v3

    div-float v1, v2, v3

    .line 50
    .local v1, "scale":F
    invoke-virtual {p0}, Lcom/dd/processbutton/iml/SubmitProcessButton;->getMeasuredWidth()I

    move-result v2

    int-to-float v2, v2

    mul-float v0, v2, v1

    .line 52
    .local v0, "indicatorWidth":F
    invoke-virtual {p0}, Lcom/dd/processbutton/iml/SubmitProcessButton;->getProgressDrawable()Landroid/graphics/drawable/GradientDrawable;

    move-result-object v2

    float-to-int v3, v0

    invoke-virtual {p0}, Lcom/dd/processbutton/iml/SubmitProcessButton;->getMeasuredHeight()I

    move-result v4

    invoke-virtual {v2, v5, v5, v3, v4}, Landroid/graphics/drawable/GradientDrawable;->setBounds(IIII)V

    .line 53
    invoke-virtual {p0}, Lcom/dd/processbutton/iml/SubmitProcessButton;->getProgressDrawable()Landroid/graphics/drawable/GradientDrawable;

    move-result-object v2

    invoke-virtual {v2, p1}, Landroid/graphics/drawable/GradientDrawable;->draw(Landroid/graphics/Canvas;)V

    .line 54
    return-void
.end method
