.class public Lcom/lidroid/xutils/db/sqlite/ForeignLazyLoader;
.super Ljava/lang/Object;
.source "ForeignLazyLoader.java"


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
.field private columnValue:Ljava/lang/Object;

.field private final foreignColumn:Lcom/lidroid/xutils/db/table/Foreign;


# direct methods
.method public constructor <init>(Lcom/lidroid/xutils/db/table/Foreign;Ljava/lang/Object;)V
    .locals 1
    .param p1, "foreignColumn"    # Lcom/lidroid/xutils/db/table/Foreign;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 34
    .local p0, "this":Lcom/lidroid/xutils/db/sqlite/ForeignLazyLoader;, "Lcom/lidroid/xutils/db/sqlite/ForeignLazyLoader<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    iput-object p1, p0, Lcom/lidroid/xutils/db/sqlite/ForeignLazyLoader;->foreignColumn:Lcom/lidroid/xutils/db/table/Foreign;

    .line 36
    invoke-static {p2}, Lcom/lidroid/xutils/db/table/ColumnUtils;->convert2DbColumnValueIfNeeded(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lcom/lidroid/xutils/db/sqlite/ForeignLazyLoader;->columnValue:Ljava/lang/Object;

    .line 37
    return-void
.end method

.method public constructor <init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 1
    .param p2, "columnName"    # Ljava/lang/String;
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
    .line 29
    .local p0, "this":Lcom/lidroid/xutils/db/sqlite/ForeignLazyLoader;, "Lcom/lidroid/xutils/db/sqlite/ForeignLazyLoader<TT;>;"
    .local p1, "entityType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    invoke-static {p1, p2}, Lcom/lidroid/xutils/db/table/TableUtils;->getColumnOrId(Ljava/lang/Class;Ljava/lang/String;)Lcom/lidroid/xutils/db/table/Column;

    move-result-object v0

    check-cast v0, Lcom/lidroid/xutils/db/table/Foreign;

    iput-object v0, p0, Lcom/lidroid/xutils/db/sqlite/ForeignLazyLoader;->foreignColumn:Lcom/lidroid/xutils/db/table/Foreign;

    .line 31
    invoke-static {p3}, Lcom/lidroid/xutils/db/table/ColumnUtils;->convert2DbColumnValueIfNeeded(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lcom/lidroid/xutils/db/sqlite/ForeignLazyLoader;->columnValue:Ljava/lang/Object;

    .line 32
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
    .line 40
    .local p0, "this":Lcom/lidroid/xutils/db/sqlite/ForeignLazyLoader;, "Lcom/lidroid/xutils/db/sqlite/ForeignLazyLoader<TT;>;"
    const/4 v0, 0x0

    .line 41
    .local v0, "entities":Ljava/util/List;, "Ljava/util/List<TT;>;"
    iget-object v1, p0, Lcom/lidroid/xutils/db/sqlite/ForeignLazyLoader;->foreignColumn:Lcom/lidroid/xutils/db/table/Foreign;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/lidroid/xutils/db/sqlite/ForeignLazyLoader;->foreignColumn:Lcom/lidroid/xutils/db/table/Foreign;

    iget-object v1, v1, Lcom/lidroid/xutils/db/table/Foreign;->db:Lcom/lidroid/xutils/DbUtils;

    if-eqz v1, :cond_0

    .line 42
    iget-object v1, p0, Lcom/lidroid/xutils/db/sqlite/ForeignLazyLoader;->foreignColumn:Lcom/lidroid/xutils/db/table/Foreign;

    iget-object v1, v1, Lcom/lidroid/xutils/db/table/Foreign;->db:Lcom/lidroid/xutils/DbUtils;

    .line 43
    iget-object v2, p0, Lcom/lidroid/xutils/db/sqlite/ForeignLazyLoader;->foreignColumn:Lcom/lidroid/xutils/db/table/Foreign;

    invoke-virtual {v2}, Lcom/lidroid/xutils/db/table/Foreign;->getForeignEntityType()Ljava/lang/Class;

    move-result-object v2

    invoke-static {v2}, Lcom/lidroid/xutils/db/sqlite/Selector;->from(Ljava/lang/Class;)Lcom/lidroid/xutils/db/sqlite/Selector;

    move-result-object v2

    .line 44
    iget-object v3, p0, Lcom/lidroid/xutils/db/sqlite/ForeignLazyLoader;->foreignColumn:Lcom/lidroid/xutils/db/table/Foreign;

    invoke-virtual {v3}, Lcom/lidroid/xutils/db/table/Foreign;->getForeignColumnName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "="

    iget-object v5, p0, Lcom/lidroid/xutils/db/sqlite/ForeignLazyLoader;->columnValue:Ljava/lang/Object;

    invoke-virtual {v2, v3, v4, v5}, Lcom/lidroid/xutils/db/sqlite/Selector;->where(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)Lcom/lidroid/xutils/db/sqlite/Selector;

    move-result-object v2

    .line 42
    invoke-virtual {v1, v2}, Lcom/lidroid/xutils/DbUtils;->findAll(Lcom/lidroid/xutils/db/sqlite/Selector;)Ljava/util/List;

    move-result-object v0

    .line 46
    :cond_0
    return-object v0
.end method

.method public getColumnValue()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 64
    .local p0, "this":Lcom/lidroid/xutils/db/sqlite/ForeignLazyLoader;, "Lcom/lidroid/xutils/db/sqlite/ForeignLazyLoader<TT;>;"
    iget-object v0, p0, Lcom/lidroid/xutils/db/sqlite/ForeignLazyLoader;->columnValue:Ljava/lang/Object;

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
    .line 50
    .local p0, "this":Lcom/lidroid/xutils/db/sqlite/ForeignLazyLoader;, "Lcom/lidroid/xutils/db/sqlite/ForeignLazyLoader<TT;>;"
    const/4 v0, 0x0

    .line 51
    .local v0, "entity":Ljava/lang/Object;, "TT;"
    iget-object v1, p0, Lcom/lidroid/xutils/db/sqlite/ForeignLazyLoader;->foreignColumn:Lcom/lidroid/xutils/db/table/Foreign;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/lidroid/xutils/db/sqlite/ForeignLazyLoader;->foreignColumn:Lcom/lidroid/xutils/db/table/Foreign;

    iget-object v1, v1, Lcom/lidroid/xutils/db/table/Foreign;->db:Lcom/lidroid/xutils/DbUtils;

    if-eqz v1, :cond_0

    .line 52
    iget-object v1, p0, Lcom/lidroid/xutils/db/sqlite/ForeignLazyLoader;->foreignColumn:Lcom/lidroid/xutils/db/table/Foreign;

    iget-object v1, v1, Lcom/lidroid/xutils/db/table/Foreign;->db:Lcom/lidroid/xutils/DbUtils;

    .line 53
    iget-object v2, p0, Lcom/lidroid/xutils/db/sqlite/ForeignLazyLoader;->foreignColumn:Lcom/lidroid/xutils/db/table/Foreign;

    invoke-virtual {v2}, Lcom/lidroid/xutils/db/table/Foreign;->getForeignEntityType()Ljava/lang/Class;

    move-result-object v2

    invoke-static {v2}, Lcom/lidroid/xutils/db/sqlite/Selector;->from(Ljava/lang/Class;)Lcom/lidroid/xutils/db/sqlite/Selector;

    move-result-object v2

    .line 54
    iget-object v3, p0, Lcom/lidroid/xutils/db/sqlite/ForeignLazyLoader;->foreignColumn:Lcom/lidroid/xutils/db/table/Foreign;

    invoke-virtual {v3}, Lcom/lidroid/xutils/db/table/Foreign;->getForeignColumnName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "="

    iget-object v5, p0, Lcom/lidroid/xutils/db/sqlite/ForeignLazyLoader;->columnValue:Ljava/lang/Object;

    invoke-virtual {v2, v3, v4, v5}, Lcom/lidroid/xutils/db/sqlite/Selector;->where(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)Lcom/lidroid/xutils/db/sqlite/Selector;

    move-result-object v2

    .line 52
    invoke-virtual {v1, v2}, Lcom/lidroid/xutils/DbUtils;->findFirst(Lcom/lidroid/xutils/db/sqlite/Selector;)Ljava/lang/Object;

    move-result-object v0

    .line 56
    .end local v0    # "entity":Ljava/lang/Object;, "TT;"
    :cond_0
    return-object v0
.end method

.method public setColumnValue(Ljava/lang/Object;)V
    .locals 1
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .line 60
    .local p0, "this":Lcom/lidroid/xutils/db/sqlite/ForeignLazyLoader;, "Lcom/lidroid/xutils/db/sqlite/ForeignLazyLoader<TT;>;"
    invoke-static {p1}, Lcom/lidroid/xutils/db/table/ColumnUtils;->convert2DbColumnValueIfNeeded(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lcom/lidroid/xutils/db/sqlite/ForeignLazyLoader;->columnValue:Ljava/lang/Object;

    .line 61
    return-void
.end method
