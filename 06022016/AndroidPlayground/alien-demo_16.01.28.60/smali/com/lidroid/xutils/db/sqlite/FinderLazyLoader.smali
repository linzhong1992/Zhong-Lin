.class public Lcom/lidroid/xutils/db/sqlite/FinderLazyLoader;
.super Ljava/lang/Object;
.source "FinderLazyLoader.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private final finderColumn:Lcom/lidroid/xutils/db/table/Finder;

.field private final finderValue:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lcom/lidroid/xutils/db/table/Finder;Ljava/lang/Object;)V
    .locals 1
    .param p1, "finderColumn"    # Lcom/lidroid/xutils/db/table/Finder;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 24
    .local p0, "this":Lcom/lidroid/xutils/db/sqlite/FinderLazyLoader;, "Lcom/lidroid/xutils/db/sqlite/FinderLazyLoader<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    iput-object p1, p0, Lcom/lidroid/xutils/db/sqlite/FinderLazyLoader;->finderColumn:Lcom/lidroid/xutils/db/table/Finder;

    .line 26
    invoke-static {p2}, Lcom/lidroid/xutils/db/table/ColumnUtils;->convert2DbColumnValueIfNeeded(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lcom/lidroid/xutils/db/sqlite/FinderLazyLoader;->finderValue:Ljava/lang/Object;

    .line 27
    return-void
.end method

.method public constructor <init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 1
    .param p2, "fieldName"    # Ljava/lang/String;
    .param p3, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    .prologue
    .line 19
    .local p0, "this":Lcom/lidroid/xutils/db/sqlite/FinderLazyLoader;, "Lcom/lidroid/xutils/db/sqlite/FinderLazyLoader<TT;>;"
    .local p1, "entityType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    invoke-static {p1, p2}, Lcom/lidroid/xutils/db/table/TableUtils;->getColumnOrId(Ljava/lang/Class;Ljava/lang/String;)Lcom/lidroid/xutils/db/table/Column;

    move-result-object v0

    check-cast v0, Lcom/lidroid/xutils/db/table/Finder;

    iput-object v0, p0, Lcom/lidroid/xutils/db/sqlite/FinderLazyLoader;->finderColumn:Lcom/lidroid/xutils/db/table/Finder;

    .line 21
    invoke-static {p3}, Lcom/lidroid/xutils/db/table/ColumnUtils;->convert2DbColumnValueIfNeeded(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lcom/lidroid/xutils/db/sqlite/FinderLazyLoader;->finderValue:Ljava/lang/Object;

    .line 22
    return-void
.end method


# virtual methods
.method public getAllFromDb()Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lidroid/xutils/exception/DbException;
        }
    .end annotation

    .prologue
    .line 30
    .local p0, "this":Lcom/lidroid/xutils/db/sqlite/FinderLazyLoader;, "Lcom/lidroid/xutils/db/sqlite/FinderLazyLoader<TT;>;"
    const/4 v0, 0x0

    .line 31
    .local v0, "entities":Ljava/util/List;, "Ljava/util/List<TT;>;"
    iget-object v1, p0, Lcom/lidroid/xutils/db/sqlite/FinderLazyLoader;->finderColumn:Lcom/lidroid/xutils/db/table/Finder;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/lidroid/xutils/db/sqlite/FinderLazyLoader;->finderColumn:Lcom/lidroid/xutils/db/table/Finder;

    iget-object v1, v1, Lcom/lidroid/xutils/db/table/Finder;->db:Lcom/lidroid/xutils/DbUtils;

    if-eqz v1, :cond_0

    .line 32
    iget-object v1, p0, Lcom/lidroid/xutils/db/sqlite/FinderLazyLoader;->finderColumn:Lcom/lidroid/xutils/db/table/Finder;

    iget-object v1, v1, Lcom/lidroid/xutils/db/table/Finder;->db:Lcom/lidroid/xutils/DbUtils;

    .line 33
    iget-object v2, p0, Lcom/lidroid/xutils/db/sqlite/FinderLazyLoader;->finderColumn:Lcom/lidroid/xutils/db/table/Finder;

    invoke-virtual {v2}, Lcom/lidroid/xutils/db/table/Finder;->getTargetEntityType()Ljava/lang/Class;

    move-result-object v2

    invoke-static {v2}, Lcom/lidroid/xutils/db/sqlite/Selector;->from(Ljava/lang/Class;)Lcom/lidroid/xutils/db/sqlite/Selector;

    move-result-object v2

    .line 34
    iget-object v3, p0, Lcom/lidroid/xutils/db/sqlite/FinderLazyLoader;->finderColumn:Lcom/lidroid/xutils/db/table/Finder;

    invoke-virtual {v3}, Lcom/lidroid/xutils/db/table/Finder;->getTargetColumnName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "="

    iget-object v5, p0, Lcom/lidroid/xutils/db/sqlite/FinderLazyLoader;->finderValue:Ljava/lang/Object;

    invoke-virtual {v2, v3, v4, v5}, Lcom/lidroid/xutils/db/sqlite/Selector;->where(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)Lcom/lidroid/xutils/db/sqlite/Selector;

    move-result-object v2

    .line 32
    invoke-virtual {v1, v2}, Lcom/lidroid/xutils/DbUtils;->findAll(Lcom/lidroid/xutils/db/sqlite/Selector;)Ljava/util/List;

    move-result-object v0

    .line 36
    :cond_0
    return-object v0
.end method

.method public getFirstFromDb()Ljava/lang/Object;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lidroid/xutils/exception/DbException;
        }
    .end annotation

    .prologue
    .line 40
    .local p0, "this":Lcom/lidroid/xutils/db/sqlite/FinderLazyLoader;, "Lcom/lidroid/xutils/db/sqlite/FinderLazyLoader<TT;>;"
    const/4 v0, 0x0

    .line 41
    .local v0, "entity":Ljava/lang/Object;, "TT;"
    iget-object v1, p0, Lcom/lidroid/xutils/db/sqlite/FinderLazyLoader;->finderColumn:Lcom/lidroid/xutils/db/table/Finder;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/lidroid/xutils/db/sqlite/FinderLazyLoader;->finderColumn:Lcom/lidroid/xutils/db/table/Finder;

    iget-object v1, v1, Lcom/lidroid/xutils/db/table/Finder;->db:Lcom/lidroid/xutils/DbUtils;

    if-eqz v1, :cond_0

    .line 42
    iget-object v1, p0, Lcom/lidroid/xutils/db/sqlite/FinderLazyLoader;->finderColumn:Lcom/lidroid/xutils/db/table/Finder;

    iget-object v1, v1, Lcom/lidroid/xutils/db/table/Finder;->db:Lcom/lidroid/xutils/DbUtils;

    .line 43
    iget-object v2, p0, Lcom/lidroid/xutils/db/sqlite/FinderLazyLoader;->finderColumn:Lcom/lidroid/xutils/db/table/Finder;

    invoke-virtual {v2}, Lcom/lidroid/xutils/db/table/Finder;->getTargetEntityType()Ljava/lang/Class;

    move-result-object v2

    invoke-static {v2}, Lcom/lidroid/xutils/db/sqlite/Selector;->from(Ljava/lang/Class;)Lcom/lidroid/xutils/db/sqlite/Selector;

    move-result-object v2

    .line 44
    iget-object v3, p0, Lcom/lidroid/xutils/db/sqlite/FinderLazyLoader;->finderColumn:Lcom/lidroid/xutils/db/table/Finder;

    invoke-virtual {v3}, Lcom/lidroid/xutils/db/table/Finder;->getTargetColumnName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "="

    iget-object v5, p0, Lcom/lidroid/xutils/db/sqlite/FinderLazyLoader;->finderValue:Ljava/lang/Object;

    invoke-virtual {v2, v3, v4, v5}, Lcom/lidroid/xutils/db/sqlite/Selector;->where(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)Lcom/lidroid/xutils/db/sqlite/Selector;

    move-result-object v2

    .line 42
    invoke-virtual {v1, v2}, Lcom/lidroid/xutils/DbUtils;->findFirst(Lcom/lidroid/xutils/db/sqlite/Selector;)Ljava/lang/Object;

    move-result-object v0

    .line 46
    .end local v0    # "entity":Ljava/lang/Object;, "TT;"
    :cond_0
    return-object v0
.end method
