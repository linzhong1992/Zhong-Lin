.class public Lcom/lidroid/xutils/http/client/util/URIBuilder;
.super Ljava/lang/Object;
.source "URIBuilder.java"


# instance fields
.field private encodedAuthority:Ljava/lang/String;

.field private encodedFragment:Ljava/lang/String;

.field private encodedPath:Ljava/lang/String;

.field private encodedQuery:Ljava/lang/String;

.field private encodedSchemeSpecificPart:Ljava/lang/String;

.field private encodedUserInfo:Ljava/lang/String;

.field private fragment:Ljava/lang/String;

.field private host:Ljava/lang/String;

.field private path:Ljava/lang/String;

.field private port:I

.field private queryParams:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/apache/http/NameValuePair;",
            ">;"
        }
    .end annotation
.end field

.field private scheme:Ljava/lang/String;

.field private userInfo:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    const/4 v0, -0x1

    iput v0, p0, Lcom/lidroid/xutils/http/client/util/URIBuilder;->port:I

    .line 49
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 2
    .param p1, "uri"    # Ljava/lang/String;

    .prologue
    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    :try_start_0
    new-instance v1, Ljava/net/URI;

    invoke-direct {v1, p1}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v1}, Lcom/lidroid/xutils/http/client/util/URIBuilder;->digestURI(Ljava/net/URI;)V
    :try_end_0
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_0} :catch_0

    .line 57
    :goto_0
    return-void

    .line 54
    :catch_0
    move-exception v0

    .line 55
    .local v0, "e":Ljava/net/URISyntaxException;
    invoke-virtual {v0}, Ljava/net/URISyntaxException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/lidroid/xutils/util/LogUtils;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public constructor <init>(Ljava/net/URI;)V
    .locals 0
    .param p1, "uri"    # Ljava/net/URI;

    .prologue
    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    invoke-direct {p0, p1}, Lcom/lidroid/xutils/http/client/util/URIBuilder;->digestURI(Ljava/net/URI;)V

    .line 61
    return-void
.end method

