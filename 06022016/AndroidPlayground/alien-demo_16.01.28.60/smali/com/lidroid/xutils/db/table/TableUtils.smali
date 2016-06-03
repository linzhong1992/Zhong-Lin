.class public Lcom/lidroid/xutils/db/table/TableUtils;
.super Ljava/lang/Object;
.source "TableUtils.java"


# static fields
.field private static entityColumnsMap:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/lidroid/xutils/db/table/Column;",
            ">;>;"
        }
    .end annotation
.end field

.field private static entityIdMap:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/lidroid/xutils/db/table/Id;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 53
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    sput-object v0, Lcom/lidroid/xutils/db/table/TableUtils;->entityColumnsMap:Ljava/util/concurrent/ConcurrentHashMap;

    .line 127
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    sput-object v0, Lcom/lidroid/xutils/db/table/TableUtils;->entityIdMap:Ljava/util/concurrent/ConcurrentHashMap;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    return-void
.end method

.method private static addColumns2Map(Ljava/lang/Class;Ljava/lang/String;Ljava/util/HashMap;)V
    .locals 7
    .param p1, "primaryKeyFieldName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/lidroid/xutils/db/table/Column;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 74
    .local p0, "entityType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p2, "columnMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lcom/lidroid/xutils/db/table/Column;>;"
    const-class v4, Ljava/lang/Object;

    invoke-virtual {v4, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 107
    :cond_0
    :goto_0
    return-void

    .line 76
    :cond_1
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v3

    .line 77
    .local v3, "fields":[Ljava/lang/reflect/Field;
    array-length v5, v3

    const/4 v4, 0x0

    :goto_1
    if-lt v4, v5, :cond_2

    .line 101
    const-class v4, Ljava/lang/Object;

    invoke-virtual {p0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 102
    invoke-virtual {p0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v4

    invoke-static {v4, p1, p2}, Lcom/lidroid/xutils/db/table/TableUtils;->addColumns2Map(Ljava/lang/Class;Ljava/lang/String;Ljava/util/HashMap;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 104
    .end local v3    # "fields":[Ljava/lang/reflect/Field;
    :catch_0
    move-exception v1

    .line 105
    .local v1, "e":Ljava/lang/Throwable;
    invoke-virtual {v1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4, v1}, Lcom/lidroid/xutils/util/LogUtils;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 77
    .end local v1    # "e":Ljava/lang/Throwable;
    .restart local v3    # "fields":[Ljava/lang/reflect/Field;
    :cond_2
    :try_start_1
    aget-object v2, v3, v4

    .line 78
    .local v2, "field":Ljava/lang/reflect/Field;
    invoke-static {v2}, Lcom/lidroid/xutils/db/table/ColumnUtils;->isTransient(Ljava/lang/reflect/Field;)Z

    move-result v6

    if-nez v6, :cond_3

    invoke-virtual {v2}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v6

    invoke-static {v6}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v6

    if-eqz v6, :cond_4

    .line 77
    :cond_3
    :goto_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 81
    :cond_4
    invoke-virtual {v2}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v6

    invoke-static {v6}, Lcom/lidroid/xutils/db/converter/ColumnConverterFactory;->isSupportColumnConverter(Ljava/lang/Class;)Z

    move-result v6

    if-eqz v6, :cond_5

    .line 82
    invoke-virtual {v2}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_3

    .line 83
    new-instance v0, Lcom/lidroid/xutils/db/table/Column;

    invoke-direct {v0, p0, v2}, Lcom/lidroid/xutils/db/table/Column;-><init>(Ljava/lang/Class;Ljava/lang/reflect/Field;)V

    .line 84
    .local v0, "column":Lcom/lidroid/xutils/db/table/Column;
    invoke-virtual {v0}, Lcom/lidroid/xutils/db/table/Column;->getColumnName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p2, v6}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_3

    .line 85
    invoke-virtual {v0}, Lcom/lidroid/xutils/db/table/Column;->getColumnName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p2, v6, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    .line 88
    .end local v0    # "column":Lcom/lidroid/xutils/db/table/Column;
    :cond_5
    invoke-static {v2}, Lcom/lidroid/xutils/db/table/ColumnUtils;->isForeign(Ljava/lang/reflect/Field;)Z

    move-result v6

    if-eqz v6, :cond_6

    .line 89
    new-instance v0, Lcom/lidroid/xutils/db/table/Foreign;

    invoke-direct {v0, p0, v2}, Lcom/lidroid/xutils/db/table/Foreign;-><init>(Ljava/lang/Class;Ljava/lang/reflect/Field;)V

    .line 90
    .local v0, "column":Lcom/lidroid/xutils/db/table/Foreign;
    invoke-virtual {v0}, Lcom/lidroid/xutils/db/table/Foreign;->getColumnName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p2, v6}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_3

    .line 91
    invoke-virtual {v0}, Lcom/lidroid/xutils/db/table/Foreign;->getColumnName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p2, v6, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    .line 93
    .end local v0    # "column":Lcom/lidroid/xutils/db/table/Foreign;
    :cond_6
    invoke-static {v2}, Lcom/lidroid/xutils/db/table/ColumnUtils;->isFinder(Ljava/lang/reflect/Field;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 94
    new-instance v0, Lcom/lidroid/xutils/db/table/Finder;

    invoke-direct {v0, p0, v2}, Lcom/lidroid/xutils/db/table/Finder;-><init>(Ljava/lang/Class;Ljava/lang/reflect/Field;)V

    .line 95
    .local v0, "column":Lcom/lidroid/xutils/db/table/Finder;
    invoke-virtual {v0}, Lcom/lidroid/xutils/db/table/Finder;->getColumnName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p2, v6}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_3

    .line 96
    invoke-virtual {v0}, Lcom/lidroid/xutils/db/table/Finder;->getColumnName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p2, v6, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_2
.end method

.method public static declared-synchronized getColumnMap(Ljava/lang/Class;)Ljava/util/HashMap;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/lidroid/xutils/db/table/Column;",
            ">;"
        }
    .end annotation

    .prologue
    .line 61
    .local p0, "entityType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v3, Lcom/lidroid/xutils/db/table/TableUtils;

    monitor-enter v3

    :try_start_0
    sget-object v2, Lcom/lidroid/xutils/db/table/TableUtils;->entityColumnsMap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {p0}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/util/concurrent/ConcurrentHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 62
    sget-object v2, Lcom/lidroid/xutils/db/table/TableUtils;->entityColumnsMap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {p0}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/HashMap;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 70
    :goto_0
    monitor-exit v3

    return-object v2

    .line 65
    :cond_0
    :try_start_1
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 66
    .local v0, "columnMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lcom/lidroid/xutils/db/table/Column;>;"
    invoke-static {p0}, Lcom/lidroid/xutils/db/table/TableUtils;->getPrimaryKeyFieldName(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v1

    .line 67
    .local v1, "primaryKeyFieldName":Ljava/lang/String;
    invoke-static {p0, v1, v0}, Lcom/lidroid/xutils/db/table/TableUtils;->addColumns2Map(Ljava/lang/Class;Ljava/lang/String;Ljava/util/HashMap;)V

    .line 68
    sget-object v2, Lcom/lidroid/xutils/db/table/TableUtils;->entityColumnsMap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {p0}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4, v0}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-object v2, v0

    .line 70
    goto :goto_0

    .line 61
    .end local v0    # "columnMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lcom/lidroid/xutils/db/table/Column;>;"
    .end local v1    # "primaryKeyFieldName":Ljava/lang/String;
    :catchall_0
    move-exception v2

    monitor-exit v3

    throw v2
.end method

.method public static getColumnOrId(Ljava/lang/Class;Ljava/lang/String;)Lcom/lidroid/xutils/db/table/Column;
    .locals 1
    .param p1, "columnName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            ")",
            "Lcom/lidroid/xutils/db/table/Column;"
        }
    .end annotation

    .prologue
    .line 110
    .local p0, "entityType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {p0}, Lcom/lidroid/xutils/db/table/TableUtils;->getPrimaryKeyColumnName(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 111
    invoke-static {p0}, Lcom/lidroid/xutils/db/table/TableUtils;->getId(Ljava/lang/Class;)Lcom/lidroid/xutils/db/table/Id;

    move-result-object v0

    .line 113
    :goto_0
    return-object v0

    :cond_0
    invoke-static {p0}, Lcom/lidroid/xutils/db/table/TableUtils;->getColumnMap(Ljava/lang/Class;)Ljava/util/HashMap;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lidroid/xutils/db/table/Column;

    goto :goto_0
