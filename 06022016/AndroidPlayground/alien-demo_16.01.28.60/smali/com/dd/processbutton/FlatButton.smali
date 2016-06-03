.class public Lcom/dd/processbutton/FlatButton;
.super Landroid/widget/Button;
.source "FlatButton.java"


# instance fields
.field private cornerRadius:F

.field private mNormalDrawable:Landroid/graphics/drawable/StateListDrawable;

.field private mNormalText:Ljava/lang/CharSequence;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 31
    invoke-direct {p0, p1}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 32
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/dd/processbutton/FlatButton;->init(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 33
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 26
    invoke-direct {p0, p1, p2}, Landroid/widget/Button;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 27
    invoke-direct {p0, p1, p2}, Lcom/dd/processbutton/FlatButton;->init(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 28
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 21
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/Button;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 22
    invoke-direct {p0, p1, p2}, Lcom/dd/processbutton/FlatButton;->init(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 23
    return-void
.end method

.method private createNormalDrawable(Landroid/content/res/TypedArray;)Landroid/graphics/drawable/LayerDrawable;
    .locals 8
    .param p1, "attr"    # Landroid/content/res/TypedArray;

    .prologue
    .line 69
    sget v7, Lcom/dd/processbutton/R$drawable;->rect_normal:I

    invoke-virtual {p0, v7}, Lcom/dd/processbutton/FlatButton;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v7

    invoke-virtual {v7}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v5

    check-cast v5, Landroid/graphics/drawable/LayerDrawable;

    .line 72
    .local v5, "drawableNormal":Landroid/graphics/drawable/LayerDrawable;
    const/4 v7, 0x0

    invoke-virtual {v5, v7}, Landroid/graphics/drawable/LayerDrawable;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v7

    invoke-virtual {v7}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v6

    check-cast v6, Landroid/graphics/drawable/GradientDrawable;

    .line 74
    .local v6, "drawableTop":Landroid/graphics/drawable/GradientDrawable;
    invoke-virtual {p0}, Lcom/dd/processbutton/FlatButton;->getCornerRadius()F

    move-result v7

    invoke-virtual {v6, v7}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 76
    sget v7, Lcom/dd/processbutton/R$color;->blue_pressed:I

    invoke-virtual {p0, v7}, Lcom/dd/processbutton/FlatButton;->getColor(I)I

    move-result v0

    .line 77
    .local v0, "blueDark":I
    sget v7, Lcom/dd/processbutton/R$styleable;->FlatButton_pb_colorPressed:I

    invoke-virtual {p1, v7, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v3

    .line 78
    .local v3, "colorPressed":I
    invoke-virtual {v6, v3}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 80
    const/4 v7, 0x1

    invoke-virtual {v5, v7}, Landroid/graphics/drawable/LayerDrawable;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v7

    invoke-virtual {v7}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v4

    check-cast v4, Landroid/graphics/drawable/GradientDrawable;

    .line 82
    .local v4, "drawableBottom":Landroid/graphics/drawable/GradientDrawable;
    invoke-virtual {p0}, Lcom/dd/processbutton/FlatButton;->getCornerRadius()F

    move-result v7

    invoke-virtual {v4, v7}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 84
    sget v7, Lcom/dd/processbutton/R$color;->blue_normal:I

    invoke-virtual {p0, v7}, Lcom/dd/processbutton/FlatButton;->getColor(I)I

    move-result v1

    .line 85
    .local v1, "blueNormal":I
    sget v7, Lcom/dd/processbutton/R$styleable;->FlatButton_pb_colorNormal:I

    invoke-virtual {p1, v7, v1}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v2

    .line 86
    .local v2, "colorNormal":I
    invoke-virtual {v4, v2}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 87
    return-object v5
.end method

.method private createPressedDrawable(Landroid/content/res/TypedArray;)Landroid/graphics/drawable/Drawable;
    .locals 4
    .param p1, "attr"    # Landroid/content/res/TypedArray;

    .prologue
    .line 91
    sget v3, Lcom/dd/processbutton/R$drawable;->rect_pressed:I

    invoke-virtual {p0, v3}, Lcom/dd/processbutton/FlatButton;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    invoke-virtual {v3}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    check-cast v2, Landroid/graphics/drawable/GradientDrawable;

    .line 93
    .local v2, "drawablePressed":Landroid/graphics/drawable/GradientDrawable;
    invoke-virtual {p0}, Lcom/dd/processbutton/FlatButton;->getCornerRadius()F

    move-result v3

    invoke-virtual {v2, v3}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 95
    sget v3, Lcom/dd/processbutton/R$color;->blue_pressed:I

    invoke-virtual {p0, v3}, Lcom/dd/processbutton/FlatButton;->getColor(I)I

    move-result v0

    .line 96
    .local v0, "blueDark":I
    sget v3, Lcom/dd/processbutton/R$styleable;->FlatButton_pb_colorPressed:I

    invoke-virtual {p1, v3, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v1

    .line 97
    .local v1, "colorPressed":I
    invoke-virtual {v2, v1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 99
    return-object v2
.end method

.method private init(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 36
    new-instance v0, Landroid/graphics/drawable/StateListDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/StateListDrawable;-><init>()V

    iput-object v0, p0, Lcom/dd/processbutton/FlatButton;->mNormalDrawable:Landroid/graphics/drawable/StateListDrawable;

    .line 37
    if-eqz p2, :cond_0

    .line 38
    invoke-direct {p0, p1, p2}, Lcom/dd/processbutton/FlatButton;->initAttributes(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 40
    :cond_0
    invoke-virtual {p0}, Lcom/dd/processbutton/FlatButton;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/dd/processbutton/FlatButton;->mNormalText:Ljava/lang/CharSequence;

    .line 41
    iget-object v0, p0, Lcom/dd/processbutton/FlatButton;->mNormalDrawable:Landroid/graphics/drawable/StateListDrawable;

    invoke-virtual {p0, v0}, Lcom/dd/processbutton/FlatButton;->setBackgroundCompat(Landroid/graphics/drawable/Drawable;)V

    .line 42
    return-void
.end method

.method private initAttributes(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attributeSet"    # Landroid/util/AttributeSet;

    .prologue
    .line 45
    sget-object v2, Lcom/dd/processbutton/R$styleable;->FlatButton:[I

    invoke-virtual {p0, p1, p2, v2}, Lcom/dd/processbutton/FlatButton;->getTypedArray(Landroid/content/Context;Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 46
    .local v0, "attr":Landroid/content/res/TypedArray;
    if-nez v0, :cond_0

    .line 66
    :goto_0
    return-void

    .line 52
    :cond_0
    :try_start_0
    sget v2, Lcom/dd/processbutton/R$dimen;->corner_radius:I

    invoke-virtual {p0, v2}, Lcom/dd/processbutton/FlatButton;->getDimension(I)F

    move-result v1

    .line 53
    .local v1, "defValue":F
    sget v2, Lcom/dd/processbutton/R$styleable;->FlatButton_pb_cornerRadius:I

    invoke-virtual {v0, v2, v1}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v2

    iput v2, p0, Lcom/dd/processbutton/FlatButton;->cornerRadius:F

    .line 55
    iget-object v2, p0, Lcom/dd/processbutton/FlatButton;->mNormalDrawable:Landroid/graphics/drawable/StateListDrawable;

    const/4 v3, 0x1

    new-array v3, v3, [I

    const/4 v4, 0x0

    const v5, 0x10100a7

    aput v5, v3, v4

    invoke-direct {p0, v0}, Lcom/dd/processbutton/FlatButton;->createPressedDrawable(Landroid/content/res/TypedArray;)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 57
    iget-object v2, p0, Lcom/dd/processbutton/FlatButton;->mNormalDrawable:Landroid/graphics/drawable/StateListDrawable;

    const/4 v3, 0x1

    new-array v3, v3, [I

    const/4 v4, 0x0

    const v5, 0x101009c

    aput v5, v3, v4

    invoke-direct {p0, v0}, Lcom/dd/processbutton/FlatButton;->createPressedDrawable(Landroid/content/res/TypedArray;)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 59
    iget-object v2, p0, Lcom/dd/processbutton/FlatButton;->mNormalDrawable:Landroid/graphics/drawable/StateListDrawable;

    const/4 v3, 0x1

    new-array v3, v3, [I

    const/4 v4, 0x0

    const v5, 0x10100a1

    aput v5, v3, v4

    invoke-direct {p0, v0}, Lcom/dd/processbutton/FlatButton;->createPressedDrawable(Landroid/content/res/TypedArray;)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 61
    iget-object v2, p0, Lcom/dd/processbutton/FlatButton;->mNormalDrawable:Landroid/graphics/drawable/StateListDrawable;

    const/4 v3, 0x0

    new-array v3, v3, [I

    invoke-direct {p0, v0}, Lcom/dd/processbutton/FlatButton;->createNormalDrawable(Landroid/content/res/TypedArray;)Landroid/graphics/drawable/LayerDrawable;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 64
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    goto :goto_0

    .end local v1    # "defValue":F
    :catchall_0
    move-exception v2

    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    throw v2
.end method


# virtual methods
.method protected getColor(I)I
    .locals 1
    .param p1, "id"    # I

    .prologue
    .line 111
    invoke-virtual {p0}, Lcom/dd/processbutton/FlatButton;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    return v0
.end method

.method public getCornerRadius()F
    .locals 1

    .prologue
    .line 119
    iget v0, p0, Lcom/dd/processbutton/FlatButton;->cornerRadius:F

    return v0
.end method

.method protected getDimension(I)F
    .locals 1
    .param p1, "id"    # I

    .prologue
    .line 107
    invoke-virtual {p0}, Lcom/dd/processbutton/FlatButton;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v0

    return v0
.end method

.method protected getDrawable(I)Landroid/graphics/drawable/Drawable;
    .locals 1
    .param p1, "id"    # I

    .prologue
    .line 103
    invoke-virtual {p0}, Lcom/dd/processbutton/FlatButton;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0
.end method

.method public getNormalDrawable()Landroid/graphics/drawable/StateListDrawable;
    .locals 1

    .prologue
    .line 123
    iget-object v0, p0, Lcom/dd/processbutton/FlatButton;->mNormalDrawable:Landroid/graphics/drawable/StateListDrawable;

    return-object v0
.end method

.method public getNormalText()Ljava/lang/CharSequence;
    .locals 1

    .prologue
    .line 127
    iget-object v0, p0, Lcom/dd/processbutton/FlatButton;->mNormalText:Ljava/lang/CharSequence;

    return-object v0
.end method

.method protected getTypedArray(Landroid/content/Context;Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attributeSet"    # Landroid/util/AttributeSet;
    .param p3, "attr"    # [I

    .prologue
    const/4 v0, 0x0

    .line 115
    invoke-virtual {p1, p2, p3, v0, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    return-object v0
.end method

.method public setBackgroundCompat(Landroid/graphics/drawable/Drawable;)V
    .locals 6
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .prologue
    .line 142
    invoke-virtual {p0}, Lcom/dd/processbutton/FlatButton;->getPaddingLeft()I

    move-result v1

    .line 143
    .local v1, "pL":I
    invoke-virtual {p0}, Lcom/dd/processbutton/FlatButton;->getPaddingTop()I

    move-result v3

    .line 144
    .local v3, "pT":I
    invoke-virtual {p0}, Lcom/dd/processbutton/FlatButton;->getPaddingRight()I

    move-result v2

    .line 145
    .local v2, "pR":I
    invoke-virtual {p0}, Lcom/dd/processbutton/FlatButton;->getPaddingBottom()I

    move-result v0

    .line 147
    .local v0, "pB":I
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x10

    if-lt v4, v5, :cond_0

    .line 148
    invoke-virtual {p0, p1}, Lcom/dd/processbutton/FlatButton;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 152
    :goto_0
    invoke-virtual {p0, v1, v3, v2, v0}, Lcom/dd/processbutton/FlatButton;->setPadding(IIII)V

    .line 153
    return-void

    .line 150
    :cond_0
    invoke-virtual {p0, p1}, Lcom/dd/processbutton/FlatButton;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0
.end method

.method public setNormalText(Ljava/lang/CharSequence;)V
    .locals 0
    .param p1, "normalText"    # Ljava/lang/CharSequence;

    .prologue
    .line 131
    iput-object p1, p0, Lcom/dd/processbutton/FlatButton;->mNormalText:Ljava/lang/CharSequence;

    .line 132
    return-void
.end method
