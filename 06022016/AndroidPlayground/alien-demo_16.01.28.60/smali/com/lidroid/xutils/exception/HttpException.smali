.class public Lcom/lidroid/xutils/exception/HttpException;
.super Lcom/lidroid/xutils/exception/BaseException;
.source "HttpException.java"


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private exceptionCode:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 23
    invoke-direct {p0}, Lcom/lidroid/xutils/exception/BaseException;-><init>()V

    .line 24
    return-void
.end method

.method public constructor <init>(I)V
    .locals 0
    .param p1, "exceptionCode"    # I

    .prologue
    .line 41
    invoke-direct {p0}, Lcom/lidroid/xutils/exception/BaseException;-><init>()V

    .line 42
    iput p1, p0, Lcom/lidroid/xutils/exception/HttpException;->exceptionCode:I

    .line 43
    return-void
.end method

.method public constructor <init>(ILjava/lang/String;)V
    .locals 0
    .param p1, "exceptionCode"    # I
    .param p2, "detailMessage"    # Ljava/lang/String;

    .prologue
    .line 50
    invoke-direct {p0, p2}, Lcom/lidroid/xutils/exception/BaseException;-><init>(Ljava/lang/String;)V

    .line 51
    iput p1, p0, Lcom/lidroid/xutils/exception/HttpException;->exceptionCode:I

    .line 52
    return-void
.end method

.method public constructor <init>(ILjava/lang/String;Ljava/lang/Throwable;)V
    .locals 0
    .param p1, "exceptionCode"    # I
    .param p2, "detailMessage"    # Ljava/lang/String;
    .param p3, "throwable"    # Ljava/lang/Throwable;

    .prologue
    .line 60
    invoke-direct {p0, p2, p3}, Lcom/lidroid/xutils/exception/BaseException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 61
    iput p1, p0, Lcom/lidroid/xutils/exception/HttpException;->exceptionCode:I

    .line 62
    return-void
.end method

.method public constructor <init>(ILjava/lang/Throwable;)V
    .locals 0
    .param p1, "exceptionCode"    # I
    .param p2, "throwable"    # Ljava/lang/Throwable;

    .prologue
    .line 69
    invoke-direct {p0, p2}, Lcom/lidroid/xutils/exception/BaseException;-><init>(Ljava/lang/Throwable;)V

    .line 70
    iput p1, p0, Lcom/lidroid/xutils/exception/HttpException;->exceptionCode:I

    .line 71
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "detailMessage"    # Ljava/lang/String;

    .prologue
    .line 27
    invoke-direct {p0, p1}, Lcom/lidroid/xutils/exception/BaseException;-><init>(Ljava/lang/String;)V

    .line 28
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0
    .param p1, "detailMessage"    # Ljava/lang/String;
    .param p2, "throwable"    # Ljava/lang/Throwable;

    .prologue
    .line 31
    invoke-direct {p0, p1, p2}, Lcom/lidroid/xutils/exception/BaseException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 32
    return-void
.end method

.method public constructor <init>(Ljava/lang/Throwable;)V
    .locals 0
    .param p1, "throwable"    # Ljava/lang/Throwable;

    .prologue
    .line 35
    invoke-direct {p0, p1}, Lcom/lidroid/xutils/exception/BaseException;-><init>(Ljava/lang/Throwable;)V

    .line 36
    return-void
.end method


# virtual methods
.method public getExceptionCode()I
    .locals 1

    .prologue
    .line 77
    iget v0, p0, Lcom/lidroid/xutils/exception/HttpException;->exceptionCode:I

    return v0
.end method
