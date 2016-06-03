.class public Lcom/lidroid/xutils/http/client/util/URLEncodedUtils;
.super Ljava/lang/Object;
.source "URLEncodedUtils.java"


# static fields
.field public static final CONTENT_TYPE:Ljava/lang/String; = "application/x-www-form-urlencoded"

.field private static final DELIM:[C

.field private static final FRAGMENT:Ljava/util/BitSet;

.field private static final NAME_VALUE_SEPARATOR:Ljava/lang/String; = "="

.field private static final PARAMETER_SEPARATOR:Ljava/lang/String; = "&"

.field private static final PATHSAFE:Ljava/util/BitSet;

.field private static final PUNCT:Ljava/util/BitSet;

.field private static final RADIX:I = 0x10

.field private static final RESERVED:Ljava/util/BitSet;

.field private static final UNRESERVED:Ljava/util/BitSet;

.field private static final URLENCODER:Ljava/util/BitSet;

.field private static final USERINFO:Ljava/util/BitSet;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/16 v7, 0x2c

    const/16 v6, 0x2b

    const/16 v5, 0x24

    const/16 v4, 0x26

    const/16 v3, 0x100

    .line 115
    const/4 v1, 0x1

    new-array v1, v1, [C

    const/4 v2, 0x0

    aput-char v4, v1, v2

    sput-object v1, Lcom/lidroid/xutils/http/client/util/URLEncodedUtils;->DELIM:[C

    .line 200
    new-instance v1, Ljava/util/BitSet;

    invoke-direct {v1, v3}, Ljava/util/BitSet;-><init>(I)V

    sput-object v1, Lcom/lidroid/xutils/http/client/util/URLEncodedUtils;->UNRESERVED:Ljava/util/BitSet;

    .line 206
    new-instance v1, Ljava/util/BitSet;

    invoke-direct {v1, v3}, Ljava/util/BitSet;-><init>(I)V

    sput-object v1, Lcom/lidroid/xutils/http/client/util/URLEncodedUtils;->PUNCT:Ljava/util/BitSet;

    .line 210
    new-instance v1, Ljava/util/BitSet;

    invoke-direct {v1, v3}, Ljava/util/BitSet;-><init>(I)V

    sput-object v1, Lcom/lidroid/xutils/http/client/util/URLEncodedUtils;->USERINFO:Ljava/util/BitSet;

    .line 214
    new-instance v1, Ljava/util/BitSet;

    invoke-direct {v1, v3}, Ljava/util/BitSet;-><init>(I)V

    sput-object v1, Lcom/lidroid/xutils/http/client/util/URLEncodedUtils;->PATHSAFE:Ljava/util/BitSet;

    .line 218
    new-instance v1, Ljava/util/BitSet;

    invoke-direct {v1, v3}, Ljava/util/BitSet;-><init>(I)V

    sput-object v1, Lcom/lidroid/xutils/http/client/util/URLEncodedUtils;->FRAGMENT:Ljava/util/BitSet;

    .line 228
    new-instance v1, Ljava/util/BitSet;

    invoke-direct {v1, v3}, Ljava/util/BitSet;-><init>(I)V

    sput-object v1, Lcom/lidroid/xutils/http/client/util/URLEncodedUtils;->RESERVED:Ljava/util/BitSet;

    .line 235
    new-instance v1, Ljava/util/BitSet;

    invoke-direct {v1, v3}, Ljava/util/BitSet;-><init>(I)V

    sput-object v1, Lcom/lidroid/xutils/http/client/util/URLEncodedUtils;->URLENCODER:Ljava/util/BitSet;

    .line 240
    const/16 v0, 0x61

    .local v0, "i":I
    :goto_0
    const/16 v1, 0x7a

    if-le v0, v1, :cond_0

    .line 243
    const/16 v0, 0x41

    :goto_1
    const/16 v1, 0x5a

    if-le v0, v1, :cond_1

    .line 247
    const/16 v0, 0x30

    :goto_2
    const/16 v1, 0x39

    if-le v0, v1, :cond_2

    .line 250
    sget-object v1, Lcom/lidroid/xutils/http/client/util/URLEncodedUtils;->UNRESERVED:Ljava/util/BitSet;

    const/16 v2, 0x5f

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 251
    sget-object v1, Lcom/lidroid/xutils/http/client/util/URLEncodedUtils;->UNRESERVED:Ljava/util/BitSet;

    const/16 v2, 0x2d

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 252
    sget-object v1, Lcom/lidroid/xutils/http/client/util/URLEncodedUtils;->UNRESERVED:Ljava/util/BitSet;

    const/16 v2, 0x2e

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 253
    sget-object v1, Lcom/lidroid/xutils/http/client/util/URLEncodedUtils;->UNRESERVED:Ljava/util/BitSet;

    const/16 v2, 0x2a

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 254
    sget-object v1, Lcom/lidroid/xutils/http/client/util/URLEncodedUtils;->URLENCODER:Ljava/util/BitSet;

    sget-object v2, Lcom/lidroid/xutils/http/client/util/URLEncodedUtils;->UNRESERVED:Ljava/util/BitSet;

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->or(Ljava/util/BitSet;)V

    .line 255
    sget-object v1, Lcom/lidroid/xutils/http/client/util/URLEncodedUtils;->UNRESERVED:Ljava/util/BitSet;

    const/16 v2, 0x21

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 256
    sget-object v1, Lcom/lidroid/xutils/http/client/util/URLEncodedUtils;->UNRESERVED:Ljava/util/BitSet;

    const/16 v2, 0x7e

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 257
    sget-object v1, Lcom/lidroid/xutils/http/client/util/URLEncodedUtils;->UNRESERVED:Ljava/util/BitSet;

    const/16 v2, 0x27

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 258
    sget-object v1, Lcom/lidroid/xutils/http/client/util/URLEncodedUtils;->UNRESERVED:Ljava/util/BitSet;

    const/16 v2, 0x28

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 259
    sget-object v1, Lcom/lidroid/xutils/http/client/util/URLEncodedUtils;->UNRESERVED:Ljava/util/BitSet;

    const/16 v2, 0x29

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 261
    sget-object v1, Lcom/lidroid/xutils/http/client/util/URLEncodedUtils;->PUNCT:Ljava/util/BitSet;

    invoke-virtual {v1, v7}, Ljava/util/BitSet;->set(I)V

    .line 262
    sget-object v1, Lcom/lidroid/xutils/http/client/util/URLEncodedUtils;->PUNCT:Ljava/util/BitSet;

    const/16 v2, 0x3b

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 263
    sget-object v1, Lcom/lidroid/xutils/http/client/util/URLEncodedUtils;->PUNCT:Ljava/util/BitSet;

    const/16 v2, 0x3a

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 264
    sget-object v1, Lcom/lidroid/xutils/http/client/util/URLEncodedUtils;->PUNCT:Ljava/util/BitSet;

    invoke-virtual {v1, v5}, Ljava/util/BitSet;->set(I)V

    .line 265
    sget-object v1, Lcom/lidroid/xutils/http/client/util/URLEncodedUtils;->PUNCT:Ljava/util/BitSet;

    invoke-virtual {v1, v4}, Ljava/util/BitSet;->set(I)V

    .line 266
    sget-object v1, Lcom/lidroid/xutils/http/client/util/URLEncodedUtils;->PUNCT:Ljava/util/BitSet;

    invoke-virtual {v1, v6}, Ljava/util/BitSet;->set(I)V

    .line 267
    sget-object v1, Lcom/lidroid/xutils/http/client/util/URLEncodedUtils;->PUNCT:Ljava/util/BitSet;

    const/16 v2, 0x3d

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 269
    sget-object v1, Lcom/lidroid/xutils/http/client/util/URLEncodedUtils;->USERINFO:Ljava/util/BitSet;

    sget-object v2, Lcom/lidroid/xutils/http/client/util/URLEncodedUtils;->UNRESERVED:Ljava/util/BitSet;

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->or(Ljava/util/BitSet;)V

    .line 270
    sget-object v1, Lcom/lidroid/xutils/http/client/util/URLEncodedUtils;->USERINFO:Ljava/util/BitSet;

    sget-object v2, Lcom/lidroid/xutils/http/client/util/URLEncodedUtils;->PUNCT:Ljava/util/BitSet;

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->or(Ljava/util/BitSet;)V

    .line 273
    sget-object v1, Lcom/lidroid/xutils/http/client/util/URLEncodedUtils;->PATHSAFE:Ljava/util/BitSet;

    sget-object v2, Lcom/lidroid/xutils/http/client/util/URLEncodedUtils;->UNRESERVED:Ljava/util/BitSet;

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->or(Ljava/util/BitSet;)V

    .line 274
    sget-object v1, Lcom/lidroid/xutils/http/client/util/URLEncodedUtils;->PATHSAFE:Ljava/util/BitSet;

    const/16 v2, 0x2f

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 275
    sget-object v1, Lcom/lidroid/xutils/http/client/util/URLEncodedUtils;->PATHSAFE:Ljava/util/BitSet;

    const/16 v2, 0x3b

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 276
    sget-object v1, Lcom/lidroid/xutils/http/client/util/URLEncodedUtils;->PATHSAFE:Ljava/util/BitSet;

    const/16 v2, 0x3a

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 277
    sget-object v1, Lcom/lidroid/xutils/http/client/util/URLEncodedUtils;->PATHSAFE:Ljava/util/BitSet;

    const/16 v2, 0x40

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 278
    sget-object v1, Lcom/lidroid/xutils/http/client/util/URLEncodedUtils;->PATHSAFE:Ljava/util/BitSet;

    invoke-virtual {v1, v4}, Ljava/util/BitSet;->set(I)V

    .line 279
    sget-object v1, Lcom/lidroid/xutils/http/client/util/URLEncodedUtils;->PATHSAFE:Ljava/util/BitSet;

    const/16 v2, 0x3d

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 280
    sget-object v1, Lcom/lidroid/xutils/http/client/util/URLEncodedUtils;->PATHSAFE:Ljava/util/BitSet;

    invoke-virtual {v1, v6}, Ljava/util/BitSet;->set(I)V

    .line 281
    sget-object v1, Lcom/lidroid/xutils/http/client/util/URLEncodedUtils;->PATHSAFE:Ljava/util/BitSet;

    invoke-virtual {v1, v5}, Ljava/util/BitSet;->set(I)V

    .line 282
    sget-object v1, Lcom/lidroid/xutils/http/client/util/URLEncodedUtils;->PATHSAFE:Ljava/util/BitSet;

    invoke-virtual {v1, v7}, Ljava/util/BitSet;->set(I)V

    .line 284
    sget-object v1, Lcom/lidroid/xutils/http/client/util/URLEncodedUtils;->RESERVED:Ljava/util/BitSet;

    const/16 v2, 0x3b

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 285
    sget-object v1, Lcom/lidroid/xutils/http/client/util/URLEncodedUtils;->RESERVED:Ljava/util/BitSet;

    const/16 v2, 0x2f

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 286
    sget-object v1, Lcom/lidroid/xutils/http/client/util/URLEncodedUtils;->RESERVED:Ljava/util/BitSet;

    const/16 v2, 0x3f

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 287
    sget-object v1, Lcom/lidroid/xutils/http/client/util/URLEncodedUtils;->RESERVED:Ljava/util/BitSet;

    const/16 v2, 0x3a

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 288
    sget-object v1, Lcom/lidroid/xutils/http/client/util/URLEncodedUtils;->RESERVED:Ljava/util/BitSet;

    const/16 v2, 0x40

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 289
    sget-object v1, Lcom/lidroid/xutils/http/client/util/URLEncodedUtils;->RESERVED:Ljava/util/BitSet;

    invoke-virtual {v1, v4}, Ljava/util/BitSet;->set(I)V

    .line 290
    sget-object v1, Lcom/lidroid/xutils/http/client/util/URLEncodedUtils;->RESERVED:Ljava/util/BitSet;

    const/16 v2, 0x3d

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 291
    sget-object v1, Lcom/lidroid/xutils/http/client/util/URLEncodedUtils;->RESERVED:Ljava/util/BitSet;

    invoke-virtual {v1, v6}, Ljava/util/BitSet;->set(I)V

    .line 292
    sget-object v1, Lcom/lidroid/xutils/http/client/util/URLEncodedUtils;->RESERVED:Ljava/util/BitSet;

    invoke-virtual {v1, v5}, Ljava/util/BitSet;->set(I)V

    .line 293
    sget-object v1, Lcom/lidroid/xutils/http/client/util/URLEncodedUtils;->RESERVED:Ljava/util/BitSet;

    invoke-virtual {v1, v7}, Ljava/util/BitSet;->set(I)V

    .line 294
    sget-object v1, Lcom/lidroid/xutils/http/client/util/URLEncodedUtils;->RESERVED:Ljava/util/BitSet;

    const/16 v2, 0x5b

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 295
    sget-object v1, Lcom/lidroid/xutils/http/client/util/URLEncodedUtils;->RESERVED:Ljava/util/BitSet;

    const/16 v2, 0x5d

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 297
    sget-object v1, Lcom/lidroid/xutils/http/client/util/URLEncodedUtils;->FRAGMENT:Ljava/util/BitSet;

    sget-object v2, Lcom/lidroid/xutils/http/client/util/URLEncodedUtils;->RESERVED:Ljava/util/BitSet;

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->or(Ljava/util/BitSet;)V

    .line 298
    sget-object v1, Lcom/lidroid/xutils/http/client/util/URLEncodedUtils;->FRAGMENT:Ljava/util/BitSet;

    sget-object v2, Lcom/lidroid/xutils/http/client/util/URLEncodedUtils;->UNRESERVED:Ljava/util/BitSet;

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->or(Ljava/util/BitSet;)V

    .line 301
    return-void

    .line 241
    :cond_0
    sget-object v1, Lcom/lidroid/xutils/http/client/util/URLEncodedUtils;->UNRESERVED:Ljava/util/BitSet;

    invoke-virtual {v1, v0}, Ljava/util/BitSet;->set(I)V

    .line 240
    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_0

    .line 244
    :cond_1
    sget-object v1, Lcom/lidroid/xutils/http/client/util/URLEncodedUtils;->UNRESERVED:Ljava/util/BitSet;

    invoke-virtual {v1, v0}, Ljava/util/BitSet;->set(I)V

    .line 243
    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_1

    .line 248
    :cond_2
    sget-object v1, Lcom/lidroid/xutils/http/client/util/URLEncodedUtils;->UNRESERVED:Ljava/util/BitSet;

    invoke-virtual {v1, v0}, Ljava/util/BitSet;->set(I)V

    .line 247
    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_2
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static decodeFormFields(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "content"    # Ljava/lang/String;
    .param p1, "charset"    # Ljava/lang/String;

    .prologue
    .line 379
    if-nez p0, :cond_0

    .line 380
    const/4 v0, 0x0

    .line 382
    :goto_0
    return-object v0

    :cond_0
    if-eqz p1, :cond_1

    invoke-static {p1}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    :goto_1
    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Lcom/lidroid/xutils/http/client/util/URLEncodedUtils;->urldecode(Ljava/lang/String;Ljava/nio/charset/Charset;Z)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_1
    const-string v0, "UTF-8"

    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    goto :goto_1
.end method

.method private static decodeFormFields(Ljava/lang/String;Ljava/nio/charset/Charset;)Ljava/lang/String;
    .locals 1
    .param p0, "content"    # Ljava/lang/String;
    .param p1, "charset"    # Ljava/nio/charset/Charset;

    .prologue
    .line 393
    if-nez p0, :cond_0

    .line 394
    const/4 v0, 0x0

    .line 396
    .end local p1    # "charset":Ljava/nio/charset/Charset;
    :goto_0
    return-object v0

    .restart local p1    # "charset":Ljava/nio/charset/Charset;
    :cond_0
    if-eqz p1, :cond_1

    .end local p1    # "charset":Ljava/nio/charset/Charset;
    :goto_1
    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Lcom/lidroid/xutils/http/client/util/URLEncodedUtils;->urldecode(Ljava/lang/String;Ljava/nio/charset/Charset;Z)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .restart local p1    # "charset":Ljava/nio/charset/Charset;
    :cond_1
    const-string v0, "UTF-8"

    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object p1

    goto :goto_1
.end method

.method static encFragment(Ljava/lang/String;Ljava/nio/charset/Charset;)Ljava/lang/String;
    .locals 2
    .param p0, "content"    # Ljava/lang/String;
    .param p1, "charset"    # Ljava/nio/charset/Charset;

    .prologue
    .line 459
    sget-object v0, Lcom/lidroid/xutils/http/client/util/URLEncodedUtils;->FRAGMENT:Ljava/util/BitSet;

    const/4 v1, 0x0

    invoke-static {p0, p1, v0, v1}, Lcom/lidroid/xutils/http/client/util/URLEncodedUtils;->urlencode(Ljava/lang/String;Ljava/nio/charset/Charset;Ljava/util/BitSet;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static encPath(Ljava/lang/String;Ljava/nio/charset/Charset;)Ljava/lang/String;
    .locals 2
    .param p0, "content"    # Ljava/lang/String;
    .param p1, "charset"    # Ljava/nio/charset/Charset;

    .prologue
    .line 472
    sget-object v0, Lcom/lidroid/xutils/http/client/util/URLEncodedUtils;->PATHSAFE:Ljava/util/BitSet;

    const/4 v1, 0x0

    invoke-static {p0, p1, v0, v1}, Lcom/lidroid/xutils/http/client/util/URLEncodedUtils;->urlencode(Ljava/lang/String;Ljava/nio/charset/Charset;Ljava/util/BitSet;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static encUserInfo(Ljava/lang/String;Ljava/nio/charset/Charset;)Ljava/lang/String;
    .locals 2
    .param p0, "content"    # Ljava/lang/String;
    .param p1, "charset"    # Ljava/nio/charset/Charset;

    .prologue
    .line 446
    sget-object v0, Lcom/lidroid/xutils/http/client/util/URLEncodedUtils;->USERINFO:Ljava/util/BitSet;

    const/4 v1, 0x0

    invoke-static {p0, p1, v0, v1}, Lcom/lidroid/xutils/http/client/util/URLEncodedUtils;->urlencode(Ljava/lang/String;Ljava/nio/charset/Charset;Ljava/util/BitSet;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static encodeFormFields(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "content"    # Ljava/lang/String;
    .param p1, "charset"    # Ljava/lang/String;

    .prologue
    .line 411
    if-nez p0, :cond_0

    .line 412
    const/4 v0, 0x0

    .line 414
    :goto_0
    return-object v0

    :cond_0
    if-eqz p1, :cond_1

    invoke-static {p1}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    .line 415
    :goto_1
    sget-object v1, Lcom/lidroid/xutils/http/client/util/URLEncodedUtils;->URLENCODER:Ljava/util/BitSet;

    const/4 v2, 0x1

    .line 414
    invoke-static {p0, v0, v1, v2}, Lcom/lidroid/xutils/http/client/util/URLEncodedUtils;->urlencode(Ljava/lang/String;Ljava/nio/charset/Charset;Ljava/util/BitSet;Z)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 415
    :cond_1
    const-string v0, "UTF-8"

    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    goto :goto_1
.end method

.method private static encodeFormFields(Ljava/lang/String;Ljava/nio/charset/Charset;)Ljava/lang/String;
    .locals 2
    .param p0, "content"    # Ljava/lang/String;
    .param p1, "charset"    # Ljava/nio/charset/Charset;

    .prologue
    .line 430
    if-nez p0, :cond_0

    .line 431
    const/4 v0, 0x0

    .line 433
    .end local p1    # "charset":Ljava/nio/charset/Charset;
    :goto_0
    return-object v0

    .restart local p1    # "charset":Ljava/nio/charset/Charset;
    :cond_0
    if-eqz p1, :cond_1

    .end local p1    # "charset":Ljava/nio/charset/Charset;
    :goto_1
    sget-object v0, Lcom/lidroid/xutils/http/client/util/URLEncodedUtils;->URLENCODER:Ljava/util/BitSet;

    const/4 v1, 0x1

    invoke-static {p0, p1, v0, v1}, Lcom/lidroid/xutils/http/client/util/URLEncodedUtils;->urlencode(Ljava/lang/String;Ljava/nio/charset/Charset;Ljava/util/BitSet;Z)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .restart local p1    # "charset":Ljava/nio/charset/Charset;
    :cond_1
    const-string v0, "UTF-8"

    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object p1

    goto :goto_1
.end method

.method public static format(Ljava/lang/Iterable;Ljava/nio/charset/Charset;)Ljava/lang/String;
    .locals 6
    .param p1, "charset"    # Ljava/nio/charset/Charset;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable",
            "<+",
            "Lorg/apache/http/NameValuePair;",
            ">;",
            "Ljava/nio/charset/Charset;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 178
    .local p0, "parameters":Ljava/lang/Iterable;, "Ljava/lang/Iterable<+Lorg/apache/http/NameValuePair;>;"
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 179
    .local v3, "result":Ljava/lang/StringBuilder;
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_0
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-nez v5, :cond_1

    .line 191
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4

    .line 179
    :cond_1
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/http/NameValuePair;

    .line 180
    .local v2, "parameter":Lorg/apache/http/NameValuePair;
    invoke-interface {v2}, Lorg/apache/http/NameValuePair;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5, p1}, Lcom/lidroid/xutils/http/client/util/URLEncodedUtils;->encodeFormFields(Ljava/lang/String;Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v0

    .line 181
    .local v0, "encodedName":Ljava/lang/String;
    invoke-interface {v2}, Lorg/apache/http/NameValuePair;->getValue()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5, p1}, Lcom/lidroid/xutils/http/client/util/URLEncodedUtils;->encodeFormFields(Ljava/lang/String;Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v1

    .line 182
    .local v1, "encodedValue":Ljava/lang/String;
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v5

    if-lez v5, :cond_2

    .line 183
    const-string v5, "&"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 185
    :cond_2
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 186
    if-eqz v1, :cond_0

    .line 187
    const-string v5, "="

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 188
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0
.end method

.method public static format(Ljava/util/List;Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .param p1, "charset"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<+",
            "Lorg/apache/http/NameValuePair;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 151
    .local p0, "parameters":Ljava/util/List;, "Ljava/util/List<+Lorg/apache/http/NameValuePair;>;"
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 152
    .local v3, "result":Ljava/lang/StringBuilder;
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_0
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-nez v5, :cond_1

    .line 164
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4

    .line 152
    :cond_1
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/http/NameValuePair;

    .line 153
    .local v2, "parameter":Lorg/apache/http/NameValuePair;
    invoke-interface {v2}, Lorg/apache/http/NameValuePair;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5, p1}, Lcom/lidroid/xutils/http/client/util/URLEncodedUtils;->encodeFormFields(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 154
    .local v0, "encodedName":Ljava/lang/String;
    invoke-interface {v2}, Lorg/apache/http/NameValuePair;->getValue()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5, p1}, Lcom/lidroid/xutils/http/client/util/URLEncodedUtils;->encodeFormFields(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 155
    .local v1, "encodedValue":Ljava/lang/String;
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v5

    if-lez v5, :cond_2

    .line 156
    const-string v5, "&"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 158
    :cond_2
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 159
    if-eqz v1, :cond_0

    .line 160
    const-string v5, "="

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 161
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0
.end method

.method public static isEncoded(Lorg/apache/http/HttpEntity;)Z
    .locals 5
    .param p0, "entity"    # Lorg/apache/http/HttpEntity;

    .prologue
    const/4 v3, 0x0

    .line 51
    invoke-interface {p0}, Lorg/apache/http/HttpEntity;->getContentType()Lorg/apache/http/Header;

    move-result-object v2

    .line 52
    .local v2, "h":Lorg/apache/http/Header;
    if-eqz v2, :cond_0

    .line 53
    invoke-interface {v2}, Lorg/apache/http/Header;->getElements()[Lorg/apache/http/HeaderElement;

    move-result-object v1

    .line 54
    .local v1, "elems":[Lorg/apache/http/HeaderElement;
    array-length v4, v1

    if-lez v4, :cond_0

    .line 55
    aget-object v3, v1, v3

    invoke-interface {v3}, Lorg/apache/http/HeaderElement;->getName()Ljava/lang/String;

    move-result-object v0

    .line 56
    .local v0, "contentType":Ljava/lang/String;
    const-string v3, "application/x-www-form-urlencoded"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    .line 61
    .end local v0    # "contentType":Ljava/lang/String;
    .end local v1    # "elems":[Lorg/apache/http/HeaderElement;
    :cond_0
    return v3
.end method

.method public static parse(Ljava/lang/String;)Ljava/util/List;
    .locals 8
    .param p0, "s"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Lorg/apache/http/NameValuePair;",
            ">;"
        }
    .end annotation

    .prologue
    .line 124
    if-nez p0, :cond_1

    .line 125
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v2

    .line 138
    :cond_0
    return-object v2

    .line 127
    :cond_1
    sget-object v4, Lorg/apache/http/message/BasicHeaderValueParser;->DEFAULT:Lorg/apache/http/message/BasicHeaderValueParser;

    .line 128
    .local v4, "parser":Lorg/apache/http/message/BasicHeaderValueParser;
    new-instance v0, Lorg/apache/http/util/CharArrayBuffer;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    invoke-direct {v0, v5}, Lorg/apache/http/util/CharArrayBuffer;-><init>(I)V

    .line 129
    .local v0, "buffer":Lorg/apache/http/util/CharArrayBuffer;
    invoke-virtual {v0, p0}, Lorg/apache/http/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 130
    new-instance v1, Lorg/apache/http/message/ParserCursor;

    const/4 v5, 0x0

    invoke-virtual {v0}, Lorg/apache/http/util/CharArrayBuffer;->length()I

    move-result v6

    invoke-direct {v1, v5, v6}, Lorg/apache/http/message/ParserCursor;-><init>(II)V

    .line 131
    .local v1, "cursor":Lorg/apache/http/message/ParserCursor;
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 132
    .local v2, "list":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    :cond_2
    :goto_0
    invoke-virtual {v1}, Lorg/apache/http/message/ParserCursor;->atEnd()Z

    move-result v5

    if-nez v5, :cond_0

    .line 133
    sget-object v5, Lcom/lidroid/xutils/http/client/util/URLEncodedUtils;->DELIM:[C

    invoke-virtual {v4, v0, v1, v5}, Lorg/apache/http/message/BasicHeaderValueParser;->parseNameValuePair(Lorg/apache/http/util/CharArrayBuffer;Lorg/apache/http/message/ParserCursor;[C)Lorg/apache/http/NameValuePair;

    move-result-object v3

    .line 134
    .local v3, "nvp":Lorg/apache/http/NameValuePair;
    invoke-interface {v3}, Lorg/apache/http/NameValuePair;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    if-lez v5, :cond_2

    .line 135
    new-instance v5, Lorg/apache/http/message/BasicNameValuePair;

    invoke-interface {v3}, Lorg/apache/http/NameValuePair;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v3}, Lorg/apache/http/NameValuePair;->getValue()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v2, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public static parse(Ljava/net/URI;)Ljava/util/List;
    .locals 4
    .param p0, "uri"    # Ljava/net/URI;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/net/URI;",
            ")",
            "Ljava/util/List",
            "<",
            "Lorg/apache/http/NameValuePair;",
            ">;"
        }
    .end annotation

    .prologue
    .line 76
    invoke-virtual {p0}, Ljava/net/URI;->getRawQuery()Ljava/lang/String;

    move-result-object v0

    .line 77
    .local v0, "query":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 78
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 79
    .local v1, "result":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    new-instance v2, Ljava/util/Scanner;

    invoke-direct {v2, v0}, Ljava/util/Scanner;-><init>(Ljava/lang/String;)V

    .line 80
    .local v2, "scanner":Ljava/util/Scanner;
    invoke-static {v1, v2}, Lcom/lidroid/xutils/http/client/util/URLEncodedUtils;->parse(Ljava/util/List;Ljava/util/Scanner;)V

    .line 83
    .end local v1    # "result":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    .end local v2    # "scanner":Ljava/util/Scanner;
    :goto_0
    return-object v1

    :cond_0
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v1

    goto :goto_0
.end method

.method public static parse(Ljava/util/List;Ljava/util/Scanner;)V
    .locals 5
    .param p1, "scanner"    # Ljava/util/Scanner;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/apache/http/NameValuePair;",
            ">;",
            "Ljava/util/Scanner;",
            ")V"
        }
    .end annotation

    .prologue
    .line 99
    .local p0, "parameters":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    const-string v4, "&"

    invoke-virtual {p1, v4}, Ljava/util/Scanner;->useDelimiter(Ljava/lang/String;)Ljava/util/Scanner;

    .line 100
    :goto_0
    invoke-virtual {p1}, Ljava/util/Scanner;->hasNext()Z

    move-result v4

    if-nez v4, :cond_0

    .line 113
    return-void

    .line 101
    :cond_0
    const/4 v1, 0x0

    .line 102
    .local v1, "name":Ljava/lang/String;
    const/4 v3, 0x0

    .line 103
    .local v3, "value":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/util/Scanner;->next()Ljava/lang/String;

    move-result-object v2

    .line 104
    .local v2, "token":Ljava/lang/String;
    const-string v4, "="

    invoke-virtual {v2, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 105
    .local v0, "i":I
    const/4 v4, -0x1

    if-eq v0, v4, :cond_1

    .line 106
    const/4 v4, 0x0

    invoke-virtual {v2, v4, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 107
    add-int/lit8 v4, v0, 0x1

    invoke-virtual {v2, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    .line 111
    :goto_1
    new-instance v4, Lorg/apache/http/message/BasicNameValuePair;

    invoke-direct {v4, v1, v3}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {p0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 109
    :cond_1
    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    goto :goto_1
.end method

.method private static urldecode(Ljava/lang/String;Ljava/nio/charset/Charset;Z)Ljava/lang/String;
    .locals 12
    .param p0, "content"    # Ljava/lang/String;
    .param p1, "charset"    # Ljava/nio/charset/Charset;
    .param p2, "plusAsBlank"    # Z

    .prologue
    const/16 v11, 0x25

    const/16 v10, 0x10

    const/4 v9, -0x1

    .line 342
    if-nez p0, :cond_0

    .line 343
    const/4 v7, 0x0

    .line 368
    :goto_0
    return-object v7

    .line 345
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v7

    invoke-static {v7}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 346
    .local v0, "bb":Ljava/nio/ByteBuffer;
    invoke-static {p0}, Ljava/nio/CharBuffer;->wrap(Ljava/lang/CharSequence;)Ljava/nio/CharBuffer;

    move-result-object v2

    .line 347
    .local v2, "cb":Ljava/nio/CharBuffer;
    :goto_1
    invoke-virtual {v2}, Ljava/nio/CharBuffer;->hasRemaining()Z

    move-result v7

    if-nez v7, :cond_1

    .line 367
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 368
    invoke-virtual {p1, v0}, Ljava/nio/charset/Charset;->decode(Ljava/nio/ByteBuffer;)Ljava/nio/CharBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/nio/CharBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    goto :goto_0

    .line 348
    :cond_1
    invoke-virtual {v2}, Ljava/nio/CharBuffer;->get()C

    move-result v1

    .line 349
    .local v1, "c":C
    if-ne v1, v11, :cond_3

    invoke-virtual {v2}, Ljava/nio/CharBuffer;->remaining()I

    move-result v7

    const/4 v8, 0x2

    if-lt v7, v8, :cond_3

    .line 350
    invoke-virtual {v2}, Ljava/nio/CharBuffer;->get()C

    move-result v6

    .line 351
    .local v6, "uc":C
    invoke-virtual {v2}, Ljava/nio/CharBuffer;->get()C

    move-result v4

    .line 352
    .local v4, "lc":C
    invoke-static {v6, v10}, Ljava/lang/Character;->digit(CI)I

    move-result v5

    .line 353
    .local v5, "u":I
    invoke-static {v4, v10}, Ljava/lang/Character;->digit(CI)I

    move-result v3

    .line 354
    .local v3, "l":I
    if-eq v5, v9, :cond_2

    if-eq v3, v9, :cond_2

    .line 355
    shl-int/lit8 v7, v5, 0x4

    add-int/2addr v7, v3

    int-to-byte v7, v7

    invoke-virtual {v0, v7}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    goto :goto_1

    .line 357
    :cond_2
    invoke-virtual {v0, v11}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 358
    int-to-byte v7, v6

    invoke-virtual {v0, v7}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 359
    int-to-byte v7, v4

    invoke-virtual {v0, v7}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    goto :goto_1

    .line 361
    .end local v3    # "l":I
    .end local v4    # "lc":C
    .end local v5    # "u":I
    .end local v6    # "uc":C
    :cond_3
    if-eqz p2, :cond_4

    const/16 v7, 0x2b

    if-ne v1, v7, :cond_4

    .line 362
    const/16 v7, 0x20

    invoke-virtual {v0, v7}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    goto :goto_1

    .line 364
    :cond_4
    int-to-byte v7, v1

    invoke-virtual {v0, v7}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    goto :goto_1
.end method

.method private static urlencode(Ljava/lang/String;Ljava/nio/charset/Charset;Ljava/util/BitSet;Z)Ljava/lang/String;
    .locals 7
    .param p0, "content"    # Ljava/lang/String;
    .param p1, "charset"    # Ljava/nio/charset/Charset;
    .param p2, "safechars"    # Ljava/util/BitSet;
    .param p3, "blankAsPlus"    # Z

    .prologue
    const/16 v6, 0x10

    .line 308
    if-nez p0, :cond_0

    .line 309
    const/4 v5, 0x0

    .line 327
    :goto_0
    return-object v5

    .line 311
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 312
    .local v2, "buf":Ljava/lang/StringBuilder;
    invoke-virtual {p1, p0}, Ljava/nio/charset/Charset;->encode(Ljava/lang/String;)Ljava/nio/ByteBuffer;

    move-result-object v1

    .line 313
    .local v1, "bb":Ljava/nio/ByteBuffer;
    :goto_1
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v5

    if-nez v5, :cond_1

    .line 327
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    goto :goto_0

    .line 314
    :cond_1
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->get()B

    move-result v5

    and-int/lit16 v0, v5, 0xff

    .line 315
    .local v0, "b":I
    invoke-virtual {p2, v0}, Ljava/util/BitSet;->get(I)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 316
    int-to-char v5, v0

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 317
    :cond_2
    if-eqz p3, :cond_3

    const/16 v5, 0x20

    if-ne v0, v5, :cond_3

    .line 318
    const/16 v5, 0x2b

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 320
    :cond_3
    const-string v5, "%"

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 321
    shr-int/lit8 v5, v0, 0x4

    and-int/lit8 v5, v5, 0xf

    invoke-static {v5, v6}, Ljava/lang/Character;->forDigit(II)C

    move-result v5

    invoke-static {v5}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v3

    .line 322
    .local v3, "hex1":C
    and-int/lit8 v5, v0, 0xf

    invoke-static {v5, v6}, Ljava/lang/Character;->forDigit(II)C

    move-result v5

    invoke-static {v5}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v4

    .line 323
    .local v4, "hex2":C
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 324
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1
.end method
