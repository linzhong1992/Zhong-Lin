.class abstract Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$WorkerRunnable;
.super Ljava/lang/Object;
.source "CompatibleAsyncTask.java"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lidroid/xutils/util/core/CompatibleAsyncTask;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x40a
    name = "WorkerRunnable"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<Params:",
        "Ljava/lang/Object;",
        "Result:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable",
        "<TResult;>;"
    }
.end annotation


# instance fields
.field mParams:[Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[TParams;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 634
    .local p0, "this":Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$WorkerRunnable;, "Lcom/lidroid/xutils/util/core/CompatibleAsyncTask<TParams;TProgress;TResult;>.WorkerRunnable<TParams;TResult;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$WorkerRunnable;)V
    .locals 0

    .prologue
    .line 634
    invoke-direct {p0}, Lcom/lidroid/xutils/util/core/CompatibleAsyncTask$WorkerRunnable;-><init>()V

    return-void
.end method
