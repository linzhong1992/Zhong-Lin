.class public Lcom/dd/processbutton/iml/ActionProcessButton;
.super Lcom/dd/processbutton/ProcessButton;
.source "ActionProcessButton.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dd/processbutton/iml/ActionProcessButton$1;,
        Lcom/dd/processbutton/iml/ActionProcessButton$ProgressBar;,
        Lcom/dd/processbutton/iml/ActionProcessButton$Mode;
    }
.end annotation


# instance fields
.field private mColor1:I

.field private mColor2:I

.field private mColor3:I

.field private mColor4:I

.field private mMode:Lcom/dd/processbutton/iml/ActionProcessButton$Mode;

.field private mProgressBar:Lcom/dd/processbutton/iml/ActionProcessButton$ProgressBar;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 59
    invoke-direct {p0, p1}, Lcom/dd/processbutton/ProcessButton;-><init>(Landroid/content/Context;)V

    .line 60
    invoke-direct {p0, p1}, Lcom/dd/processbutton/iml/ActionProcessButton;->init(Landroid/content/Context;)V

    .line 61
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 64
    invoke-direct {p0, p1, p2}, Lcom/dd/processbutton/ProcessButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 65
    invoke-direct {p0, p1}, Lcom/dd/processbutton/iml/ActionProcessButton;->init(Landroid/content/Context;)V

    .line 66
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 69
    invoke-direct {p0, p1, p2, p3}, Lcom/dd/processbutton/ProcessButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 70
    invoke-direct {p0, p1}, Lcom/dd/processbutton/iml/ActionProcessButton;->init(Landroid/content/Context;)V

    .line 71
    return-void
.end method

.method private drawEndlessProgress(Landroid/graphics/Canvas;)V
    .locals 5
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 142
    iget-object v0, p0, Lcom/dd/processbutton/iml/ActionProcessButton;->mProgressBar:Lcom/dd/processbutton/iml/ActionProcessButton$ProgressBar;

    if-nez v0, :cond_0

    .line 143
    new-instance v0, Lcom/dd/processbutton/iml/ActionProcessButton$ProgressBar;

    invoke-direct {v0, p0}, Lcom/dd/processbutton/iml/ActionProcessButton$ProgressBar;-><init>(Landroid/view/View;)V

    iput-object v0, p0, Lcom/dd/processbutton/iml/ActionProcessButton;->mProgressBar:Lcom/dd/processbutton/iml/ActionProcessButton$ProgressBar;

    .line 144
    invoke-direct {p0}, Lcom/dd/processbutton/iml/ActionProcessButton;->setupProgressBarBounds()V

    .line 145
    iget-object v0, p0, Lcom/dd/processbutton/iml/ActionProcessButton;->mProgressBar:Lcom/dd/processbutton/iml/ActionProcessButton$ProgressBar;

    iget v1, p0, Lcom/dd/processbutton/iml/ActionProcessButton;->mColor1:I

    iget v2, p0, Lcom/dd/processbutton/iml/ActionProcessButton;->mColor2:I

    iget v3, p0, Lcom/dd/processbutton/iml/ActionProcessButton;->mColor3:I

    iget v4, p0, Lcom/dd/processbutton/iml/ActionProcessButton;->mColor4:I

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/dd/processbutton/iml/ActionProcessButton$ProgressBar;->setColorScheme(IIII)V

    .line 146
    iget-object v0, p0, Lcom/dd/processbutton/iml/ActionProcessButton;->mProgressBar:Lcom/dd/processbutton/iml/ActionProcessButton$ProgressBar;

    invoke-virtual {v0}, Lcom/dd/processbutton/iml/ActionProcessButton$ProgressBar;->start()V

    .line 149
    :cond_0
    invoke-virtual {p0}, Lcom/dd/processbutton/iml/ActionProcessButton;->getProgress()I

    move-result v0

    if-lez v0, :cond_1

    .line 150
    iget-object v0, p0, Lcom/dd/processbutton/iml/ActionProcessButton;->mProgressBar:Lcom/dd/processbutton/iml/ActionProcessButton$ProgressBar;

    invoke-virtual {v0, p1}, Lcom/dd/processbutton/iml/ActionProcessButton$ProgressBar;->draw(Landroid/graphics/Canvas;)V

    .line 152
    :cond_1
    return-void
.end method

