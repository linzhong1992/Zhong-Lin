.class public Lcom/lidroid/xutils/view/ResLoader;
.super Ljava/lang/Object;
.source "ResLoader.java"


# static fields
.field private static synthetic $SWITCH_TABLE$com$lidroid$xutils$view$ResType:[I


# direct methods
.method static synthetic $SWITCH_TABLE$com$lidroid$xutils$view$ResType()[I
    .locals 3

    .prologue
    .line 16
    sget-object v0, Lcom/lidroid/xutils/view/ResLoader;->$SWITCH_TABLE$com$lidroid$xutils$view$ResType:[I

    if-eqz v0, :cond_0

    :goto_0
    return-object v0

    :cond_0
    invoke-static {}, Lcom/lidroid/xutils/view/ResType;->values()[Lcom/lidroid/xutils/view/ResType;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_0
    sget-object v1, Lcom/lidroid/xutils/view/ResType;->Animation:Lcom/lidroid/xutils/view/ResType;

    invoke-virtual {v1}, Lcom/lidroid/xutils/view/ResType;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_f

    :goto_1
    :try_start_1
    sget-object v1, Lcom/lidroid/xutils/view/ResType;->Boolean:Lcom/lidroid/xutils/view/ResType;

    invoke-virtual {v1}, Lcom/lidroid/xutils/view/ResType;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_e

    :goto_2
    :try_start_2
    sget-object v1, Lcom/lidroid/xutils/view/ResType;->Color:Lcom/lidroid/xutils/view/ResType;

    invoke-virtual {v1}, Lcom/lidroid/xutils/view/ResType;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_d

    :goto_3
    :try_start_3
    sget-object v1, Lcom/lidroid/xutils/view/ResType;->ColorStateList:Lcom/lidroid/xutils/view/ResType;

    invoke-virtual {v1}, Lcom/lidroid/xutils/view/ResType;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_c

    :goto_4
    :try_start_4
    sget-object v1, Lcom/lidroid/xutils/view/ResType;->Dimension:Lcom/lidroid/xutils/view/ResType;

    invoke-virtual {v1}, Lcom/lidroid/xutils/view/ResType;->ordinal()I

    move-result v1

    const/4 v2, 0x5

    aput v2, v0, v1
    :try_end_4
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4 .. :try_end_4} :catch_b

    :goto_5
    :try_start_5
    sget-object v1, Lcom/lidroid/xutils/view/ResType;->DimensionPixelOffset:Lcom/lidroid/xutils/view/ResType;

    invoke-virtual {v1}, Lcom/lidroid/xutils/view/ResType;->ordinal()I

    move-result v1

    const/4 v2, 0x6

    aput v2, v0, v1
    :try_end_5
    .catch Ljava/lang/NoSuchFieldError; {:try_start_5 .. :try_end_5} :catch_a

    :goto_6
    :try_start_6
    sget-object v1, Lcom/lidroid/xutils/view/ResType;->DimensionPixelSize:Lcom/lidroid/xutils/view/ResType;

    invoke-virtual {v1}, Lcom/lidroid/xutils/view/ResType;->ordinal()I

    move-result v1

    const/4 v2, 0x7

    aput v2, v0, v1
    :try_end_6
    .catch Ljava/lang/NoSuchFieldError; {:try_start_6 .. :try_end_6} :catch_9

    :goto_7
    :try_start_7
    sget-object v1, Lcom/lidroid/xutils/view/ResType;->Drawable:Lcom/lidroid/xutils/view/ResType;

    invoke-virtual {v1}, Lcom/lidroid/xutils/view/ResType;->ordinal()I

    move-result v1

    const/16 v2, 0x8

    aput v2, v0, v1
    :try_end_7
    .catch Ljava/lang/NoSuchFieldError; {:try_start_7 .. :try_end_7} :catch_8

    :goto_8
    :try_start_8
    sget-object v1, Lcom/lidroid/xutils/view/ResType;->IntArray:Lcom/lidroid/xutils/view/ResType;

    invoke-virtual {v1}, Lcom/lidroid/xutils/view/ResType;->ordinal()I

    move-result v1

    const/16 v2, 0xa

    aput v2, v0, v1
    :try_end_8
    .catch Ljava/lang/NoSuchFieldError; {:try_start_8 .. :try_end_8} :catch_7

    :goto_9
    :try_start_9
    sget-object v1, Lcom/lidroid/xutils/view/ResType;->Integer:Lcom/lidroid/xutils/view/ResType;

    invoke-virtual {v1}, Lcom/lidroid/xutils/view/ResType;->ordinal()I

    move-result v1

    const/16 v2, 0x9

    aput v2, v0, v1
    :try_end_9
    .catch Ljava/lang/NoSuchFieldError; {:try_start_9 .. :try_end_9} :catch_6

    :goto_a
    :try_start_a
    sget-object v1, Lcom/lidroid/xutils/view/ResType;->Movie:Lcom/lidroid/xutils/view/ResType;

    invoke-virtual {v1}, Lcom/lidroid/xutils/view/ResType;->ordinal()I

    move-result v1

    const/16 v2, 0xb

    aput v2, v0, v1
    :try_end_a
    .catch Ljava/lang/NoSuchFieldError; {:try_start_a .. :try_end_a} :catch_5

    :goto_b
    :try_start_b
    sget-object v1, Lcom/lidroid/xutils/view/ResType;->String:Lcom/lidroid/xutils/view/ResType;

    invoke-virtual {v1}, Lcom/lidroid/xutils/view/ResType;->ordinal()I

    move-result v1

    const/16 v2, 0xc

    aput v2, v0, v1
    :try_end_b
    .catch Ljava/lang/NoSuchFieldError; {:try_start_b .. :try_end_b} :catch_4

    :goto_c
    :try_start_c
    sget-object v1, Lcom/lidroid/xutils/view/ResType;->StringArray:Lcom/lidroid/xutils/view/ResType;

    invoke-virtual {v1}, Lcom/lidroid/xutils/view/ResType;->ordinal()I

    move-result v1

    const/16 v2, 0xd

    aput v2, v0, v1
    :try_end_c
    .catch Ljava/lang/NoSuchFieldError; {:try_start_c .. :try_end_c} :catch_3

    :goto_d
    :try_start_d
    sget-object v1, Lcom/lidroid/xutils/view/ResType;->Text:Lcom/lidroid/xutils/view/ResType;

    invoke-virtual {v1}, Lcom/lidroid/xutils/view/ResType;->ordinal()I

    move-result v1

    const/16 v2, 0xe

    aput v2, v0, v1
    :try_end_d
    .catch Ljava/lang/NoSuchFieldError; {:try_start_d .. :try_end_d} :catch_2

    :goto_e
    :try_start_e
    sget-object v1, Lcom/lidroid/xutils/view/ResType;->TextArray:Lcom/lidroid/xutils/view/ResType;

    invoke-virtual {v1}, Lcom/lidroid/xutils/view/ResType;->ordinal()I

    move-result v1

    const/16 v2, 0xf

    aput v2, v0, v1
    :try_end_e
    .catch Ljava/lang/NoSuchFieldError; {:try_start_e .. :try_end_e} :catch_1

    :goto_f
    :try_start_f
    sget-object v1, Lcom/lidroid/xutils/view/ResType;->Xml:Lcom/lidroid/xutils/view/ResType;

    invoke-virtual {v1}, Lcom/lidroid/xutils/view/ResType;->ordinal()I

    move-result v1

    const/16 v2, 0x10

    aput v2, v0, v1
    :try_end_f
    .catch Ljava/lang/NoSuchFieldError; {:try_start_f .. :try_end_f} :catch_0

    :goto_10
    sput-object v0, Lcom/lidroid/xutils/view/ResLoader;->$SWITCH_TABLE$com$lidroid$xutils$view$ResType:[I

    goto/16 :goto_0

    :catch_0
    move-exception v1

    goto :goto_10

    :catch_1
    move-exception v1

    goto :goto_f

    :catch_2
    move-exception v1

    goto :goto_e

    :catch_3
    move-exception v1

    goto :goto_d

    :catch_4
    move-exception v1

    goto :goto_c

    :catch_5
    move-exception v1

    goto :goto_b

    :catch_6
    move-exception v1

    goto :goto_a

    :catch_7
    move-exception v1

    goto :goto_9

    :catch_8
    move-exception v1

    goto :goto_8

    :catch_9
    move-exception v1

    goto :goto_7

    :catch_a
    move-exception v1

    goto :goto_6

    :catch_b
    move-exception v1

    goto/16 :goto_5

    :catch_c
    move-exception v1

    goto/16 :goto_4

    :catch_d
    move-exception v1

    goto/16 :goto_3

    :catch_e
    move-exception v1

    goto/16 :goto_2

    :catch_f
    move-exception v1

    goto/16 :goto_1
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "id"    # I

    .prologue
    .line 61
    invoke-static {p0, p1}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v0

    return-object v0
.end method

.method public static getBoolean(Landroid/content/Context;I)Z
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "id"    # I

    .prologue
    .line 65
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v0

    return v0
.end method

.method public static getColor(Landroid/content/Context;I)I
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "id"    # I

    .prologue
    .line 69
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    return v0
.end method

.method public static getColorStateList(Landroid/content/Context;I)Landroid/content/res/ColorStateList;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "id"    # I

    .prologue
    .line 73
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    return-object v0
.end method

.method public static getDimension(Landroid/content/Context;I)F
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "id"    # I

    .prologue
    .line 77
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v0

    return v0
.end method

.method public static getDimensionPixelOffset(Landroid/content/Context;I)I
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "id"    # I

    .prologue
    .line 81
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v0

    return v0
.end method

.method public static getDimensionPixelSize(Landroid/content/Context;I)I
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "id"    # I

    .prologue
    .line 85
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    return v0
.end method

.method public static getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "id"    # I

    .prologue
    .line 89
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0
.end method

.method public static getIntArray(Landroid/content/Context;I)[I
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "id"    # I

    .prologue
    .line 97
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getIntArray(I)[I

    move-result-object v0

    return-object v0
.end method

.method public static getInteger(Landroid/content/Context;I)I
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "id"    # I

    .prologue
    .line 93
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v0

    return v0
.end method

.method public static getMovie(Landroid/content/Context;I)Landroid/graphics/Movie;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "id"    # I

    .prologue
    .line 101
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getMovie(I)Landroid/graphics/Movie;

    move-result-object v0

    return-object v0
.end method

.method public static getString(Landroid/content/Context;I)Ljava/lang/String;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "id"    # I

    .prologue
    .line 105
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getStringArray(Landroid/content/Context;I)[Ljava/lang/String;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "id"    # I

    .prologue
    .line 109
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getText(Landroid/content/Context;I)Ljava/lang/CharSequence;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "id"    # I

    .prologue
    .line 113
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method public static getTextArray(Landroid/content/Context;I)[Ljava/lang/CharSequence;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "id"    # I

    .prologue
    .line 117
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getTextArray(I)[Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method public static getXml(Landroid/content/Context;I)Landroid/content/res/XmlResourceParser;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "id"    # I

    .prologue
    .line 121
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getXml(I)Landroid/content/res/XmlResourceParser;

    move-result-object v0

    return-object v0
.end method

.method public static loadRes(Lcom/lidroid/xutils/view/ResType;Landroid/content/Context;I)Ljava/lang/Object;
    .locals 3
    .param p0, "type"    # Lcom/lidroid/xutils/view/ResType;
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "id"    # I

    .prologue
    const/4 v0, 0x0

    .line 19
    if-eqz p1, :cond_0

    const/4 v1, 0x1

    if-ge p2, v1, :cond_1

    .line 57
    :cond_0
    :goto_0
    return-object v0

    .line 20
    :cond_1
    invoke-static {}, Lcom/lidroid/xutils/view/ResLoader;->$SWITCH_TABLE$com$lidroid$xutils$view$ResType()[I

    move-result-object v1

    invoke-virtual {p0}, Lcom/lidroid/xutils/view/ResType;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    goto :goto_0

    .line 22
    :pswitch_0
    invoke-static {p1, p2}, Lcom/lidroid/xutils/view/ResLoader;->getAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v0

    goto :goto_0

    .line 24
    :pswitch_1
    invoke-static {p1, p2}, Lcom/lidroid/xutils/view/ResLoader;->getBoolean(Landroid/content/Context;I)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_0

    .line 26
    :pswitch_2
    invoke-static {p1, p2}, Lcom/lidroid/xutils/view/ResLoader;->getColor(Landroid/content/Context;I)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_0

    .line 28
    :pswitch_3
    invoke-static {p1, p2}, Lcom/lidroid/xutils/view/ResLoader;->getColorStateList(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object v0

    goto :goto_0

    .line 30
    :pswitch_4
    invoke-static {p1, p2}, Lcom/lidroid/xutils/view/ResLoader;->getDimension(Landroid/content/Context;I)F

    move-result v0

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    goto :goto_0

    .line 32
    :pswitch_5
    invoke-static {p1, p2}, Lcom/lidroid/xutils/view/ResLoader;->getDimensionPixelOffset(Landroid/content/Context;I)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_0

    .line 34
    :pswitch_6
    invoke-static {p1, p2}, Lcom/lidroid/xutils/view/ResLoader;->getDimensionPixelSize(Landroid/content/Context;I)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_0

    .line 36
    :pswitch_7
    invoke-static {p1, p2}, Lcom/lidroid/xutils/view/ResLoader;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    goto :goto_0

    .line 38
    :pswitch_8
    invoke-static {p1, p2}, Lcom/lidroid/xutils/view/ResLoader;->getInteger(Landroid/content/Context;I)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_0

    .line 40
    :pswitch_9
    invoke-static {p1, p2}, Lcom/lidroid/xutils/view/ResLoader;->getIntArray(Landroid/content/Context;I)[I

    move-result-object v0

    goto :goto_0

    .line 42
    :pswitch_a
    invoke-static {p1, p2}, Lcom/lidroid/xutils/view/ResLoader;->getMovie(Landroid/content/Context;I)Landroid/graphics/Movie;

    move-result-object v0

    goto :goto_0

    .line 44
    :pswitch_b
    invoke-static {p1, p2}, Lcom/lidroid/xutils/view/ResLoader;->getString(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 46
    :pswitch_c
    invoke-static {p1, p2}, Lcom/lidroid/xutils/view/ResLoader;->getStringArray(Landroid/content/Context;I)[Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 48
    :pswitch_d
    invoke-static {p1, p2}, Lcom/lidroid/xutils/view/ResLoader;->getText(Landroid/content/Context;I)Ljava/lang/CharSequence;

    move-result-object v0

    goto :goto_0

    .line 50
    :pswitch_e
    invoke-static {p1, p2}, Lcom/lidroid/xutils/view/ResLoader;->getTextArray(Landroid/content/Context;I)[Ljava/lang/CharSequence;

    move-result-object v0

    goto :goto_0

    .line 52
    :pswitch_f
    invoke-static {p1, p2}, Lcom/lidroid/xutils/view/ResLoader;->getXml(Landroid/content/Context;I)Landroid/content/res/XmlResourceParser;

    move-result-object v0

    goto :goto_0

    .line 20
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_9
        :pswitch_a
        :pswitch_b
        :pswitch_c
        :pswitch_d
        :pswitch_e
        :pswitch_f
    .end packed-switch
.end method
