.class public Lcom/lidroid/xutils/db/table/Id;
.super Lcom/lidroid/xutils/db/table/Column;
.source "Id.java"


# static fields
.field private static final AUTO_INCREMENT_TYPES:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final INTEGER_TYPES:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private columnFieldClassName:Ljava/lang/String;

.field private isAutoIncrement:Z

.field private isAutoIncrementChecked:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 79
    new-instance v0, Ljava/util/HashSet;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(I)V

    sput-object v0, Lcom/lidroid/xutils/db/table/Id;->INTEGER_TYPES:Ljava/util/HashSet;

    .line 80
    new-instance v0, Ljava/util/HashSet;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(I)V

    sput-object v0, Lcom/lidroid/xutils/db/table/Id;->AUTO_INCREMENT_TYPES:Ljava/util/HashSet;

    .line 83
    sget-object v0, Lcom/lidroid/xutils/db/table/Id;->INTEGER_TYPES:Ljava/util/HashSet;

    sget-object v1, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-virtual {v1}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 84
    sget-object v0, Lcom/lidroid/xutils/db/table/Id;->INTEGER_TYPES:Ljava/util/HashSet;

    const-class v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 86
    sget-object v0, Lcom/lidroid/xutils/db/table/Id;->AUTO_INCREMENT_TYPES:Ljava/util/HashSet;

    sget-object v1, Lcom/lidroid/xutils/db/table/Id;->INTEGER_TYPES:Ljava/util/HashSet;

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->addAll(Ljava/util/Collection;)Z

    .line 87
    sget-object v0, Lcom/lidroid/xutils/db/table/Id;->AUTO_INCREMENT_TYPES:Ljava/util/HashSet;

    sget-object v1, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    invoke-virtual {v1}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 88
    sget-object v0, Lcom/lidroid/xutils/db/table/Id;->AUTO_INCREMENT_TYPES:Ljava/util/HashSet;

    const-class v1, Ljava/lang/Long;

    invoke-virtual {v1}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 89
    return-void
.end method

.method protected constructor <init>(Ljava/lang/Class;Ljava/lang/reflect/Field;)V
    .locals 1
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
    .local p1, "entityType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v0, 0x0

    .line 27
    invoke-direct {p0, p1, p2}, Lcom/lidroid/xutils/db/table/Column;-><init>(Ljava/lang/Class;Ljava/lang/reflect/Field;)V

    .line 32
    iput-boolean v0, p0, Lcom/lidroid/xutils/db/table/Id;->isAutoIncrementChecked:Z

    .line 33
    iput-boolean v0, p0, Lcom/lidroid/xutils/db/table/Id;->isAutoIncrement:Z

    .line 28
    iget-object v0, p0, Lcom/lidroid/xutils/db/table/Id;->columnField:Ljava/lang/reflect/Field;

    invoke-virtual {v0}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lidroid/xutils/db/table/Id;->columnFieldClassName:Ljava/lang/String;

    .line 29
    return-void
.end method


# virtual methods
.method public getColumnValue(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4
    .param p1, "entity"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 68
    invoke-super {p0, p1}, Lcom/lidroid/xutils/db/table/Column;->getColumnValue(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 69
    .local v0, "idValue":Ljava/lang/Object;
    if-eqz v0, :cond_2

    .line 70
    invoke-virtual {p0}, Lcom/lidroid/xutils/db/table/Id;->isAutoIncrement()Z

    move-result v2

    if-eqz v2, :cond_1

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    const-wide/16 v2, 0x0

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    :cond_0
    move-object v0, v1

    .line 76
    .end local v0    # "idValue":Ljava/lang/Object;
    :cond_1
    :goto_0
    return-object v0

    .restart local v0    # "idValue":Ljava/lang/Object;
    :cond_2
    move-object v0, v1

    goto :goto_0
.end method

.method public isAutoIncrement()Z
    .locals 3

    .prologue
    const/4 v0, 0x1

    .line 36
    iget-boolean v1, p0, Lcom/lidroid/xutils/db/table/Id;->isAutoIncrementChecked:Z

    if-nez v1, :cond_0

    .line 37
    iput-boolean v0, p0, Lcom/lidroid/xutils/db/table/Id;->isAutoIncrementChecked:Z

    .line 38
    iget-object v1, p0, Lcom/lidroid/xutils/db/table/Id;->columnField:Ljava/lang/reflect/Field;

    const-class v2, Lcom/lidroid/xutils/db/annotation/NoAutoIncrement;

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Field;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v1

    if-nez v1, :cond_1

    .line 39
    sget-object v1, Lcom/lidroid/xutils/db/table/Id;->AUTO_INCREMENT_TYPES:Ljava/util/HashSet;

    iget-object v2, p0, Lcom/lidroid/xutils/db/table/Id;->columnFieldClassName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 38
    :goto_0
    iput-boolean v0, p0, Lcom/lidroid/xutils/db/table/Id;->isAutoIncrement:Z

    .line 41
    :cond_0
    iget-boolean v0, p0, Lcom/lidroid/xutils/db/table/Id;->isAutoIncrement:Z

    return v0

    .line 39
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setAutoIncrementId(Ljava/lang/Object;J)V
    .locals 6
    .param p1, "entity"    # Ljava/lang/Object;
    .param p2, "value"    # J

    .prologue
    .line 45
    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    .line 46
    .local v1, "idValue":Ljava/lang/Long;
    sget-object v2, Lcom/lidroid/xutils/db/table/Id;->INTEGER_TYPES:Ljava/util/HashSet;

    iget-object v3, p0, Lcom/lidroid/xutils/db/table/Id;->columnFieldClassName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 47
    long-to-int v2, p2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 50
    .end local v1    # "idValue":Ljava/lang/Long;
    :cond_0
    iget-object v2, p0, Lcom/lidroid/xutils/db/table/Id;->setMethod:Ljava/lang/reflect/Method;

    if-eqz v2, :cond_1

    .line 52
    :try_start_0
    iget-object v2, p0, Lcom/lidroid/xutils/db/table/Id;->setMethod:Ljava/lang/reflect/Method;

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v1, v3, v4

    invoke-virtual {v2, p1, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 64
    :goto_0
    return-void

    .line 53
    :catch_0
    move-exception v0

    .line 54
    .local v0, "e":Ljava/lang/Throwable;
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, v0}, Lcom/lidroid/xutils/util/LogUtils;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 58
    .end local v0    # "e":Ljava/lang/Throwable;
    :cond_1
    :try_start_1
    iget-object v2, p0, Lcom/lidroid/xutils/db/table/Id;->columnField:Ljava/lang/reflect/Field;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 59
    iget-object v2, p0, Lcom/lidroid/xutils/db/table/Id;->columnField:Ljava/lang/reflect/Field;

    invoke-virtual {v2, p1, v1}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 60
    :catch_1
    move-exception v0

    .line 61
    .restart local v0    # "e":Ljava/lang/Throwable;
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, v0}, Lcom/lidroid/xutils/util/LogUtils;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method