.method private drawLineProgress(Landroid/graphics/Canvas;)V
    .locals 10
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 132
    invoke-virtual {p0}, Lcom/dd/processbutton/iml/ActionProcessButton;->getProgress()I

    move-result v5

    int-to-float v5, v5

    invoke-virtual {p0}, Lcom/dd/processbutton/iml/ActionProcessButton;->getMaxProgress()I

    move-result v6

    int-to-float v6, v6

    div-float v4, v5, v6

    .line 133
    .local v4, "scale":F
    invoke-virtual {p0}, Lcom/dd/processbutton/iml/ActionProcessButton;->getMeasuredWidth()I

    move-result v5

    int-to-float v5, v5

    mul-float v1, v5, v4

    .line 135
    .local v1, "indicatorWidth":F
    const-wide v2, 0x3fa999999999999aL    # 0.05

    .line 136
    .local v2, "indicatorHeightPercent":D
    invoke-virtual {p0}, Lcom/dd/processbutton/iml/ActionProcessButton;->getMeasuredHeight()I

    move-result v5

    int-to-double v6, v5

    invoke-virtual {p0}, Lcom/dd/processbutton/iml/ActionProcessButton;->getMeasuredHeight()I

    move-result v5

    int-to-double v8, v5

    mul-double/2addr v8, v2

    sub-double/2addr v6, v8

    double-to-int v0, v6

    .line 137
    .local v0, "bottom":I
    invoke-virtual {p0}, Lcom/dd/processbutton/iml/ActionProcessButton;->getProgressDrawable()Landroid/graphics/drawable/GradientDrawable;

    move-result-object v5

    const/4 v6, 0x0

    float-to-int v7, v1

    invoke-virtual {p0}, Lcom/dd/processbutton/iml/ActionProcessButton;->getMeasuredHeight()I

    move-result v8

    invoke-virtual {v5, v6, v0, v7, v8}, Landroid/graphics/drawable/GradientDrawable;->setBounds(IIII)V

    .line 138
    invoke-virtual {p0}, Lcom/dd/processbutton/iml/ActionProcessButton;->getProgressDrawable()Landroid/graphics/drawable/GradientDrawable;

    move-result-object v5

    invoke-virtual {v5, p1}, Landroid/graphics/drawable/GradientDrawable;->draw(Landroid/graphics/Canvas;)V

    .line 139
    return-void
.end method

