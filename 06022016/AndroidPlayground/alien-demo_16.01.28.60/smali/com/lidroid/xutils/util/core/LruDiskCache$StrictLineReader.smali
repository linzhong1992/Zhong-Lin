.class Lcom/lidroid/xutils/util/core/LruDiskCache$StrictLineReader;
.super Ljava/lang/Object;
.source "LruDiskCache.java"

# interfaces
.implements Ljava/io/Closeable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lidroid/xutils/util/core/LruDiskCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "StrictLineReader"
.end annotation


# static fields
.field private static final CR:B = 0xdt

.field private static final LF:B = 0xat


# instance fields
.field private buf:[B

.field private final charset:Ljava/nio/charset/Charset;

.field private end:I

.field private final in:Ljava/io/InputStream;

.field private pos:I

.field final synthetic this$0:Lcom/lidroid/xutils/util/core/LruDiskCache;


# direct methods
.method public constructor <init>(Lcom/lidroid/xutils/util/core/LruDiskCache;Ljava/io/InputStream;)V
    .locals 1
    .param p2, "in"    # Ljava/io/InputStream;

    .prologue
    .line 1090
    const/16 v0, 0x2000

    invoke-direct {p0, p1, p2, v0}, Lcom/lidroid/xutils/util/core/LruDiskCache$StrictLineReader;-><init>(Lcom/lidroid/xutils/util/core/LruDiskCache;Ljava/io/InputStream;I)V

    .line 1091
    return-void
.end method

.method public constructor <init>(Lcom/lidroid/xutils/util/core/LruDiskCache;Ljava/io/InputStream;I)V
    .locals 2
    .param p2, "in"    # Ljava/io/InputStream;
    .param p3, "capacity"    # I

    .prologue
    .line 1102
    iput-object p1, p0, Lcom/lidroid/xutils/util/core/LruDiskCache$StrictLineReader;->this$0:Lcom/lidroid/xutils/util/core/LruDiskCache;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1070
    const-string v0, "US-ASCII"

    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    iput-object v0, p0, Lcom/lidroid/xutils/util/core/LruDiskCache$StrictLineReader;->charset:Ljava/nio/charset/Charset;

    .line 1103
    if-nez p2, :cond_0

    .line 1104
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 1106
    :cond_0
    if-gez p3, :cond_1

    .line 1107
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "capacity <= 0"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1110
    :cond_1
    iput-object p2, p0, Lcom/lidroid/xutils/util/core/LruDiskCache$StrictLineReader;->in:Ljava/io/InputStream;

    .line 1111
    new-array v0, p3, [B

    iput-object v0, p0, Lcom/lidroid/xutils/util/core/LruDiskCache$StrictLineReader;->buf:[B

    .line 1112
    return-void
.end method

.method static synthetic access$0(Lcom/lidroid/xutils/util/core/LruDiskCache$StrictLineReader;)Ljava/nio/charset/Charset;
    .locals 1

    .prologue
    .line 1070
    iget-object v0, p0, Lcom/lidroid/xutils/util/core/LruDiskCache$StrictLineReader;->charset:Ljava/nio/charset/Charset;

    return-object v0
.end method

.method private fillBuf()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 1198
    iget-object v1, p0, Lcom/lidroid/xutils/util/core/LruDiskCache$StrictLineReader;->in:Ljava/io/InputStream;

    iget-object v2, p0, Lcom/lidroid/xutils/util/core/LruDiskCache$StrictLineReader;->buf:[B

    iget-object v3, p0, Lcom/lidroid/xutils/util/core/LruDiskCache$StrictLineReader;->buf:[B

    array-length v3, v3

    invoke-virtual {v1, v2, v4, v3}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    .line 1199
    .local v0, "result":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 1200
    new-instance v1, Ljava/io/EOFException;

    invoke-direct {v1}, Ljava/io/EOFException;-><init>()V

    throw v1

    .line 1202
    :cond_0
    iput v4, p0, Lcom/lidroid/xutils/util/core/LruDiskCache$StrictLineReader;->pos:I

    .line 1203
    iput v0, p0, Lcom/lidroid/xutils/util/core/LruDiskCache$StrictLineReader;->end:I

    .line 1204
    return-void
.end method


# virtual methods
.method public close()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1122
    iget-object v1, p0, Lcom/lidroid/xutils/util/core/LruDiskCache$StrictLineReader;->in:Ljava/io/InputStream;

    monitor-enter v1

    .line 1123
    :try_start_0
    iget-object v0, p0, Lcom/lidroid/xutils/util/core/LruDiskCache$StrictLineReader;->buf:[B

    if-eqz v0, :cond_0

    .line 1124
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lidroid/xutils/util/core/LruDiskCache$StrictLineReader;->buf:[B

    .line 1125
    iget-object v0, p0, Lcom/lidroid/xutils/util/core/LruDiskCache$StrictLineReader;->in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 1122
    :cond_0
    monitor-exit v1

    .line 1128
    return-void

    .line 1122
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public readLine()Ljava/lang/String;
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v9, 0xa

    .line 1139
    iget-object v5, p0, Lcom/lidroid/xutils/util/core/LruDiskCache$StrictLineReader;->in:Ljava/io/InputStream;

    monitor-enter v5

    .line 1140
    :try_start_0
    iget-object v4, p0, Lcom/lidroid/xutils/util/core/LruDiskCache$StrictLineReader;->buf:[B

    if-nez v4, :cond_0

    .line 1141
    new-instance v4, Ljava/io/IOException;

    const-string v6, "LineReader is closed"

    invoke-direct {v4, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 1139
    :catchall_0
    move-exception v4

    monitor-exit v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v4

    .line 1147
    :cond_0
    :try_start_1
    iget v4, p0, Lcom/lidroid/xutils/util/core/LruDiskCache$StrictLineReader;->pos:I

    iget v6, p0, Lcom/lidroid/xutils/util/core/LruDiskCache$StrictLineReader;->end:I

    if-lt v4, v6, :cond_1

    .line 1148
    invoke-direct {p0}, Lcom/lidroid/xutils/util/core/LruDiskCache$StrictLineReader;->fillBuf()V

    .line 1151
    :cond_1
    iget v0, p0, Lcom/lidroid/xutils/util/core/LruDiskCache$StrictLineReader;->pos:I

    .local v0, "i":I
    :goto_0
    iget v4, p0, Lcom/lidroid/xutils/util/core/LruDiskCache$StrictLineReader;->end:I

    if-ne v0, v4, :cond_4

    .line 1161
    new-instance v2, Lcom/lidroid/xutils/util/core/LruDiskCache$StrictLineReader$1;

    iget v4, p0, Lcom/lidroid/xutils/util/core/LruDiskCache$StrictLineReader;->end:I

    iget v6, p0, Lcom/lidroid/xutils/util/core/LruDiskCache$StrictLineReader;->pos:I

    sub-int/2addr v4, v6

    add-int/lit8 v4, v4, 0x50

    invoke-direct {v2, p0, v4}, Lcom/lidroid/xutils/util/core/LruDiskCache$StrictLineReader$1;-><init>(Lcom/lidroid/xutils/util/core/LruDiskCache$StrictLineReader;I)V

    .line 1174
    .local v2, "out":Ljava/io/ByteArrayOutputStream;
    :cond_2
    iget-object v4, p0, Lcom/lidroid/xutils/util/core/LruDiskCache$StrictLineReader;->buf:[B

    iget v6, p0, Lcom/lidroid/xutils/util/core/LruDiskCache$StrictLineReader;->pos:I

    iget v7, p0, Lcom/lidroid/xutils/util/core/LruDiskCache$StrictLineReader;->end:I

    iget v8, p0, Lcom/lidroid/xutils/util/core/LruDiskCache$StrictLineReader;->pos:I

    sub-int/2addr v7, v8

    invoke-virtual {v2, v4, v6, v7}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 1176
    const/4 v4, -0x1

    iput v4, p0, Lcom/lidroid/xutils/util/core/LruDiskCache$StrictLineReader;->end:I

    .line 1177
    invoke-direct {p0}, Lcom/lidroid/xutils/util/core/LruDiskCache$StrictLineReader;->fillBuf()V

    .line 1179
    iget v0, p0, Lcom/lidroid/xutils/util/core/LruDiskCache$StrictLineReader;->pos:I

    :goto_1
    iget v4, p0, Lcom/lidroid/xutils/util/core/LruDiskCache$StrictLineReader;->end:I

    if-eq v0, v4, :cond_2

    .line 1180
    iget-object v4, p0, Lcom/lidroid/xutils/util/core/LruDiskCache$StrictLineReader;->buf:[B

    aget-byte v4, v4, v0

    if-ne v4, v9, :cond_7

    .line 1181
    iget v4, p0, Lcom/lidroid/xutils/util/core/LruDiskCache$StrictLineReader;->pos:I

    if-eq v0, v4, :cond_3

    .line 1182
    iget-object v4, p0, Lcom/lidroid/xutils/util/core/LruDiskCache$StrictLineReader;->buf:[B

    iget v6, p0, Lcom/lidroid/xutils/util/core/LruDiskCache$StrictLineReader;->pos:I

    iget v7, p0, Lcom/lidroid/xutils/util/core/LruDiskCache$StrictLineReader;->pos:I

    sub-int v7, v0, v7

    invoke-virtual {v2, v4, v6, v7}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 1184
    :cond_3
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->flush()V

    .line 1185
    add-int/lit8 v4, v0, 0x1

    iput v4, p0, Lcom/lidroid/xutils/util/core/LruDiskCache$StrictLineReader;->pos:I

    .line 1186
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->toString()Ljava/lang/String;

    move-result-object v3

    monitor-exit v5

    .end local v2    # "out":Ljava/io/ByteArrayOutputStream;
    :goto_2
    return-object v3

    .line 1152
    :cond_4
    iget-object v4, p0, Lcom/lidroid/xutils/util/core/LruDiskCache$StrictLineReader;->buf:[B

    aget-byte v4, v4, v0

    if-ne v4, v9, :cond_6

    .line 1153
    iget v4, p0, Lcom/lidroid/xutils/util/core/LruDiskCache$StrictLineReader;->pos:I

    if-eq v0, v4, :cond_5

    iget-object v4, p0, Lcom/lidroid/xutils/util/core/LruDiskCache$StrictLineReader;->buf:[B

    add-int/lit8 v6, v0, -0x1

    aget-byte v4, v4, v6

    const/16 v6, 0xd

    if-ne v4, v6, :cond_5

    add-int/lit8 v1, v0, -0x1

    .line 1154
    .local v1, "lineEnd":I
    :goto_3
    new-instance v3, Ljava/lang/String;

    iget-object v4, p0, Lcom/lidroid/xutils/util/core/LruDiskCache$StrictLineReader;->buf:[B

    iget v6, p0, Lcom/lidroid/xutils/util/core/LruDiskCache$StrictLineReader;->pos:I

    iget v7, p0, Lcom/lidroid/xutils/util/core/LruDiskCache$StrictLineReader;->pos:I

    sub-int v7, v1, v7

    iget-object v8, p0, Lcom/lidroid/xutils/util/core/LruDiskCache$StrictLineReader;->charset:Ljava/nio/charset/Charset;

    invoke-virtual {v8}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v3, v4, v6, v7, v8}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V

    .line 1155
    .local v3, "res":Ljava/lang/String;
    add-int/lit8 v4, v0, 0x1

    iput v4, p0, Lcom/lidroid/xutils/util/core/LruDiskCache$StrictLineReader;->pos:I

    .line 1156
    monitor-exit v5
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_2

    .end local v1    # "lineEnd":I
    .end local v3    # "res":Ljava/lang/String;
    :cond_5
    move v1, v0

    .line 1153
    goto :goto_3

    .line 1151
    :cond_6
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1179
    .restart local v2    # "out":Ljava/io/ByteArrayOutputStream;
    :cond_7
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method
