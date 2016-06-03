.class public Lcom/lidroid/xutils/http/HttpHandler;
.super Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;
.source "HttpHandler.java"

# interfaces
.implements Lcom/lidroid/xutils/http/callback/RequestCallBackHandler;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lidroid/xutils/http/HttpHandler$NotUseApacheRedirectHandler;,
        Lcom/lidroid/xutils/http/HttpHandler$State;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/lidroid/xutils/util/core/CompatibleAsyncTask",
        "<",
        "Ljava/lang/Object;",
        "Ljava/lang/Object;",
        "Ljava/lang/Void;",
        ">;",
        "Lcom/lidroid/xutils/http/callback/RequestCallBackHandler;"
    }
.end annotation


# static fields
.field private static final UPDATE_FAILURE:I = 0x3

.field private static final UPDATE_LOADING:I = 0x2

.field private static final UPDATE_START:I = 0x1

.field private static final UPDATE_SUCCESS:I = 0x4

.field private static final notUseApacheRedirectHandler:Lcom/lidroid/xutils/http/HttpHandler$NotUseApacheRedirectHandler;


# instance fields
.field private autoRename:Z

.field private autoResume:Z

.field private callback:Lcom/lidroid/xutils/http/callback/RequestCallBack;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lidroid/xutils/http/callback/RequestCallBack",
            "<TT;>;"
        }
    .end annotation
.end field

.field private charset:Ljava/lang/String;

.field private final client:Lorg/apache/http/impl/client/AbstractHttpClient;

.field private final context:Lorg/apache/http/protocol/HttpContext;

.field private expiry:J

.field private fileSavePath:Ljava/lang/String;

.field private httpRedirectHandler:Lcom/lidroid/xutils/http/callback/HttpRedirectHandler;

.field private isDownloadingFile:Z

.field private isUploading:Z

.field private lastUpdateTime:J

.field private final mFileDownloadHandler:Lcom/lidroid/xutils/http/callback/FileDownloadHandler;

.field private final mStringDownloadHandler:Lcom/lidroid/xutils/http/callback/StringDownloadHandler;

.field private request:Lorg/apache/http/client/methods/HttpRequestBase;

.field private requestMethod:Ljava/lang/String;

.field private requestUrl:Ljava/lang/String;

.field private retriedCount:I

.field private state:Lcom/lidroid/xutils/http/HttpHandler$State;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 348
    new-instance v0, Lcom/lidroid/xutils/http/HttpHandler$NotUseApacheRedirectHandler;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/lidroid/xutils/http/HttpHandler$NotUseApacheRedirectHandler;-><init>(Lcom/lidroid/xutils/http/HttpHandler$NotUseApacheRedirectHandler;)V

    sput-object v0, Lcom/lidroid/xutils/http/HttpHandler;->notUseApacheRedirectHandler:Lcom/lidroid/xutils/http/HttpHandler$NotUseApacheRedirectHandler;

    return-void
.end method

.method public constructor <init>(Lorg/apache/http/impl/client/AbstractHttpClient;Lorg/apache/http/protocol/HttpContext;Ljava/lang/String;Lcom/lidroid/xutils/http/callback/RequestCallBack;)V
    .locals 2
    .param p1, "client"    # Lorg/apache/http/impl/client/AbstractHttpClient;
    .param p2, "context"    # Lorg/apache/http/protocol/HttpContext;
    .param p3, "charset"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/http/impl/client/AbstractHttpClient;",
            "Lorg/apache/http/protocol/HttpContext;",
            "Ljava/lang/String;",
            "Lcom/lidroid/xutils/http/callback/RequestCallBack",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/lidroid/xutils/http/HttpHandler;, "Lcom/lidroid/xutils/http/HttpHandler<TT;>;"
    .local p4, "callback":Lcom/lidroid/xutils/http/callback/RequestCallBack;, "Lcom/lidroid/xutils/http/callback/RequestCallBack<TT;>;"
    const/4 v1, 0x0

    .line 69
    invoke-direct {p0}, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;-><init>()V

    .line 45
    new-instance v0, Lcom/lidroid/xutils/http/callback/StringDownloadHandler;

    invoke-direct {v0}, Lcom/lidroid/xutils/http/callback/StringDownloadHandler;-><init>()V

    iput-object v0, p0, Lcom/lidroid/xutils/http/HttpHandler;->mStringDownloadHandler:Lcom/lidroid/xutils/http/callback/StringDownloadHandler;

    .line 46
    new-instance v0, Lcom/lidroid/xutils/http/callback/FileDownloadHandler;

    invoke-direct {v0}, Lcom/lidroid/xutils/http/callback/FileDownloadHandler;-><init>()V

    iput-object v0, p0, Lcom/lidroid/xutils/http/HttpHandler;->mFileDownloadHandler:Lcom/lidroid/xutils/http/callback/FileDownloadHandler;

    .line 59
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lidroid/xutils/http/HttpHandler;->isUploading:Z

    .line 62
    iput v1, p0, Lcom/lidroid/xutils/http/HttpHandler;->retriedCount:I

    .line 63
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lidroid/xutils/http/HttpHandler;->fileSavePath:Ljava/lang/String;

    .line 64
    iput-boolean v1, p0, Lcom/lidroid/xutils/http/HttpHandler;->isDownloadingFile:Z

    .line 65
    iput-boolean v1, p0, Lcom/lidroid/xutils/http/HttpHandler;->autoResume:Z

    .line 66
    iput-boolean v1, p0, Lcom/lidroid/xutils/http/HttpHandler;->autoRename:Z

    .line 77
    sget-object v0, Lcom/lidroid/xutils/http/HttpHandler$State;->WAITING:Lcom/lidroid/xutils/http/HttpHandler$State;

    iput-object v0, p0, Lcom/lidroid/xutils/http/HttpHandler;->state:Lcom/lidroid/xutils/http/HttpHandler$State;

    .line 83
    invoke-static {}, Lcom/lidroid/xutils/http/HttpCache;->getDefaultExpiryTime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/lidroid/xutils/http/HttpHandler;->expiry:J

    .line 70
    iput-object p1, p0, Lcom/lidroid/xutils/http/HttpHandler;->client:Lorg/apache/http/impl/client/AbstractHttpClient;

    .line 71
    iput-object p2, p0, Lcom/lidroid/xutils/http/HttpHandler;->context:Lorg/apache/http/protocol/HttpContext;

    .line 72
    iput-object p4, p0, Lcom/lidroid/xutils/http/HttpHandler;->callback:Lcom/lidroid/xutils/http/callback/RequestCallBack;

    .line 73
    iput-object p3, p0, Lcom/lidroid/xutils/http/HttpHandler;->charset:Ljava/lang/String;

    .line 74
    iget-object v0, p0, Lcom/lidroid/xutils/http/HttpHandler;->client:Lorg/apache/http/impl/client/AbstractHttpClient;

    sget-object v1, Lcom/lidroid/xutils/http/HttpHandler;->notUseApacheRedirectHandler:Lcom/lidroid/xutils/http/HttpHandler$NotUseApacheRedirectHandler;

    invoke-virtual {v0, v1}, Lorg/apache/http/impl/client/AbstractHttpClient;->setRedirectHandler(Lorg/apache/http/client/RedirectHandler;)V

    .line 75
    return-void
