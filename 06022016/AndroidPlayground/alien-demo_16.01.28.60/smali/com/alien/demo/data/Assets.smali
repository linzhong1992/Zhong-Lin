.class public Lcom/alien/demo/data/Assets;
.super Ljava/lang/Object;
.source "Assets.java"


# static fields
.field private static final RFID_ASSETS_DIR:Ljava/lang/String; = "/sdcard/Alien/"

.field private static final RFID_ASSETS_FILE:Ljava/lang/String; = "/sdcard/Alien/assets.txt"

.field private static final TAG:Ljava/lang/String; = "AlienRFID-Assets"

.field private static instance:Lcom/alien/demo/data/Assets;


# instance fields
.field private assets:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/alien/demo/data/Asset;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 28
    const/4 v0, 0x0

    sput-object v0, Lcom/alien/demo/data/Assets;->instance:Lcom/alien/demo/data/Assets;

    return-void
.end method

.method private constructor <init>()V
    .locals 5

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lcom/alien/demo/data/Assets;->assets:Ljava/util/ArrayList;

    .line 39
    :try_start_0
    new-instance v2, Ljava/io/File;

    const-string v3, "/sdcard/Alien/assets.txt"

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_0

    .line 49
    :goto_0
    return-void

    .line 42
    :cond_0
    new-instance v1, Ljava/io/FileInputStream;

    const-string v2, "/sdcard/Alien/assets.txt"

    invoke-direct {v1, v2}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    .line 43
    .local v1, "in":Ljava/io/InputStream;
    invoke-virtual {p0, v1}, Lcom/alien/demo/data/Assets;->load(Ljava/io/InputStream;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 45
    .end local v1    # "in":Ljava/io/InputStream;
    :catch_0
    move-exception v0

    .line 46
    .local v0, "e":Ljava/lang/Exception;
    const-string v2, "AlienRFID-Assets"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Error init assets: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 47
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public static getInstance()Lcom/alien/demo/data/Assets;
    .locals 1

    .prologue
    .line 52
    invoke-static {}, Lcom/alien/demo/data/Assets;->init()V

    .line 53
    sget-object v0, Lcom/alien/demo/data/Assets;->instance:Lcom/alien/demo/data/Assets;

    return-object v0
.end method

.method public static init()V
    .locals 1

    .prologue
    .line 31
    sget-object v0, Lcom/alien/demo/data/Assets;->instance:Lcom/alien/demo/data/Assets;

    if-nez v0, :cond_0

    .line 32
    new-instance v0, Lcom/alien/demo/data/Assets;

    invoke-direct {v0}, Lcom/alien/demo/data/Assets;-><init>()V

    sput-object v0, Lcom/alien/demo/data/Assets;->instance:Lcom/alien/demo/data/Assets;

    .line 34
    :cond_0
    return-void
.end method


# virtual methods
.method public add(Lcom/alien/demo/data/Asset;)V
    .locals 4
    .param p1, "asset"    # Lcom/alien/demo/data/Asset;

    .prologue
    .line 93
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v2, p0, Lcom/alien/demo/data/Assets;->assets:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 94
    iget-object v2, p0, Lcom/alien/demo/data/Assets;->assets:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/alien/demo/data/Asset;

    .line 95
    .local v0, "a":Lcom/alien/demo/data/Asset;
    invoke-virtual {v0}, Lcom/alien/demo/data/Asset;->getEpc()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Lcom/alien/demo/data/Asset;->getEpc()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 96
    iget-object v2, p0, Lcom/alien/demo/data/Assets;->assets:Ljava/util/ArrayList;

    invoke-virtual {v2, v1, p1}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 101
    .end local v0    # "a":Lcom/alien/demo/data/Asset;
    :goto_1
    return-void

    .line 93
    .restart local v0    # "a":Lcom/alien/demo/data/Asset;
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 100
    .end local v0    # "a":Lcom/alien/demo/data/Asset;
    :cond_1
    iget-object v2, p0, Lcom/alien/demo/data/Assets;->assets:Ljava/util/ArrayList;

    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1
.end method

.method public getAt(I)Lcom/alien/demo/data/Asset;
    .locals 1
    .param p1, "index"    # I

    .prologue
    .line 89
    iget-object v0, p0, Lcom/alien/demo/data/Assets;->assets:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/alien/demo/data/Asset;

    return-object v0
.end method

.method public getList()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/alien/demo/data/Asset;",
            ">;"
        }
    .end annotation

    .prologue
    .line 104
    iget-object v0, p0, Lcom/alien/demo/data/Assets;->assets:Ljava/util/ArrayList;

    return-object v0
.end method

.method public load(Ljava/io/InputStream;)V
    .locals 4
    .param p1, "in"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 57
    iget-object v3, p0, Lcom/alien/demo/data/Assets;->assets:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->clear()V

    .line 58
    new-instance v2, Ljava/io/BufferedReader;

    new-instance v3, Ljava/io/InputStreamReader;

    invoke-direct {v3, p1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v2, v3}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 59
    .local v2, "reader":Ljava/io/BufferedReader;
    const/4 v1, 0x0

    .line 60
    .local v1, "line":Ljava/lang/String;
    :goto_0
    invoke-virtual {v2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 61
    invoke-static {v1}, Lcom/alien/demo/data/Asset;->loadFromString(Ljava/lang/String;)Lcom/alien/demo/data/Asset;

    move-result-object v0

    .line 62
    .local v0, "asset":Lcom/alien/demo/data/Asset;
    iget-object v3, p0, Lcom/alien/demo/data/Assets;->assets:Ljava/util/ArrayList;

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 64
    .end local v0    # "asset":Lcom/alien/demo/data/Asset;
    :cond_0
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V

    .line 65
    return-void
.end method

.method public save()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 68
    new-instance v0, Ljava/io/File;

    const-string v2, "/sdcard/Alien/"

    invoke-direct {v0, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 69
    .local v0, "dir":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 71
    new-instance v1, Ljava/io/FileOutputStream;

    const-string v2, "/sdcard/Alien/assets.txt"

    invoke-direct {v1, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 72
    .local v1, "out":Ljava/io/OutputStream;
    invoke-virtual {p0, v1}, Lcom/alien/demo/data/Assets;->save(Ljava/io/OutputStream;)V

    .line 73
    return-void
.end method

.method public save(Ljava/io/OutputStream;)V
    .locals 6
    .param p1, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 76
    new-instance v3, Ljava/io/BufferedWriter;

    new-instance v4, Ljava/io/OutputStreamWriter;

    invoke-direct {v4, p1}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;)V

    invoke-direct {v3, v4}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V

    .line 77
    .local v3, "writer":Ljava/io/BufferedWriter;
    iget-object v4, p0, Lcom/alien/demo/data/Assets;->assets:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/alien/demo/data/Asset;

    .line 78
    .local v0, "asset":Lcom/alien/demo/data/Asset;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Lcom/alien/demo/data/Asset;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 79
    .local v2, "sAsset":Ljava/lang/String;
    invoke-virtual {v3, v2}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    goto :goto_0

    .line 81
    .end local v0    # "asset":Lcom/alien/demo/data/Asset;
    .end local v2    # "sAsset":Ljava/lang/String;
    :cond_0
    invoke-virtual {v3}, Ljava/io/BufferedWriter;->close()V

    .line 82
    return-void
.end method

.method public size()I
    .locals 1

    .prologue
    .line 85
    iget-object v0, p0, Lcom/alien/demo/data/Assets;->assets:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method
