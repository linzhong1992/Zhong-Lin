.class public Lcom/lidroid/xutils/bitmap/download/DefaultDownloader;
.super Lcom/lidroid/xutils/bitmap/download/Downloader;
.source "DefaultDownloader.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 30
    invoke-direct {p0}, Lcom/lidroid/xutils/bitmap/download/Downloader;-><init>()V

    return-void
.end method


# virtual methods
.method public downloadToStream(Ljava/lang/String;Ljava/io/OutputStream;Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask;)J
    .locals 24
    .param p1, "uri"    # Ljava/lang/String;
    .param p2, "outputStream"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/io/OutputStream;",
            "Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask",
            "<*>;)J"
        }
    .end annotation

    .prologue
    .line 43
    .local p3, "task":Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask;, "Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask<*>;"
    if-eqz p3, :cond_0

    invoke-virtual/range {p3 .. p3}, Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask;->isCancelled()Z

    move-result v19

    if-nez v19, :cond_0

    invoke-virtual/range {p3 .. p3}, Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask;->getTargetContainer()Landroid/view/View;

    move-result-object v19

    if-nez v19, :cond_1

    :cond_0
    const-wide/16 v16, -0x1

    .line 92
    :goto_0
    return-wide v16

    .line 45
    :cond_1
    const/16 v18, 0x0

    .line 46
    .local v18, "urlConnection":Ljava/net/URLConnection;
    const/4 v4, 0x0

    .line 48
    .local v4, "bis":Ljava/io/BufferedInputStream;
    invoke-static {}, Lcom/lidroid/xutils/util/OtherUtils;->trustAllSSLForHttpsURLConnection()V

    .line 50
    const-wide/16 v16, -0x1

    .line 51
    .local v16, "result":J
    const-wide/16 v12, 0x0

    .line 52
    .local v12, "fileLen":J
    const-wide/16 v8, 0x0

    .line 54
    .local v8, "currCount":J
    :try_start_0
    const-string v19, "/"

    move-object/from16 v0, p1

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_3

    .line 55
    new-instance v10, Ljava/io/FileInputStream;

    move-object/from16 v0, p1

    invoke-direct {v10, v0}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    .line 56
    .local v10, "fileInputStream":Ljava/io/FileInputStream;
    invoke-virtual {v10}, Ljava/io/FileInputStream;->available()I

    move-result v19

    move/from16 v0, v19

    int-to-long v12, v0

    .line 57
    new-instance v5, Ljava/io/BufferedInputStream;

    invoke-direct {v5, v10}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 58
    .end local v4    # "bis":Ljava/io/BufferedInputStream;
    .local v5, "bis":Ljava/io/BufferedInputStream;
    :try_start_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v20

    invoke-virtual/range {p0 .. p0}, Lcom/lidroid/xutils/bitmap/download/DefaultDownloader;->getDefaultExpiry()J
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-result-wide v22

    add-long v16, v20, v22

    move-object v4, v5

    .line 75
    .end local v5    # "bis":Ljava/io/BufferedInputStream;
    .end local v10    # "fileInputStream":Ljava/io/FileInputStream;
    .restart local v4    # "bis":Ljava/io/BufferedInputStream;
    :goto_1
    :try_start_2
    invoke-virtual/range {p3 .. p3}, Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask;->isCancelled()Z

    move-result v19

    if-nez v19, :cond_2

    invoke-virtual/range {p3 .. p3}, Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask;->getTargetContainer()Landroid/view/View;
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-object v19

    if-nez v19, :cond_6

    .line 90
    :cond_2
    invoke-static {v4}, Lcom/lidroid/xutils/util/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    .line 75
    const-wide/16 v16, -0x1

    goto :goto_0

    .line 59
    :cond_3
    :try_start_3
    const-string v19, "assets/"

    move-object/from16 v0, p1

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_4

    .line 60
    invoke-virtual/range {p0 .. p0}, Lcom/lidroid/xutils/bitmap/download/DefaultDownloader;->getContext()Landroid/content/Context;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v19

    const/16 v20, 0x7

    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->length()I

    move-result v21

    move-object/from16 v0, p1

    move/from16 v1, v20

    move/from16 v2, v21

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v11

    .line 61
    .local v11, "inputStream":Ljava/io/InputStream;
    invoke-virtual {v11}, Ljava/io/InputStream;->available()I

    move-result v19

    move/from16 v0, v19

    int-to-long v12, v0

    .line 62
    new-instance v5, Ljava/io/BufferedInputStream;

    invoke-direct {v5, v11}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 63
    .end local v4    # "bis":Ljava/io/BufferedInputStream;
    .restart local v5    # "bis":Ljava/io/BufferedInputStream;
    const-wide v16, 0x7fffffffffffffffL

    move-object v4, v5

    .line 64
    .end local v5    # "bis":Ljava/io/BufferedInputStream;
    .restart local v4    # "bis":Ljava/io/BufferedInputStream;
    goto :goto_1

    .line 65
    .end local v11    # "inputStream":Ljava/io/InputStream;
    :cond_4
    new-instance v15, Ljava/net/URL;

    move-object/from16 v0, p1

    invoke-direct {v15, v0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 66
    .local v15, "url":Ljava/net/URL;
    invoke-virtual {v15}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v18

    .line 67
    invoke-virtual/range {p0 .. p0}, Lcom/lidroid/xutils/bitmap/download/DefaultDownloader;->getDefaultConnectTimeout()I

    move-result v19

    invoke-virtual/range {v18 .. v19}, Ljava/net/URLConnection;->setConnectTimeout(I)V

    .line 68
    invoke-virtual/range {p0 .. p0}, Lcom/lidroid/xutils/bitmap/download/DefaultDownloader;->getDefaultReadTimeout()I

    move-result v19

    invoke-virtual/range {v18 .. v19}, Ljava/net/URLConnection;->setReadTimeout(I)V

    .line 69
    new-instance v5, Ljava/io/BufferedInputStream;

    invoke-virtual/range {v18 .. v18}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-direct {v5, v0}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 70
    .end local v4    # "bis":Ljava/io/BufferedInputStream;
    .restart local v5    # "bis":Ljava/io/BufferedInputStream;
    :try_start_4
    invoke-virtual/range {v18 .. v18}, Ljava/net/URLConnection;->getExpiration()J

    move-result-wide v16

    .line 71
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v20

    cmp-long v19, v16, v20

    if-gez v19, :cond_5

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v20

    invoke-virtual/range {p0 .. p0}, Lcom/lidroid/xutils/bitmap/download/DefaultDownloader;->getDefaultExpiry()J

    move-result-wide v22

    add-long v16, v20, v22

    .line 72
    :cond_5
    invoke-virtual/range {v18 .. v18}, Ljava/net/URLConnection;->getContentLength()I
    :try_end_4
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    move-result v19

    move/from16 v0, v19

    int-to-long v12, v0

    move-object v4, v5

    .end local v5    # "bis":Ljava/io/BufferedInputStream;
    .restart local v4    # "bis":Ljava/io/BufferedInputStream;
    goto/16 :goto_1

    .line 77
    .end local v15    # "url":Ljava/net/URL;
    :cond_6
    const/16 v19, 0x1000

    :try_start_5
    move/from16 v0, v19

    new-array v6, v0, [B

    .line 78
    .local v6, "buffer":[B
    const/4 v14, 0x0

    .line 79
    .local v14, "len":I
    :goto_2
    invoke-virtual {v4, v6}, Ljava/io/BufferedInputStream;->read([B)I

    move-result v14

    const/16 v19, -0x1

    move/from16 v0, v19

    if-ne v14, v0, :cond_7

    .line 85
    invoke-virtual/range {p2 .. p2}, Ljava/io/OutputStream;->flush()V
    :try_end_5
    .catch Ljava/lang/Throwable; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 90
    invoke-static {v4}, Lcom/lidroid/xutils/util/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    goto/16 :goto_0

    .line 80
    :cond_7
    const/16 v19, 0x0

    :try_start_6
    move-object/from16 v0, p2

    move/from16 v1, v19

    invoke-virtual {v0, v6, v1, v14}, Ljava/io/OutputStream;->write([BII)V

    .line 81
    int-to-long v0, v14

    move-wide/from16 v20, v0

    add-long v8, v8, v20

    .line 82
    invoke-virtual/range {p3 .. p3}, Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask;->isCancelled()Z

    move-result v19

    if-nez v19, :cond_8

    invoke-virtual/range {p3 .. p3}, Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask;->getTargetContainer()Landroid/view/View;
    :try_end_6
    .catch Ljava/lang/Throwable; {:try_start_6 .. :try_end_6} :catch_0
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    move-result-object v19

    if-nez v19, :cond_9

    .line 90
    :cond_8
    invoke-static {v4}, Lcom/lidroid/xutils/util/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    .line 82
    const-wide/16 v16, -0x1

    goto/16 :goto_0

    .line 83
    :cond_9
    :try_start_7
    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13, v8, v9}, Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask;->updateProgress(JJ)V
    :try_end_7
    .catch Ljava/lang/Throwable; {:try_start_7 .. :try_end_7} :catch_0
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    goto :goto_2

    .line 86
    .end local v6    # "buffer":[B
    .end local v14    # "len":I
    :catch_0
    move-exception v7

    .line 87
    .local v7, "e":Ljava/lang/Throwable;
    :goto_3
    const-wide/16 v16, -0x1

    .line 88
    :try_start_8
    invoke-virtual {v7}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-static {v0, v7}, Lcom/lidroid/xutils/util/LogUtils;->e(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 90
    invoke-static {v4}, Lcom/lidroid/xutils/util/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    goto/16 :goto_0

    .line 89
    .end local v7    # "e":Ljava/lang/Throwable;
    :catchall_0
    move-exception v19

    .line 90
    :goto_4
    invoke-static {v4}, Lcom/lidroid/xutils/util/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    .line 91
    throw v19

    .line 89
    .end local v4    # "bis":Ljava/io/BufferedInputStream;
    .restart local v5    # "bis":Ljava/io/BufferedInputStream;
    :catchall_1
    move-exception v19

    move-object v4, v5

    .end local v5    # "bis":Ljava/io/BufferedInputStream;
    .restart local v4    # "bis":Ljava/io/BufferedInputStream;
    goto :goto_4

    .line 86
    .end local v4    # "bis":Ljava/io/BufferedInputStream;
    .restart local v5    # "bis":Ljava/io/BufferedInputStream;
    :catch_1
    move-exception v7

    move-object v4, v5

    .end local v5    # "bis":Ljava/io/BufferedInputStream;
    .restart local v4    # "bis":Ljava/io/BufferedInputStream;
    goto :goto_3
.end method
