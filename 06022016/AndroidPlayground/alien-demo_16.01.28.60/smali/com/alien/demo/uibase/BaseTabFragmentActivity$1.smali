.class Lcom/alien/demo/uibase/BaseTabFragmentActivity$1;
.super Ljava/lang/Object;
.source "BaseTabFragmentActivity.java"

# interfaces
.implements Landroid/app/ActionBar$TabListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/alien/demo/uibase/BaseTabFragmentActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/alien/demo/uibase/BaseTabFragmentActivity;


# direct methods
.method constructor <init>(Lcom/alien/demo/uibase/BaseTabFragmentActivity;)V
    .locals 0

    .prologue
    .line 65
    iput-object p1, p0, Lcom/alien/demo/uibase/BaseTabFragmentActivity$1;->this$0:Lcom/alien/demo/uibase/BaseTabFragmentActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTabReselected(Landroid/app/ActionBar$Tab;Landroid/app/FragmentTransaction;)V
    .locals 0
    .param p1, "tab"    # Landroid/app/ActionBar$Tab;
    .param p2, "fragmentTransaction"    # Landroid/app/FragmentTransaction;

    .prologue
    .line 86
    return-void
.end method

.method public onTabSelected(Landroid/app/ActionBar$Tab;Landroid/app/FragmentTransaction;)V
    .locals 2
    .param p1, "tab"    # Landroid/app/ActionBar$Tab;
    .param p2, "fragmentTransaction"    # Landroid/app/FragmentTransaction;

    .prologue
    .line 69
    iget-object v0, p0, Lcom/alien/demo/uibase/BaseTabFragmentActivity$1;->this$0:Lcom/alien/demo/uibase/BaseTabFragmentActivity;

    iget-object v0, v0, Lcom/alien/demo/uibase/BaseTabFragmentActivity;->mViewPager:Lcom/alien/demo/uibase/NoScrollViewPager;

    invoke-virtual {p1}, Landroid/app/ActionBar$Tab;->getPosition()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/alien/demo/uibase/NoScrollViewPager;->setCurrentItem(I)V

    .line 70
    iget-object v0, p0, Lcom/alien/demo/uibase/BaseTabFragmentActivity$1;->this$0:Lcom/alien/demo/uibase/BaseTabFragmentActivity;

    # getter for: Lcom/alien/demo/uibase/BaseTabFragmentActivity;->initFirstTab:Z
    invoke-static {v0}, Lcom/alien/demo/uibase/BaseTabFragmentActivity;->access$000(Lcom/alien/demo/uibase/BaseTabFragmentActivity;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 71
    iget-object v0, p0, Lcom/alien/demo/uibase/BaseTabFragmentActivity$1;->this$0:Lcom/alien/demo/uibase/BaseTabFragmentActivity;

    invoke-virtual {p1}, Landroid/app/ActionBar$Tab;->getPosition()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/alien/demo/uibase/BaseTabFragmentActivity;->onTabChanged(I)V

    .line 76
    :goto_0
    return-void

    .line 74
    :cond_0
    iget-object v0, p0, Lcom/alien/demo/uibase/BaseTabFragmentActivity$1;->this$0:Lcom/alien/demo/uibase/BaseTabFragmentActivity;

    const/4 v1, 0x1

    # setter for: Lcom/alien/demo/uibase/BaseTabFragmentActivity;->initFirstTab:Z
    invoke-static {v0, v1}, Lcom/alien/demo/uibase/BaseTabFragmentActivity;->access$002(Lcom/alien/demo/uibase/BaseTabFragmentActivity;Z)Z

    goto :goto_0
.end method

.method public onTabUnselected(Landroid/app/ActionBar$Tab;Landroid/app/FragmentTransaction;)V
    .locals 0
    .param p1, "tab"    # Landroid/app/ActionBar$Tab;
    .param p2, "fragmentTransaction"    # Landroid/app/FragmentTransaction;

    .prologue
    .line 81
    return-void
.end method
