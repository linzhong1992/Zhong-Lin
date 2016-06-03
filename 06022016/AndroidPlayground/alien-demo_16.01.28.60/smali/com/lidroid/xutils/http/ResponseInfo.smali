.class public final Lcom/lidroid/xutils/http/ResponseInfo;
.super Ljava/lang/Object;
.source "ResponseInfo.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field public final contentEncoding:Lorg/apache/http/Header;

.field public final contentLength:J

.field public final contentType:Lorg/apache/http/Header;

.field public final locale:Ljava/util/Locale;

.field public final protocolVersion:Lorg/apache/http/ProtocolVersion;

.field public final reasonPhrase:Ljava/lang/String;

.field private final response:Lorg/apache/http/HttpResponse;

.field public result:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field public final resultFormCache:Z

.field public final statusCode:I


# direct methods
.method public constructor <init>(Lorg/apache/http/HttpResponse;Ljava/lang/Object;Z)V
    .locals 8
    .param p1, "response"    # Lorg/apache/http/HttpResponse;
    .param p3, "resultFormCache"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/http/HttpResponse;",
            "TT;Z)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/lidroid/xutils/http/ResponseInfo;, "Lcom/lidroid/xutils/http/ResponseInfo<TT;>;"
    .local p2, "result":Ljava/lang/Object;, "TT;"
    const-wide/16 v6, 0x0

    const/4 v4, 0x0

    const/4 v3, 0x0

    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    iput-object p1, p0, Lcom/lidroid/xutils/http/ResponseInfo;->response:Lorg/apache/http/HttpResponse;

    .line 52
    iput-object p2, p0, Lcom/lidroid/xutils/http/ResponseInfo;->result:Ljava/lang/Object;

    .line 53
    iput-boolean p3, p0, Lcom/lidroid/xutils/http/ResponseInfo;->resultFormCache:Z

    .line 55
    if-eqz p1, :cond_2

    .line 56
    invoke-interface {p1}, Lorg/apache/http/HttpResponse;->getLocale()Ljava/util/Locale;

    move-result-object v2

    iput-object v2, p0, Lcom/lidroid/xutils/http/ResponseInfo;->locale:Ljava/util/Locale;

    .line 59
    invoke-interface {p1}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v1

    .line 60
    .local v1, "statusLine":Lorg/apache/http/StatusLine;
    if-eqz v1, :cond_0

    .line 61
    invoke-interface {v1}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v2

    iput v2, p0, Lcom/lidroid/xutils/http/ResponseInfo;->statusCode:I

    .line 62
    invoke-interface {v1}, Lorg/apache/http/StatusLine;->getProtocolVersion()Lorg/apache/http/ProtocolVersion;

    move-result-object v2

    iput-object v2, p0, Lcom/lidroid/xutils/http/ResponseInfo;->protocolVersion:Lorg/apache/http/ProtocolVersion;

    .line 63
    invoke-interface {v1}, Lorg/apache/http/StatusLine;->getReasonPhrase()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/lidroid/xutils/http/ResponseInfo;->reasonPhrase:Ljava/lang/String;

    .line 71
    :goto_0
    invoke-interface {p1}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v0

    .line 72
    .local v0, "entity":Lorg/apache/http/HttpEntity;
    if-eqz v0, :cond_1

    .line 73
    invoke-interface {v0}, Lorg/apache/http/HttpEntity;->getContentLength()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/lidroid/xutils/http/ResponseInfo;->contentLength:J

    .line 74
    invoke-interface {v0}, Lorg/apache/http/HttpEntity;->getContentType()Lorg/apache/http/Header;

    move-result-object v2

    iput-object v2, p0, Lcom/lidroid/xutils/http/ResponseInfo;->contentType:Lorg/apache/http/Header;

    .line 75
    invoke-interface {v0}, Lorg/apache/http/HttpEntity;->getContentEncoding()Lorg/apache/http/Header;

    move-result-object v2

    iput-object v2, p0, Lcom/lidroid/xutils/http/ResponseInfo;->contentEncoding:Lorg/apache/http/Header;

    .line 94
    .end local v0    # "entity":Lorg/apache/http/HttpEntity;
    .end local v1    # "statusLine":Lorg/apache/http/StatusLine;
    :goto_1
    return-void

    .line 65
    .restart local v1    # "statusLine":Lorg/apache/http/StatusLine;
    :cond_0
    iput v4, p0, Lcom/lidroid/xutils/http/ResponseInfo;->statusCode:I

    .line 66
    iput-object v3, p0, Lcom/lidroid/xutils/http/ResponseInfo;->protocolVersion:Lorg/apache/http/ProtocolVersion;

    .line 67
    iput-object v3, p0, Lcom/lidroid/xutils/http/ResponseInfo;->reasonPhrase:Ljava/lang/String;

    goto :goto_0

    .line 77
    .restart local v0    # "entity":Lorg/apache/http/HttpEntity;
    :cond_1
    iput-wide v6, p0, Lcom/lidroid/xutils/http/ResponseInfo;->contentLength:J

    .line 78
    iput-object v3, p0, Lcom/lidroid/xutils/http/ResponseInfo;->contentType:Lorg/apache/http/Header;

    .line 79
    iput-object v3, p0, Lcom/lidroid/xutils/http/ResponseInfo;->contentEncoding:Lorg/apache/http/Header;

    goto :goto_1

    .line 82
    .end local v0    # "entity":Lorg/apache/http/HttpEntity;
    .end local v1    # "statusLine":Lorg/apache/http/StatusLine;
    :cond_2
    iput-object v3, p0, Lcom/lidroid/xutils/http/ResponseInfo;->locale:Ljava/util/Locale;

    .line 85
    iput v4, p0, Lcom/lidroid/xutils/http/ResponseInfo;->statusCode:I

    .line 86
    iput-object v3, p0, Lcom/lidroid/xutils/http/ResponseInfo;->protocolVersion:Lorg/apache/http/ProtocolVersion;

    .line 87
    iput-object v3, p0, Lcom/lidroid/xutils/http/ResponseInfo;->reasonPhrase:Ljava/lang/String;

    .line 90
    iput-wide v6, p0, Lcom/lidroid/xutils/http/ResponseInfo;->contentLength:J

    .line 91
    iput-object v3, p0, Lcom/lidroid/xutils/http/ResponseInfo;->contentType:Lorg/apache/http/Header;

    .line 92
    iput-object v3, p0, Lcom/lidroid/xutils/http/ResponseInfo;->contentEncoding:Lorg/apache/http/Header;

    goto :goto_1