.end method

.method private handleResponse(Lorg/apache/http/HttpResponse;)Lcom/lidroid/xutils/http/ResponseInfo;
    .locals 14
    .param p1, "response"    # Lorg/apache/http/HttpResponse;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/http/HttpResponse;",
            ")",
            "Lcom/lidroid/xutils/http/ResponseInfo",
            "<TT;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lidroid/xutils/exception/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/lidroid/xutils/http/HttpHandler;, "Lcom/lidroid/xutils/http/HttpHandler<TT;>;"
    const/4 v5, 0x0

    const/4 v10, 0x0

    .line 230
    if-nez p1, :cond_0

    .line 231
    new-instance v0, Lcom/lidroid/xutils/exception/HttpException;

    const-string v2, "response is null"

    invoke-direct {v0, v2}, Lcom/lidroid/xutils/exception/HttpException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 233
    :cond_0
    invoke-virtual {p0}, Lcom/lidroid/xutils/http/HttpHandler;->isCancelled()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 267
    :cond_1
    :goto_0
    return-object v5

    .line 235
    :cond_2
    invoke-interface {p1}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v8

    .line 236
    .local v8, "status":Lorg/apache/http/StatusLine;
    invoke-interface {v8}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v9

    .line 237
    .local v9, "statusCode":I
    const/16 v0, 0x12c

    if-ge v9, v0, :cond_7

    .line 238
    const/4 v7, 0x0

    .line 239
    .local v7, "result":Ljava/lang/Object;
    invoke-interface {p1}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v1

    .line 240
    .local v1, "entity":Lorg/apache/http/HttpEntity;
    if-eqz v1, :cond_4

    .line 241
    iput-boolean v10, p0, Lcom/lidroid/xutils/http/HttpHandler;->isUploading:Z

    .line 242
    iget-boolean v0, p0, Lcom/lidroid/xutils/http/HttpHandler;->isDownloadingFile:Z

    if-eqz v0, :cond_6

    .line 243
    iget-boolean v0, p0, Lcom/lidroid/xutils/http/HttpHandler;->autoResume:Z

    if-eqz v0, :cond_5

    invoke-static {p1}, Lcom/lidroid/xutils/util/OtherUtils;->isSupportRange(Lorg/apache/http/HttpResponse;)Z

    move-result v0

    if-eqz v0, :cond_5

    const/4 v0, 0x1

    :goto_1
    iput-boolean v0, p0, Lcom/lidroid/xutils/http/HttpHandler;->autoResume:Z

    .line 244
    iget-boolean v0, p0, Lcom/lidroid/xutils/http/HttpHandler;->autoRename:Z

    if-eqz v0, :cond_3

    invoke-static {p1}, Lcom/lidroid/xutils/util/OtherUtils;->getFileNameFromHttpResponse(Lorg/apache/http/HttpResponse;)Ljava/lang/String;

    move-result-object v5

    .line 245
    .local v5, "responseFileName":Ljava/lang/String;
    :cond_3
    iget-object v0, p0, Lcom/lidroid/xutils/http/HttpHandler;->mFileDownloadHandler:Lcom/lidroid/xutils/http/callback/FileDownloadHandler;

    iget-object v3, p0, Lcom/lidroid/xutils/http/HttpHandler;->fileSavePath:Ljava/lang/String;

    iget-boolean v4, p0, Lcom/lidroid/xutils/http/HttpHandler;->autoResume:Z

    move-object v2, p0

    invoke-virtual/range {v0 .. v5}, Lcom/lidroid/xutils/http/callback/FileDownloadHandler;->handleEntity(Lorg/apache/http/HttpEntity;Lcom/lidroid/xutils/http/callback/RequestCallBackHandler;Ljava/lang/String;ZLjava/lang/String;)Ljava/io/File;

    move-result-object v7

    .line 253
    .end local v5    # "responseFileName":Ljava/lang/String;
    .end local v7    # "result":Ljava/lang/Object;
    :cond_4
    :goto_2
    new-instance v5, Lcom/lidroid/xutils/http/ResponseInfo;

    invoke-direct {v5, p1, v7, v10}, Lcom/lidroid/xutils/http/ResponseInfo;-><init>(Lorg/apache/http/HttpResponse;Ljava/lang/Object;Z)V

    goto :goto_0

    .restart local v7    # "result":Ljava/lang/Object;
    :cond_5
    move v0, v10

    .line 243
    goto :goto_1

    .line 247
    :cond_6
    iget-object v0, p0, Lcom/lidroid/xutils/http/HttpHandler;->mStringDownloadHandler:Lcom/lidroid/xutils/http/callback/StringDownloadHandler;

    iget-object v2, p0, Lcom/lidroid/xutils/http/HttpHandler;->charset:Ljava/lang/String;

    invoke-virtual {v0, v1, p0, v2}, Lcom/lidroid/xutils/http/callback/StringDownloadHandler;->handleEntity(Lorg/apache/http/HttpEntity;Lcom/lidroid/xutils/http/callback/RequestCallBackHandler;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 248
    .local v7, "result":Ljava/lang/String;
    sget-object v0, Lcom/lidroid/xutils/HttpUtils;->sHttpCache:Lcom/lidroid/xutils/http/HttpCache;

    iget-object v2, p0, Lcom/lidroid/xutils/http/HttpHandler;->requestMethod:Ljava/lang/String;

    invoke-virtual {v0, v2}, Lcom/lidroid/xutils/http/HttpCache;->isEnabled(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 249
    sget-object v2, Lcom/lidroid/xutils/HttpUtils;->sHttpCache:Lcom/lidroid/xutils/http/HttpCache;

    iget-object v3, p0, Lcom/lidroid/xutils/http/HttpHandler;->requestUrl:Ljava/lang/String;

    move-object v0, v7

    check-cast v0, Ljava/lang/String;

    iget-wide v12, p0, Lcom/lidroid/xutils/http/HttpHandler;->expiry:J

    invoke-virtual {v2, v3, v0, v12, v13}, Lcom/lidroid/xutils/http/HttpCache;->put(Ljava/lang/String;Ljava/lang/String;J)V

    goto :goto_2

    .line 254
    .end local v1    # "entity":Lorg/apache/http/HttpEntity;
    .end local v7    # "result":Ljava/lang/String;
    :cond_7
    const/16 v0, 0x12d

    if-eq v9, v0, :cond_8

    const/16 v0, 0x12e

    if-ne v9, v0, :cond_a

    .line 255
    :cond_8
    iget-object v0, p0, Lcom/lidroid/xutils/http/HttpHandler;->httpRedirectHandler:Lcom/lidroid/xutils/http/callback/HttpRedirectHandler;

    if-nez v0, :cond_9

    .line 256
    new-instance v0, Lcom/lidroid/xutils/http/callback/DefaultHttpRedirectHandler;

    invoke-direct {v0}, Lcom/lidroid/xutils/http/callback/DefaultHttpRedirectHandler;-><init>()V

    iput-object v0, p0, Lcom/lidroid/xutils/http/HttpHandler;->httpRedirectHandler:Lcom/lidroid/xutils/http/callback/HttpRedirectHandler;

    .line 258
    :cond_9
    iget-object v0, p0, Lcom/lidroid/xutils/http/HttpHandler;->httpRedirectHandler:Lcom/lidroid/xutils/http/callback/HttpRedirectHandler;

    invoke-interface {v0, p1}, Lcom/lidroid/xutils/http/callback/HttpRedirectHandler;->getDirectRequest(Lorg/apache/http/HttpResponse;)Lorg/apache/http/client/methods/HttpRequestBase;

    move-result-object v6

    .line 259
    .local v6, "request":Lorg/apache/http/client/methods/HttpRequestBase;
    if-eqz v6, :cond_1

    .line 260
    invoke-direct {p0, v6}, Lcom/lidroid/xutils/http/HttpHandler;->sendRequest(Lorg/apache/http/client/methods/HttpRequestBase;)Lcom/lidroid/xutils/http/ResponseInfo;

    move-result-object v5

    goto :goto_0

    .line 262
    .end local v6    # "request":Lorg/apache/http/client/methods/HttpRequestBase;
    :cond_a
    const/16 v0, 0x1a0

    if-ne v9, v0, :cond_b

    .line 263
    new-instance v0, Lcom/lidroid/xutils/exception/HttpException;

    const-string v2, "maybe the file has downloaded completely"

    invoke-direct {v0, v9, v2}, Lcom/lidroid/xutils/exception/HttpException;-><init>(ILjava/lang/String;)V

    throw v0

    .line 265
    :cond_b
    new-instance v0, Lcom/lidroid/xutils/exception/HttpException;

    invoke-interface {v8}, Lorg/apache/http/StatusLine;->getReasonPhrase()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v9, v2}, Lcom/lidroid/xutils/exception/HttpException;-><init>(ILjava/lang/String;)V

    throw v0
.end method

.method private sendRequest(Lorg/apache/http/client/methods/HttpRequestBase;)Lcom/lidroid/xutils/http/ResponseInfo;
    .locals 13
    .param p1, "request"    # Lorg/apache/http/client/methods/HttpRequestBase;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/http/client/methods/HttpRequestBase;",
            ")",
            "Lcom/lidroid/xutils/http/ResponseInfo",
            "<TT;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lidroid/xutils/exception/HttpException;
        }
    .end annotation

    .prologue
    .line 101
    .local p0, "this":Lcom/lidroid/xutils/http/HttpHandler;, "Lcom/lidroid/xutils/http/HttpHandler<TT;>;"
    iget-object v10, p0, Lcom/lidroid/xutils/http/HttpHandler;->client:Lorg/apache/http/impl/client/AbstractHttpClient;

    invoke-virtual {v10}, Lorg/apache/http/impl/client/AbstractHttpClient;->getHttpRequestRetryHandler()Lorg/apache/http/client/HttpRequestRetryHandler;

    move-result-object v9

    .line 104
    .local v9, "retryHandler":Lorg/apache/http/client/HttpRequestRetryHandler;
    :cond_0
    iget-boolean v10, p0, Lcom/lidroid/xutils/http/HttpHandler;->autoResume:Z

    if-eqz v10, :cond_2

    iget-boolean v10, p0, Lcom/lidroid/xutils/http/HttpHandler;->isDownloadingFile:Z

    if-eqz v10, :cond_2

    .line 105
    new-instance v0, Ljava/io/File;

    iget-object v10, p0, Lcom/lidroid/xutils/http/HttpHandler;->fileSavePath:Ljava/lang/String;

    invoke-direct {v0, v10}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 106
    .local v0, "downloadFile":Ljava/io/File;
    const-wide/16 v4, 0x0

    .line 107
    .local v4, "fileLen":J
    invoke-virtual {v0}, Ljava/io/File;->isFile()Z

    move-result v10

    if-eqz v10, :cond_1

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v10

    if-eqz v10, :cond_1

    .line 108
    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v4

    .line 110
    :cond_1
    const-wide/16 v10, 0x0

    cmp-long v10, v4, v10

    if-lez v10, :cond_2

    .line 111
    const-string v10, "RANGE"

    new-instance v11, Ljava/lang/StringBuilder;

    const-string v12, "bytes="

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v11, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "-"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {p1, v10, v11}, Lorg/apache/http/client/methods/HttpRequestBase;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 115
    .end local v0    # "downloadFile":Ljava/io/File;
    .end local v4    # "fileLen":J
    :cond_2
    const/4 v8, 0x1

    .line 116
    .local v8, "retry":Z
    const/4 v2, 0x0

    .line 118
    .local v2, "exception":Ljava/io/IOException;
    :try_start_0
    invoke-virtual {p1}, Lorg/apache/http/client/methods/HttpRequestBase;->getMethod()Ljava/lang/String;

    move-result-object v10

    iput-object v10, p0, Lcom/lidroid/xutils/http/HttpHandler;->requestMethod:Ljava/lang/String;

    .line 119
    sget-object v10, Lcom/lidroid/xutils/HttpUtils;->sHttpCache:Lcom/lidroid/xutils/http/HttpCache;

    iget-object v11, p0, Lcom/lidroid/xutils/http/HttpHandler;->requestMethod:Ljava/lang/String;

    invoke-virtual {v10, v11}, Lcom/lidroid/xutils/http/HttpCache;->isEnabled(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_4

    .line 120
    sget-object v10, Lcom/lidroid/xutils/HttpUtils;->sHttpCache:Lcom/lidroid/xutils/http/HttpCache;

    iget-object v11, p0, Lcom/lidroid/xutils/http/HttpHandler;->requestUrl:Ljava/lang/String;

    invoke-virtual {v10, v11}, Lcom/lidroid/xutils/http/HttpCache;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 121
    .local v7, "result":Ljava/lang/String;
    if-eqz v7, :cond_4

    .line 122
    new-instance v6, Lcom/lidroid/xutils/http/ResponseInfo;

    const/4 v10, 0x0

    const/4 v11, 0x1

    invoke-direct {v6, v10, v7, v11}, Lcom/lidroid/xutils/http/ResponseInfo;-><init>(Lorg/apache/http/HttpResponse;Ljava/lang/Object;Z)V

    .line 131
    .end local v7    # "result":Ljava/lang/String;
    :cond_3
    :goto_0
    return-object v6

    .line 126
    :cond_4
    const/4 v6, 0x0

    .line 127
    .local v6, "responseInfo":Lcom/lidroid/xutils/http/ResponseInfo;, "Lcom/lidroid/xutils/http/ResponseInfo<TT;>;"
    invoke-virtual {p0}, Lcom/lidroid/xutils/http/HttpHandler;->isCancelled()Z

    move-result v10

    if-nez v10, :cond_3

    .line 128
    iget-object v10, p0, Lcom/lidroid/xutils/http/HttpHandler;->client:Lorg/apache/http/impl/client/AbstractHttpClient;

    iget-object v11, p0, Lcom/lidroid/xutils/http/HttpHandler;->context:Lorg/apache/http/protocol/HttpContext;

    invoke-virtual {v10, p1, v11}, Lorg/apache/http/impl/client/AbstractHttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object v3

    .line 129
    .local v3, "response":Lorg/apache/http/HttpResponse;
    invoke-direct {p0, v3}, Lcom/lidroid/xutils/http/HttpHandler;->handleResponse(Lorg/apache/http/HttpResponse;)Lcom/lidroid/xutils/http/ResponseInfo;
    :try_end_0
    .catch Ljava/net/UnknownHostException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Lcom/lidroid/xutils/exception/HttpException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_4

    move-result-object v6

    goto :goto_0

    .line 132
    .end local v3    # "response":Lorg/apache/http/HttpResponse;
    .end local v6    # "responseInfo":Lcom/lidroid/xutils/http/ResponseInfo;, "Lcom/lidroid/xutils/http/ResponseInfo<TT;>;"
    :catch_0
    move-exception v1

    .line 133
    .local v1, "e":Ljava/net/UnknownHostException;
    move-object v2, v1

    .line 134
    iget v10, p0, Lcom/lidroid/xutils/http/HttpHandler;->retriedCount:I

    add-int/lit8 v10, v10, 0x1

    iput v10, p0, Lcom/lidroid/xutils/http/HttpHandler;->retriedCount:I

    iget-object v11, p0, Lcom/lidroid/xutils/http/HttpHandler;->context:Lorg/apache/http/protocol/HttpContext;

    invoke-interface {v9, v2, v10, v11}, Lorg/apache/http/client/HttpRequestRetryHandler;->retryRequest(Ljava/io/IOException;ILorg/apache/http/protocol/HttpContext;)Z

    move-result v8

    .line 149
    .end local v1    # "e":Ljava/net/UnknownHostException;
    :goto_1
    if-nez v8, :cond_0

    .line 150
    new-instance v10, Lcom/lidroid/xutils/exception/HttpException;

    invoke-direct {v10, v2}, Lcom/lidroid/xutils/exception/HttpException;-><init>(Ljava/lang/Throwable;)V

    throw v10

    .line 135
    :catch_1
    move-exception v1

    .line 136
    .local v1, "e":Ljava/io/IOException;
    move-object v2, v1

    .line 137
    iget v10, p0, Lcom/lidroid/xutils/http/HttpHandler;->retriedCount:I

    add-int/lit8 v10, v10, 0x1

    iput v10, p0, Lcom/lidroid/xutils/http/HttpHandler;->retriedCount:I

    iget-object v11, p0, Lcom/lidroid/xutils/http/HttpHandler;->context:Lorg/apache/http/protocol/HttpContext;

    invoke-interface {v9, v2, v10, v11}, Lorg/apache/http/client/HttpRequestRetryHandler;->retryRequest(Ljava/io/IOException;ILorg/apache/http/protocol/HttpContext;)Z

    move-result v8

    goto :goto_1

    .line 138
    .end local v1    # "e":Ljava/io/IOException;
    :catch_2
    move-exception v1

    .line 139
    .local v1, "e":Ljava/lang/NullPointerException;
    new-instance v2, Ljava/io/IOException;

    .end local v2    # "exception":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/lang/NullPointerException;->getMessage()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v2, v10}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 140
    .restart local v2    # "exception":Ljava/io/IOException;
    invoke-virtual {v2, v1}, Ljava/io/IOException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 141
    iget v10, p0, Lcom/lidroid/xutils/http/HttpHandler;->retriedCount:I

    add-int/lit8 v10, v10, 0x1

    iput v10, p0, Lcom/lidroid/xutils/http/HttpHandler;->retriedCount:I

    iget-object v11, p0, Lcom/lidroid/xutils/http/HttpHandler;->context:Lorg/apache/http/protocol/HttpContext;

    invoke-interface {v9, v2, v10, v11}, Lorg/apache/http/client/HttpRequestRetryHandler;->retryRequest(Ljava/io/IOException;ILorg/apache/http/protocol/HttpContext;)Z

    move-result v8

    goto :goto_1

    .line 142
    .end local v1    # "e":Ljava/lang/NullPointerException;
    :catch_3
    move-exception v1

    .line 143
    .local v1, "e":Lcom/lidroid/xutils/exception/HttpException;
    throw v1

    .line 144
    .end local v1    # "e":Lcom/lidroid/xutils/exception/HttpException;
    :catch_4
    move-exception v1

    .line 145
    .local v1, "e":Ljava/lang/Throwable;
    new-instance v2, Ljava/io/IOException;

    .end local v2    # "exception":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v2, v10}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 146
    .restart local v2    # "exception":Ljava/io/IOException;
    invoke-virtual {v2, v1}, Ljava/io/IOException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 147
    iget v10, p0, Lcom/lidroid/xutils/http/HttpHandler;->retriedCount:I

    add-int/lit8 v10, v10, 0x1

    iput v10, p0, Lcom/lidroid/xutils/http/HttpHandler;->retriedCount:I

    iget-object v11, p0, Lcom/lidroid/xutils/http/HttpHandler;->context:Lorg/apache/http/protocol/HttpContext;

    invoke-interface {v9, v2, v10, v11}, Lorg/apache/http/client/HttpRequestRetryHandler;->retryRequest(Ljava/io/IOException;ILorg/apache/http/protocol/HttpContext;)Z

    move-result v8

    goto :goto_1
.end method


# virtual methods
.method protected bridge varargs synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1
    check-cast p1, [Ljava/lang/Object;

    invoke-virtual {p0, p1}, Lcom/lidroid/xutils/http/HttpHandler;->doInBackground([Ljava/lang/Object;)Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/Object;)Ljava/lang/Void;
    .locals 11
    .param p1, "params"    # [Ljava/lang/Object;

    .prologue
    .local p0, "this":Lcom/lidroid/xutils/http/HttpHandler;, "Lcom/lidroid/xutils/http/HttpHandler<TT;>;"
    const/4 v10, 0x2

    const/4 v9, 0x0

    const/4 v8, 0x3

    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 157
    iget-object v2, p0, Lcom/lidroid/xutils/http/HttpHandler;->state:Lcom/lidroid/xutils/http/HttpHandler$State;

    sget-object v5, Lcom/lidroid/xutils/http/HttpHandler$State;->STOPPED:Lcom/lidroid/xutils/http/HttpHandler$State;

    if-eq v2, v5, :cond_0

    if-eqz p1, :cond_0

    array-length v2, p1

    if-nez v2, :cond_1

    .line 188
    :cond_0
    :goto_0
    return-object v9

    .line 159
    :cond_1
    array-length v2, p1

    if-le v2, v8, :cond_2

    .line 160
    aget-object v2, p1, v3

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/lidroid/xutils/http/HttpHandler;->fileSavePath:Ljava/lang/String;

    .line 161
    iget-object v2, p0, Lcom/lidroid/xutils/http/HttpHandler;->fileSavePath:Ljava/lang/String;

    if-eqz v2, :cond_4

    move v2, v3

    :goto_1
    iput-boolean v2, p0, Lcom/lidroid/xutils/http/HttpHandler;->isDownloadingFile:Z

    .line 162
    aget-object v2, p1, v10

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    iput-boolean v2, p0, Lcom/lidroid/xutils/http/HttpHandler;->autoResume:Z

    .line 163
    aget-object v2, p1, v8

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    iput-boolean v2, p0, Lcom/lidroid/xutils/http/HttpHandler;->autoRename:Z

    .line 167
    :cond_2
    :try_start_0
    iget-object v2, p0, Lcom/lidroid/xutils/http/HttpHandler;->state:Lcom/lidroid/xutils/http/HttpHandler$State;

    sget-object v5, Lcom/lidroid/xutils/http/HttpHandler$State;->STOPPED:Lcom/lidroid/xutils/http/HttpHandler$State;

    if-eq v2, v5, :cond_0

    .line 169
    const/4 v2, 0x0

    aget-object v2, p1, v2

    check-cast v2, Lorg/apache/http/client/methods/HttpRequestBase;

    iput-object v2, p0, Lcom/lidroid/xutils/http/HttpHandler;->request:Lorg/apache/http/client/methods/HttpRequestBase;

    .line 170
    iget-object v2, p0, Lcom/lidroid/xutils/http/HttpHandler;->request:Lorg/apache/http/client/methods/HttpRequestBase;

    invoke-virtual {v2}, Lorg/apache/http/client/methods/HttpRequestBase;->getURI()Ljava/net/URI;

    move-result-object v2

    invoke-virtual {v2}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/lidroid/xutils/http/HttpHandler;->requestUrl:Ljava/lang/String;

    .line 171
    iget-object v2, p0, Lcom/lidroid/xutils/http/HttpHandler;->callback:Lcom/lidroid/xutils/http/callback/RequestCallBack;

    if-eqz v2, :cond_3

    .line 172
    iget-object v2, p0, Lcom/lidroid/xutils/http/HttpHandler;->callback:Lcom/lidroid/xutils/http/callback/RequestCallBack;

    iget-object v5, p0, Lcom/lidroid/xutils/http/HttpHandler;->requestUrl:Ljava/lang/String;

    invoke-virtual {v2, v5}, Lcom/lidroid/xutils/http/callback/RequestCallBack;->setRequestUrl(Ljava/lang/String;)V

    .line 175
    :cond_3
    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v5, 0x0

    const/4 v6, 0x1

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v2, v5

    invoke-virtual {p0, v2}, Lcom/lidroid/xutils/http/HttpHandler;->publishProgress([Ljava/lang/Object;)V

    .line 177
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v6

    iput-wide v6, p0, Lcom/lidroid/xutils/http/HttpHandler;->lastUpdateTime:J

    .line 179
    iget-object v2, p0, Lcom/lidroid/xutils/http/HttpHandler;->request:Lorg/apache/http/client/methods/HttpRequestBase;

    invoke-direct {p0, v2}, Lcom/lidroid/xutils/http/HttpHandler;->sendRequest(Lorg/apache/http/client/methods/HttpRequestBase;)Lcom/lidroid/xutils/http/ResponseInfo;

    move-result-object v1

    .line 180
    .local v1, "responseInfo":Lcom/lidroid/xutils/http/ResponseInfo;, "Lcom/lidroid/xutils/http/ResponseInfo<TT;>;"
    if-eqz v1, :cond_0

    .line 181
    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v5, 0x0

    const/4 v6, 0x4

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v2, v5

    const/4 v5, 0x1

    aput-object v1, v2, v5

    invoke-virtual {p0, v2}, Lcom/lidroid/xutils/http/HttpHandler;->publishProgress([Ljava/lang/Object;)V
    :try_end_0
    .catch Lcom/lidroid/xutils/exception/HttpException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 184
    .end local v1    # "responseInfo":Lcom/lidroid/xutils/http/ResponseInfo;, "Lcom/lidroid/xutils/http/ResponseInfo<TT;>;"
    :catch_0
    move-exception v0

    .line 185
    .local v0, "e":Lcom/lidroid/xutils/exception/HttpException;
    new-array v2, v8, [Ljava/lang/Object;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v2, v4

    aput-object v0, v2, v3

    invoke-virtual {v0}, Lcom/lidroid/xutils/exception/HttpException;->getMessage()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v10

    invoke-virtual {p0, v2}, Lcom/lidroid/xutils/http/HttpHandler;->publishProgress([Ljava/lang/Object;)V

    goto/16 :goto_0

    .end local v0    # "e":Lcom/lidroid/xutils/exception/HttpException;
    :cond_4
    move v2, v4

    .line 161
    goto :goto_1
.end method

.method public getRequestCallBack()Lcom/lidroid/xutils/http/callback/RequestCallBack;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/lidroid/xutils/http/callback/RequestCallBack",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 94
    .local p0, "this":Lcom/lidroid/xutils/http/HttpHandler;, "Lcom/lidroid/xutils/http/HttpHandler<TT;>;"
    iget-object v0, p0, Lcom/lidroid/xutils/http/HttpHandler;->callback:Lcom/lidroid/xutils/http/callback/RequestCallBack;

    return-object v0
.end method

.method public getState()Lcom/lidroid/xutils/http/HttpHandler$State;
    .locals 1

    .prologue
    .line 80
    .local p0, "this":Lcom/lidroid/xutils/http/HttpHandler;, "Lcom/lidroid/xutils/http/HttpHandler<TT;>;"
    iget-object v0, p0, Lcom/lidroid/xutils/http/HttpHandler;->state:Lcom/lidroid/xutils/http/HttpHandler$State;

    return-object v0
.end method

.method public isStopped()Z
    .locals 2

    .prologue
    .line 295
    .local p0, "this":Lcom/lidroid/xutils/http/HttpHandler;, "Lcom/lidroid/xutils/http/HttpHandler<TT;>;"
    iget-object v0, p0, Lcom/lidroid/xutils/http/HttpHandler;->state:Lcom/lidroid/xutils/http/HttpHandler$State;

    sget-object v1, Lcom/lidroid/xutils/http/HttpHandler$State;->STOPPED:Lcom/lidroid/xutils/http/HttpHandler$State;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected varargs onProgressUpdate([Ljava/lang/Object;)V
    .locals 7
    .param p1, "values"    # [Ljava/lang/Object;

    .prologue
    .local p0, "this":Lcom/lidroid/xutils/http/HttpHandler;, "Lcom/lidroid/xutils/http/HttpHandler<TT;>;"
    const/4 v2, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    .line 199
    iget-object v0, p0, Lcom/lidroid/xutils/http/HttpHandler;->state:Lcom/lidroid/xutils/http/HttpHandler$State;

    sget-object v1, Lcom/lidroid/xutils/http/HttpHandler$State;->STOPPED:Lcom/lidroid/xutils/http/HttpHandler$State;

    if-eq v0, v1, :cond_0

    if-eqz p1, :cond_0

    array-length v0, p1

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lidroid/xutils/http/HttpHandler;->callback:Lcom/lidroid/xutils/http/callback/RequestCallBack;

    if-nez v0, :cond_1

    .line 226
    :cond_0
    :goto_0
    return-void

    .line 200
    :cond_1
    const/4 v0, 0x0

    aget-object v0, p1, v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    .line 202
    :pswitch_0
    sget-object v0, Lcom/lidroid/xutils/http/HttpHandler$State;->STARTED:Lcom/lidroid/xutils/http/HttpHandler$State;

    iput-object v0, p0, Lcom/lidroid/xutils/http/HttpHandler;->state:Lcom/lidroid/xutils/http/HttpHandler$State;

    .line 203
    iget-object v0, p0, Lcom/lidroid/xutils/http/HttpHandler;->callback:Lcom/lidroid/xutils/http/callback/RequestCallBack;

    invoke-virtual {v0}, Lcom/lidroid/xutils/http/callback/RequestCallBack;->onStart()V

    goto :goto_0

    .line 206
    :pswitch_1
    array-length v0, p1

    if-ne v0, v2, :cond_0

    .line 207
    sget-object v0, Lcom/lidroid/xutils/http/HttpHandler$State;->LOADING:Lcom/lidroid/xutils/http/HttpHandler$State;

    iput-object v0, p0, Lcom/lidroid/xutils/http/HttpHandler;->state:Lcom/lidroid/xutils/http/HttpHandler$State;

    .line 208
    iget-object v1, p0, Lcom/lidroid/xutils/http/HttpHandler;->callback:Lcom/lidroid/xutils/http/callback/RequestCallBack;

    .line 209
    aget-object v0, p1, v3

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    .line 210
    aget-object v0, p1, v4

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    .line 211
    iget-boolean v6, p0, Lcom/lidroid/xutils/http/HttpHandler;->isUploading:Z

    .line 208
    invoke-virtual/range {v1 .. v6}, Lcom/lidroid/xutils/http/callback/RequestCallBack;->onLoading(JJZ)V

    goto :goto_0

    .line 214
    :pswitch_2
    array-length v0, p1

    if-ne v0, v2, :cond_0

    .line 215
    sget-object v0, Lcom/lidroid/xutils/http/HttpHandler$State;->FAILURE:Lcom/lidroid/xutils/http/HttpHandler$State;

    iput-object v0, p0, Lcom/lidroid/xutils/http/HttpHandler;->state:Lcom/lidroid/xutils/http/HttpHandler$State;

    .line 216
    iget-object v2, p0, Lcom/lidroid/xutils/http/HttpHandler;->callback:Lcom/lidroid/xutils/http/callback/RequestCallBack;

    aget-object v0, p1, v3

    check-cast v0, Lcom/lidroid/xutils/exception/HttpException;

    aget-object v1, p1, v4

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v2, v0, v1}, Lcom/lidroid/xutils/http/callback/RequestCallBack;->onFailure(Lcom/lidroid/xutils/exception/HttpException;Ljava/lang/String;)V

    goto :goto_0

    .line 219
    :pswitch_3
    array-length v0, p1

    if-ne v0, v4, :cond_0

    .line 220
    sget-object v0, Lcom/lidroid/xutils/http/HttpHandler$State;->SUCCESS:Lcom/lidroid/xutils/http/HttpHandler$State;

    iput-object v0, p0, Lcom/lidroid/xutils/http/HttpHandler;->state:Lcom/lidroid/xutils/http/HttpHandler$State;

    .line 221
    iget-object v1, p0, Lcom/lidroid/xutils/http/HttpHandler;->callback:Lcom/lidroid/xutils/http/callback/RequestCallBack;

    aget-object v0, p1, v3

    check-cast v0, Lcom/lidroid/xutils/http/ResponseInfo;

    invoke-virtual {v1, v0}, Lcom/lidroid/xutils/http/callback/RequestCallBack;->onSuccess(Lcom/lidroid/xutils/http/ResponseInfo;)V

    goto :goto_0

    .line 200
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method public setExpiry(J)V
    .locals 1
    .param p1, "expiry"    # J

    .prologue
    .line 86
    .local p0, "this":Lcom/lidroid/xutils/http/HttpHandler;, "Lcom/lidroid/xutils/http/HttpHandler<TT;>;"
    iput-wide p1, p0, Lcom/lidroid/xutils/http/HttpHandler;->expiry:J

    .line 87
    return-void
.end method

.method public setHttpRedirectHandler(Lcom/lidroid/xutils/http/callback/HttpRedirectHandler;)V
    .locals 0
    .param p1, "httpRedirectHandler"    # Lcom/lidroid/xutils/http/callback/HttpRedirectHandler;

    .prologue
    .line 51
    .local p0, "this":Lcom/lidroid/xutils/http/HttpHandler;, "Lcom/lidroid/xutils/http/HttpHandler<TT;>;"
    if-eqz p1, :cond_0

    .line 52
    iput-object p1, p0, Lcom/lidroid/xutils/http/HttpHandler;->httpRedirectHandler:Lcom/lidroid/xutils/http/callback/HttpRedirectHandler;

    .line 54
    :cond_0
    return-void
.end method

.method public setRequestCallBack(Lcom/lidroid/xutils/http/callback/RequestCallBack;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lidroid/xutils/http/callback/RequestCallBack",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 90
    .local p0, "this":Lcom/lidroid/xutils/http/HttpHandler;, "Lcom/lidroid/xutils/http/HttpHandler<TT;>;"
    .local p1, "callback":Lcom/lidroid/xutils/http/callback/RequestCallBack;, "Lcom/lidroid/xutils/http/callback/RequestCallBack<TT;>;"
    iput-object p1, p0, Lcom/lidroid/xutils/http/HttpHandler;->callback:Lcom/lidroid/xutils/http/callback/RequestCallBack;

    .line 91
    return-void
.end method

.method public stop()V
    .locals 1

    .prologue
    .line 274
    .local p0, "this":Lcom/lidroid/xutils/http/HttpHandler;, "Lcom/lidroid/xutils/http/HttpHandler<TT;>;"
    sget-object v0, Lcom/lidroid/xutils/http/HttpHandler$State;->STOPPED:Lcom/lidroid/xutils/http/HttpHandler$State;

    iput-object v0, p0, Lcom/lidroid/xutils/http/HttpHandler;->state:Lcom/lidroid/xutils/http/HttpHandler$State;

    .line 276
    iget-object v0, p0, Lcom/lidroid/xutils/http/HttpHandler;->request:Lorg/apache/http/client/methods/HttpRequestBase;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lidroid/xutils/http/HttpHandler;->request:Lorg/apache/http/client/methods/HttpRequestBase;

    invoke-virtual {v0}, Lorg/apache/http/client/methods/HttpRequestBase;->isAborted()Z

    move-result v0

    if-nez v0, :cond_0

    .line 278
    :try_start_0
    iget-object v0, p0, Lcom/lidroid/xutils/http/HttpHandler;->request:Lorg/apache/http/client/methods/HttpRequestBase;

    invoke-virtual {v0}, Lorg/apache/http/client/methods/HttpRequestBase;->abort()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_1

    .line 282
    :cond_0
    :goto_0
    invoke-virtual {p0}, Lcom/lidroid/xutils/http/HttpHandler;->isCancelled()Z

    move-result v0

    if-nez v0, :cond_1

    .line 284
    const/4 v0, 0x1

    :try_start_1
    invoke-virtual {p0, v0}, Lcom/lidroid/xutils/http/HttpHandler;->cancel(Z)Z
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0

    .line 289
    :cond_1
    :goto_1
    iget-object v0, p0, Lcom/lidroid/xutils/http/HttpHandler;->callback:Lcom/lidroid/xutils/http/callback/RequestCallBack;

    if-eqz v0, :cond_2

    .line 290
    iget-object v0, p0, Lcom/lidroid/xutils/http/HttpHandler;->callback:Lcom/lidroid/xutils/http/callback/RequestCallBack;

    invoke-virtual {v0}, Lcom/lidroid/xutils/http/callback/RequestCallBack;->onStopped()V

    .line 292
    :cond_2
    return-void

    .line 285
    :catch_0
    move-exception v0

    goto :goto_1

    .line 279
    :catch_1
    move-exception v0

    goto :goto_0
.end method

.method public updateProgress(JJZ)Z
    .locals 11
    .param p1, "total"    # J
    .param p3, "current"    # J
    .param p5, "forceUpdateUI"    # Z

    .prologue
    .local p0, "this":Lcom/lidroid/xutils/http/HttpHandler;, "Lcom/lidroid/xutils/http/HttpHandler<TT;>;"
    const/4 v9, 0x3

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/4 v8, 0x2

    .line 302
    iget-object v4, p0, Lcom/lidroid/xutils/http/HttpHandler;->callback:Lcom/lidroid/xutils/http/callback/RequestCallBack;

    if-eqz v4, :cond_0

    iget-object v4, p0, Lcom/lidroid/xutils/http/HttpHandler;->state:Lcom/lidroid/xutils/http/HttpHandler$State;

    sget-object v5, Lcom/lidroid/xutils/http/HttpHandler$State;->STOPPED:Lcom/lidroid/xutils/http/HttpHandler$State;

    if-eq v4, v5, :cond_0

    .line 303
    if-eqz p5, :cond_1

    .line 304
    new-array v4, v9, [Ljava/lang/Object;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v3

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    aput-object v5, v4, v2

    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    aput-object v5, v4, v8

    invoke-virtual {p0, v4}, Lcom/lidroid/xutils/http/HttpHandler;->publishProgress([Ljava/lang/Object;)V

    .line 313
    :cond_0
    :goto_0
    iget-object v4, p0, Lcom/lidroid/xutils/http/HttpHandler;->state:Lcom/lidroid/xutils/http/HttpHandler$State;

    sget-object v5, Lcom/lidroid/xutils/http/HttpHandler$State;->STOPPED:Lcom/lidroid/xutils/http/HttpHandler$State;

    if-eq v4, v5, :cond_2

    :goto_1
    return v2

    .line 306
    :cond_1
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    .line 307
    .local v0, "currTime":J
    iget-wide v4, p0, Lcom/lidroid/xutils/http/HttpHandler;->lastUpdateTime:J

    sub-long v4, v0, v4

    iget-object v6, p0, Lcom/lidroid/xutils/http/HttpHandler;->callback:Lcom/lidroid/xutils/http/callback/RequestCallBack;

    invoke-virtual {v6}, Lcom/lidroid/xutils/http/callback/RequestCallBack;->getRate()I

    move-result v6

    int-to-long v6, v6

    cmp-long v4, v4, v6

    if-ltz v4, :cond_0

    .line 308
    iput-wide v0, p0, Lcom/lidroid/xutils/http/HttpHandler;->lastUpdateTime:J

    .line 309
    new-array v4, v9, [Ljava/lang/Object;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v3

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    aput-object v5, v4, v2

    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    aput-object v5, v4, v8

    invoke-virtual {p0, v4}, Lcom/lidroid/xutils/http/HttpHandler;->publishProgress([Ljava/lang/Object;)V

    goto :goto_0

    .end local v0    # "currTime":J
    :cond_2
    move v2, v3

    .line 313
    goto :goto_1
.end method
