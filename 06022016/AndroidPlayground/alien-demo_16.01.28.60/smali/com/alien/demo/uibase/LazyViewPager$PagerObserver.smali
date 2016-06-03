.class Lcom/alien/demo/uibase/LazyViewPager$PagerObserver;
.super Landroid/database/DataSetObserver;
.source "LazyViewPager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/alien/demo/uibase/LazyViewPager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PagerObserver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/alien/demo/uibase/LazyViewPager;


# direct methods
.method private constructor <init>(Lcom/alien/demo/uibase/LazyViewPager;)V
    .locals 0

    .prologue
    .line 1717
    iput-object p1, p0, Lcom/alien/demo/uibase/LazyViewPager$PagerObserver;->this$0:Lcom/alien/demo/uibase/LazyViewPager;

    invoke-direct {p0}, Landroid/database/DataSetObserver;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/alien/demo/uibase/LazyViewPager;Lcom/alien/demo/uibase/LazyViewPager$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/alien/demo/uibase/LazyViewPager;
    .param p2, "x1"    # Lcom/alien/demo/uibase/LazyViewPager$1;

    .prologue
    .line 1717
    invoke-direct {p0, p1}, Lcom/alien/demo/uibase/LazyViewPager$PagerObserver;-><init>(Lcom/alien/demo/uibase/LazyViewPager;)V

    return-void
.end method


# virtual methods
.method public onChanged()V
    .locals 1

    .prologue
    .line 1721
    iget-object v0, p0, Lcom/alien/demo/uibase/LazyViewPager$PagerObserver;->this$0:Lcom/alien/demo/uibase/LazyViewPager;

    invoke-virtual {v0}, Lcom/alien/demo/uibase/LazyViewPager;->dataSetChanged()V

    .line 1722
    return-void
.end method

.method public onInvalidated()V
    .locals 1

    .prologue
    .line 1726
    iget-object v0, p0, Lcom/alien/demo/uibase/LazyViewPager$PagerObserver;->this$0:Lcom/alien/demo/uibase/LazyViewPager;

    invoke-virtual {v0}, Lcom/alien/demo/uibase/LazyViewPager;->dataSetChanged()V

    .line 1727
    return-void
.end method
