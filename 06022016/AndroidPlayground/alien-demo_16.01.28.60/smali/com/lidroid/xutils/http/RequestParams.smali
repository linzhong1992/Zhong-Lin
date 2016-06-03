.class public Lcom/lidroid/xutils/http/RequestParams;
.super Ljava/lang/Object;
.source "RequestParams.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lidroid/xutils/http/RequestParams$HeaderItem;
    }
.end annotation


# instance fields
.field private bodyEntity:Lorg/apache/http/HttpEntity;

.field private bodyParams:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/apache/http/NameValuePair;",
            ">;"
        }
    .end annotation
.end field

.field private charset:Ljava/lang/String;

.field private fileParams:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/lidroid/xutils/http/client/multipart/content/ContentBody;",
            ">;"
        }
    .end annotation
.end field

.field private headers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/lidroid/xutils/http/RequestParams$HeaderItem;",
            ">;"
        }
    .end annotation
.end field

.field private queryStringParams:Ljava/util/List;
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
    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    const-string v0, "UTF-8"

    iput-object v0, p0, Lcom/lidroid/xutils/http/RequestParams;->charset:Ljava/lang/String;

    .line 55
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "charset"    # Ljava/lang/String;

    .prologue
    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    const-string v0, "UTF-8"

    iput-object v0, p0, Lcom/lidroid/xutils/http/RequestParams;->charset:Ljava/lang/String;

    .line 58
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 59
    iput-object p1, p0, Lcom/lidroid/xutils/http/RequestParams;->charset:Ljava/lang/String;

    .line 61
    :cond_0
    return-void
.end method


