.class public Lcom/lidroid/xutils/db/sqlite/CursorUtils;
.super Ljava/lang/Object;
.source "CursorUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lidroid/xutils/db/sqlite/CursorUtils$EntityTempCache;,
        Lcom/lidroid/xutils/db/sqlite/CursorUtils$FindCacheSequence;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getDbModel(Landroid/database/Cursor;)Lcom/lidroid/xutils/db/table/DbModel;
    .locals 5
    .param p0, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 76
    const/4 v2, 0x0

    .line 77
    .local v2, "result":Lcom/lidroid/xutils/db/table/DbModel;
    if-eqz p0, :cond_0

    .line 78
    new-instance v2, Lcom/lidroid/xutils/db/table/DbModel;

    .end local v2    # "result":Lcom/lidroid/xutils/db/table/DbModel;
    invoke-direct {v2}, Lcom/lidroid/xutils/db/table/DbModel;-><init>()V

    .line 79
    .restart local v2    # "result":Lcom/lidroid/xutils/db/table/DbModel;
    invoke-interface {p0}, Landroid/database/Cursor;->getColumnCount()I

    move-result v0

    .line 80
    .local v0, "columnCount":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-lt v1, v0, :cond_1

    .line 84
    .end local v0    # "columnCount":I
    .end local v1    # "i":I
    :cond_0
    return-object v2

    .line 81
    .restart local v0    # "columnCount":I
    .restart local v1    # "i":I
    :cond_1
    invoke-interface {p0, v1}, Landroid/database/Cursor;->getColumnName(I)Ljava/lang/String;

    move-result-object v3

    invoke-interface {p0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lcom/lidroid/xutils/db/table/DbModel;->add(Ljava/lang/String;Ljava/lang/String;)V

    .line 80
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method public static getEntity(Lcom/lidroid/xutils/DbUtils;Landroid/database/Cursor;Ljava/lang/Class;J)Ljava/lang/Object;
    .locals 19
    .param p0, "db"    # Lcom/lidroid/xutils/DbUtils;
    .param p1, "cursor"    # Landroid/database/Cursor;
    .param p3, "findCacheSequence"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/lidroid/xutils/DbUtils;",
            "Landroid/database/Cursor;",
            "Ljava/lang/Class",
            "<TT;>;J)TT;"
        }
    .end annotation

    .prologue
    .line 28
    .local p2, "entityType":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    if-eqz p0, :cond_0

    if-nez p1, :cond_2

    :cond_0
    const/4 v6, 0x0

    .line 72
    :cond_1
    :goto_0
    return-object v6

    .line 30
    :cond_2
    invoke-static/range {p3 .. p4}, Lcom/lidroid/xutils/db/sqlite/CursorUtils$EntityTempCache;->setSeq(J)V

    .line 32
    :try_start_0
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-static {v0, v1}, Lcom/lidroid/xutils/db/table/Table;->get(Lcom/lidroid/xutils/DbUtils;Ljava/lang/Class;)Lcom/lidroid/xutils/db/table/Table;

    move-result-object v14

    .line 33
    .local v14, "table":Lcom/lidroid/xutils/db/table/Table;
    invoke-virtual {v14}, Lcom/lidroid/xutils/db/table/Table;->getId()Lcom/lidroid/xutils/db/table/Id;

    move-result-object v10

    .line 34
    .local v10, "id":Lcom/lidroid/xutils/db/table/Id;
    invoke-virtual {v10}, Lcom/lidroid/xutils/db/table/Id;->getColumnName()Ljava/lang/String;

    move-result-object v11

    .line 35
    .local v11, "idColumnName":Ljava/lang/String;
    move-object/from16 v0, p1

    invoke-interface {v0, v11}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v12

    .line 36
    .local v12, "idIndex":I
    move-object/from16 v0, p1

    invoke-interface {v0, v12}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v13

    .line 37
    .local v13, "idStr":Ljava/lang/String;
    move-object/from16 v0, p2

    invoke-static {v0, v13}, Lcom/lidroid/xutils/db/sqlite/CursorUtils$EntityTempCache;->get(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    .line 38
    .local v6, "entity":Ljava/lang/Object;, "TT;"
    if-nez v6, :cond_1

    .line 39
    invoke-virtual/range {p2 .. p2}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v6

    .line 40
    move-object/from16 v0, p1

    invoke-virtual {v10, v6, v0, v12}, Lcom/lidroid/xutils/db/table/Id;->setValue2Entity(Ljava/lang/Object;Landroid/database/Cursor;I)V

    .line 41
    invoke-static {v6, v13}, Lcom/lidroid/xutils/db/sqlite/CursorUtils$EntityTempCache;->put(Ljava/lang/Object;Ljava/lang/String;)V

    .line 45
    invoke-interface/range {p1 .. p1}, Landroid/database/Cursor;->getColumnCount()I

    move-result v3

    .line 46
    .local v3, "columnCount":I
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_1
    if-lt v9, v3, :cond_4

    .line 60
    iget-object v15, v14, Lcom/lidroid/xutils/db/table/Table;->columnMap:Ljava/util/HashMap;

    invoke-virtual {v15}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v15

    invoke-interface {v15}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v15

    :cond_3
    :goto_2
    invoke-interface {v15}, Ljava/util/Iterator;->hasNext()Z

    move-result v16

    if-eqz v16, :cond_1

    invoke-interface {v15}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/lidroid/xutils/db/table/Column;

    .line 61
    .local v2, "column":Lcom/lidroid/xutils/db/table/Column;
    instance-of v0, v2, Lcom/lidroid/xutils/db/table/Finder;

    move/from16 v16, v0

    if-eqz v16, :cond_3

    .line 62
    move-object v0, v2

    check-cast v0, Lcom/lidroid/xutils/db/table/Finder;

    move-object v7, v0

    .line 63
    .local v7, "finder":Lcom/lidroid/xutils/db/table/Finder;
    move-object/from16 v0, p0

    iput-object v0, v7, Lcom/lidroid/xutils/db/table/Finder;->db:Lcom/lidroid/xutils/DbUtils;

    .line 64
    const/16 v16, 0x0

    const/16 v17, 0x0

    move-object/from16 v0, v16

    move/from16 v1, v17

    invoke-virtual {v7, v6, v0, v1}, Lcom/lidroid/xutils/db/table/Finder;->setValue2Entity(Ljava/lang/Object;Landroid/database/Cursor;I)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    .line 68
    .end local v2    # "column":Lcom/lidroid/xutils/db/table/Column;
    .end local v3    # "columnCount":I
    .end local v6    # "entity":Ljava/lang/Object;, "TT;"
    .end local v7    # "finder":Lcom/lidroid/xutils/db/table/Finder;
    .end local v9    # "i":I
    .end local v10    # "id":Lcom/lidroid/xutils/db/table/Id;
    .end local v11    # "idColumnName":Ljava/lang/String;
    .end local v12    # "idIndex":I
    .end local v13    # "idStr":Ljava/lang/String;
    .end local v14    # "table":Lcom/lidroid/xutils/db/table/Table;
    :catch_0
    move-exception v5

    .line 69
    .local v5, "e":Ljava/lang/Throwable;
    invoke-virtual {v5}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v15

    invoke-static {v15, v5}, Lcom/lidroid/xutils/util/LogUtils;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 72
    const/4 v6, 0x0

    goto :goto_0

    .line 47
    .end local v5    # "e":Ljava/lang/Throwable;
    .restart local v3    # "columnCount":I
    .restart local v6    # "entity":Ljava/lang/Object;, "TT;"
    .restart local v9    # "i":I
    .restart local v10    # "id":Lcom/lidroid/xutils/db/table/Id;
    .restart local v11    # "idColumnName":Ljava/lang/String;
    .restart local v12    # "idIndex":I
    .restart local v13    # "idStr":Ljava/lang/String;
    .restart local v14    # "table":Lcom/lidroid/xutils/db/table/Table;
    :cond_4
    :try_start_1
    move-object/from16 v0, p1

    invoke-interface {v0, v9}, Landroid/database/Cursor;->getColumnName(I)Ljava/lang/String;

    move-result-object v4

    .line 48
    .local v4, "columnName":Ljava/lang/String;
    iget-object v15, v14, Lcom/lidroid/xutils/db/table/Table;->columnMap:Ljava/util/HashMap;

    invoke-virtual {v15, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/lidroid/xutils/db/table/Column;

    .line 49
    .restart local v2    # "column":Lcom/lidroid/xutils/db/table/Column;
    if-eqz v2, :cond_5

    .line 50
    instance-of v15, v2, Lcom/lidroid/xutils/db/table/Foreign;

    if-eqz v15, :cond_6

    .line 51
    move-object v0, v2

    check-cast v0, Lcom/lidroid/xutils/db/table/Foreign;

    move-object v8, v0

    .line 52
    .local v8, "foreign":Lcom/lidroid/xutils/db/table/Foreign;
    move-object/from16 v0, p0

    iput-object v0, v8, Lcom/lidroid/xutils/db/table/Foreign;->db:Lcom/lidroid/xutils/DbUtils;

    .line 53
    move-object/from16 v0, p1

    invoke-virtual {v8, v6, v0, v9}, Lcom/lidroid/xutils/db/table/Foreign;->setValue2Entity(Ljava/lang/Object;Landroid/database/Cursor;I)V

    .line 46
    .end local v8    # "foreign":Lcom/lidroid/xutils/db/table/Foreign;
    :cond_5
    :goto_3
    add-int/lit8 v9, v9, 0x1

    goto :goto_1

    .line 55
    :cond_6
    move-object/from16 v0, p1

    invoke-virtual {v2, v6, v0, v9}, Lcom/lidroid/xutils/db/table/Column;->setValue2Entity(Ljava/lang/Object;Landroid/database/Cursor;I)V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_3
.end method
