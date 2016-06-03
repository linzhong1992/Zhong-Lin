.class public Lcom/lidroid/xutils/http/callback/DefaultHttpRedirectHandler;
.super Ljava/lang/Object;
.source "DefaultHttpRedirectHandler.java"

# interfaces
.implements Lcom/lidroid/xutils/http/callback/HttpRedirectHandler;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getDirectRequest(Lorg/apache/http/HttpResponse;)Lorg/apache/http/client/methods/HttpRequestBase;
    .locals 4
    .param p1, "response"    # Lorg/apache/http/HttpResponse;

    .prologue
    .line 31
    const-string v3, "Location"

    invoke-interface {p1, v3}, Lorg/apache/http/HttpResponse;->containsHeader(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 32
    const-string v3, "Location"

    invoke-interface {p1, v3}, Lorg/apache/http/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v3

    invoke-interface {v3}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v1

    .line 33
    .local v1, "location":Ljava/lang/String;
    new-instance v2, Lorg/apache/http/client/methods/HttpGet;

    invoke-direct {v2, v1}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    .line 34
    .local v2, "request":Lorg/apache/http/client/methods/HttpGet;
    const-string v3, "Set-Cookie"

    invoke-interface {p1, v3}, Lorg/apache/http/HttpResponse;->containsHeader(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 35
    const-string v3, "Set-Cookie"

    invoke-interface {p1, v3}, Lorg/apache/http/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v3

    invoke-interface {v3}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v0

    .line 36
    .local v0, "cookie":Ljava/lang/String;
    const-string v3, "Cookie"

    invoke-virtual {v2, v3, v0}, Lorg/apache/http/client/methods/HttpGet;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 40
    .end local v0    # "cookie":Ljava/lang/String;
    .end local v1    # "location":Ljava/lang/String;
    .end local v2    # "request":Lorg/apache/http/client/methods/HttpGet;
    :cond_0
    :goto_0
    return-object v2

    :cond_1
    const/4 v2, 0x0

    goto :goto_0
.end method