# virtual methods
.method public addBodyParameter(Ljava/lang/String;Ljava/io/File;)V
    .locals 2
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "file"    # Ljava/io/File;

    .prologue
    .line 202
    iget-object v0, p0, Lcom/lidroid/xutils/http/RequestParams;->fileParams:Ljava/util/HashMap;

    if-nez v0, :cond_0

    .line 203
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/lidroid/xutils/http/RequestParams;->fileParams:Ljava/util/HashMap;

    .line 205
    :cond_0
    iget-object v0, p0, Lcom/lidroid/xutils/http/RequestParams;->fileParams:Ljava/util/HashMap;

    new-instance v1, Lcom/lidroid/xutils/http/client/multipart/content/FileBody;

    invoke-direct {v1, p2}, Lcom/lidroid/xutils/http/client/multipart/content/FileBody;-><init>(Ljava/io/File;)V

    invoke-virtual {v0, p1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 206
    return-void
.end method

.method public addBodyParameter(Ljava/lang/String;Ljava/io/File;Ljava/lang/String;)V
    .locals 2
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "file"    # Ljava/io/File;
    .param p3, "mimeType"    # Ljava/lang/String;

    .prologue
    .line 209
    iget-object v0, p0, Lcom/lidroid/xutils/http/RequestParams;->fileParams:Ljava/util/HashMap;

    if-nez v0, :cond_0

    .line 210
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/lidroid/xutils/http/RequestParams;->fileParams:Ljava/util/HashMap;

    .line 212
    :cond_0
    iget-object v0, p0, Lcom/lidroid/xutils/http/RequestParams;->fileParams:Ljava/util/HashMap;

    new-instance v1, Lcom/lidroid/xutils/http/client/multipart/content/FileBody;

    invoke-direct {v1, p2, p3}, Lcom/lidroid/xutils/http/client/multipart/content/FileBody;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0, p1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 213
    return-void
.end method

.method public addBodyParameter(Ljava/lang/String;Ljava/io/File;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "file"    # Ljava/io/File;
    .param p3, "mimeType"    # Ljava/lang/String;
    .param p4, "charset"    # Ljava/lang/String;

    .prologue
    .line 216
    iget-object v0, p0, Lcom/lidroid/xutils/http/RequestParams;->fileParams:Ljava/util/HashMap;

    if-nez v0, :cond_0

    .line 217
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/lidroid/xutils/http/RequestParams;->fileParams:Ljava/util/HashMap;

    .line 219
    :cond_0
    iget-object v0, p0, Lcom/lidroid/xutils/http/RequestParams;->fileParams:Ljava/util/HashMap;

    new-instance v1, Lcom/lidroid/xutils/http/client/multipart/content/FileBody;

    invoke-direct {v1, p2, p3, p4}, Lcom/lidroid/xutils/http/client/multipart/content/FileBody;-><init>(Ljava/io/File;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, p1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 220
    return-void
.end method

.method public addBodyParameter(Ljava/lang/String;Ljava/io/File;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "file"    # Ljava/io/File;
    .param p3, "fileName"    # Ljava/lang/String;
    .param p4, "mimeType"    # Ljava/lang/String;
    .param p5, "charset"    # Ljava/lang/String;

    .prologue
    .line 223
    iget-object v0, p0, Lcom/lidroid/xutils/http/RequestParams;->fileParams:Ljava/util/HashMap;

    if-nez v0, :cond_0

    .line 224
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/lidroid/xutils/http/RequestParams;->fileParams:Ljava/util/HashMap;

    .line 226
    :cond_0
    iget-object v0, p0, Lcom/lidroid/xutils/http/RequestParams;->fileParams:Ljava/util/HashMap;

    new-instance v1, Lcom/lidroid/xutils/http/client/multipart/content/FileBody;

    invoke-direct {v1, p2, p3, p4, p5}, Lcom/lidroid/xutils/http/client/multipart/content/FileBody;-><init>(Ljava/io/File;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, p1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 227
    return-void
.end method

.method public addBodyParameter(Ljava/lang/String;Ljava/io/InputStream;J)V
    .locals 3
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "stream"    # Ljava/io/InputStream;
    .param p3, "length"    # J

    .prologue
    .line 230
    iget-object v0, p0, Lcom/lidroid/xutils/http/RequestParams;->fileParams:Ljava/util/HashMap;

    if-nez v0, :cond_0

    .line 231
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/lidroid/xutils/http/RequestParams;->fileParams:Ljava/util/HashMap;

    .line 233
    :cond_0
    iget-object v0, p0, Lcom/lidroid/xutils/http/RequestParams;->fileParams:Ljava/util/HashMap;

    new-instance v1, Lcom/lidroid/xutils/http/client/multipart/content/InputStreamBody;

    invoke-direct {v1, p2, p3, p4}, Lcom/lidroid/xutils/http/client/multipart/content/InputStreamBody;-><init>(Ljava/io/InputStream;J)V

    invoke-virtual {v0, p1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 234
    return-void
.end method

.method public addBodyParameter(Ljava/lang/String;Ljava/io/InputStream;JLjava/lang/String;)V
    .locals 3
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "stream"    # Ljava/io/InputStream;
    .param p3, "length"    # J
    .param p5, "fileName"    # Ljava/lang/String;

    .prologue
    .line 237
    iget-object v0, p0, Lcom/lidroid/xutils/http/RequestParams;->fileParams:Ljava/util/HashMap;

    if-nez v0, :cond_0

    .line 238
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/lidroid/xutils/http/RequestParams;->fileParams:Ljava/util/HashMap;

    .line 240
    :cond_0
    iget-object v0, p0, Lcom/lidroid/xutils/http/RequestParams;->fileParams:Ljava/util/HashMap;

    new-instance v1, Lcom/lidroid/xutils/http/client/multipart/content/InputStreamBody;

    invoke-direct {v1, p2, p3, p4, p5}, Lcom/lidroid/xutils/http/client/multipart/content/InputStreamBody;-><init>(Ljava/io/InputStream;JLjava/lang/String;)V

    invoke-virtual {v0, p1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 241
    return-void
.end method

.method public addBodyParameter(Ljava/lang/String;Ljava/io/InputStream;JLjava/lang/String;Ljava/lang/String;)V
    .locals 7
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "stream"    # Ljava/io/InputStream;
    .param p3, "length"    # J
    .param p5, "fileName"    # Ljava/lang/String;
    .param p6, "mimeType"    # Ljava/lang/String;

    .prologue
    .line 244
    iget-object v0, p0, Lcom/lidroid/xutils/http/RequestParams;->fileParams:Ljava/util/HashMap;

    if-nez v0, :cond_0

    .line 245
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/lidroid/xutils/http/RequestParams;->fileParams:Ljava/util/HashMap;

    .line 247
    :cond_0
    iget-object v6, p0, Lcom/lidroid/xutils/http/RequestParams;->fileParams:Ljava/util/HashMap;

    new-instance v0, Lcom/lidroid/xutils/http/client/multipart/content/InputStreamBody;

    move-object v1, p2

    move-wide v2, p3

    move-object v4, p5

    move-object v5, p6

    invoke-direct/range {v0 .. v5}, Lcom/lidroid/xutils/http/client/multipart/content/InputStreamBody;-><init>(Ljava/io/InputStream;JLjava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v6, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 248
    return-void
.end method

.method public addBodyParameter(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 177
    iget-object v0, p0, Lcom/lidroid/xutils/http/RequestParams;->bodyParams:Ljava/util/List;

    if-nez v0, :cond_0

    .line 178
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/lidroid/xutils/http/RequestParams;->bodyParams:Ljava/util/List;

    .line 180
    :cond_0
    iget-object v0, p0, Lcom/lidroid/xutils/http/RequestParams;->bodyParams:Ljava/util/List;

    new-instance v1, Lorg/apache/http/message/BasicNameValuePair;

    invoke-direct {v1, p1, p2}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 181
    return-void
.end method

.method public addBodyParameter(Ljava/util/List;)V
    .locals 3
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
    .line 191
    .local p1, "nameValuePairs":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    iget-object v1, p0, Lcom/lidroid/xutils/http/RequestParams;->bodyParams:Ljava/util/List;

    if-nez v1, :cond_0

    .line 192
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/lidroid/xutils/http/RequestParams;->bodyParams:Ljava/util/List;

    .line 194
    :cond_0
    if-eqz p1, :cond_1

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_1

    .line 195
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_2

    .line 199
    :cond_1
    return-void

    .line 195
    :cond_2
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/NameValuePair;

    .line 196
    .local v0, "pair":Lorg/apache/http/NameValuePair;
    iget-object v2, p0, Lcom/lidroid/xutils/http/RequestParams;->bodyParams:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public addBodyParameter(Lorg/apache/http/NameValuePair;)V
    .locals 1
    .param p1, "nameValuePair"    # Lorg/apache/http/NameValuePair;

    .prologue
    .line 184
    iget-object v0, p0, Lcom/lidroid/xutils/http/RequestParams;->bodyParams:Ljava/util/List;

    if-nez v0, :cond_0

    .line 185
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/lidroid/xutils/http/RequestParams;->bodyParams:Ljava/util/List;

    .line 187
    :cond_0
    iget-object v0, p0, Lcom/lidroid/xutils/http/RequestParams;->bodyParams:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 188
    return-void
.end method

.method public addHeader(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 90
    iget-object v0, p0, Lcom/lidroid/xutils/http/RequestParams;->headers:Ljava/util/List;

    if-nez v0, :cond_0

    .line 91
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/lidroid/xutils/http/RequestParams;->headers:Ljava/util/List;

    .line 93
    :cond_0
    iget-object v0, p0, Lcom/lidroid/xutils/http/RequestParams;->headers:Ljava/util/List;

    new-instance v1, Lcom/lidroid/xutils/http/RequestParams$HeaderItem;

    invoke-direct {v1, p0, p1, p2}, Lcom/lidroid/xutils/http/RequestParams$HeaderItem;-><init>(Lcom/lidroid/xutils/http/RequestParams;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 94
    return-void
.end method

.method public addHeader(Lorg/apache/http/Header;)V
    .locals 2
    .param p1, "header"    # Lorg/apache/http/Header;

    .prologue
    .line 77
    iget-object v0, p0, Lcom/lidroid/xutils/http/RequestParams;->headers:Ljava/util/List;

    if-nez v0, :cond_0

    .line 78
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/lidroid/xutils/http/RequestParams;->headers:Ljava/util/List;

    .line 80
    :cond_0
    iget-object v0, p0, Lcom/lidroid/xutils/http/RequestParams;->headers:Ljava/util/List;

    new-instance v1, Lcom/lidroid/xutils/http/RequestParams$HeaderItem;

    invoke-direct {v1, p0, p1}, Lcom/lidroid/xutils/http/RequestParams$HeaderItem;-><init>(Lcom/lidroid/xutils/http/RequestParams;Lorg/apache/http/Header;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 81
    return-void
.end method

.method public addHeaders(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/apache/http/Header;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 102
    .local p1, "headers":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/Header;>;"
    iget-object v1, p0, Lcom/lidroid/xutils/http/RequestParams;->headers:Ljava/util/List;

    if-nez v1, :cond_0

    .line 103
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/lidroid/xutils/http/RequestParams;->headers:Ljava/util/List;

    .line 105
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_1

    .line 108
    return-void

    .line 105
    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/Header;

    .line 106
    .local v0, "header":Lorg/apache/http/Header;
    iget-object v2, p0, Lcom/lidroid/xutils/http/RequestParams;->headers:Ljava/util/List;

    new-instance v3, Lcom/lidroid/xutils/http/RequestParams$HeaderItem;

    invoke-direct {v3, p0, v0}, Lcom/lidroid/xutils/http/RequestParams$HeaderItem;-><init>(Lcom/lidroid/xutils/http/RequestParams;Lorg/apache/http/Header;)V

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public addQueryStringParameter(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 152
    iget-object v0, p0, Lcom/lidroid/xutils/http/RequestParams;->queryStringParams:Ljava/util/List;

    if-nez v0, :cond_0

    .line 153
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/lidroid/xutils/http/RequestParams;->queryStringParams:Ljava/util/List;

    .line 155
    :cond_0
    iget-object v0, p0, Lcom/lidroid/xutils/http/RequestParams;->queryStringParams:Ljava/util/List;

    new-instance v1, Lorg/apache/http/message/BasicNameValuePair;

    invoke-direct {v1, p1, p2}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 156
    return-void
.end method

.method public addQueryStringParameter(Ljava/util/List;)V
    .locals 3
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
    .line 166
    .local p1, "nameValuePairs":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    iget-object v1, p0, Lcom/lidroid/xutils/http/RequestParams;->queryStringParams:Ljava/util/List;

    if-nez v1, :cond_0

    .line 167
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/lidroid/xutils/http/RequestParams;->queryStringParams:Ljava/util/List;

    .line 169
    :cond_0
    if-eqz p1, :cond_1

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_1

    .line 170
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_2

    .line 174
    :cond_1
    return-void

    .line 170
    :cond_2
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/NameValuePair;

    .line 171
    .local v0, "pair":Lorg/apache/http/NameValuePair;
    iget-object v2, p0, Lcom/lidroid/xutils/http/RequestParams;->queryStringParams:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public addQueryStringParameter(Lorg/apache/http/NameValuePair;)V
    .locals 1
    .param p1, "nameValuePair"    # Lorg/apache/http/NameValuePair;

    .prologue
    .line 159
    iget-object v0, p0, Lcom/lidroid/xutils/http/RequestParams;->queryStringParams:Ljava/util/List;

    if-nez v0, :cond_0

    .line 160
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/lidroid/xutils/http/RequestParams;->queryStringParams:Ljava/util/List;

    .line 162
    :cond_0
    iget-object v0, p0, Lcom/lidroid/xutils/http/RequestParams;->queryStringParams:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 163
    return-void
.end method

.method public getCharset()Ljava/lang/String;
    .locals 1

    .prologue
    .line 64
    iget-object v0, p0, Lcom/lidroid/xutils/http/RequestParams;->charset:Ljava/lang/String;

    return-object v0
.end method

.method public getEntity()Lorg/apache/http/HttpEntity;
    .locals 9

    .prologue
    .line 267
    iget-object v5, p0, Lcom/lidroid/xutils/http/RequestParams;->bodyEntity:Lorg/apache/http/HttpEntity;

    if-eqz v5, :cond_1

    .line 268
    iget-object v4, p0, Lcom/lidroid/xutils/http/RequestParams;->bodyEntity:Lorg/apache/http/HttpEntity;

    .line 296
    :cond_0
    :goto_0
    return-object v4

    .line 271
    :cond_1
    const/4 v4, 0x0

    .line 273
    .local v4, "result":Lorg/apache/http/HttpEntity;
    iget-object v5, p0, Lcom/lidroid/xutils/http/RequestParams;->fileParams:Ljava/util/HashMap;

    if-eqz v5, :cond_5

    iget-object v5, p0, Lcom/lidroid/xutils/http/RequestParams;->fileParams:Ljava/util/HashMap;

    invoke-virtual {v5}, Ljava/util/HashMap;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_5

    .line 275
    new-instance v2, Lcom/lidroid/xutils/http/client/multipart/MultipartEntity;

    sget-object v5, Lcom/lidroid/xutils/http/client/multipart/HttpMultipartMode;->STRICT:Lcom/lidroid/xutils/http/client/multipart/HttpMultipartMode;

    const/4 v6, 0x0

    iget-object v7, p0, Lcom/lidroid/xutils/http/RequestParams;->charset:Ljava/lang/String;

    invoke-static {v7}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v7

    invoke-direct {v2, v5, v6, v7}, Lcom/lidroid/xutils/http/client/multipart/MultipartEntity;-><init>(Lcom/lidroid/xutils/http/client/multipart/HttpMultipartMode;Ljava/lang/String;Ljava/nio/charset/Charset;)V

    .line 277
    .local v2, "multipartEntity":Lcom/lidroid/xutils/http/client/multipart/MultipartEntity;
    iget-object v5, p0, Lcom/lidroid/xutils/http/RequestParams;->bodyParams:Ljava/util/List;

    if-eqz v5, :cond_2

    iget-object v5, p0, Lcom/lidroid/xutils/http/RequestParams;->bodyParams:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_2

    .line 278
    iget-object v5, p0, Lcom/lidroid/xutils/http/RequestParams;->bodyParams:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-nez v6, :cond_3

    .line 287
    :cond_2
    iget-object v5, p0, Lcom/lidroid/xutils/http/RequestParams;->fileParams:Ljava/util/HashMap;

    invoke-virtual {v5}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_2
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-nez v5, :cond_4

    .line 291
    move-object v4, v2

    .line 292
    goto :goto_0

    .line 278
    :cond_3
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/http/NameValuePair;

    .line 280
    .local v3, "param":Lorg/apache/http/NameValuePair;
    :try_start_0
    invoke-interface {v3}, Lorg/apache/http/NameValuePair;->getName()Ljava/lang/String;

    move-result-object v6

    new-instance v7, Lcom/lidroid/xutils/http/client/multipart/content/StringBody;

    invoke-interface {v3}, Lorg/apache/http/NameValuePair;->getValue()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Lcom/lidroid/xutils/http/client/multipart/content/StringBody;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v6, v7}, Lcom/lidroid/xutils/http/client/multipart/MultipartEntity;->addPart(Ljava/lang/String;Lcom/lidroid/xutils/http/client/multipart/content/ContentBody;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 281
    :catch_0
    move-exception v0

    .line 282
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    invoke-virtual {v0}, Ljava/io/UnsupportedEncodingException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6, v0}, Lcom/lidroid/xutils/util/LogUtils;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1

    .line 287
    .end local v0    # "e":Ljava/io/UnsupportedEncodingException;
    .end local v3    # "param":Lorg/apache/http/NameValuePair;
    :cond_4
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 288
    .local v1, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/lidroid/xutils/http/client/multipart/content/ContentBody;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/lidroid/xutils/http/client/multipart/content/ContentBody;

    invoke-virtual {v2, v5, v6}, Lcom/lidroid/xutils/http/client/multipart/MultipartEntity;->addPart(Ljava/lang/String;Lcom/lidroid/xutils/http/client/multipart/content/ContentBody;)V

    goto :goto_2

    .line 292
    .end local v1    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/lidroid/xutils/http/client/multipart/content/ContentBody;>;"
    .end local v2    # "multipartEntity":Lcom/lidroid/xutils/http/client/multipart/MultipartEntity;
    :cond_5
    iget-object v5, p0, Lcom/lidroid/xutils/http/RequestParams;->bodyParams:Ljava/util/List;

    if-eqz v5, :cond_0

    iget-object v5, p0, Lcom/lidroid/xutils/http/RequestParams;->bodyParams:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_0

    .line 293
    new-instance v4, Lcom/lidroid/xutils/http/client/entity/BodyParamsEntity;

    .end local v4    # "result":Lorg/apache/http/HttpEntity;
    iget-object v5, p0, Lcom/lidroid/xutils/http/RequestParams;->bodyParams:Ljava/util/List;

    iget-object v6, p0, Lcom/lidroid/xutils/http/RequestParams;->charset:Ljava/lang/String;

    invoke-direct {v4, v5, v6}, Lcom/lidroid/xutils/http/client/entity/BodyParamsEntity;-><init>(Ljava/util/List;Ljava/lang/String;)V

    .restart local v4    # "result":Lorg/apache/http/HttpEntity;
    goto/16 :goto_0
.end method

.method public getHeaders()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/lidroid/xutils/http/RequestParams$HeaderItem;",
            ">;"
        }
    .end annotation

    .prologue
    .line 304
    iget-object v0, p0, Lcom/lidroid/xutils/http/RequestParams;->headers:Ljava/util/List;

    return-object v0
.end method

.method public getQueryStringParams()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/apache/http/NameValuePair;",
            ">;"
        }
    .end annotation

    .prologue
    .line 300
    iget-object v0, p0, Lcom/lidroid/xutils/http/RequestParams;->queryStringParams:Ljava/util/List;

    return-object v0
.end method

.method public setBodyEntity(Lorg/apache/http/HttpEntity;)V
    .locals 2
    .param p1, "bodyEntity"    # Lorg/apache/http/HttpEntity;

    .prologue
    const/4 v1, 0x0

    .line 251
    iput-object p1, p0, Lcom/lidroid/xutils/http/RequestParams;->bodyEntity:Lorg/apache/http/HttpEntity;

    .line 252
    iget-object v0, p0, Lcom/lidroid/xutils/http/RequestParams;->bodyParams:Ljava/util/List;

    if-eqz v0, :cond_0

    .line 253
    iget-object v0, p0, Lcom/lidroid/xutils/http/RequestParams;->bodyParams:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 254
    iput-object v1, p0, Lcom/lidroid/xutils/http/RequestParams;->bodyParams:Ljava/util/List;

    .line 256
    :cond_0
    iget-object v0, p0, Lcom/lidroid/xutils/http/RequestParams;->fileParams:Ljava/util/HashMap;

    if-eqz v0, :cond_1

    .line 257
    iget-object v0, p0, Lcom/lidroid/xutils/http/RequestParams;->fileParams:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 258
    iput-object v1, p0, Lcom/lidroid/xutils/http/RequestParams;->fileParams:Ljava/util/HashMap;

    .line 260
    :cond_1
    return-void
.end method

.method public setContentType(Ljava/lang/String;)V
    .locals 1
    .param p1, "contentType"    # Ljava/lang/String;

    .prologue
    .line 68
    const-string v0, "Content-Type"

    invoke-virtual {p0, v0, p1}, Lcom/lidroid/xutils/http/RequestParams;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 69
    return-void
.end method

.method public setHeader(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 131
    iget-object v0, p0, Lcom/lidroid/xutils/http/RequestParams;->headers:Ljava/util/List;

    if-nez v0, :cond_0

    .line 132
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/lidroid/xutils/http/RequestParams;->headers:Ljava/util/List;

    .line 134
    :cond_0
    iget-object v0, p0, Lcom/lidroid/xutils/http/RequestParams;->headers:Ljava/util/List;

    new-instance v1, Lcom/lidroid/xutils/http/RequestParams$HeaderItem;

    const/4 v2, 0x1

    invoke-direct {v1, p0, p1, p2, v2}, Lcom/lidroid/xutils/http/RequestParams$HeaderItem;-><init>(Lcom/lidroid/xutils/http/RequestParams;Ljava/lang/String;Ljava/lang/String;Z)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 135
    return-void
.end method

.method public setHeader(Lorg/apache/http/Header;)V
    .locals 3
    .param p1, "header"    # Lorg/apache/http/Header;

    .prologue
    .line 117
    iget-object v0, p0, Lcom/lidroid/xutils/http/RequestParams;->headers:Ljava/util/List;

    if-nez v0, :cond_0

    .line 118
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/lidroid/xutils/http/RequestParams;->headers:Ljava/util/List;

    .line 120
    :cond_0
    iget-object v0, p0, Lcom/lidroid/xutils/http/RequestParams;->headers:Ljava/util/List;

    new-instance v1, Lcom/lidroid/xutils/http/RequestParams$HeaderItem;

    const/4 v2, 0x1

    invoke-direct {v1, p0, p1, v2}, Lcom/lidroid/xutils/http/RequestParams$HeaderItem;-><init>(Lcom/lidroid/xutils/http/RequestParams;Lorg/apache/http/Header;Z)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 121
    return-void
.end method

.method public setHeaders(Ljava/util/List;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/apache/http/Header;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 143
    .local p1, "headers":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/Header;>;"
    iget-object v1, p0, Lcom/lidroid/xutils/http/RequestParams;->headers:Ljava/util/List;

    if-nez v1, :cond_0

    .line 144
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/lidroid/xutils/http/RequestParams;->headers:Ljava/util/List;

    .line 146
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_1

    .line 149
    return-void

    .line 146
    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/Header;

    .line 147
    .local v0, "header":Lorg/apache/http/Header;
    iget-object v2, p0, Lcom/lidroid/xutils/http/RequestParams;->headers:Ljava/util/List;

    new-instance v3, Lcom/lidroid/xutils/http/RequestParams$HeaderItem;

    const/4 v4, 0x1

    invoke-direct {v3, p0, v0, v4}, Lcom/lidroid/xutils/http/RequestParams$HeaderItem;-><init>(Lcom/lidroid/xutils/http/RequestParams;Lorg/apache/http/Header;Z)V

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method
