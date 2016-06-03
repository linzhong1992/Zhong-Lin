.class public Lcom/lidroid/xutils/http/client/multipart/content/InputStreamBody;
.super Lcom/lidroid/xutils/http/client/multipart/content/AbstractContentBody;
.source "InputStreamBody.java"


# instance fields
.field private final filename:Ljava/lang/String;

.field private final in:Ljava/io/InputStream;

.field private length:J


# direct methods
.method public constructor <init>(Ljava/io/InputStream;J)V
    .locals 6
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "length"    # J

    .prologue
    .line 50
    const-string v4, "no_name"

    const-string v5, "application/octet-stream"

    move-object v0, p0

    move-object v1, p1

    move-wide v2, p2

    invoke-direct/range {v0 .. v5}, Lcom/lidroid/xutils/http/client/multipart/content/InputStreamBody;-><init>(Ljava/io/InputStream;JLjava/lang/String;Ljava/lang/String;)V

    .line 51
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;JLjava/lang/String;)V
    .locals 6
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "length"    # J
    .param p4, "filename"    # Ljava/lang/String;

    .prologue
    .line 46
    const-string v5, "application/octet-stream"

    move-object v0, p0

    move-object v1, p1

    move-wide v2, p2

    move-object v4, p4

    invoke-direct/range {v0 .. v5}, Lcom/lidroid/xutils/http/client/multipart/content/InputStreamBody;-><init>(Ljava/io/InputStream;JLjava/lang/String;Ljava/lang/String;)V

    .line 47
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;JLjava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "length"    # J
    .param p4, "filename"    # Ljava/lang/String;
    .param p5, "mimeType"    # Ljava/lang/String;

    .prologue
    .line 36
    invoke-direct {p0, p5}, Lcom/lidroid/xutils/http/client/multipart/content/AbstractContentBody;-><init>(Ljava/lang/String;)V

    .line 37
    if-nez p1, :cond_0

    .line 38
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Input stream may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 40
    :cond_0
    iput-object p1, p0, Lcom/lidroid/xutils/http/client/multipart/content/InputStreamBody;->in:Ljava/io/InputStream;

    .line 41
    iput-object p4, p0, Lcom/lidroid/xutils/http/client/multipart/content/InputStreamBody;->filename:Ljava/lang/String;

    .line 42
    iput-wide p2, p0, Lcom/lidroid/xutils/http/client/multipart/content/InputStreamBody;->length:J

    .line 43
    return-void
.end method


# virtual methods
.method public getCharset()Ljava/lang/String;
    .locals 1

    .prologue
    .line 82
    const/4 v0, 0x0

    return-object v0
.end method

.method public getContentLength()J
    .locals 2

    .prologue
    .line 86
    iget-wide v0, p0, Lcom/lidroid/xutils/http/client/multipart/content/InputStreamBody;->length:J

    return-wide v0
.end method

.method public getFilename()Ljava/lang/String;
    .locals 1

    .prologue
    .line 90
    iget-object v0, p0, Lcom/lidroid/xutils/http/client/multipart/content/InputStreamBody;->filename:Ljava/lang/String;

    return-object v0
.end method

.method public getInputStream()Ljava/io/InputStream;
    .locals 1

    .prologue
    .line 54
    iget-object v0, p0, Lcom/lidroid/xutils/http/client/multipart/content/InputStreamBody;->in:Ljava/io/InputStream;

    return-object v0
.end method

.method public getTransferEncoding()Ljava/lang/String;
    .locals 1

    .prologue
    .line 78
    const-string v0, "binary"

    return-object v0
.end method

.method public writeTo(Ljava/io/OutputStream;)V
    .locals 8
    .param p1, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 58
    if-nez p1, :cond_0

    .line 59
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Output stream may not be null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 62
    :cond_0
    const/16 v2, 0x1000

    :try_start_0
    new-array v1, v2, [B

    .line 64
    .local v1, "tmp":[B
    :cond_1
    iget-object v2, p0, Lcom/lidroid/xutils/http/client/multipart/content/InputStreamBody;->in:Ljava/io/InputStream;

    invoke-virtual {v2, v1}, Ljava/io/InputStream;->read([B)I

    move-result v0

    .local v0, "l":I
    const/4 v2, -0x1

    if-ne v0, v2, :cond_2

    .line 71
    invoke-virtual {p1}, Ljava/io/OutputStream;->flush()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 73
    iget-object v2, p0, Lcom/lidroid/xutils/http/client/multipart/content/InputStreamBody;->in:Ljava/io/InputStream;

    invoke-static {v2}, Lcom/lidroid/xutils/util/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    .line 75
    return-void

    .line 65
    :cond_2
    const/4 v2, 0x0

    :try_start_1
    invoke-virtual {p1, v1, v2, v0}, Ljava/io/OutputStream;->write([BII)V

    .line 66
    iget-object v2, p0, Lcom/lidroid/xutils/http/client/multipart/content/InputStreamBody;->callBackInfo:Lcom/lidroid/xutils/http/client/multipart/MultipartEntity$CallBackInfo;

    iget-wide v4, v2, Lcom/lidroid/xutils/http/client/multipart/MultipartEntity$CallBackInfo;->pos:J

    int-to-long v6, v0

    add-long/2addr v4, v6

    iput-wide v4, v2, Lcom/lidroid/xutils/http/client/multipart/MultipartEntity$CallBackInfo;->pos:J

    .line 67
    iget-object v2, p0, Lcom/lidroid/xutils/http/client/multipart/content/InputStreamBody;->callBackInfo:Lcom/lidroid/xutils/http/client/multipart/MultipartEntity$CallBackInfo;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/lidroid/xutils/http/client/multipart/MultipartEntity$CallBackInfo;->doCallBack(Z)Z

    move-result v2

    if-nez v2, :cond_1

    .line 68
    new-instance v2, Ljava/io/InterruptedIOException;

    const-string v3, "stop"

    invoke-direct {v2, v3}, Ljava/io/InterruptedIOException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 72
    .end local v0    # "l":I
    .end local v1    # "tmp":[B
    :catchall_0
    move-exception v2

    .line 73
    iget-object v3, p0, Lcom/lidroid/xutils/http/client/multipart/content/InputStreamBody;->in:Ljava/io/InputStream;

    invoke-static {v3}, Lcom/lidroid/xutils/util/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    .line 74
    throw v2
.end method
