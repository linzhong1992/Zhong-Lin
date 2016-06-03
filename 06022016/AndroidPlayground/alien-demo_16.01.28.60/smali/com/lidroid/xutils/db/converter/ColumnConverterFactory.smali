.class public Lcom/lidroid/xutils/db/converter/ColumnConverterFactory;
.super Ljava/lang/Object;
.source "ColumnConverterFactory.java"


# static fields
.field private static final columnType_columnConverter_map:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/lidroid/xutils/db/converter/ColumnConverter;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 14

    .prologue
    .line 65
    new-instance v12, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v12}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    sput-object v12, Lcom/lidroid/xutils/db/converter/ColumnConverterFactory;->columnType_columnConverter_map:Ljava/util/concurrent/ConcurrentHashMap;

    .line 67
    new-instance v0, Lcom/lidroid/xutils/db/converter/BooleanColumnConverter;

    invoke-direct {v0}, Lcom/lidroid/xutils/db/converter/BooleanColumnConverter;-><init>()V

    .line 68
    .local v0, "booleanColumnConverter":Lcom/lidroid/xutils/db/converter/BooleanColumnConverter;
    sget-object v12, Lcom/lidroid/xutils/db/converter/ColumnConverterFactory;->columnType_columnConverter_map:Ljava/util/concurrent/ConcurrentHashMap;

    sget-object v13, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    invoke-virtual {v13}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13, v0}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 69
    sget-object v12, Lcom/lidroid/xutils/db/converter/ColumnConverterFactory;->columnType_columnConverter_map:Ljava/util/concurrent/ConcurrentHashMap;

    const-class v13, Ljava/lang/Boolean;

    invoke-virtual {v13}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13, v0}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 71
    new-instance v1, Lcom/lidroid/xutils/db/converter/ByteArrayColumnConverter;

    invoke-direct {v1}, Lcom/lidroid/xutils/db/converter/ByteArrayColumnConverter;-><init>()V

    .line 72
    .local v1, "byteArrayColumnConverter":Lcom/lidroid/xutils/db/converter/ByteArrayColumnConverter;
    sget-object v12, Lcom/lidroid/xutils/db/converter/ColumnConverterFactory;->columnType_columnConverter_map:Ljava/util/concurrent/ConcurrentHashMap;

    const-class v13, [B

    invoke-virtual {v13}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13, v1}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 74
    new-instance v2, Lcom/lidroid/xutils/db/converter/ByteColumnConverter;

    invoke-direct {v2}, Lcom/lidroid/xutils/db/converter/ByteColumnConverter;-><init>()V

    .line 75
    .local v2, "byteColumnConverter":Lcom/lidroid/xutils/db/converter/ByteColumnConverter;
    sget-object v12, Lcom/lidroid/xutils/db/converter/ColumnConverterFactory;->columnType_columnConverter_map:Ljava/util/concurrent/ConcurrentHashMap;

    sget-object v13, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    invoke-virtual {v13}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13, v2}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    sget-object v12, Lcom/lidroid/xutils/db/converter/ColumnConverterFactory;->columnType_columnConverter_map:Ljava/util/concurrent/ConcurrentHashMap;

    const-class v13, Ljava/lang/Byte;

    invoke-virtual {v13}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13, v2}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 78
    new-instance v3, Lcom/lidroid/xutils/db/converter/CharColumnConverter;

    invoke-direct {v3}, Lcom/lidroid/xutils/db/converter/CharColumnConverter;-><init>()V

    .line 79
    .local v3, "charColumnConverter":Lcom/lidroid/xutils/db/converter/CharColumnConverter;
    sget-object v12, Lcom/lidroid/xutils/db/converter/ColumnConverterFactory;->columnType_columnConverter_map:Ljava/util/concurrent/ConcurrentHashMap;

    sget-object v13, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    invoke-virtual {v13}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13, v3}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 80
    sget-object v12, Lcom/lidroid/xutils/db/converter/ColumnConverterFactory;->columnType_columnConverter_map:Ljava/util/concurrent/ConcurrentHashMap;

    const-class v13, Ljava/lang/Character;

    invoke-virtual {v13}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13, v3}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 82
    new-instance v4, Lcom/lidroid/xutils/db/converter/DateColumnConverter;

    invoke-direct {v4}, Lcom/lidroid/xutils/db/converter/DateColumnConverter;-><init>()V

    .line 83
    .local v4, "dateColumnConverter":Lcom/lidroid/xutils/db/converter/DateColumnConverter;
    sget-object v12, Lcom/lidroid/xutils/db/converter/ColumnConverterFactory;->columnType_columnConverter_map:Ljava/util/concurrent/ConcurrentHashMap;

    const-class v13, Ljava/util/Date;

    invoke-virtual {v13}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13, v4}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 85
    new-instance v5, Lcom/lidroid/xutils/db/converter/DoubleColumnConverter;

    invoke-direct {v5}, Lcom/lidroid/xutils/db/converter/DoubleColumnConverter;-><init>()V

    .line 86
    .local v5, "doubleColumnConverter":Lcom/lidroid/xutils/db/converter/DoubleColumnConverter;
    sget-object v12, Lcom/lidroid/xutils/db/converter/ColumnConverterFactory;->columnType_columnConverter_map:Ljava/util/concurrent/ConcurrentHashMap;

    sget-object v13, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    invoke-virtual {v13}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13, v5}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 87
    sget-object v12, Lcom/lidroid/xutils/db/converter/ColumnConverterFactory;->columnType_columnConverter_map:Ljava/util/concurrent/ConcurrentHashMap;

    const-class v13, Ljava/lang/Double;

    invoke-virtual {v13}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13, v5}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 89
    new-instance v6, Lcom/lidroid/xutils/db/converter/FloatColumnConverter;

    invoke-direct {v6}, Lcom/lidroid/xutils/db/converter/FloatColumnConverter;-><init>()V

    .line 90
    .local v6, "floatColumnConverter":Lcom/lidroid/xutils/db/converter/FloatColumnConverter;
    sget-object v12, Lcom/lidroid/xutils/db/converter/ColumnConverterFactory;->columnType_columnConverter_map:Ljava/util/concurrent/ConcurrentHashMap;

    sget-object v13, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    invoke-virtual {v13}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13, v6}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 91
    sget-object v12, Lcom/lidroid/xutils/db/converter/ColumnConverterFactory;->columnType_columnConverter_map:Ljava/util/concurrent/ConcurrentHashMap;

    const-class v13, Ljava/lang/Float;

    invoke-virtual {v13}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13, v6}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 93
    new-instance v7, Lcom/lidroid/xutils/db/converter/IntegerColumnConverter;

    invoke-direct {v7}, Lcom/lidroid/xutils/db/converter/IntegerColumnConverter;-><init>()V

    .line 94
    .local v7, "integerColumnConverter":Lcom/lidroid/xutils/db/converter/IntegerColumnConverter;
    sget-object v12, Lcom/lidroid/xutils/db/converter/ColumnConverterFactory;->columnType_columnConverter_map:Ljava/util/concurrent/ConcurrentHashMap;

    sget-object v13, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-virtual {v13}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13, v7}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 95
    sget-object v12, Lcom/lidroid/xutils/db/converter/ColumnConverterFactory;->columnType_columnConverter_map:Ljava/util/concurrent/ConcurrentHashMap;

    const-class v13, Ljava/lang/Integer;

    invoke-virtual {v13}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13, v7}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 97
    new-instance v8, Lcom/lidroid/xutils/db/converter/LongColumnConverter;

    invoke-direct {v8}, Lcom/lidroid/xutils/db/converter/LongColumnConverter;-><init>()V

    .line 98
    .local v8, "longColumnConverter":Lcom/lidroid/xutils/db/converter/LongColumnConverter;
    sget-object v12, Lcom/lidroid/xutils/db/converter/ColumnConverterFactory;->columnType_columnConverter_map:Ljava/util/concurrent/ConcurrentHashMap;

    sget-object v13, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    invoke-virtual {v13}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13, v8}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 99
    sget-object v12, Lcom/lidroid/xutils/db/converter/ColumnConverterFactory;->columnType_columnConverter_map:Ljava/util/concurrent/ConcurrentHashMap;

    const-class v13, Ljava/lang/Long;

    invoke-virtual {v13}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13, v8}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 101
    new-instance v9, Lcom/lidroid/xutils/db/converter/ShortColumnConverter;

    invoke-direct {v9}, Lcom/lidroid/xutils/db/converter/ShortColumnConverter;-><init>()V

    .line 102
    .local v9, "shortColumnConverter":Lcom/lidroid/xutils/db/converter/ShortColumnConverter;
    sget-object v12, Lcom/lidroid/xutils/db/converter/ColumnConverterFactory;->columnType_columnConverter_map:Ljava/util/concurrent/ConcurrentHashMap;

    sget-object v13, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    invoke-virtual {v13}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13, v9}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 103
    sget-object v12, Lcom/lidroid/xutils/db/converter/ColumnConverterFactory;->columnType_columnConverter_map:Ljava/util/concurrent/ConcurrentHashMap;

    const-class v13, Ljava/lang/Short;

    invoke-virtual {v13}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13, v9}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 105
    new-instance v10, Lcom/lidroid/xutils/db/converter/SqlDateColumnConverter;

    invoke-direct {v10}, Lcom/lidroid/xutils/db/converter/SqlDateColumnConverter;-><init>()V

    .line 106
    .local v10, "sqlDateColumnConverter":Lcom/lidroid/xutils/db/converter/SqlDateColumnConverter;
    sget-object v12, Lcom/lidroid/xutils/db/converter/ColumnConverterFactory;->columnType_columnConverter_map:Ljava/util/concurrent/ConcurrentHashMap;

    const-class v13, Ljava/sql/Date;

    invoke-virtual {v13}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13, v10}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 108
    new-instance v11, Lcom/lidroid/xutils/db/converter/StringColumnConverter;

    invoke-direct {v11}, Lcom/lidroid/xutils/db/converter/StringColumnConverter;-><init>()V

    .line 109
    .local v11, "stringColumnConverter":Lcom/lidroid/xutils/db/converter/StringColumnConverter;
    sget-object v12, Lcom/lidroid/xutils/db/converter/ColumnConverterFactory;->columnType_columnConverter_map:Ljava/util/concurrent/ConcurrentHashMap;

    const-class v13, Ljava/lang/String;

    invoke-virtual {v13}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13, v11}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 110
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    return-void
.end method

