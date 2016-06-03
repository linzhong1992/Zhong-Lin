.class public Lcom/alien/demo/data/ComplexPreferences;
.super Ljava/lang/Object;
.source "ComplexPreferences.java"


# static fields
.field private static GSON:Lcom/google/gson/Gson;

.field private static complexPreferences:Lcom/alien/demo/data/ComplexPreferences;


# instance fields
.field private context:Landroid/content/Context;

.field private editor:Landroid/content/SharedPreferences$Editor;

.field private preferences:Landroid/content/SharedPreferences;

.field typeOfObject:Ljava/lang/reflect/Type;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 15
    new-instance v0, Lcom/google/gson/Gson;

    invoke-direct {v0}, Lcom/google/gson/Gson;-><init>()V

    sput-object v0, Lcom/alien/demo/data/ComplexPreferences;->GSON:Lcom/google/gson/Gson;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;Ljava/lang/String;I)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "namePreferences"    # Ljava/lang/String;
    .param p3, "mode"    # I

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    new-instance v0, Lcom/alien/demo/data/ComplexPreferences$1;

    invoke-direct {v0, p0}, Lcom/alien/demo/data/ComplexPreferences$1;-><init>(Lcom/alien/demo/data/ComplexPreferences;)V

    invoke-virtual {v0}, Lcom/alien/demo/data/ComplexPreferences$1;->getType()Ljava/lang/reflect/Type;

    move-result-object v0

    iput-object v0, p0, Lcom/alien/demo/data/ComplexPreferences;->typeOfObject:Ljava/lang/reflect/Type;

    .line 20
    iput-object p1, p0, Lcom/alien/demo/data/ComplexPreferences;->context:Landroid/content/Context;

    .line 21
    if-eqz p2, :cond_0

    const-string v0, ""

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 22
    :cond_0
    const-string p2, "complex_preferences"

    .line 24
    :cond_1
    invoke-virtual {p1, p2, p3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lcom/alien/demo/data/ComplexPreferences;->preferences:Landroid/content/SharedPreferences;

    .line 25
    iget-object v0, p0, Lcom/alien/demo/data/ComplexPreferences;->preferences:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    iput-object v0, p0, Lcom/alien/demo/data/ComplexPreferences;->editor:Landroid/content/SharedPreferences$Editor;

    .line 26
    return-void
.end method

.method public static getComplexPreferences(Landroid/content/Context;Ljava/lang/String;I)Lcom/alien/demo/data/ComplexPreferences;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "namePreferences"    # Ljava/lang/String;
    .param p2, "mode"    # I

    .prologue
    .line 31
    sget-object v0, Lcom/alien/demo/data/ComplexPreferences;->complexPreferences:Lcom/alien/demo/data/ComplexPreferences;

    if-nez v0, :cond_0

    .line 32
    new-instance v0, Lcom/alien/demo/data/ComplexPreferences;

    invoke-direct {v0, p0, p1, p2}, Lcom/alien/demo/data/ComplexPreferences;-><init>(Landroid/content/Context;Ljava/lang/String;I)V

    sput-object v0, Lcom/alien/demo/data/ComplexPreferences;->complexPreferences:Lcom/alien/demo/data/ComplexPreferences;

    .line 36
    :cond_0
    sget-object v0, Lcom/alien/demo/data/ComplexPreferences;->complexPreferences:Lcom/alien/demo/data/ComplexPreferences;

    return-object v0
.end method


# virtual methods
.method public commit()V
    .locals 1

    .prologue
    .line 52
    iget-object v0, p0, Lcom/alien/demo/data/ComplexPreferences;->editor:Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 53
    return-void
.end method

.method public getObject(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;
    .locals 5
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Ljava/lang/Class",
            "<TT;>;)TT;"
        }
    .end annotation

    .prologue
    .local p2, "a":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    const/4 v2, 0x0

    .line 57
    iget-object v3, p0, Lcom/alien/demo/data/ComplexPreferences;->preferences:Landroid/content/SharedPreferences;

    invoke-interface {v3, p1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 58
    .local v1, "gson":Ljava/lang/String;
    if-nez v1, :cond_0

    .line 62
    :goto_0
    return-object v2

    :cond_0
    :try_start_0
    sget-object v2, Lcom/alien/demo/data/ComplexPreferences;->GSON:Lcom/google/gson/Gson;

    invoke-virtual {v2, v1, p2}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    goto :goto_0

    .line 63
    :catch_0
    move-exception v0

    .line 64
    .local v0, "e":Ljava/lang/Exception;
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Object storaged with key "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " is instanceof other class"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public putObject(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 2
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "object"    # Ljava/lang/Object;

    .prologue
    .line 40
    if-nez p2, :cond_0

    .line 41
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "object is null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 44
    :cond_0
    const-string v0, ""

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    if-nez p1, :cond_2

    .line 45
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "key is empty or null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 48
    :cond_2
    iget-object v0, p0, Lcom/alien/demo/data/ComplexPreferences;->editor:Landroid/content/SharedPreferences$Editor;

    sget-object v1, Lcom/alien/demo/data/ComplexPreferences;->GSON:Lcom/google/gson/Gson;

    invoke-virtual {v1, p2}, Lcom/google/gson/Gson;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, p1, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 49
    return-void
.end method
