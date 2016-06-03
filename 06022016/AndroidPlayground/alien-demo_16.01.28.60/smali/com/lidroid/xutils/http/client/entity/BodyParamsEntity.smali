.class public Lcom/lidroid/xutils/http/client/entity/BodyParamsEntity;
.super Lorg/apache/http/entity/AbstractHttpEntity;
.source "BodyParamsEntity.java"

# interfaces
.implements Ljava/lang/Cloneable;


# instance fields
.field private charset:Ljava/lang/String;

.field protected content:[B

.field private dirty:Z

.field private params:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/apache/http/NameValuePair;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 45
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/lidroid/xutils/http/client/entity/BodyParamsEntity;-><init>(Ljava/lang/String;)V

    .line 46
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "charset"    # Ljava/lang/String;

    .prologue
    .line 49
    invoke-direct {p0}, Lorg/apache/http/entity/AbstractHttpEntity;-><init>()V

    .line 38
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lidroid/xutils/http/client/entity/BodyParamsEntity;->dirty:Z

    .line 40
    const-string v0, "UTF-8"

    iput-object v0, p0, Lcom/lidroid/xutils/http/client/entity/BodyParamsEntity;->charset:Ljava/lang/String;

    .line 50
    if-eqz p1, :cond_0

    .line 51
    iput-object p1, p0, Lcom/lidroid/xutils/http/client/entity/BodyParamsEntity;->charset:Ljava/lang/String;

    .line 53
    :cond_0
    const-string v0, "application/x-www-form-urlencoded"

    invoke-virtual {p0, v0}, Lcom/lidroid/xutils/http/client/entity/BodyParamsEntity;->setContentType(Ljava/lang/String;)V

    .line 54
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/lidroid/xutils/http/client/entity/BodyParamsEntity;->params:Ljava/util/List;

    .line 55
    return-void
.end method

.method public constructor <init>(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/apache/http/NameValuePair;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 58
    .local p1, "params":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/lidroid/xutils/http/client/entity/BodyParamsEntity;-><init>(Ljava/util/List;Ljava/lang/String;)V

    .line 59
    return-void
.end method

.method public constructor <init>(Ljava/util/List;Ljava/lang/String;)V
    .locals 1
    .param p2, "charset"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/apache/http/NameValuePair;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 62
    .local p1, "params":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    invoke-direct {p0}, Lorg/apache/http/entity/AbstractHttpEntity;-><init>()V

    .line 38
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lidroid/xutils/http/client/entity/BodyParamsEntity;->dirty:Z

    .line 40
    const-string v0, "UTF-8"

    iput-object v0, p0, Lcom/lidroid/xutils/http/client/entity/BodyParamsEntity;->charset:Ljava/lang/String;

    .line 63
    if-eqz p2, :cond_0

    .line 64
    iput-object p2, p0, Lcom/lidroid/xutils/http/client/entity/BodyParamsEntity;->charset:Ljava/lang/String;

    .line 66
    :cond_0
    const-string v0, "application/x-www-form-urlencoded"

    invoke-virtual {p0, v0}, Lcom/lidroid/xutils/http/client/entity/BodyParamsEntity;->setContentType(Ljava/lang/String;)V

    .line 67
    iput-object p1, p0, Lcom/lidroid/xutils/http/client/entity/BodyParamsEntity;->params:Ljava/util/List;

    .line 68
    invoke-direct {p0}, Lcom/lidroid/xutils/http/client/entity/BodyParamsEntity;->refreshContent()V

    .line 69
    return-void
.end method

.method private refreshContent()V
    .locals 3

    .prologue
    .line 84
    iget-boolean v1, p0, Lcom/lidroid/xutils/http/client/entity/BodyParamsEntity;->dirty:Z

    if-eqz v1, :cond_0

    .line 86
    :try_start_0
    iget-object v1, p0, Lcom/lidroid/xutils/http/client/entity/BodyParamsEntity;->params:Ljava/util/List;

    iget-object v2, p0, Lcom/lidroid/xutils/http/client/entity/BodyParamsEntity;->charset:Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/lidroid/xutils/http/client/util/URLEncodedUtils;->format(Ljava/util/List;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/lidroid/xutils/http/client/entity/BodyParamsEntity;->charset:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v1

    iput-object v1, p0, Lcom/lidroid/xutils/http/client/entity/BodyParamsEntity;->content:[B
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 90
    :goto_0
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/lidroid/xutils/http/client/entity/BodyParamsEntity;->dirty:Z

    .line 92
    :cond_0
    return-void

    .line 87
    :catch_0
    move-exception v0

    .line 88
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    invoke-virtual {v0}, Ljava/io/UnsupportedEncodingException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/lidroid/xutils/util/LogUtils;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method


# virtual methods
.method public addParameter(Ljava/lang/String;Ljava/lang/String;)Lcom/lidroid/xutils/http/client/entity/BodyParamsEntity;
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 72
    iget-object v0, p0, Lcom/lidroid/xutils/http/client/entity/BodyParamsEntity;->params:Ljava/util/List;

    new-instance v1, Lorg/apache/http/message/BasicNameValuePair;

    invoke-direct {v1, p1, p2}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 73
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lidroid/xutils/http/client/entity/BodyParamsEntity;->dirty:Z

    .line 74
    return-object p0
.end method

.method public addParams(Ljava/util/List;)Lcom/lidroid/xutils/http/client/entity/BodyParamsEntity;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/apache/http/NameValuePair;",
            ">;)",
            "Lcom/lidroid/xutils/http/client/entity/BodyParamsEntity;"
        }
    .end annotation

    .prologue
    .line 78
    .local p1, "params":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    iget-object v0, p0, Lcom/lidroid/xutils/http/client/entity/BodyParamsEntity;->params:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 79
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lidroid/xutils/http/client/entity/BodyParamsEntity;->dirty:Z

    .line 80
    return-object p0
.end method

.method public clone()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 127
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getContent()Ljava/io/InputStream;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 104
    invoke-direct {p0}, Lcom/lidroid/xutils/http/client/entity/BodyParamsEntity;->refreshContent()V

    .line 105
    new-instance v0, Ljava/io/ByteArrayInputStream;

    iget-object v1, p0, Lcom/lidroid/xutils/http/client/entity/BodyParamsEntity;->content:[B

    invoke-direct {v0, v1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    return-object v0
.end method

.method public getContentLength()J
    .locals 2

    .prologue
    .line 99
    invoke-direct {p0}, Lcom/lidroid/xutils/http/client/entity/BodyParamsEntity;->refreshContent()V

    .line 100
    iget-object v0, p0, Lcom/lidroid/xutils/http/client/entity/BodyParamsEntity;->content:[B

    array-length v0, v0

    int-to-long v0, v0

    return-wide v0
.end method

.method public isRepeatable()Z
    .locals 1

    .prologue
    .line 95
    const/4 v0, 0x1

    return v0
.end method

.method public isStreaming()Z
    .locals 1

    .prologue
    .line 123
    const/4 v0, 0x0

    return v0
.end method

.method public writeTo(Ljava/io/OutputStream;)V
    .locals 2
    .param p1, "outStream"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 109
    if-nez p1, :cond_0

    .line 110
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Output stream may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 112
    :cond_0
    invoke-direct {p0}, Lcom/lidroid/xutils/http/client/entity/BodyParamsEntity;->refreshContent()V

    .line 113
    iget-object v0, p0, Lcom/lidroid/xutils/http/client/entity/BodyParamsEntity;->content:[B

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write([B)V

    .line 114
    invoke-virtual {p1}, Ljava/io/OutputStream;->flush()V

    .line 115
    return-void
.end method