.method public static getColumnConverter(Ljava/lang/Class;)Lcom/lidroid/xutils/db/converter/ColumnConverter;
    .locals 3
    .param p0, "columnType"    # Ljava/lang/Class;

    .prologue
    .line 19
    sget-object v1, Lcom/lidroid/xutils/db/converter/ColumnConverterFactory;->columnType_columnConverter_map:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {p0}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/concurrent/ConcurrentHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 20
    sget-object v1, Lcom/lidroid/xutils/db/converter/ColumnConverterFactory;->columnType_columnConverter_map:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {p0}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lidroid/xutils/db/converter/ColumnConverter;

    .line 31
    :goto_0
    return-object v1

    .line 21
    :cond_0
    const-class v1, Lcom/lidroid/xutils/db/converter/ColumnConverter;

    invoke-virtual {v1, p0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 23
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lidroid/xutils/db/converter/ColumnConverter;

    .line 24
    .local v0, "columnConverter":Lcom/lidroid/xutils/db/converter/ColumnConverter;
    if-eqz v0, :cond_1

    .line 25
    sget-object v1, Lcom/lidroid/xutils/db/converter/ColumnConverterFactory;->columnType_columnConverter_map:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {p0}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :cond_1
    move-object v1, v0

    .line 27
    goto :goto_0

    .line 28
    .end local v0    # "columnConverter":Lcom/lidroid/xutils/db/converter/ColumnConverter;
    :catch_0
    move-exception v1

    .line 31
    :cond_2
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static getDbColumnType(Ljava/lang/Class;)Lcom/lidroid/xutils/db/sqlite/ColumnDbType;
    .locals 2
    .param p0, "columnType"    # Ljava/lang/Class;

    .prologue
    .line 35
    invoke-static {p0}, Lcom/lidroid/xutils/db/converter/ColumnConverterFactory;->getColumnConverter(Ljava/lang/Class;)Lcom/lidroid/xutils/db/converter/ColumnConverter;

    move-result-object v0

    .line 36
    .local v0, "converter":Lcom/lidroid/xutils/db/converter/ColumnConverter;
    if-eqz v0, :cond_0

    .line 37
    invoke-interface {v0}, Lcom/lidroid/xutils/db/converter/ColumnConverter;->getColumnDbType()Lcom/lidroid/xutils/db/sqlite/ColumnDbType;

    move-result-object v1

    .line 39
    :goto_0
    return-object v1

    :cond_0
    sget-object v1, Lcom/lidroid/xutils/db/sqlite/ColumnDbType;->TEXT:Lcom/lidroid/xutils/db/sqlite/ColumnDbType;

    goto :goto_0
.end method

.method public static isSupportColumnConverter(Ljava/lang/Class;)Z
    .locals 5
    .param p0, "columnType"    # Ljava/lang/Class;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 47
    sget-object v3, Lcom/lidroid/xutils/db/converter/ColumnConverterFactory;->columnType_columnConverter_map:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {p0}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/concurrent/ConcurrentHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 59
    :cond_0
    :goto_0
    return v1

    .line 49
    :cond_1
    const-class v3, Lcom/lidroid/xutils/db/converter/ColumnConverter;

    invoke-virtual {v3, p0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 51
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lidroid/xutils/db/converter/ColumnConverter;

    .line 52
    .local v0, "columnConverter":Lcom/lidroid/xutils/db/converter/ColumnConverter;
    if-eqz v0, :cond_2

    .line 53
    sget-object v3, Lcom/lidroid/xutils/db/converter/ColumnConverterFactory;->columnType_columnConverter_map:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {p0}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4, v0}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 55
    :cond_2
    if-eqz v0, :cond_0

    move v1, v2

    goto :goto_0

    .line 56
    .end local v0    # "columnConverter":Lcom/lidroid/xutils/db/converter/ColumnConverter;
    :catch_0
    move-exception v1

    :cond_3
    move v1, v2

    .line 59
    goto :goto_0
.end method

.method public static registerColumnConverter(Ljava/lang/Class;Lcom/lidroid/xutils/db/converter/ColumnConverter;)V
    .locals 2
    .param p0, "columnType"    # Ljava/lang/Class;
    .param p1, "columnConverter"    # Lcom/lidroid/xutils/db/converter/ColumnConverter;

    .prologue
    .line 43
    sget-object v0, Lcom/lidroid/xutils/db/converter/ColumnConverterFactory;->columnType_columnConverter_map:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {p0}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    return-void
.end method
