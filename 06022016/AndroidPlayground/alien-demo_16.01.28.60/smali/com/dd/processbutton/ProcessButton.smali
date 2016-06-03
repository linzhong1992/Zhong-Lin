.class public abstract Lcom/dd/processbutton/ProcessButton;
.super Lcom/dd/processbutton/FlatButton;
.source "ProcessButton.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dd/processbutton/ProcessButton$1;,
        Lcom/dd/processbutton/ProcessButton$SavedState;
    }
.end annotation


# instance fields
.field private mCompleteDrawable:Landroid/graphics/drawable/GradientDrawable;

.field private mCompleteText:Ljava/lang/CharSequence;

.field private mErrorDrawable:Landroid/graphics/drawable/GradientDrawable;

.field private mErrorText:Ljava/lang/CharSequence;

.field private mLoadingText:Ljava/lang/CharSequence;

.field private mMaxProgress:I

.field private mMinProgress:I

.field private mProgress:I

.field private mProgressDrawable:Landroid/graphics/drawable/GradientDrawable;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 36
    invoke-direct {p0, p1}, Lcom/dd/processbutton/FlatButton;-><init>(Landroid/content/Context;)V

    .line 37
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/dd/processbutton/ProcessButton;->init(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 38
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 31
    invoke-direct {p0, p1, p2}, Lcom/dd/processbutton/FlatButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 32
    invoke-direct {p0, p1, p2}, Lcom/dd/processbutton/ProcessButton;->init(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 33
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 26
    invoke-direct {p0, p1, p2, p3}, Lcom/dd/processbutton/FlatButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 27
    invoke-direct {p0, p1, p2}, Lcom/dd/processbutton/ProcessButton;->init(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 28
    return-void
.end method

.method private init(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 41
    const/4 v0, 0x0

    iput v0, p0, Lcom/dd/processbutton/ProcessButton;->mMinProgress:I

    .line 42
    const/16 v0, 0x64

    iput v0, p0, Lcom/dd/processbutton/ProcessButton;->mMaxProgress:I

    .line 44
    sget v0, Lcom/dd/processbutton/R$drawable;->rect_progress:I

    invoke-virtual {p0, v0}, Lcom/dd/processbutton/ProcessButton;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Landroid/graphics/drawable/GradientDrawable;

    iput-object v0, p0, Lcom/dd/processbutton/ProcessButton;->mProgressDrawable:Landroid/graphics/drawable/GradientDrawable;

    .line 45
    iget-object v0, p0, Lcom/dd/processbutton/ProcessButton;->mProgressDrawable:Landroid/graphics/drawable/GradientDrawable;

    invoke-virtual {p0}, Lcom/dd/processbutton/ProcessButton;->getCornerRadius()F

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 47
    sget v0, Lcom/dd/processbutton/R$drawable;->rect_complete:I

    invoke-virtual {p0, v0}, Lcom/dd/processbutton/ProcessButton;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Landroid/graphics/drawable/GradientDrawable;

    iput-object v0, p0, Lcom/dd/processbutton/ProcessButton;->mCompleteDrawable:Landroid/graphics/drawable/GradientDrawable;

    .line 48
    iget-object v0, p0, Lcom/dd/processbutton/ProcessButton;->mCompleteDrawable:Landroid/graphics/drawable/GradientDrawable;

    invoke-virtual {p0}, Lcom/dd/processbutton/ProcessButton;->getCornerRadius()F

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 50
    sget v0, Lcom/dd/processbutton/R$drawable;->rect_error:I

    invoke-virtual {p0, v0}, Lcom/dd/processbutton/ProcessButton;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Landroid/graphics/drawable/GradientDrawable;

    iput-object v0, p0, Lcom/dd/processbutton/ProcessButton;->mErrorDrawable:Landroid/graphics/drawable/GradientDrawable;

    .line 51
    iget-object v0, p0, Lcom/dd/processbutton/ProcessButton;->mErrorDrawable:Landroid/graphics/drawable/GradientDrawable;

    invoke-virtual {p0}, Lcom/dd/processbutton/ProcessButton;->getCornerRadius()F

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 53
    if-eqz p2, :cond_0

    .line 54
    invoke-direct {p0, p1, p2}, Lcom/dd/processbutton/ProcessButton;->initAttributes(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 56
    :cond_0
    return-void
.end method

.method private initAttributes(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attributeSet"    # Landroid/util/AttributeSet;

    .prologue
    .line 59
    sget-object v7, Lcom/dd/processbutton/R$styleable;->ProcessButton:[I

    invoke-virtual {p0, p1, p2, v7}, Lcom/dd/processbutton/ProcessButton;->getTypedArray(Landroid/content/Context;Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 61
    .local v0, "attr":Landroid/content/res/TypedArray;
    if-nez v0, :cond_0

    .line 85
    :goto_0
    return-void

    .line 66
    :cond_0
    :try_start_0
    sget v7, Lcom/dd/processbutton/R$styleable;->ProcessButton_pb_textProgress:I

    invoke-virtual {v0, v7}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/dd/processbutton/ProcessButton;->mLoadingText:Ljava/lang/CharSequence;

    .line 67
    sget v7, Lcom/dd/processbutton/R$styleable;->ProcessButton_pb_textComplete:I

    invoke-virtual {v0, v7}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/dd/processbutton/ProcessButton;->mCompleteText:Ljava/lang/CharSequence;

    .line 68
    sget v7, Lcom/dd/processbutton/R$styleable;->ProcessButton_pb_textError:I

    invoke-virtual {v0, v7}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/dd/processbutton/ProcessButton;->mErrorText:Ljava/lang/CharSequence;

    .line 70
    sget v7, Lcom/dd/processbutton/R$color;->purple_progress:I

    invoke-virtual {p0, v7}, Lcom/dd/processbutton/ProcessButton;->getColor(I)I

    move-result v5

    .line 71
    .local v5, "purple":I
    sget v7, Lcom/dd/processbutton/R$styleable;->ProcessButton_pb_colorProgress:I

    invoke-virtual {v0, v7, v5}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v3

    .line 72
    .local v3, "colorProgress":I
    iget-object v7, p0, Lcom/dd/processbutton/ProcessButton;->mProgressDrawable:Landroid/graphics/drawable/GradientDrawable;

    invoke-virtual {v7, v3}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 74
    sget v7, Lcom/dd/processbutton/R$color;->green_complete:I

    invoke-virtual {p0, v7}, Lcom/dd/processbutton/ProcessButton;->getColor(I)I

    move-result v4

    .line 75
    .local v4, "green":I
    sget v7, Lcom/dd/processbutton/R$styleable;->ProcessButton_pb_colorComplete:I

    invoke-virtual {v0, v7, v4}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v1

    .line 76
    .local v1, "colorComplete":I
    iget-object v7, p0, Lcom/dd/processbutton/ProcessButton;->mCompleteDrawable:Landroid/graphics/drawable/GradientDrawable;

    invoke-virtual {v7, v1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 78
    sget v7, Lcom/dd/processbutton/R$color;->red_error:I

    invoke-virtual {p0, v7}, Lcom/dd/processbutton/ProcessButton;->getColor(I)I

    move-result v6

    .line 79
    .local v6, "red":I
    sget v7, Lcom/dd/processbutton/R$styleable;->ProcessButton_pb_colorError:I

    invoke-virtual {v0, v7, v6}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v2

    .line 80
    .local v2, "colorError":I
    iget-object v7, p0, Lcom/dd/processbutton/ProcessButton;->mErrorDrawable:Landroid/graphics/drawable/GradientDrawable;

    invoke-virtual {v7, v2}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 83
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    goto :goto_0

    .end local v1    # "colorComplete":I
    .end local v2    # "colorError":I
    .end local v3    # "colorProgress":I
    .end local v4    # "green":I
    .end local v5    # "purple":I
    .end local v6    # "red":I
    :catchall_0
    move-exception v7

    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    throw v7
.end method


# virtual methods
.method public abstract drawProgress(Landroid/graphics/Canvas;)V
.end method

.method public getCompleteDrawable()Landroid/graphics/drawable/GradientDrawable;
    .locals 1

    .prologue
    .line 160
    iget-object v0, p0, Lcom/dd/processbutton/ProcessButton;->mCompleteDrawable:Landroid/graphics/drawable/GradientDrawable;

    return-object v0
.end method

.method public getCompleteText()Ljava/lang/CharSequence;
    .locals 1

    .prologue
    .line 168
    iget-object v0, p0, Lcom/dd/processbutton/ProcessButton;->mCompleteText:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public getErrorDrawable()Landroid/graphics/drawable/GradientDrawable;
    .locals 1

    .prologue
    .line 195
    iget-object v0, p0, Lcom/dd/processbutton/ProcessButton;->mErrorDrawable:Landroid/graphics/drawable/GradientDrawable;

    return-object v0
.end method

.method public getErrorText()Ljava/lang/CharSequence;
    .locals 1

    .prologue
    .line 203
    iget-object v0, p0, Lcom/dd/processbutton/ProcessButton;->mErrorText:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public getLoadingText()Ljava/lang/CharSequence;
    .locals 1

    .prologue
    .line 164
    iget-object v0, p0, Lcom/dd/processbutton/ProcessButton;->mLoadingText:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public getMaxProgress()I
    .locals 1

    .prologue
    .line 148
    iget v0, p0, Lcom/dd/processbutton/ProcessButton;->mMaxProgress:I

    return v0
.end method

.method public getMinProgress()I
    .locals 1

    .prologue
    .line 152
    iget v0, p0, Lcom/dd/processbutton/ProcessButton;->mMinProgress:I

    return v0
.end method

.method public getProgress()I
    .locals 1

    .prologue
    .line 144
    iget v0, p0, Lcom/dd/processbutton/ProcessButton;->mProgress:I

    return v0
.end method

.method public getProgressDrawable()Landroid/graphics/drawable/GradientDrawable;
    .locals 1

    .prologue
    .line 156
    iget-object v0, p0, Lcom/dd/processbutton/ProcessButton;->mProgressDrawable:Landroid/graphics/drawable/GradientDrawable;

    return-object v0
.end method

.method protected onCompleteState()V
    .locals 1

    .prologue
    .line 118
    invoke-virtual {p0}, Lcom/dd/processbutton/ProcessButton;->getCompleteText()Ljava/lang/CharSequence;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 119
    invoke-virtual {p0}, Lcom/dd/processbutton/ProcessButton;->getCompleteText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/dd/processbutton/ProcessButton;->setText(Ljava/lang/CharSequence;)V

    .line 121
    :cond_0
    invoke-virtual {p0}, Lcom/dd/processbutton/ProcessButton;->getCompleteDrawable()Landroid/graphics/drawable/GradientDrawable;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/dd/processbutton/ProcessButton;->setBackgroundCompat(Landroid/graphics/drawable/Drawable;)V

    .line 122
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 2
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 134
    iget v0, p0, Lcom/dd/processbutton/ProcessButton;->mProgress:I

    iget v1, p0, Lcom/dd/processbutton/ProcessButton;->mMinProgress:I

    if-le v0, v1, :cond_0

    iget v0, p0, Lcom/dd/processbutton/ProcessButton;->mProgress:I

    iget v1, p0, Lcom/dd/processbutton/ProcessButton;->mMaxProgress:I

    if-ge v0, v1, :cond_0

    .line 135
    invoke-virtual {p0, p1}, Lcom/dd/processbutton/ProcessButton;->drawProgress(Landroid/graphics/Canvas;)V

    .line 138
    :cond_0
    invoke-super {p0, p1}, Lcom/dd/processbutton/FlatButton;->onDraw(Landroid/graphics/Canvas;)V

    .line 139
    return-void
.end method

.method protected onErrorState()V
    .locals 1

    .prologue
    .line 104
    invoke-virtual {p0}, Lcom/dd/processbutton/ProcessButton;->getErrorText()Ljava/lang/CharSequence;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 105
    invoke-virtual {p0}, Lcom/dd/processbutton/ProcessButton;->getErrorText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/dd/processbutton/ProcessButton;->setText(Ljava/lang/CharSequence;)V

    .line 107
    :cond_0
    invoke-virtual {p0}, Lcom/dd/processbutton/ProcessButton;->getErrorDrawable()Landroid/graphics/drawable/GradientDrawable;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/dd/processbutton/ProcessButton;->setBackgroundCompat(Landroid/graphics/drawable/Drawable;)V

    .line 108
    return-void
.end method

.method protected onNormalState()V
    .locals 1

    .prologue
    .line 125
    invoke-virtual {p0}, Lcom/dd/processbutton/ProcessButton;->getNormalText()Ljava/lang/CharSequence;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 126
    invoke-virtual {p0}, Lcom/dd/processbutton/ProcessButton;->getNormalText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/dd/processbutton/ProcessButton;->setText(Ljava/lang/CharSequence;)V

    .line 128
    :cond_0
    invoke-virtual {p0}, Lcom/dd/processbutton/ProcessButton;->getNormalDrawable()Landroid/graphics/drawable/StateListDrawable;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/dd/processbutton/ProcessButton;->setBackgroundCompat(Landroid/graphics/drawable/Drawable;)V

    .line 129
    return-void
.end method

.method protected onProgress()V
    .locals 1

    .prologue
    .line 111
    invoke-virtual {p0}, Lcom/dd/processbutton/ProcessButton;->getLoadingText()Ljava/lang/CharSequence;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 112
    invoke-virtual {p0}, Lcom/dd/processbutton/ProcessButton;->getLoadingText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/dd/processbutton/ProcessButton;->setText(Ljava/lang/CharSequence;)V

    .line 114
    :cond_0
    invoke-virtual {p0}, Lcom/dd/processbutton/ProcessButton;->getProgressDrawable()Landroid/graphics/drawable/GradientDrawable;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/dd/processbutton/ProcessButton;->setBackgroundCompat(Landroid/graphics/drawable/Drawable;)V

    .line 115
    return-void
.end method

.method public onRestoreInstanceState(Landroid/os/Parcelable;)V
    .locals 2
    .param p1, "state"    # Landroid/os/Parcelable;

    .prologue
    .line 221
    instance-of v1, p1, Lcom/dd/processbutton/ProcessButton$SavedState;

    if-eqz v1, :cond_0

    move-object v0, p1

    .line 222
    check-cast v0, Lcom/dd/processbutton/ProcessButton$SavedState;

    .line 223
    .local v0, "savedState":Lcom/dd/processbutton/ProcessButton$SavedState;
    # getter for: Lcom/dd/processbutton/ProcessButton$SavedState;->mProgress:I
    invoke-static {v0}, Lcom/dd/processbutton/ProcessButton$SavedState;->access$000(Lcom/dd/processbutton/ProcessButton$SavedState;)I

    move-result v1

    iput v1, p0, Lcom/dd/processbutton/ProcessButton;->mProgress:I

    .line 224
    invoke-virtual {v0}, Lcom/dd/processbutton/ProcessButton$SavedState;->getSuperState()Landroid/os/Parcelable;

    move-result-object v1

    invoke-super {p0, v1}, Lcom/dd/processbutton/FlatButton;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 225
    iget v1, p0, Lcom/dd/processbutton/ProcessButton;->mProgress:I

    invoke-virtual {p0, v1}, Lcom/dd/processbutton/ProcessButton;->setProgress(I)V

    .line 229
    .end local v0    # "savedState":Lcom/dd/processbutton/ProcessButton$SavedState;
    :goto_0
    return-void

    .line 227
    :cond_0
    invoke-super {p0, p1}, Lcom/dd/processbutton/FlatButton;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    goto :goto_0
.end method

.method public onSaveInstanceState()Landroid/os/Parcelable;
    .locals 3

    .prologue
    .line 212
    invoke-super {p0}, Lcom/dd/processbutton/FlatButton;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v1

    .line 213
    .local v1, "superState":Landroid/os/Parcelable;
    new-instance v0, Lcom/dd/processbutton/ProcessButton$SavedState;

    invoke-direct {v0, v1}, Lcom/dd/processbutton/ProcessButton$SavedState;-><init>(Landroid/os/Parcelable;)V

    .line 214
    .local v0, "savedState":Lcom/dd/processbutton/ProcessButton$SavedState;
    iget v2, p0, Lcom/dd/processbutton/ProcessButton;->mProgress:I

    # setter for: Lcom/dd/processbutton/ProcessButton$SavedState;->mProgress:I
    invoke-static {v0, v2}, Lcom/dd/processbutton/ProcessButton$SavedState;->access$002(Lcom/dd/processbutton/ProcessButton$SavedState;I)I

    .line 216
    return-object v0
.end method

.method public setCompleteDrawable(Landroid/graphics/drawable/GradientDrawable;)V
    .locals 0
    .param p1, "completeDrawable"    # Landroid/graphics/drawable/GradientDrawable;

    .prologue
    .line 176
    iput-object p1, p0, Lcom/dd/processbutton/ProcessButton;->mCompleteDrawable:Landroid/graphics/drawable/GradientDrawable;

    .line 177
    return-void
.end method

.method public setCompleteText(Ljava/lang/CharSequence;)V
    .locals 0
    .param p1, "completeText"    # Ljava/lang/CharSequence;

    .prologue
    .line 191
    iput-object p1, p0, Lcom/dd/processbutton/ProcessButton;->mCompleteText:Ljava/lang/CharSequence;

    .line 192
    return-void
.end method

.method public setErrorDrawable(Landroid/graphics/drawable/GradientDrawable;)V
    .locals 0
    .param p1, "errorDrawable"    # Landroid/graphics/drawable/GradientDrawable;

    .prologue
    .line 199
    iput-object p1, p0, Lcom/dd/processbutton/ProcessButton;->mErrorDrawable:Landroid/graphics/drawable/GradientDrawable;

    .line 200
    return-void
.end method

.method public setErrorText(Ljava/lang/CharSequence;)V
    .locals 0
    .param p1, "errorText"    # Ljava/lang/CharSequence;

    .prologue
    .line 207
    iput-object p1, p0, Lcom/dd/processbutton/ProcessButton;->mErrorText:Ljava/lang/CharSequence;

    .line 208
    return-void
.end method

.method public setLoadingText(Ljava/lang/CharSequence;)V
    .locals 0
    .param p1, "loadingText"    # Ljava/lang/CharSequence;

    .prologue
    .line 187
    iput-object p1, p0, Lcom/dd/processbutton/ProcessButton;->mLoadingText:Ljava/lang/CharSequence;

    .line 188
    return-void
.end method

.method public setNormalText(Ljava/lang/CharSequence;)V
    .locals 2
    .param p1, "normalText"    # Ljava/lang/CharSequence;

    .prologue
    .line 180
    invoke-super {p0, p1}, Lcom/dd/processbutton/FlatButton;->setNormalText(Ljava/lang/CharSequence;)V

    .line 181
    iget v0, p0, Lcom/dd/processbutton/ProcessButton;->mProgress:I

    iget v1, p0, Lcom/dd/processbutton/ProcessButton;->mMinProgress:I

    if-ne v0, v1, :cond_0

    .line 182
    invoke-virtual {p0, p1}, Lcom/dd/processbutton/ProcessButton;->setText(Ljava/lang/CharSequence;)V

    .line 184
    :cond_0
    return-void
.end method

.method public setProgress(I)V
    .locals 2
    .param p1, "progress"    # I

    .prologue
    .line 88
    iput p1, p0, Lcom/dd/processbutton/ProcessButton;->mProgress:I

    .line 90
    iget v0, p0, Lcom/dd/processbutton/ProcessButton;->mProgress:I

    iget v1, p0, Lcom/dd/processbutton/ProcessButton;->mMinProgress:I

    if-ne v0, v1, :cond_0

    .line 91
    invoke-virtual {p0}, Lcom/dd/processbutton/ProcessButton;->onNormalState()V

    .line 100
    :goto_0
    invoke-virtual {p0}, Lcom/dd/processbutton/ProcessButton;->invalidate()V

    .line 101
    return-void

    .line 92
    :cond_0
    iget v0, p0, Lcom/dd/processbutton/ProcessButton;->mProgress:I

    iget v1, p0, Lcom/dd/processbutton/ProcessButton;->mMaxProgress:I

    if-ne v0, v1, :cond_1

    .line 93
    invoke-virtual {p0}, Lcom/dd/processbutton/ProcessButton;->onCompleteState()V

    goto :goto_0

    .line 94
    :cond_1
    iget v0, p0, Lcom/dd/processbutton/ProcessButton;->mProgress:I

    iget v1, p0, Lcom/dd/processbutton/ProcessButton;->mMinProgress:I

    if-ge v0, v1, :cond_2

    .line 95
    invoke-virtual {p0}, Lcom/dd/processbutton/ProcessButton;->onErrorState()V

    goto :goto_0

    .line 97
    :cond_2
    invoke-virtual {p0}, Lcom/dd/processbutton/ProcessButton;->onProgress()V

    goto :goto_0
.end method

.method public setProgressDrawable(Landroid/graphics/drawable/GradientDrawable;)V
    .locals 0
    .param p1, "progressDrawable"    # Landroid/graphics/drawable/GradientDrawable;

    .prologue
    .line 172
    iput-object p1, p0, Lcom/dd/processbutton/ProcessButton;->mProgressDrawable:Landroid/graphics/drawable/GradientDrawable;

    .line 173
    return-void
.end method