.method private buildString(Ljava/nio/charset/Charset;)Ljava/lang/String;
    .locals 3
    .param p1, "charset"    # Ljava/nio/charset/Charset;

    .prologue
    .line 96
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 97
    .local v0, "sb":Ljava/lang/StringBuilder;
    iget-object v1, p0, Lcom/lidroid/xutils/http/client/util/URIBuilder;->scheme:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 98
    iget-object v1, p0, Lcom/lidroid/xutils/http/client/util/URIBuilder;->scheme:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v2, 0x3a

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 100
    :cond_0
    iget-object v1, p0, Lcom/lidroid/xutils/http/client/util/URIBuilder;->encodedSchemeSpecificPart:Ljava/lang/String;

    if-eqz v1, :cond_3

    .line 101
    iget-object v1, p0, Lcom/lidroid/xutils/http/client/util/URIBuilder;->encodedSchemeSpecificPart:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 132
    :cond_1
    :goto_0
    iget-object v1, p0, Lcom/lidroid/xutils/http/client/util/URIBuilder;->encodedFragment:Ljava/lang/String;

    if-eqz v1, :cond_c

    .line 133
    const-string v1, "#"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/lidroid/xutils/http/client/util/URIBuilder;->encodedFragment:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 137
    :cond_2
    :goto_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 103
    :cond_3
    iget-object v1, p0, Lcom/lidroid/xutils/http/client/util/URIBuilder;->encodedAuthority:Ljava/lang/String;

    if-eqz v1, :cond_6

    .line 104
    const-string v1, "//"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/lidroid/xutils/http/client/util/URIBuilder;->encodedAuthority:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 121
    :cond_4
    :goto_2
    iget-object v1, p0, Lcom/lidroid/xutils/http/client/util/URIBuilder;->encodedPath:Ljava/lang/String;

    if-eqz v1, :cond_a

    .line 122
    iget-object v1, p0, Lcom/lidroid/xutils/http/client/util/URIBuilder;->encodedPath:Ljava/lang/String;

    invoke-static {v1}, Lcom/lidroid/xutils/http/client/util/URIBuilder;->normalizePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    :cond_5
    :goto_3
    iget-object v1, p0, Lcom/lidroid/xutils/http/client/util/URIBuilder;->encodedQuery:Ljava/lang/String;

    if-eqz v1, :cond_b

    .line 127
    const-string v1, "?"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/lidroid/xutils/http/client/util/URIBuilder;->encodedQuery:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 105
    :cond_6
    iget-object v1, p0, Lcom/lidroid/xutils/http/client/util/URIBuilder;->host:Ljava/lang/String;

    if-eqz v1, :cond_4

    .line 106
    const-string v1, "//"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    iget-object v1, p0, Lcom/lidroid/xutils/http/client/util/URIBuilder;->encodedUserInfo:Ljava/lang/String;

    if-eqz v1, :cond_8

    .line 108
    iget-object v1, p0, Lcom/lidroid/xutils/http/client/util/URIBuilder;->encodedUserInfo:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "@"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    :cond_7
    :goto_4
    iget-object v1, p0, Lcom/lidroid/xutils/http/client/util/URIBuilder;->host:Ljava/lang/String;

    invoke-static {v1}, Lorg/apache/http/conn/util/InetAddressUtils;->isIPv6Address(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_9

    .line 113
    const-string v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/lidroid/xutils/http/client/util/URIBuilder;->host:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 117
    :goto_5
    iget v1, p0, Lcom/lidroid/xutils/http/client/util/URIBuilder;->port:I

    if-ltz v1, :cond_4

    .line 118
    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/lidroid/xutils/http/client/util/URIBuilder;->port:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 109
    :cond_8
    iget-object v1, p0, Lcom/lidroid/xutils/http/client/util/URIBuilder;->userInfo:Ljava/lang/String;

    if-eqz v1, :cond_7

    .line 110
    iget-object v1, p0, Lcom/lidroid/xutils/http/client/util/URIBuilder;->userInfo:Ljava/lang/String;

    invoke-direct {p0, v1, p1}, Lcom/lidroid/xutils/http/client/util/URIBuilder;->encodeUserInfo(Ljava/lang/String;Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "@"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_4

    .line 115
    :cond_9
    iget-object v1, p0, Lcom/lidroid/xutils/http/client/util/URIBuilder;->host:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_5

    .line 123
    :cond_a
    iget-object v1, p0, Lcom/lidroid/xutils/http/client/util/URIBuilder;->path:Ljava/lang/String;

    if-eqz v1, :cond_5

    .line 124
    iget-object v1, p0, Lcom/lidroid/xutils/http/client/util/URIBuilder;->path:Ljava/lang/String;

    invoke-static {v1}, Lcom/lidroid/xutils/http/client/util/URIBuilder;->normalizePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1, p1}, Lcom/lidroid/xutils/http/client/util/URIBuilder;->encodePath(Ljava/lang/String;Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_3

    .line 128
    :cond_b
    iget-object v1, p0, Lcom/lidroid/xutils/http/client/util/URIBuilder;->queryParams:Ljava/util/List;

    if-eqz v1, :cond_1

    .line 129
    const-string v1, "?"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/lidroid/xutils/http/client/util/URIBuilder;->queryParams:Ljava/util/List;

    invoke-direct {p0, v2, p1}, Lcom/lidroid/xutils/http/client/util/URIBuilder;->encodeQuery(Ljava/util/List;Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_0

    .line 134
    :cond_c
    iget-object v1, p0, Lcom/lidroid/xutils/http/client/util/URIBuilder;->fragment:Ljava/lang/String;

    if-eqz v1, :cond_2

    .line 135
    const-string v1, "#"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/lidroid/xutils/http/client/util/URIBuilder;->fragment:Ljava/lang/String;

    invoke-direct {p0, v2, p1}, Lcom/lidroid/xutils/http/client/util/URIBuilder;->encodeFragment(Ljava/lang/String;Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_1
.end method

.method private digestURI(Ljava/net/URI;)V
    .locals 1
    .param p1, "uri"    # Ljava/net/URI;

    .prologue
    .line 64
    invoke-virtual {p1}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lidroid/xutils/http/client/util/URIBuilder;->scheme:Ljava/lang/String;

    .line 65
    invoke-virtual {p1}, Ljava/net/URI;->getRawSchemeSpecificPart()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lidroid/xutils/http/client/util/URIBuilder;->encodedSchemeSpecificPart:Ljava/lang/String;

    .line 66
    invoke-virtual {p1}, Ljava/net/URI;->getRawAuthority()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lidroid/xutils/http/client/util/URIBuilder;->encodedAuthority:Ljava/lang/String;

    .line 67
    invoke-virtual {p1}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lidroid/xutils/http/client/util/URIBuilder;->host:Ljava/lang/String;

    .line 68
    invoke-virtual {p1}, Ljava/net/URI;->getPort()I

    move-result v0

    iput v0, p0, Lcom/lidroid/xutils/http/client/util/URIBuilder;->port:I

    .line 69
    invoke-virtual {p1}, Ljava/net/URI;->getRawUserInfo()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lidroid/xutils/http/client/util/URIBuilder;->encodedUserInfo:Ljava/lang/String;

    .line 70
    invoke-virtual {p1}, Ljava/net/URI;->getUserInfo()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lidroid/xutils/http/client/util/URIBuilder;->userInfo:Ljava/lang/String;

    .line 71
    invoke-virtual {p1}, Ljava/net/URI;->getRawPath()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lidroid/xutils/http/client/util/URIBuilder;->encodedPath:Ljava/lang/String;

    .line 72
    invoke-virtual {p1}, Ljava/net/URI;->getPath()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lidroid/xutils/http/client/util/URIBuilder;->path:Ljava/lang/String;

    .line 73
    invoke-virtual {p1}, Ljava/net/URI;->getRawQuery()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lidroid/xutils/http/client/util/URIBuilder;->encodedQuery:Ljava/lang/String;

    .line 74
    invoke-virtual {p1}, Ljava/net/URI;->getRawQuery()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/lidroid/xutils/http/client/util/URIBuilder;->parseQuery(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/lidroid/xutils/http/client/util/URIBuilder;->queryParams:Ljava/util/List;

    .line 75
    invoke-virtual {p1}, Ljava/net/URI;->getRawFragment()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lidroid/xutils/http/client/util/URIBuilder;->encodedFragment:Ljava/lang/String;

    .line 76
    invoke-virtual {p1}, Ljava/net/URI;->getFragment()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lidroid/xutils/http/client/util/URIBuilder;->fragment:Ljava/lang/String;

    .line 77
    return-void
.end method

.method private encodeFragment(Ljava/lang/String;Ljava/nio/charset/Charset;)Ljava/lang/String;
    .locals 1
    .param p1, "fragment"    # Ljava/lang/String;
    .param p2, "charset"    # Ljava/nio/charset/Charset;

    .prologue
    .line 153
    invoke-static {p1, p2}, Lcom/lidroid/xutils/http/client/util/URLEncodedUtils;->encFragment(Ljava/lang/String;Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private encodePath(Ljava/lang/String;Ljava/nio/charset/Charset;)Ljava/lang/String;
    .locals 3
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "charset"    # Ljava/nio/charset/Charset;

    .prologue
    .line 145
    invoke-static {p1, p2}, Lcom/lidroid/xutils/http/client/util/URLEncodedUtils;->encPath(Ljava/lang/String;Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "+"

    const-string v2, "20%"

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private encodeQuery(Ljava/util/List;Ljava/nio/charset/Charset;)Ljava/lang/String;
    .locals 1
    .param p2, "charset"    # Ljava/nio/charset/Charset;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/apache/http/NameValuePair;",
            ">;",
            "Ljava/nio/charset/Charset;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 149
    .local p1, "params":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    invoke-static {p1, p2}, Lcom/lidroid/xutils/http/client/util/URLEncodedUtils;->format(Ljava/lang/Iterable;Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private encodeUserInfo(Ljava/lang/String;Ljava/nio/charset/Charset;)Ljava/lang/String;
    .locals 1
    .param p1, "userInfo"    # Ljava/lang/String;
    .param p2, "charset"    # Ljava/nio/charset/Charset;

    .prologue
    .line 141
    invoke-static {p1, p2}, Lcom/lidroid/xutils/http/client/util/URLEncodedUtils;->encUserInfo(Ljava/lang/String;Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static normalizePath(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "path"    # Ljava/lang/String;

    .prologue
    .line 305
    if-nez p0, :cond_1

    .line 306
    const/4 p0, 0x0

    .line 317
    .local v0, "n":I
    :cond_0
    :goto_0
    return-object p0

    .line 308
    .end local v0    # "n":I
    :cond_1
    const/4 v0, 0x0

    .line 309
    .restart local v0    # "n":I
    :goto_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-lt v0, v1, :cond_3

    .line 314
    :cond_2
    const/4 v1, 0x1

    if-le v0, v1, :cond_0

    .line 315
    add-int/lit8 v1, v0, -0x1

    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    .line 310
    :cond_3
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/16 v2, 0x2f

    if-ne v1, v2, :cond_2

    .line 309
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method private parseQuery(Ljava/lang/String;)Ljava/util/List;
    .locals 1
    .param p1, "query"    # Ljava/lang/String;
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
    .line 80
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 81
    invoke-static {p1}, Lcom/lidroid/xutils/http/client/util/URLEncodedUtils;->parse(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    .line 83
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public addParameter(Ljava/lang/String;Ljava/lang/String;)Lcom/lidroid/xutils/http/client/util/URIBuilder;
    .locals 3
    .param p1, "param"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 231
    iget-object v0, p0, Lcom/lidroid/xutils/http/client/util/URIBuilder;->queryParams:Ljava/util/List;

    if-nez v0, :cond_0

    .line 232
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/lidroid/xutils/http/client/util/URIBuilder;->queryParams:Ljava/util/List;

    .line 234
    :cond_0
    iget-object v0, p0, Lcom/lidroid/xutils/http/client/util/URIBuilder;->queryParams:Ljava/util/List;

    new-instance v1, Lorg/apache/http/message/BasicNameValuePair;

    invoke-direct {v1, p1, p2}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 235
    iput-object v2, p0, Lcom/lidroid/xutils/http/client/util/URIBuilder;->encodedQuery:Ljava/lang/String;

    .line 236
    iput-object v2, p0, Lcom/lidroid/xutils/http/client/util/URIBuilder;->encodedSchemeSpecificPart:Ljava/lang/String;

    .line 237
    return-object p0
.end method

.method public build(Ljava/nio/charset/Charset;)Ljava/net/URI;
    .locals 2
    .param p1, "charset"    # Ljava/nio/charset/Charset;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/URISyntaxException;
        }
    .end annotation

    .prologue
    .line 92
    new-instance v0, Ljava/net/URI;

    invoke-direct {p0, p1}, Lcom/lidroid/xutils/http/client/util/URIBuilder;->buildString(Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public getFragment()Ljava/lang/String;
    .locals 1

    .prologue
    .line 301
    iget-object v0, p0, Lcom/lidroid/xutils/http/client/util/URIBuilder;->fragment:Ljava/lang/String;

    return-object v0
.end method

.method public getHost()Ljava/lang/String;
    .locals 1

    .prologue
    .line 281
    iget-object v0, p0, Lcom/lidroid/xutils/http/client/util/URIBuilder;->host:Ljava/lang/String;

    return-object v0
.end method

.method public getPath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 289
    iget-object v0, p0, Lcom/lidroid/xutils/http/client/util/URIBuilder;->path:Ljava/lang/String;

    return-object v0
.end method

.method public getPort()I
    .locals 1

    .prologue
    .line 285
    iget v0, p0, Lcom/lidroid/xutils/http/client/util/URIBuilder;->port:I

    return v0
.end method

.method public getQueryParams()Ljava/util/List;
    .locals 2
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
    .line 293
    iget-object v0, p0, Lcom/lidroid/xutils/http/client/util/URIBuilder;->queryParams:Ljava/util/List;

    if-eqz v0, :cond_0

    .line 294
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/lidroid/xutils/http/client/util/URIBuilder;->queryParams:Ljava/util/List;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 296
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    goto :goto_0
.end method

.method public getScheme()Ljava/lang/String;
    .locals 1

    .prologue
    .line 273
    iget-object v0, p0, Lcom/lidroid/xutils/http/client/util/URIBuilder;->scheme:Ljava/lang/String;

    return-object v0
.end method

.method public getUserInfo()Ljava/lang/String;
    .locals 1

    .prologue
    .line 277
    iget-object v0, p0, Lcom/lidroid/xutils/http/client/util/URIBuilder;->userInfo:Ljava/lang/String;

    return-object v0
.end method

.method public setFragment(Ljava/lang/String;)Lcom/lidroid/xutils/http/client/util/URIBuilder;
    .locals 1
    .param p1, "fragment"    # Ljava/lang/String;

    .prologue
    .line 267
    iput-object p1, p0, Lcom/lidroid/xutils/http/client/util/URIBuilder;->fragment:Ljava/lang/String;

    .line 268
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lidroid/xutils/http/client/util/URIBuilder;->encodedFragment:Ljava/lang/String;

    .line 269
    return-object p0
.end method

.method public setHost(Ljava/lang/String;)Lcom/lidroid/xutils/http/client/util/URIBuilder;
    .locals 1
    .param p1, "host"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 188
    iput-object p1, p0, Lcom/lidroid/xutils/http/client/util/URIBuilder;->host:Ljava/lang/String;

    .line 189
    iput-object v0, p0, Lcom/lidroid/xutils/http/client/util/URIBuilder;->encodedSchemeSpecificPart:Ljava/lang/String;

    .line 190
    iput-object v0, p0, Lcom/lidroid/xutils/http/client/util/URIBuilder;->encodedAuthority:Ljava/lang/String;

    .line 191
    return-object p0
.end method

.method public setParameter(Ljava/lang/String;Ljava/lang/String;)Lcom/lidroid/xutils/http/client/util/URIBuilder;
    .locals 5
    .param p1, "param"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    .line 245
    iget-object v2, p0, Lcom/lidroid/xutils/http/client/util/URIBuilder;->queryParams:Ljava/util/List;

    if-nez v2, :cond_0

    .line 246
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lcom/lidroid/xutils/http/client/util/URIBuilder;->queryParams:Ljava/util/List;

    .line 248
    :cond_0
    iget-object v2, p0, Lcom/lidroid/xutils/http/client/util/URIBuilder;->queryParams:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_2

    .line 249
    iget-object v2, p0, Lcom/lidroid/xutils/http/client/util/URIBuilder;->queryParams:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/apache/http/NameValuePair;>;"
    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_3

    .line 256
    .end local v0    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/apache/http/NameValuePair;>;"
    :cond_2
    iget-object v2, p0, Lcom/lidroid/xutils/http/client/util/URIBuilder;->queryParams:Ljava/util/List;

    new-instance v3, Lorg/apache/http/message/BasicNameValuePair;

    invoke-direct {v3, p1, p2}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 257
    iput-object v4, p0, Lcom/lidroid/xutils/http/client/util/URIBuilder;->encodedQuery:Ljava/lang/String;

    .line 258
    iput-object v4, p0, Lcom/lidroid/xutils/http/client/util/URIBuilder;->encodedSchemeSpecificPart:Ljava/lang/String;

    .line 259
    return-object p0

    .line 250
    .restart local v0    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/apache/http/NameValuePair;>;"
    :cond_3
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/http/NameValuePair;

    .line 251
    .local v1, "nvp":Lorg/apache/http/NameValuePair;
    invoke-interface {v1}, Lorg/apache/http/NameValuePair;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 252
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    goto :goto_0
.end method

.method public setPath(Ljava/lang/String;)Lcom/lidroid/xutils/http/client/util/URIBuilder;
    .locals 1
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 208
    iput-object p1, p0, Lcom/lidroid/xutils/http/client/util/URIBuilder;->path:Ljava/lang/String;

    .line 209
    iput-object v0, p0, Lcom/lidroid/xutils/http/client/util/URIBuilder;->encodedSchemeSpecificPart:Ljava/lang/String;

    .line 210
    iput-object v0, p0, Lcom/lidroid/xutils/http/client/util/URIBuilder;->encodedPath:Ljava/lang/String;

    .line 211
    return-object p0
.end method

.method public setPort(I)Lcom/lidroid/xutils/http/client/util/URIBuilder;
    .locals 1
    .param p1, "port"    # I

    .prologue
    const/4 v0, 0x0

    .line 198
    if-gez p1, :cond_0

    const/4 p1, -0x1

    .end local p1    # "port":I
    :cond_0
    iput p1, p0, Lcom/lidroid/xutils/http/client/util/URIBuilder;->port:I

    .line 199
    iput-object v0, p0, Lcom/lidroid/xutils/http/client/util/URIBuilder;->encodedSchemeSpecificPart:Ljava/lang/String;

    .line 200
    iput-object v0, p0, Lcom/lidroid/xutils/http/client/util/URIBuilder;->encodedAuthority:Ljava/lang/String;

    .line 201
    return-object p0
.end method

.method public setQuery(Ljava/lang/String;)Lcom/lidroid/xutils/http/client/util/URIBuilder;
    .locals 2
    .param p1, "query"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 220
    invoke-direct {p0, p1}, Lcom/lidroid/xutils/http/client/util/URIBuilder;->parseQuery(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/lidroid/xutils/http/client/util/URIBuilder;->queryParams:Ljava/util/List;

    .line 221
    iput-object v1, p0, Lcom/lidroid/xutils/http/client/util/URIBuilder;->encodedQuery:Ljava/lang/String;

    .line 222
    iput-object v1, p0, Lcom/lidroid/xutils/http/client/util/URIBuilder;->encodedSchemeSpecificPart:Ljava/lang/String;

    .line 223
    return-object p0
.end method

.method public setScheme(Ljava/lang/String;)Lcom/lidroid/xutils/http/client/util/URIBuilder;
    .locals 0
    .param p1, "scheme"    # Ljava/lang/String;

    .prologue
    .line 160
    iput-object p1, p0, Lcom/lidroid/xutils/http/client/util/URIBuilder;->scheme:Ljava/lang/String;

    .line 161
    return-object p0
.end method

.method public setUserInfo(Ljava/lang/String;)Lcom/lidroid/xutils/http/client/util/URIBuilder;
    .locals 1
    .param p1, "userInfo"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 169
    iput-object p1, p0, Lcom/lidroid/xutils/http/client/util/URIBuilder;->userInfo:Ljava/lang/String;

    .line 170
    iput-object v0, p0, Lcom/lidroid/xutils/http/client/util/URIBuilder;->encodedSchemeSpecificPart:Ljava/lang/String;

    .line 171
    iput-object v0, p0, Lcom/lidroid/xutils/http/client/util/URIBuilder;->encodedAuthority:Ljava/lang/String;

    .line 172
    iput-object v0, p0, Lcom/lidroid/xutils/http/client/util/URIBuilder;->encodedUserInfo:Ljava/lang/String;

    .line 173
    return-object p0
.end method

.method public setUserInfo(Ljava/lang/String;Ljava/lang/String;)Lcom/lidroid/xutils/http/client/util/URIBuilder;
    .locals 2
    .param p1, "username"    # Ljava/lang/String;
    .param p2, "password"    # Ljava/lang/String;

    .prologue
    .line 181
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/16 v1, 0x3a

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/lidroid/xutils/http/client/util/URIBuilder;->setUserInfo(Ljava/lang/String;)Lcom/lidroid/xutils/http/client/util/URIBuilder;

    move-result-object v0

    return-object v0
.end method
