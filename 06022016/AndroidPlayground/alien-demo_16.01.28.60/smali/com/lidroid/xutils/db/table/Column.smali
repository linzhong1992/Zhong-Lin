.class public Lcom/lidroid/xutils/db/table/Column;
.super Ljava/lang/Object;
.source "Column.java"


# instance fields
.field protected final columnConverter:Lcom/lidroid/xutils/db/converter/ColumnConverter;

.field protected final columnField:Ljava/lang/reflect/Field;

.field protected final columnName:Ljava/lang/String;

.field private final defaultValue:Ljava/lang/Object;

.field protected final getMethod:Ljava/lang/reflect/Method;

.field protected final setMethod:Ljava/lang/reflect/Method;


# direct methods
.method protected constructor <init>(Ljava/lang/Class;Ljava/lang/reflect/Field;)V
    .locals 2
    .param p2, "field"    # Ljava/lang/reflect/Field;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/reflect/Field;",
            ")V"
        }
    .end annotation

    .prologue
    .line 38
    .local p1, "entityType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    iput-object p2, p0, Lcom/lidroid/xutils/db/table/Column;->columnField:Ljava/lang/reflect/Field;

    .line 40
    invoke-virtual {p2}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lcom/lidroid/xutils/db/converter/ColumnConverterFactory;->getColumnConverter(Ljava/lang/Class;)Lcom/lidroid/xutils/db/converter/ColumnConverter;

    move-result-object v0

    iput-object v0, p0, Lcom/lidroid/xutils/db/table/Column;->columnConverter:Lcom/lidroid/xutils/db/converter/ColumnConverter;

    .line 41
    invoke-static {p2}, Lcom/lidroid/xutils/db/table/ColumnUtils;->getColumnNameByField(Ljava/lang/reflect/Field;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lidroid/xutils/db/table/Column;->columnName:Ljava/lang/String;

    .line 42
    iget-object v0, p0, Lcom/lidroid/xutils/db/table/Column;->columnConverter:Lcom/lidroid/xutils/db/converter/ColumnConverter;

    if-eqz v0, :cond_0

    .line 43
    iget-object v0, p0, Lcom/lidroid/xutils/db/table/Column;->columnConverter:Lcom/lidroid/xutils/db/converter/ColumnConverter;

    invoke-static {p2}, Lcom/lidroid/xutils/db/table/ColumnUtils;->getColumnDefaultValue(Ljava/lang/reflect/Field;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/lidroid/xutils/db/converter/ColumnConverter;->getFieldValue(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lcom/lidroid/xutils/db/table/Column;->defaultValue:Ljava/lang/Object;

    .line 47
    :goto_0
    invoke-static {p1, p2}, Lcom/lidroid/xutils/db/table/ColumnUtils;->getColumnGetMethod(Ljava/lang/Class;Ljava/lang/reflect/Field;)Ljava/lang/reflect/Method;

    move-result-object v0

    iput-object v0, p0, Lcom/lidroid/xutils/db/table/Column;->getMethod:Ljava/lang/reflect/Method;

    .line 48
    invoke-static {p1, p2}, Lcom/lidroid/xutils/db/table/ColumnUtils;->getColumnSetMethod(Ljava/lang/Class;Ljava/lang/reflect/Field;)Ljava/lang/reflect/Method;

    move-result-object v0

    iput-object v0, p0, Lcom/lidroid/xutils/db/table/Column;->setMethod:Ljava/lang/reflect/Method;

    .line 49
    return-void

    .line 45
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lidroid/xutils/db/table/Column;->defaultValue:Ljava/lang/Object;

    goto :goto_0
.end method


# virtual methods
.method public getColumnDbType()Lcom/lidroid/xutils/db/sqlite/ColumnDbType;
    .locals 1

    .prologue
    .line 113
    iget-object v0, p0, Lcom/lidroid/xutils/db/table/Column;->columnConverter:Lcom/lidroid/xutils/db/converter/ColumnConverter;

    invoke-interface {v0}, Lcom/lidroid/xutils/db/converter/ColumnConverter;->getColumnDbType()Lcom/lidroid/xutils/db/sqlite/ColumnDbType;

    move-result-object v0

    return-object v0
.end method

.method public getColumnField()Ljava/lang/reflect/Field;
    .locals 1

    .prologue
    .line 109
    iget-object v0, p0, Lcom/lidroid/xutils/db/table/Column;->columnField:Ljava/lang/reflect/Field;

    return-object v0
.end method

.method public getColumnName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 101
    iget-object v0, p0, Lcom/lidroid/xutils/db/table/Column;->columnName:Ljava/lang/String;

    return-object v0
.end method

.method public getColumnValue(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .param p1, "entity"    # Ljava/lang/Object;

    .prologue
    .line 75
    invoke-virtual {p0, p1}, Lcom/lidroid/xutils/db/table/Column;->getFieldValue(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 76
    .local v0, "fieldValue":Ljava/lang/Object;
    iget-object v1, p0, Lcom/lidroid/xutils/db/table/Column;->columnConverter:Lcom/lidroid/xutils/db/converter/ColumnConverter;

    invoke-interface {v1, v0}, Lcom/lidroid/xutils/db/converter/ColumnConverter;->fieldValue2ColumnValue(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public getDefaultValue()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 105
    iget-object v0, p0, Lcom/lidroid/xutils/db/table/Column;->defaultValue:Ljava/lang/Object;

    return-object v0
.end method

.method public getFieldValue(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4
    .param p1, "entity"    # Ljava/lang/Object;

    .prologue
    .line 80
    const/4 v1, 0x0

    .line 81
    .local v1, "fieldValue":Ljava/lang/Object;
    if-eqz p1, :cond_0

    .line 82
    iget-object v2, p0, Lcom/lidroid/xutils/db/table/Column;->getMethod:Ljava/lang/reflect/Method;

    if-eqz v2, :cond_1

    .line 84
    :try_start_0
    iget-object v2, p0, Lcom/lidroid/xutils/db/table/Column;->getMethod:Ljava/lang/reflect/Method;

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v2, p1, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 97
    .end local v1    # "fieldValue":Ljava/lang/Object;
    :cond_0
    :goto_0
    return-object v1

    .line 85
    .restart local v1    # "fieldValue":Ljava/lang/Object;
    :catch_0
    move-exception v0

    .line 86
    .local v0, "e":Ljava/lang/Throwable;
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, v0}, Lcom/lidroid/xutils/util/LogUtils;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 90
    .end local v0    # "e":Ljava/lang/Throwable;
    :cond_1
    :try_start_1
    iget-object v2, p0, Lcom/lidroid/xutils/db/table/Column;->columnField:Ljava/lang/reflect/Field;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 91
    iget-object v2, p0, Lcom/lidroid/xutils/db/table/Column;->columnField:Ljava/lang/reflect/Field;

    invoke-virtual {v2, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v1

    goto :goto_0

    .line 92
    :catch_1
    move-exception v0

    .line 93
    .restart local v0    # "e":Ljava/lang/Throwable;
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, v0}, Lcom/lidroid/xutils/util/LogUtils;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public setValue2Entity(Ljava/lang/Object;Landroid/database/Cursor;I)V
    .locals 5
    .param p1, "entity"    # Ljava/lang/Object;
    .param p2, "cursor"    # Landroid/database/Cursor;
    .param p3, "index"    # I

    .prologue
    .line 54
    iget-object v2, p0, Lcom/lidroid/xutils/db/table/Column;->columnConverter:Lcom/lidroid/xutils/db/converter/ColumnConverter;

    invoke-interface {v2, p2, p3}, Lcom/lidroid/xutils/db/converter/ColumnConverter;->getFieldValue(Landroid/database/Cursor;I)Ljava/lang/Object;

    move-result-object v1

    .line 55
    .local v1, "value":Ljava/lang/Object;
    if-nez v1, :cond_0

    iget-object v2, p0, Lcom/lidroid/xutils/db/table/Column;->defaultValue:Ljava/lang/Object;

    if-nez v2, :cond_0

    .line 71
    .end local v1    # "value":Ljava/lang/Object;
    :goto_0
    return-void

    .line 57
    .restart local v1    # "value":Ljava/lang/Object;
    :cond_0
    iget-object v2, p0, Lcom/lidroid/xutils/db/table/Column;->setMethod:Ljava/lang/reflect/Method;

    if-eqz v2, :cond_2

    .line 59
    :try_start_0
    iget-object v2, p0, Lcom/lidroid/xutils/db/table/Column;->setMethod:Ljava/lang/reflect/Method;

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/lidroid/xutils/db/table/Column;->defaultValue:Ljava/lang/Object;

    .end local v1    # "value":Ljava/lang/Object;
    :cond_1
    aput-object v1, v3, v4

    invoke-virtual {v2, p1, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 60
    :catch_0
    move-exception v0

    .line 61
    .local v0, "e":Ljava/lang/Throwable;
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, v0}, Lcom/lidroid/xutils/util/LogUtils;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 65
    .end local v0    # "e":Ljava/lang/Throwable;
    .restart local v1    # "value":Ljava/lang/Object;
    :cond_2
    :try_start_1
    iget-object v2, p0, Lcom/lidroid/xutils/db/table/Column;->columnField:Ljava/lang/reflect/Field;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 66
    iget-object v2, p0, Lcom/lidroid/xutils/db/table/Column;->columnField:Ljava/lang/reflect/Field;

    if-nez v1, :cond_3

    iget-object v1, p0, Lcom/lidroid/xutils/db/table/Column;->defaultValue:Ljava/lang/Object;

    .end local v1    # "value":Ljava/lang/Object;
    :cond_3
    invoke-virtual {v2, p1, v1}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 67
    :catch_1
    move-exception v0

    .line 68
    .restart local v0    # "e":Ljava/lang/Throwable;
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, v0}, Lcom/lidroid/xutils/util/LogUtils;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method