.end method


# virtual methods
.method public getAllHeaders()[Lorg/apache/http/Header;
    .locals 1

    .prologue
    .line 31
    .local p0, "this":Lcom/lidroid/xutils/http/ResponseInfo;, "Lcom/lidroid/xutils/http/ResponseInfo<TT;>;"
    iget-object v0, p0, Lcom/lidroid/xutils/http/ResponseInfo;->response:Lorg/apache/http/HttpResponse;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    .line 32
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/lidroid/xutils/http/ResponseInfo;->response:Lorg/apache/http/HttpResponse;

    invoke-interface {v0}, Lorg/apache/http/HttpResponse;->getAllHeaders()[Lorg/apache/http/Header;

    move-result-object v0

    goto :goto_0
.end method

.method public getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 41
    .local p0, "this":Lcom/lidroid/xutils/http/ResponseInfo;, "Lcom/lidroid/xutils/http/ResponseInfo<TT;>;"
    iget-object v0, p0, Lcom/lidroid/xutils/http/ResponseInfo;->response:Lorg/apache/http/HttpResponse;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    .line 42
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/lidroid/xutils/http/ResponseInfo;->response:Lorg/apache/http/HttpResponse;

    invoke-interface {v0, p1}, Lorg/apache/http/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v0

    goto :goto_0
.end method

.method public getHeaders(Ljava/lang/String;)[Lorg/apache/http/Header;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 36
    .local p0, "this":Lcom/lidroid/xutils/http/ResponseInfo;, "Lcom/lidroid/xutils/http/ResponseInfo<TT;>;"
    iget-object v0, p0, Lcom/lidroid/xutils/http/ResponseInfo;->response:Lorg/apache/http/HttpResponse;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    .line 37
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/lidroid/xutils/http/ResponseInfo;->response:Lorg/apache/http/HttpResponse;

    invoke-interface {v0, p1}, Lorg/apache/http/HttpResponse;->getHeaders(Ljava/lang/String;)[Lorg/apache/http/Header;

    move-result-object v0

    goto :goto_0
.end method

.method public getLastHeader(Ljava/lang/String;)Lorg/apache/http/Header;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 46
    .local p0, "this":Lcom/lidroid/xutils/http/ResponseInfo;, "Lcom/lidroid/xutils/http/ResponseInfo<TT;>;"
    iget-object v0, p0, Lcom/lidroid/xutils/http/ResponseInfo;->response:Lorg/apache/http/HttpResponse;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    .line 47
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/lidroid/xutils/http/ResponseInfo;->response:Lorg/apache/http/HttpResponse;

    invoke-interface {v0, p1}, Lorg/apache/http/HttpResponse;->getLastHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v0

    goto :goto_0
.end method
