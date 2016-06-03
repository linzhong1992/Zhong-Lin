.class public Lcom/lidroid/xutils/http/client/multipart/MultipartEntity;
.super Ljava/lang/Object;
.source "MultipartEntity.java"

# interfaces
.implements Lorg/apache/http/HttpEntity;
.implements Lcom/lidroid/xutils/http/client/entity/UploadEntity;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lidroid/xutils/http/client/multipart/MultipartEntity$CallBackInfo;
    }
.end annotation


# static fields
.field private static final MULTIPART_CHARS:[C


# instance fields
.field private final boundary:Ljava/lang/String;

.field private callBackInfo:Lcom/lidroid/xutils/http/client/multipart/MultipartEntity$CallBackInfo;

.field private final charset:Ljava/nio/charset/Charset;

.field private contentType:Lorg/apache/http/Header;

.field private volatile dirty:Z

.field private length:J

.field private final multipart:Lcom/lidroid/xutils/http/client/multipart/HttpMultipart;

.field private multipartSubtype:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 69
    const-string v0, "-_1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

    .line 70
    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    .line 68
    sput-object v0, Lcom/lidroid/xutils/http/client/multipart/MultipartEntity;->MULTIPART_CHARS:[C

    .line 70
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 124
    sget-object v0, Lcom/lidroid/xutils/http/client/multipart/HttpMultipartMode;->STRICT:Lcom/lidroid/xutils/http/client/multipart/HttpMultipartMode;

    invoke-direct {p0, v0, v1, v1}, Lcom/lidroid/xutils/http/client/multipart/MultipartEntity;-><init>(Lcom/lidroid/xutils/http/client/multipart/HttpMultipartMode;Ljava/lang/String;Ljava/nio/charset/Charset;)V

    .line 125
    return-void
.end method

.method public constructor <init>(Lcom/lidroid/xutils/http/client/multipart/HttpMultipartMode;)V
    .locals 1
    .param p1, "mode"    # Lcom/lidroid/xutils/http/client/multipart/HttpMultipartMode;

    .prologue
    const/4 v0, 0x0

    .line 117
    invoke-direct {p0, p1, v0, v0}, Lcom/lidroid/xutils/http/client/multipart/MultipartEntity;-><init>(Lcom/lidroid/xutils/http/client/multipart/HttpMultipartMode;Ljava/lang/String;Ljava/nio/charset/Charset;)V

    .line 118
    return-void
.end method

.method public constructor <init>(Lcom/lidroid/xutils/http/client/multipart/HttpMultipartMode;Ljava/lang/String;Ljava/nio/charset/Charset;)V
    .locals 4
    .param p1, "mode"    # Lcom/lidroid/xutils/http/client/multipart/HttpMultipartMode;
    .param p2, "boundary"    # Ljava/lang/String;
    .param p3, "charset"    # Ljava/nio/charset/Charset;

    .prologue
    .line 94
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    new-instance v0, Lcom/lidroid/xutils/http/client/multipart/MultipartEntity$CallBackInfo;

    invoke-direct {v0}, Lcom/lidroid/xutils/http/client/multipart/MultipartEntity$CallBackInfo;-><init>()V

    iput-object v0, p0, Lcom/lidroid/xutils/http/client/multipart/MultipartEntity;->callBackInfo:Lcom/lidroid/xutils/http/client/multipart/MultipartEntity$CallBackInfo;

    .line 128
    const-string v0, "form-data"

    iput-object v0, p0, Lcom/lidroid/xutils/http/client/multipart/MultipartEntity;->multipartSubtype:Ljava/lang/String;

    .line 95
    if-nez p2, :cond_0

    .line 96
    invoke-virtual {p0}, Lcom/lidroid/xutils/http/client/multipart/MultipartEntity;->generateBoundary()Ljava/lang/String;

    move-result-object p2

    .line 98
    :cond_0
    iput-object p2, p0, Lcom/lidroid/xutils/http/client/multipart/MultipartEntity;->boundary:Ljava/lang/String;

    .line 99
    if-nez p1, :cond_1

    .line 100
    sget-object p1, Lcom/lidroid/xutils/http/client/multipart/HttpMultipartMode;->STRICT:Lcom/lidroid/xutils/http/client/multipart/HttpMultipartMode;

    .line 102
    :cond_1
    if-eqz p3, :cond_2

    .end local p3    # "charset":Ljava/nio/charset/Charset;
    :goto_0
    iput-object p3, p0, Lcom/lidroid/xutils/http/client/multipart/MultipartEntity;->charset:Ljava/nio/charset/Charset;

    .line 103
    new-instance v0, Lcom/lidroid/xutils/http/client/multipart/HttpMultipart;

    iget-object v1, p0, Lcom/lidroid/xutils/http/client/multipart/MultipartEntity;->multipartSubtype:Ljava/lang/String;

    iget-object v2, p0, Lcom/lidroid/xutils/http/client/multipart/MultipartEntity;->charset:Ljava/nio/charset/Charset;

    iget-object v3, p0, Lcom/lidroid/xutils/http/client/multipart/MultipartEntity;->boundary:Ljava/lang/String;

    invoke-direct {v0, v1, v2, v3, p1}, Lcom/lidroid/xutils/http/client/multipart/HttpMultipart;-><init>(Ljava/lang/String;Ljava/nio/charset/Charset;Ljava/lang/String;Lcom/lidroid/xutils/http/client/multipart/HttpMultipartMode;)V

    iput-object v0, p0, Lcom/lidroid/xutils/http/client/multipart/MultipartEntity;->multipart:Lcom/lidroid/xutils/http/client/multipart/HttpMultipart;

    .line 104
    new-instance v0, Lorg/apache/http/message/BasicHeader;

    .line 105
    const-string v1, "Content-Type"

    .line 106
    iget-object v2, p0, Lcom/lidroid/xutils/http/client/multipart/MultipartEntity;->boundary:Ljava/lang/String;

    iget-object v3, p0, Lcom/lidroid/xutils/http/client/multipart/MultipartEntity;->charset:Ljava/nio/charset/Charset;

    invoke-virtual {p0, v2, v3}, Lcom/lidroid/xutils/http/client/multipart/MultipartEntity;->generateContentType(Ljava/lang/String;Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/http/message/BasicHeader;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 104
    iput-object v0, p0, Lcom/lidroid/xutils/http/client/multipart/MultipartEntity;->contentType:Lorg/apache/http/Header;

    .line 107
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lidroid/xutils/http/client/multipart/MultipartEntity;->dirty:Z

    .line 108
    return-void

    .line 102
    .restart local p3    # "charset":Ljava/nio/charset/Charset;
    :cond_2
    sget-object p3, Lcom/lidroid/xutils/http/client/multipart/MIME;->DEFAULT_CHARSET:Ljava/nio/charset/Charset;

    goto :goto_0
.end method


# virtual methods
.method public addPart(Lcom/lidroid/xutils/http/client/multipart/FormBodyPart;)V
    .locals 1
    .param p1, "bodyPart"    # Lcom/lidroid/xutils/http/client/multipart/FormBodyPart;

    .prologue
    .line 165
    iget-object v0, p0, Lcom/lidroid/xutils/http/client/multipart/MultipartEntity;->multipart:Lcom/lidroid/xutils/http/client/multipart/HttpMultipart;

    invoke-virtual {v0, p1}, Lcom/lidroid/xutils/http/client/multipart/HttpMultipart;->addBodyPart(Lcom/lidroid/xutils/http/client/multipart/FormBodyPart;)V

    .line 166
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lidroid/xutils/http/client/multipart/MultipartEntity;->dirty:Z

    .line 167
    return-void
.end method

.method public addPart(Ljava/lang/String;Lcom/lidroid/xutils/http/client/multipart/content/ContentBody;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "contentBody"    # Lcom/lidroid/xutils/http/client/multipart/content/ContentBody;

    .prologue
    .line 170
    new-instance v0, Lcom/lidroid/xutils/http/client/multipart/FormBodyPart;

    invoke-direct {v0, p1, p2}, Lcom/lidroid/xutils/http/client/multipart/FormBodyPart;-><init>(Ljava/lang/String;Lcom/lidroid/xutils/http/client/multipart/content/ContentBody;)V

    invoke-virtual {p0, v0}, Lcom/lidroid/xutils/http/client/multipart/MultipartEntity;->addPart(Lcom/lidroid/xutils/http/client/multipart/FormBodyPart;)V

    .line 171
    return-void
.end method

.method public addPart(Ljava/lang/String;Lcom/lidroid/xutils/http/client/multipart/content/ContentBody;Ljava/lang/String;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "contentBody"    # Lcom/lidroid/xutils/http/client/multipart/content/ContentBody;
    .param p3, "contentDisposition"    # Ljava/lang/String;

    .prologue
    .line 174
    new-instance v0, Lcom/lidroid/xutils/http/client/multipart/FormBodyPart;

    invoke-direct {v0, p1, p2, p3}, Lcom/lidroid/xutils/http/client/multipart/FormBodyPart;-><init>(Ljava/lang/String;Lcom/lidroid/xutils/http/client/multipart/content/ContentBody;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/lidroid/xutils/http/client/multipart/MultipartEntity;->addPart(Lcom/lidroid/xutils/http/client/multipart/FormBodyPart;)V

    .line 175
    return-void
.end method

.method public consumeContent()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/UnsupportedOperationException;
        }
    .end annotation

    .prologue
    .line 213
    invoke-virtual {p0}, Lcom/lidroid/xutils/http/client/multipart/MultipartEntity;->isStreaming()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 214
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    .line 215
    const-string v1, "Streaming entity does not implement #consumeContent()"

    .line 214
    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 217
    :cond_0
    return-void
.end method

.method protected generateBoundary()Ljava/lang/String;
    .locals 6

    .prologue
    .line 155
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 156
    .local v0, "buffer":Ljava/lang/StringBuilder;
    new-instance v3, Ljava/util/Random;

    invoke-direct {v3}, Ljava/util/Random;-><init>()V

    .line 157
    .local v3, "rand":Ljava/util/Random;
    const/16 v4, 0xb

    invoke-virtual {v3, v4}, Ljava/util/Random;->nextInt(I)I

    move-result v4

    add-int/lit8 v1, v4, 0x1e

    .line 158
    .local v1, "count":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-lt v2, v1, :cond_0

    .line 161
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4

    .line 159
    :cond_0
    sget-object v4, Lcom/lidroid/xutils/http/client/multipart/MultipartEntity;->MULTIPART_CHARS:[C

    sget-object v5, Lcom/lidroid/xutils/http/client/multipart/MultipartEntity;->MULTIPART_CHARS:[C

    array-length v5, v5

    invoke-virtual {v3, v5}, Ljava/util/Random;->nextInt(I)I

    move-result v5

    aget-char v4, v4, v5

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 158
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method protected generateContentType(Ljava/lang/String;Ljava/nio/charset/Charset;)Ljava/lang/String;
    .locals 3
    .param p1, "boundary"    # Ljava/lang/String;
    .param p2, "charset"    # Ljava/nio/charset/Charset;

    .prologue
    .line 144
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 145
    .local v0, "buffer":Ljava/lang/StringBuilder;
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "multipart/"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/lidroid/xutils/http/client/multipart/MultipartEntity;->multipartSubtype:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "; boundary="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 146
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 151
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public getContent()Ljava/io/InputStream;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/UnsupportedOperationException;
        }
    .end annotation

    .prologue
    .line 220
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    .line 221
    const-string v1, "Multipart form entity does not implement #getContent()"

    .line 220
    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getContentEncoding()Lorg/apache/http/Header;
    .locals 1

    .prologue
    .line 208
    const/4 v0, 0x0

    return-object v0
.end method

.method public getContentLength()J
    .locals 2

    .prologue
    .line 196
    iget-boolean v0, p0, Lcom/lidroid/xutils/http/client/multipart/MultipartEntity;->dirty:Z

    if-eqz v0, :cond_0

    .line 197
    iget-object v0, p0, Lcom/lidroid/xutils/http/client/multipart/MultipartEntity;->multipart:Lcom/lidroid/xutils/http/client/multipart/HttpMultipart;

    invoke-virtual {v0}, Lcom/lidroid/xutils/http/client/multipart/HttpMultipart;->getTotalLength()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/lidroid/xutils/http/client/multipart/MultipartEntity;->length:J

    .line 198
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lidroid/xutils/http/client/multipart/MultipartEntity;->dirty:Z

    .line 200
    :cond_0
    iget-wide v0, p0, Lcom/lidroid/xutils/http/client/multipart/MultipartEntity;->length:J

    return-wide v0
.end method

.method public getContentType()Lorg/apache/http/Header;
    .locals 1

    .prologue
    .line 204
    iget-object v0, p0, Lcom/lidroid/xutils/http/client/multipart/MultipartEntity;->contentType:Lorg/apache/http/Header;

    return-object v0
.end method

.method public isChunked()Z
    .locals 1

    .prologue
    .line 188
    invoke-virtual {p0}, Lcom/lidroid/xutils/http/client/multipart/MultipartEntity;->isRepeatable()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public isRepeatable()Z
    .locals 8

    .prologue
    .line 178
    iget-object v2, p0, Lcom/lidroid/xutils/http/client/multipart/MultipartEntity;->multipart:Lcom/lidroid/xutils/http/client/multipart/HttpMultipart;

    invoke-virtual {v2}, Lcom/lidroid/xutils/http/client/multipart/HttpMultipart;->getBodyParts()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_1

    .line 184
    const/4 v2, 0x1

    :goto_0
    return v2

    .line 178
    :cond_1
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lidroid/xutils/http/client/multipart/FormBodyPart;

    .line 179
    .local v1, "part":Lcom/lidroid/xutils/http/client/multipart/FormBodyPart;
    invoke-virtual {v1}, Lcom/lidroid/xutils/http/client/multipart/FormBodyPart;->getBody()Lcom/lidroid/xutils/http/client/multipart/content/ContentBody;

    move-result-object v0

    .line 180
    .local v0, "body":Lcom/lidroid/xutils/http/client/multipart/content/ContentBody;
    invoke-interface {v0}, Lcom/lidroid/xutils/http/client/multipart/content/ContentBody;->getContentLength()J

    move-result-wide v4

    const-wide/16 v6, 0x0

    cmp-long v3, v4, v6

    if-gez v3, :cond_0

    .line 181
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public isStreaming()Z
    .locals 1

    .prologue
    .line 192
    invoke-virtual {p0}, Lcom/lidroid/xutils/http/client/multipart/MultipartEntity;->isRepeatable()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public setCallBackHandler(Lcom/lidroid/xutils/http/callback/RequestCallBackHandler;)V
    .locals 1
    .param p1, "callBackHandler"    # Lcom/lidroid/xutils/http/callback/RequestCallBackHandler;

    .prologue
    .line 43
    iget-object v0, p0, Lcom/lidroid/xutils/http/client/multipart/MultipartEntity;->callBackInfo:Lcom/lidroid/xutils/http/client/multipart/MultipartEntity$CallBackInfo;

    iput-object p1, v0, Lcom/lidroid/xutils/http/client/multipart/MultipartEntity$CallBackInfo;->callBackHandler:Lcom/lidroid/xutils/http/callback/RequestCallBackHandler;

    .line 44
    return-void
.end method

.method public setMultipartSubtype(Ljava/lang/String;)V
    .locals 4
    .param p1, "multipartSubtype"    # Ljava/lang/String;

    .prologue
    .line 134
    iput-object p1, p0, Lcom/lidroid/xutils/http/client/multipart/MultipartEntity;->multipartSubtype:Ljava/lang/String;

    .line 135
    iget-object v0, p0, Lcom/lidroid/xutils/http/client/multipart/MultipartEntity;->multipart:Lcom/lidroid/xutils/http/client/multipart/HttpMultipart;

    invoke-virtual {v0, p1}, Lcom/lidroid/xutils/http/client/multipart/HttpMultipart;->setSubType(Ljava/lang/String;)V

    .line 136
    new-instance v0, Lorg/apache/http/message/BasicHeader;

    .line 137
    const-string v1, "Content-Type"

    .line 138
    iget-object v2, p0, Lcom/lidroid/xutils/http/client/multipart/MultipartEntity;->boundary:Ljava/lang/String;

    iget-object v3, p0, Lcom/lidroid/xutils/http/client/multipart/MultipartEntity;->charset:Ljava/nio/charset/Charset;

    invoke-virtual {p0, v2, v3}, Lcom/lidroid/xutils/http/client/multipart/MultipartEntity;->generateContentType(Ljava/lang/String;Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/http/message/BasicHeader;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 136
    iput-object v0, p0, Lcom/lidroid/xutils/http/client/multipart/MultipartEntity;->contentType:Lorg/apache/http/Header;

    .line 139
    return-void
.end method

.method public writeTo(Ljava/io/OutputStream;)V
    .locals 4
    .param p1, "outStream"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 225
    iget-object v0, p0, Lcom/lidroid/xutils/http/client/multipart/MultipartEntity;->callBackInfo:Lcom/lidroid/xutils/http/client/multipart/MultipartEntity$CallBackInfo;

    invoke-virtual {p0}, Lcom/lidroid/xutils/http/client/multipart/MultipartEntity;->getContentLength()J

    move-result-wide v2

    iput-wide v2, v0, Lcom/lidroid/xutils/http/client/multipart/MultipartEntity$CallBackInfo;->totalLength:J

    .line 226
    iget-object v0, p0, Lcom/lidroid/xutils/http/client/multipart/MultipartEntity;->multipart:Lcom/lidroid/xutils/http/client/multipart/HttpMultipart;

    iget-object v1, p0, Lcom/lidroid/xutils/http/client/multipart/MultipartEntity;->callBackInfo:Lcom/lidroid/xutils/http/client/multipart/MultipartEntity$CallBackInfo;

    invoke-virtual {v0, p1, v1}, Lcom/lidroid/xutils/http/client/multipart/HttpMultipart;->writeTo(Ljava/io/OutputStream;Lcom/lidroid/xutils/http/client/multipart/MultipartEntity$CallBackInfo;)V

    .line 227
    return-void
.end method