.method private init(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 74
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 76
    .local v0, "res":Landroid/content/res/Resources;
    sget-object v1, Lcom/dd/processbutton/iml/ActionProcessButton$Mode;->ENDLESS:Lcom/dd/processbutton/iml/ActionProcessButton$Mode;

    iput-object v1, p0, Lcom/dd/processbutton/iml/ActionProcessButton;->mMode:Lcom/dd/processbutton/iml/ActionProcessButton$Mode;

    .line 78
    sget v1, Lcom/dd/processbutton/R$color;->holo_blue_bright:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    iput v1, p0, Lcom/dd/processbutton/iml/ActionProcessButton;->mColor1:I

    .line 79
    sget v1, Lcom/dd/processbutton/R$color;->holo_green_light:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    iput v1, p0, Lcom/dd/processbutton/iml/ActionProcessButton;->mColor2:I

    .line 80
    sget v1, Lcom/dd/processbutton/R$color;->holo_orange_light:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    iput v1, p0, Lcom/dd/processbutton/iml/ActionProcessButton;->mColor3:I

    .line 81
    sget v1, Lcom/dd/processbutton/R$color;->holo_red_light:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    iput v1, p0, Lcom/dd/processbutton/iml/ActionProcessButton;->mColor4:I

    .line 82
    return-void
.end method

.method private setupProgressBarBounds()V
    .locals 7

    .prologue
    .line 155
    sget v1, Lcom/dd/processbutton/R$dimen;->layer_padding:I

    invoke-virtual {p0, v1}, Lcom/dd/processbutton/iml/ActionProcessButton;->getDimension(I)F

    move-result v1

    float-to-double v2, v1

    .line 156
    .local v2, "indicatorHeight":D
    invoke-virtual {p0}, Lcom/dd/processbutton/iml/ActionProcessButton;->getMeasuredHeight()I

    move-result v1

    int-to-double v4, v1

    sub-double/2addr v4, v2

    double-to-int v0, v4

    .line 157
    .local v0, "bottom":I
    iget-object v1, p0, Lcom/dd/processbutton/iml/ActionProcessButton;->mProgressBar:Lcom/dd/processbutton/iml/ActionProcessButton$ProgressBar;

    const/4 v4, 0x0

    invoke-virtual {p0}, Lcom/dd/processbutton/iml/ActionProcessButton;->getMeasuredWidth()I

    move-result v5

    invoke-virtual {p0}, Lcom/dd/processbutton/iml/ActionProcessButton;->getMeasuredHeight()I

    move-result v6

    invoke-virtual {v1, v4, v0, v5, v6}, Lcom/dd/processbutton/iml/ActionProcessButton$ProgressBar;->setBounds(IIII)V

    .line 158
    return-void
.end method


# virtual methods
.method public drawProgress(Landroid/graphics/Canvas;)V
    .locals 2
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 109
    invoke-virtual {p0}, Lcom/dd/processbutton/iml/ActionProcessButton;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p0}, Lcom/dd/processbutton/iml/ActionProcessButton;->getProgressDrawable()Landroid/graphics/drawable/GradientDrawable;

    move-result-object v1

    if-eq v0, v1, :cond_0

    .line 110
    invoke-virtual {p0}, Lcom/dd/processbutton/iml/ActionProcessButton;->getProgressDrawable()Landroid/graphics/drawable/GradientDrawable;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/dd/processbutton/iml/ActionProcessButton;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 113
    :cond_0
    sget-object v0, Lcom/dd/processbutton/iml/ActionProcessButton$1;->$SwitchMap$com$dd$processbutton$iml$ActionProcessButton$Mode:[I

    iget-object v1, p0, Lcom/dd/processbutton/iml/ActionProcessButton;->mMode:Lcom/dd/processbutton/iml/ActionProcessButton$Mode;

    invoke-virtual {v1}, Lcom/dd/processbutton/iml/ActionProcessButton$Mode;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 121
    :goto_0
    return-void

    .line 115
    :pswitch_0
    invoke-direct {p0, p1}, Lcom/dd/processbutton/iml/ActionProcessButton;->drawEndlessProgress(Landroid/graphics/Canvas;)V

    goto :goto_0

    .line 118
    :pswitch_1
    invoke-direct {p0, p1}, Lcom/dd/processbutton/iml/ActionProcessButton;->drawLineProgress(Landroid/graphics/Canvas;)V

    goto :goto_0

    .line 113
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method protected onSizeChanged(IIII)V
    .locals 1
    .param p1, "w"    # I
    .param p2, "h"    # I
    .param p3, "oldw"    # I
    .param p4, "oldh"    # I

    .prologue
    .line 125
    invoke-super {p0, p1, p2, p3, p4}, Lcom/dd/processbutton/ProcessButton;->onSizeChanged(IIII)V

    .line 126
    iget-object v0, p0, Lcom/dd/processbutton/iml/ActionProcessButton;->mProgressBar:Lcom/dd/processbutton/iml/ActionProcessButton$ProgressBar;

    if-eqz v0, :cond_0

    .line 127
    invoke-direct {p0}, Lcom/dd/processbutton/iml/ActionProcessButton;->setupProgressBarBounds()V

    .line 129
    :cond_0
    return-void
.end method

.method public setColorScheme(IIII)V
    .locals 0
    .param p1, "color1"    # I
    .param p2, "color2"    # I
    .param p3, "color3"    # I
    .param p4, "color4"    # I

    .prologue
    .line 101
    iput p1, p0, Lcom/dd/processbutton/iml/ActionProcessButton;->mColor1:I

    .line 102
    iput p2, p0, Lcom/dd/processbutton/iml/ActionProcessButton;->mColor2:I

    .line 103
    iput p3, p0, Lcom/dd/processbutton/iml/ActionProcessButton;->mColor3:I

    .line 104
    iput p4, p0, Lcom/dd/processbutton/iml/ActionProcessButton;->mColor4:I

    .line 105
    return-void
.end method

.method public setMode(Lcom/dd/processbutton/iml/ActionProcessButton$Mode;)V
    .locals 0
    .param p1, "mode"    # Lcom/dd/processbutton/iml/ActionProcessButton$Mode;

    .prologue
    .line 85
    iput-object p1, p0, Lcom/dd/processbutton/iml/ActionProcessButton;->mMode:Lcom/dd/processbutton/iml/ActionProcessButton$Mode;

    .line 86
    return-void
.end method

.method public startAnimation()V
    .locals 2

    .prologue
    .line 89
    iget-object v0, p0, Lcom/dd/processbutton/iml/ActionProcessButton;->mMode:Lcom/dd/processbutton/iml/ActionProcessButton$Mode;

    sget-object v1, Lcom/dd/processbutton/iml/ActionProcessButton$Mode;->ENDLESS:Lcom/dd/processbutton/iml/ActionProcessButton$Mode;

    if-ne v0, v1, :cond_0

    .line 90
    const/16 v0, 0x32

    invoke-virtual {p0, v0}, Lcom/dd/processbutton/iml/ActionProcessButton;->setProgress(I)V

    .line 92
    :cond_0
    return-void
.end method

.method public stopAnimation()V
    .locals 2

    .prologue
    .line 95
    iget-object v0, p0, Lcom/dd/processbutton/iml/ActionProcessButton;->mMode:Lcom/dd/processbutton/iml/ActionProcessButton$Mode;

    sget-object v1, Lcom/dd/processbutton/iml/ActionProcessButton$Mode;->ENDLESS:Lcom/dd/processbutton/iml/ActionProcessButton$Mode;

    if-ne v0, v1, :cond_0

    .line 96
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/dd/processbutton/iml/ActionProcessButton;->setProgress(I)V

    .line 98
    :cond_0
    return-void
.end method
