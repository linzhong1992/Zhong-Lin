.class public Lcom/lidroid/xutils/db/table/KeyValue;
.super Ljava/lang/Object;
.source "KeyValue.java"


# instance fields
.field private key:Ljava/lang/String;

.field private value:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 0
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    iput-object p1, p0, Lcom/lidroid/xutils/db/table/KeyValue;->key:Ljava/lang/String;

    .line 24
    iput-object p2, p0, Lcom/lidroid/xutils/db/table/KeyValue;->value:Ljava/lang/Object;

    .line 25
    return-void
.end method


# virtual methods
.method public getKey()Ljava/lang/String;
    .locals 1

    .prologue
    .line 28
    iget-object v0, p0, Lcom/lidroid/xutils/db/table/KeyValue;->key:Ljava/lang/String;

    return-object v0
.end method

.method public getValue()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 32
    iget-object v0, p0, Lcom/lidroid/xutils/db/table/KeyValue;->value:Ljava/lang/Object;

    return-object v0
.end method
