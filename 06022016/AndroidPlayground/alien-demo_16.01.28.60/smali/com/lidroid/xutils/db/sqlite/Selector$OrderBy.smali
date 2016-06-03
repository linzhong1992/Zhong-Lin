.class public Lcom/lidroid/xutils/db/sqlite/Selector$OrderBy;
.super Ljava/lang/Object;
.source "Selector.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lidroid/xutils/db/sqlite/Selector;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "OrderBy"
.end annotation


# instance fields
.field private columnName:Ljava/lang/String;

.field private desc:Z

.field final synthetic this$0:Lcom/lidroid/xutils/db/sqlite/Selector;


# direct methods
.method public constructor <init>(Lcom/lidroid/xutils/db/sqlite/Selector;Ljava/lang/String;)V
    .locals 0
    .param p2, "columnName"    # Ljava/lang/String;

    .prologue
    .line 156
    iput-object p1, p0, Lcom/lidroid/xutils/db/sqlite/Selector$OrderBy;->this$0:Lcom/lidroid/xutils/db/sqlite/Selector;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 157
    iput-object p2, p0, Lcom/lidroid/xutils/db/sqlite/Selector$OrderBy;->columnName:Ljava/lang/String;

    .line 158
    return-void
.end method

.method public constructor <init>(Lcom/lidroid/xutils/db/sqlite/Selector;Ljava/lang/String;Z)V
    .locals 0
    .param p2, "columnName"    # Ljava/lang/String;
    .param p3, "desc"    # Z

    .prologue
    .line 160
    iput-object p1, p0, Lcom/lidroid/xutils/db/sqlite/Selector$OrderBy;->this$0:Lcom/lidroid/xutils/db/sqlite/Selector;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 161
    iput-object p2, p0, Lcom/lidroid/xutils/db/sqlite/Selector$OrderBy;->columnName:Ljava/lang/String;

    .line 162
    iput-boolean p3, p0, Lcom/lidroid/xutils/db/sqlite/Selector$OrderBy;->desc:Z

    .line 163
    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 167
    new-instance v1, Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/lidroid/xutils/db/sqlite/Selector$OrderBy;->columnName:Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/lidroid/xutils/db/sqlite/Selector$OrderBy;->desc:Z

    if-eqz v0, :cond_0

    const-string v0, " DESC"

    :goto_0
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    const-string v0, " ASC"

    goto :goto_0
.end method
