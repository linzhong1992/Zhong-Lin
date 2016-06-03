.class public Lcom/lidroid/xutils/http/RequestParams$HeaderItem;
.super Ljava/lang/Object;
.source "RequestParams.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lidroid/xutils/http/RequestParams;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "HeaderItem"
.end annotation


# instance fields
.field public final header:Lorg/apache/http/Header;

.field public final overwrite:Z

.field final synthetic this$0:Lcom/lidroid/xutils/http/RequestParams;


# direct methods
.method public constructor <init>(Lcom/lidroid/xutils/http/RequestParams;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "value"    # Ljava/lang/String;

    .prologue
    .line 321
    iput-object p1, p0, Lcom/lidroid/xutils/http/RequestParams$HeaderItem;->this$0:Lcom/lidroid/xutils/http/RequestParams;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 322
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lidroid/xutils/http/RequestParams$HeaderItem;->overwrite:Z

    .line 323
    new-instance v0, Lorg/apache/http/message/BasicHeader;

    invoke-direct {v0, p2, p3}, Lorg/apache/http/message/BasicHeader;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/lidroid/xutils/http/RequestParams$HeaderItem;->header:Lorg/apache/http/Header;

    .line 324
    return-void
.end method

.method public constructor <init>(Lcom/lidroid/xutils/http/RequestParams;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 1
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "value"    # Ljava/lang/String;
    .param p4, "overwrite"    # Z

    .prologue
    .line 326
    iput-object p1, p0, Lcom/lidroid/xutils/http/RequestParams$HeaderItem;->this$0:Lcom/lidroid/xutils/http/RequestParams;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 327
    iput-boolean p4, p0, Lcom/lidroid/xutils/http/RequestParams$HeaderItem;->overwrite:Z

    .line 328
    new-instance v0, Lorg/apache/http/message/BasicHeader;

    invoke-direct {v0, p2, p3}, Lorg/apache/http/message/BasicHeader;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/lidroid/xutils/http/RequestParams$HeaderItem;->header:Lorg/apache/http/Header;

    .line 329
    return-void
.end method

.method public constructor <init>(Lcom/lidroid/xutils/http/RequestParams;Lorg/apache/http/Header;)V
    .locals 1
    .param p2, "header"    # Lorg/apache/http/Header;

    .prologue
    .line 311
    iput-object p1, p0, Lcom/lidroid/xutils/http/RequestParams$HeaderItem;->this$0:Lcom/lidroid/xutils/http/RequestParams;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 312
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lidroid/xutils/http/RequestParams$HeaderItem;->overwrite:Z

    .line 313
    iput-object p2, p0, Lcom/lidroid/xutils/http/RequestParams$HeaderItem;->header:Lorg/apache/http/Header;

    .line 314
    return-void
.end method

.method public constructor <init>(Lcom/lidroid/xutils/http/RequestParams;Lorg/apache/http/Header;Z)V
    .locals 0
    .param p2, "header"    # Lorg/apache/http/Header;
    .param p3, "overwrite"    # Z

    .prologue
    .line 316
    iput-object p1, p0, Lcom/lidroid/xutils/http/RequestParams$HeaderItem;->this$0:Lcom/lidroid/xutils/http/RequestParams;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 317
    iput-boolean p3, p0, Lcom/lidroid/xutils/http/RequestParams$HeaderItem;->overwrite:Z

    .line 318
    iput-object p2, p0, Lcom/lidroid/xutils/http/RequestParams$HeaderItem;->header:Lorg/apache/http/Header;

    .line 319
    return-void
.end method