.end method

.method public static getColumnOrId(Ljava/lang/Class;Ljava/lang/reflect/Field;)Lcom/lidroid/xutils/db/table/Column;
    .locals 2
    .param p1, "columnField"    # Ljava/lang/reflect/Field;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/reflect/Field;",
            ")",
            "Lcom/lidroid/xutils/db/table/Column;"
        }
    .end annotation

    .prologue
    .line 117
    .local p0, "entityType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {p1}, Lcom/lidroid/xutils/db/table/ColumnUtils;->getColumnNameByField(Ljava/lang/reflect/Field;)Ljava/lang/String;

    move-result-object v0

    .line 118
    .local v0, "columnName":Ljava/lang/String;
    invoke-static {p0}, Lcom/lidroid/xutils/db/table/TableUtils;->getPrimaryKeyColumnName(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 119
    invoke-static {p0}, Lcom/lidroid/xutils/db/table/TableUtils;->getId(Ljava/lang/Class;)Lcom/lidroid/xutils/db/table/Id;

    move-result-object v1

    .line 121
    :goto_0
    return-object v1

    :cond_0
    invoke-static {p0}, Lcom/lidroid/xutils/db/table/TableUtils;->getColumnMap(Ljava/lang/Class;)Ljava/util/HashMap;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lidroid/xutils/db/table/Column;

    goto :goto_0
.end method

.method public static getExecAfterTableCreated(Ljava/lang/Class;)Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 43
    .local p0, "entityType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v1, Lcom/lidroid/xutils/db/annotation/Table;

    invoke-virtual {p0, v1}, Ljava/lang/Class;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/lidroid/xutils/db/annotation/Table;

    .line 44
    .local v0, "table":Lcom/lidroid/xutils/db/annotation/Table;
    if-eqz v0, :cond_0

    .line 45
    invoke-interface {v0}, Lcom/lidroid/xutils/db/annotation/Table;->execAfterTableCreated()Ljava/lang/String;

    move-result-object v1

    .line 47
    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static declared-synchronized getId(Ljava/lang/Class;)Lcom/lidroid/xutils/db/table/Id;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Lcom/lidroid/xutils/db/table/Id;"
        }
    .end annotation

    .prologue
    .local p0, "entityType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v4, 0x0

    .line 130
    const-class v6, Lcom/lidroid/xutils/db/table/TableUtils;

    monitor-enter v6

    :try_start_0
    const-class v5, Ljava/lang/Object;

    invoke-virtual {v5, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 131
    new-instance v4, Ljava/lang/RuntimeException;

    const-string v5, "field \'id\' not found"

    invoke-direct {v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 130
    :catchall_0
    move-exception v4

    monitor-exit v6

    throw v4

    .line 134
    :cond_0
    :try_start_1
    sget-object v5, Lcom/lidroid/xutils/db/table/TableUtils;->entityIdMap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {p0}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/util/concurrent/ConcurrentHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 135
    sget-object v4, Lcom/lidroid/xutils/db/table/TableUtils;->entityIdMap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {p0}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/lidroid/xutils/db/table/Id;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 165
    :goto_0
    monitor-exit v6

    return-object v4

    .line 138
    :cond_1
    const/4 v3, 0x0

    .line 139
    .local v3, "primaryKeyField":Ljava/lang/reflect/Field;
    :try_start_2
    invoke-virtual {p0}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v1

    .line 140
    .local v1, "fields":[Ljava/lang/reflect/Field;
    if-eqz v1, :cond_2

    .line 142
    array-length v7, v1

    move v5, v4

    :goto_1
    if-lt v5, v7, :cond_3

    .line 149
    :goto_2
    if-nez v3, :cond_2

    .line 150
    array-length v5, v1

    :goto_3
    if-lt v4, v5, :cond_5

    .line 159
    :cond_2
    :goto_4
    if-nez v3, :cond_8

    .line 160
    invoke-virtual {p0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v4

    invoke-static {v4}, Lcom/lidroid/xutils/db/table/TableUtils;->getId(Ljava/lang/Class;)Lcom/lidroid/xutils/db/table/Id;

    move-result-object v4

    goto :goto_0

    .line 142
    :cond_3
    aget-object v0, v1, v5

    .line 143
    .local v0, "field":Ljava/lang/reflect/Field;
    const-class v8, Lcom/lidroid/xutils/db/annotation/Id;

    invoke-virtual {v0, v8}, Ljava/lang/reflect/Field;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v8

    if-eqz v8, :cond_4

    .line 144
    move-object v3, v0

    .line 145
    goto :goto_2

    .line 142
    :cond_4
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 150
    .end local v0    # "field":Ljava/lang/reflect/Field;
    :cond_5
    aget-object v0, v1, v4

    .line 151
    .restart local v0    # "field":Ljava/lang/reflect/Field;
    const-string v7, "id"

    invoke-virtual {v0}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_6

    const-string v7, "_id"

    invoke-virtual {v0}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_7

    .line 152
    :cond_6
    move-object v3, v0

    .line 153
    goto :goto_4

    .line 150
    :cond_7
    add-int/lit8 v4, v4, 0x1

    goto :goto_3

    .line 163
    .end local v0    # "field":Ljava/lang/reflect/Field;
    :cond_8
    new-instance v2, Lcom/lidroid/xutils/db/table/Id;

    invoke-direct {v2, p0, v3}, Lcom/lidroid/xutils/db/table/Id;-><init>(Ljava/lang/Class;Ljava/lang/reflect/Field;)V

    .line 164
    .local v2, "id":Lcom/lidroid/xutils/db/table/Id;
    sget-object v4, Lcom/lidroid/xutils/db/table/TableUtils;->entityIdMap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {p0}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5, v2}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-object v4, v2

    .line 165
    goto :goto_0
.end method

.method private static getPrimaryKeyColumnName(Ljava/lang/Class;)Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 174
    .local p0, "entityType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {p0}, Lcom/lidroid/xutils/db/table/TableUtils;->getId(Ljava/lang/Class;)Lcom/lidroid/xutils/db/table/Id;

    move-result-object v0

    .line 175
    .local v0, "id":Lcom/lidroid/xutils/db/table/Id;
    if-nez v0, :cond_0

    const/4 v1, 0x0

    :goto_0
    return-object v1

    :cond_0
    invoke-virtual {v0}, Lcom/lidroid/xutils/db/table/Id;->getColumnName()Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method private static getPrimaryKeyFieldName(Ljava/lang/Class;)Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 169
    .local p0, "entityType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {p0}, Lcom/lidroid/xutils/db/table/TableUtils;->getId(Ljava/lang/Class;)Lcom/lidroid/xutils/db/table/Id;

    move-result-object v0

    .line 170
    .local v0, "id":Lcom/lidroid/xutils/db/table/Id;
    if-nez v0, :cond_0

    const/4 v1, 0x0

    :goto_0
    return-object v1

    :cond_0
    invoke-virtual {v0}, Lcom/lidroid/xutils/db/table/Id;->getColumnField()Ljava/lang/reflect/Field;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method public static getTableName(Ljava/lang/Class;)Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 35
    .local p0, "entityType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v1, Lcom/lidroid/xutils/db/annotation/Table;

    invoke-virtual {p0, v1}, Ljava/lang/Class;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/lidroid/xutils/db/annotation/Table;

    .line 36
    .local v0, "table":Lcom/lidroid/xutils/db/annotation/Table;
    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/lidroid/xutils/db/annotation/Table;->name()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 37
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x2e

    const/16 v3, 0x5f

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v1

    .line 39
    :goto_0
    return-object v1

    :cond_1
    invoke-interface {v0}, Lcom/lidroid/xutils/db/annotation/Table;->name()Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method
