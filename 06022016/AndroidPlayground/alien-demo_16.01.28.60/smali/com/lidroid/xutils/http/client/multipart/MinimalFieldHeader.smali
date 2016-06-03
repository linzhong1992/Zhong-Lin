.class Lcom/lidroid/xutils/http/client/multipart/MinimalFieldHeader;
.super Ljava/lang/Object;
.source "MinimalFieldHeader.java"

# interfaces
.implements Ljava/lang/Iterable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Iterable",
        "<",
        "Lcom/lidroid/xutils/http/client/multipart/MinimalField;",
        ">;"
    }
.end annotation


# instance fields
.field private final fieldMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lcom/lidroid/xutils/http/client/multipart/MinimalField;",
            ">;>;"
        }
    .end annotation
.end field

.field private final fields:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/lidroid/xutils/http/client/multipart/MinimalField;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/lidroid/xutils/http/client/multipart/MinimalFieldHeader;->fields:Ljava/util/List;

    .line 31
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/lidroid/xutils/http/client/multipart/MinimalFieldHeader;->fieldMap:Ljava/util/Map;

    .line 32
    return-void
.end method


# virtual methods
.method public addField(Lcom/lidroid/xutils/http/client/multipart/MinimalField;)V
    .locals 4
    .param p1, "field"    # Lcom/lidroid/xutils/http/client/multipart/MinimalField;

    .prologue
    .line 35
    if-nez p1, :cond_0

    .line 46
    :goto_0
    return-void

    .line 38
    :cond_0
    invoke-virtual {p1}, Lcom/lidroid/xutils/http/client/multipart/MinimalField;->getName()Ljava/lang/String;

    move-result-object v2

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v2, v3}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    .line 39
    .local v0, "key":Ljava/lang/String;
    iget-object v2, p0, Lcom/lidroid/xutils/http/client/multipart/MinimalFieldHeader;->fieldMap:Ljava/util/Map;

    invoke-interface {v2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    .line 40
    .local v1, "values":Ljava/util/List;, "Ljava/util/List<Lcom/lidroid/xutils/http/client/multipart/MinimalField;>;"
    if-nez v1, :cond_1

    .line 41
    new-instance v1, Ljava/util/LinkedList;

    .end local v1    # "values":Ljava/util/List;, "Ljava/util/List<Lcom/lidroid/xutils/http/client/multipart/MinimalField;>;"
    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    .line 42
    .restart local v1    # "values":Ljava/util/List;, "Ljava/util/List<Lcom/lidroid/xutils/http/client/multipart/MinimalField;>;"
    iget-object v2, p0, Lcom/lidroid/xutils/http/client/multipart/MinimalFieldHeader;->fieldMap:Ljava/util/Map;

    invoke-interface {v2, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    :cond_1
    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 45
    iget-object v2, p0, Lcom/lidroid/xutils/http/client/multipart/MinimalFieldHeader;->fields:Ljava/util/List;

    invoke-interface {v2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public getField(Ljava/lang/String;)Lcom/lidroid/xutils/http/client/multipart/MinimalField;
    .locals 4
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 53
    if-nez p1, :cond_1

    .line 61
    :cond_0
    :goto_0
    return-object v2

    .line 56
    :cond_1
    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {p1, v3}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    .line 57
    .local v0, "key":Ljava/lang/String;
    iget-object v3, p0, Lcom/lidroid/xutils/http/client/multipart/MinimalFieldHeader;->fieldMap:Ljava/util/Map;

    invoke-interface {v3, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    .line 58
    .local v1, "list":Ljava/util/List;, "Ljava/util/List<Lcom/lidroid/xutils/http/client/multipart/MinimalField;>;"
    if-eqz v1, :cond_0

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_0

    .line 59
    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/lidroid/xutils/http/client/multipart/MinimalField;

    goto :goto_0
.end method

.method public getFields()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/lidroid/xutils/http/client/multipart/MinimalField;",
            ">;"
        }
    .end annotation

    .prologue
    .line 49
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/lidroid/xutils/http/client/multipart/MinimalFieldHeader;->fields:Ljava/util/List;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method

.method public getFields(Ljava/lang/String;)Ljava/util/List;
    .locals 3
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/lidroid/xutils/http/client/multipart/MinimalField;",
            ">;"
        }
    .end annotation

    .prologue
    .line 65
    if-nez p1, :cond_0

    .line 66
    const/4 v2, 0x0

    .line 73
    :goto_0
    return-object v2

    .line 68
    :cond_0
    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {p1, v2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    .line 69
    .local v0, "key":Ljava/lang/String;
    iget-object v2, p0, Lcom/lidroid/xutils/http/client/multipart/MinimalFieldHeader;->fieldMap:Ljava/util/Map;

    invoke-interface {v2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    .line 70
    .local v1, "list":Ljava/util/List;, "Ljava/util/List<Lcom/lidroid/xutils/http/client/multipart/MinimalField;>;"
    if-eqz v1, :cond_1

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 71
    :cond_1
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v2

    goto :goto_0

    .line 73
    :cond_2
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    goto :goto_0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Lcom/lidroid/xutils/http/client/multipart/MinimalField;",
            ">;"
        }
    .end annotation

    .prologue
    .line 117
    iget-object v0, p0, Lcom/lidroid/xutils/http/client/multipart/MinimalFieldHeader;->fields:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public removeFields(Ljava/lang/String;)I
    .locals 4
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 78
    if-nez p1, :cond_1

    .line 87
    :cond_0
    :goto_0
    return v2

    .line 81
    :cond_1
    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {p1, v3}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    .line 82
    .local v0, "key":Ljava/lang/String;
    iget-object v3, p0, Lcom/lidroid/xutils/http/client/multipart/MinimalFieldHeader;->fieldMap:Ljava/util/Map;

    invoke-interface {v3, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    .line 83
    .local v1, "removed":Ljava/util/List;, "Ljava/util/List<Lcom/lidroid/xutils/http/client/multipart/MinimalField;>;"
    if-eqz v1, :cond_0

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_0

    .line 86
    iget-object v2, p0, Lcom/lidroid/xutils/http/client/multipart/MinimalFieldHeader;->fields:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->removeAll(Ljava/util/Collection;)Z

    .line 87
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    goto :goto_0
.end method

.method public setField(Lcom/lidroid/xutils/http/client/multipart/MinimalField;)V
    .locals 8
    .param p1, "field"    # Lcom/lidroid/xutils/http/client/multipart/MinimalField;

    .prologue
    .line 91
    if-nez p1, :cond_0

    .line 114
    :goto_0
    return-void

    .line 94
    :cond_0
    invoke-virtual {p1}, Lcom/lidroid/xutils/http/client/multipart/MinimalField;->getName()Ljava/lang/String;

    move-result-object v6

    sget-object v7, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v6, v7}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v4

    .line 95
    .local v4, "key":Ljava/lang/String;
    iget-object v6, p0, Lcom/lidroid/xutils/http/client/multipart/MinimalFieldHeader;->fieldMap:Ljava/util/Map;

    invoke-interface {v6, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 96
    .local v5, "list":Ljava/util/List;, "Ljava/util/List<Lcom/lidroid/xutils/http/client/multipart/MinimalField;>;"
    if-eqz v5, :cond_1

    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_2

    .line 97
    :cond_1
    invoke-virtual {p0, p1}, Lcom/lidroid/xutils/http/client/multipart/MinimalFieldHeader;->addField(Lcom/lidroid/xutils/http/client/multipart/MinimalField;)V

    goto :goto_0

    .line 100
    :cond_2
    invoke-interface {v5}, Ljava/util/List;->clear()V

    .line 101
    invoke-interface {v5, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 102
    const/4 v1, -0x1

    .line 103
    .local v1, "firstOccurrence":I
    const/4 v2, 0x0

    .line 104
    .local v2, "index":I
    iget-object v6, p0, Lcom/lidroid/xutils/http/client/multipart/MinimalFieldHeader;->fields:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/lidroid/xutils/http/client/multipart/MinimalField;>;"
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-nez v6, :cond_3

    .line 113
    iget-object v6, p0, Lcom/lidroid/xutils/http/client/multipart/MinimalFieldHeader;->fields:Ljava/util/List;

    invoke-interface {v6, v1, p1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    goto :goto_0

    .line 105
    :cond_3
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lidroid/xutils/http/client/multipart/MinimalField;

    .line 106
    .local v0, "f":Lcom/lidroid/xutils/http/client/multipart/MinimalField;
    invoke-virtual {v0}, Lcom/lidroid/xutils/http/client/multipart/MinimalField;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p1}, Lcom/lidroid/xutils/http/client/multipart/MinimalField;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_4

    .line 107
    invoke-interface {v3}, Ljava/util/Iterator;->remove()V

    .line 108
    const/4 v6, -0x1

    if-ne v1, v6, :cond_4

    .line 109
    move v1, v2

    .line 104
    :cond_4
    add-int/lit8 v2, v2, 0x1

    goto :goto_1
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 122
    iget-object v0, p0, Lcom/lidroid/xutils/http/client/multipart/MinimalFieldHeader;->fields:Ljava/util/List;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
