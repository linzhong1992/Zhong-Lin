.class final Lcom/alien/demo/uibase/LazyViewPager$1;
.super Ljava/lang/Object;
.source "LazyViewPager.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/alien/demo/uibase/LazyViewPager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;)I
    .locals 2
    .param p1, "lhs"    # Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;
    .param p2, "rhs"    # Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;

    .prologue
    .line 68
    iget v0, p1, Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;->position:I

    iget v1, p2, Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;->position:I

    sub-int/2addr v0, v1

    return v0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 65
    check-cast p1, Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;

    .end local p1    # "x0":Ljava/lang/Object;
    check-cast p2, Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lcom/alien/demo/uibase/LazyViewPager$1;->compare(Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;Lcom/alien/demo/uibase/LazyViewPager$ItemInfo;)I

    move-result v0

    return v0
.end method
