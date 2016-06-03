.class public Lcom/alien/demo/uibase/BaseTabFragmentActivity;
.super Landroid/support/v4/app/FragmentActivity;
.source "BaseTabFragmentActivity.java"


# instance fields
.field private initFirstTab:Z

.field protected lstFrg:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/alien/demo/uibase/BaseFragment;",
            ">;"
        }
    .end annotation
.end field

.field protected lstTitles:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field protected mActionBar:Landroid/app/ActionBar;

.field protected mTabListener:Landroid/app/ActionBar$TabListener;

.field protected mViewPager:Lcom/alien/demo/uibase/NoScrollViewPager;

.field protected mViewPagerAdapter:Lcom/alien/demo/uibase/ViewPagerAdapter;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 17
    invoke-direct {p0}, Landroid/support/v4/app/FragmentActivity;-><init>()V

    .line 24
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/alien/demo/uibase/BaseTabFragmentActivity;->initFirstTab:Z

    .line 27
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/alien/demo/uibase/BaseTabFragmentActivity;->lstFrg:Ljava/util/List;

    .line 28
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/alien/demo/uibase/BaseTabFragmentActivity;->lstTitles:Ljava/util/List;

    .line 65
    new-instance v0, Lcom/alien/demo/uibase/BaseTabFragmentActivity$1;

    invoke-direct {v0, p0}, Lcom/alien/demo/uibase/BaseTabFragmentActivity$1;-><init>(Lcom/alien/demo/uibase/BaseTabFragmentActivity;)V

    iput-object v0, p0, Lcom/alien/demo/uibase/BaseTabFragmentActivity;->mTabListener:Landroid/app/ActionBar$TabListener;

    return-void
.end method

.method static synthetic access$000(Lcom/alien/demo/uibase/BaseTabFragmentActivity;)Z
    .locals 1
    .param p0, "x0"    # Lcom/alien/demo/uibase/BaseTabFragmentActivity;

    .prologue
    .line 17
    iget-boolean v0, p0, Lcom/alien/demo/uibase/BaseTabFragmentActivity;->initFirstTab:Z

    return v0
.end method

.method static synthetic access$002(Lcom/alien/demo/uibase/BaseTabFragmentActivity;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/alien/demo/uibase/BaseTabFragmentActivity;
    .param p1, "x1"    # Z

    .prologue
    .line 17
    iput-boolean p1, p0, Lcom/alien/demo/uibase/BaseTabFragmentActivity;->initFirstTab:Z

    return p1
.end method

.method private getCurrentFragment(I)I
    .locals 1
    .param p1, "tab"    # I

    .prologue
    .line 97
    iget-object v0, p0, Lcom/alien/demo/uibase/BaseTabFragmentActivity;->mActionBar:Landroid/app/ActionBar;

    invoke-virtual {v0}, Landroid/app/ActionBar;->getSelectedTab()Landroid/app/ActionBar$Tab;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/ActionBar$Tab;->getPosition()I

    move-result v0

    return v0
.end method


# virtual methods
.method protected initTabs()V
    .locals 4

    .prologue
    .line 57
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/alien/demo/uibase/BaseTabFragmentActivity;->mViewPagerAdapter:Lcom/alien/demo/uibase/ViewPagerAdapter;

    invoke-virtual {v1}, Lcom/alien/demo/uibase/ViewPagerAdapter;->getCount()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 58
    iget-object v1, p0, Lcom/alien/demo/uibase/BaseTabFragmentActivity;->mActionBar:Landroid/app/ActionBar;

    iget-object v2, p0, Lcom/alien/demo/uibase/BaseTabFragmentActivity;->mActionBar:Landroid/app/ActionBar;

    invoke-virtual {v2}, Landroid/app/ActionBar;->newTab()Landroid/app/ActionBar$Tab;

    move-result-object v2

    iget-object v3, p0, Lcom/alien/demo/uibase/BaseTabFragmentActivity;->mViewPagerAdapter:Lcom/alien/demo/uibase/ViewPagerAdapter;

    invoke-virtual {v3, v0}, Lcom/alien/demo/uibase/ViewPagerAdapter;->getPageTitle(I)Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/app/ActionBar$Tab;->setText(Ljava/lang/CharSequence;)Landroid/app/ActionBar$Tab;

    move-result-object v2

    iget-object v3, p0, Lcom/alien/demo/uibase/BaseTabFragmentActivity;->mTabListener:Landroid/app/ActionBar$TabListener;

    invoke-virtual {v2, v3}, Landroid/app/ActionBar$Tab;->setTabListener(Landroid/app/ActionBar$TabListener;)Landroid/app/ActionBar$Tab;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/ActionBar;->addTab(Landroid/app/ActionBar$Tab;)V

    .line 57
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 62
    :cond_0
    return-void
.end method

.method protected initViewPageData()V
    .locals 0

    .prologue
    .line 42
    return-void
.end method

.method protected initViewPager()V
    .locals 4

    .prologue
    .line 47
    new-instance v0, Lcom/alien/demo/uibase/ViewPagerAdapter;

    invoke-virtual {p0}, Lcom/alien/demo/uibase/BaseTabFragmentActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    iget-object v2, p0, Lcom/alien/demo/uibase/BaseTabFragmentActivity;->lstFrg:Ljava/util/List;

    iget-object v3, p0, Lcom/alien/demo/uibase/BaseTabFragmentActivity;->lstTitles:Ljava/util/List;

    invoke-direct {v0, v1, v2, v3}, Lcom/alien/demo/uibase/ViewPagerAdapter;-><init>(Landroid/support/v4/app/FragmentManager;Ljava/util/List;Ljava/util/List;)V

    iput-object v0, p0, Lcom/alien/demo/uibase/BaseTabFragmentActivity;->mViewPagerAdapter:Lcom/alien/demo/uibase/ViewPagerAdapter;

    .line 49
    const v0, 0x7f0c0081

    invoke-virtual {p0, v0}, Lcom/alien/demo/uibase/BaseTabFragmentActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/alien/demo/uibase/NoScrollViewPager;

    iput-object v0, p0, Lcom/alien/demo/uibase/BaseTabFragmentActivity;->mViewPager:Lcom/alien/demo/uibase/NoScrollViewPager;

    .line 50
    iget-object v0, p0, Lcom/alien/demo/uibase/BaseTabFragmentActivity;->mViewPager:Lcom/alien/demo/uibase/NoScrollViewPager;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/alien/demo/uibase/NoScrollViewPager;->setOffscreenPageLimit(I)V

    .line 51
    iget-object v0, p0, Lcom/alien/demo/uibase/BaseTabFragmentActivity;->mViewPager:Lcom/alien/demo/uibase/NoScrollViewPager;

    iget-object v1, p0, Lcom/alien/demo/uibase/BaseTabFragmentActivity;->mViewPagerAdapter:Lcom/alien/demo/uibase/ViewPagerAdapter;

    invoke-virtual {v0, v1}, Lcom/alien/demo/uibase/NoScrollViewPager;->setAdapter(Landroid/support/v4/view/PagerAdapter;)V

    .line 53
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 32
    invoke-super {p0, p1}, Landroid/support/v4/app/FragmentActivity;->onCreate(Landroid/os/Bundle;)V

    .line 33
    invoke-virtual {p0}, Lcom/alien/demo/uibase/BaseTabFragmentActivity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    iput-object v0, p0, Lcom/alien/demo/uibase/BaseTabFragmentActivity;->mActionBar:Landroid/app/ActionBar;

    .line 34
    iget-object v0, p0, Lcom/alien/demo/uibase/BaseTabFragmentActivity;->mActionBar:Landroid/app/ActionBar;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    .line 35
    iget-object v0, p0, Lcom/alien/demo/uibase/BaseTabFragmentActivity;->mActionBar:Landroid/app/ActionBar;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/app/ActionBar;->setNavigationMode(I)V

    .line 38
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 3
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 102
    iget-object v1, p0, Lcom/alien/demo/uibase/BaseTabFragmentActivity;->mViewPager:Lcom/alien/demo/uibase/NoScrollViewPager;

    if-eqz v1, :cond_0

    .line 103
    iget-object v1, p0, Lcom/alien/demo/uibase/BaseTabFragmentActivity;->mViewPagerAdapter:Lcom/alien/demo/uibase/ViewPagerAdapter;

    iget-object v2, p0, Lcom/alien/demo/uibase/BaseTabFragmentActivity;->mViewPager:Lcom/alien/demo/uibase/NoScrollViewPager;

    invoke-virtual {v2}, Lcom/alien/demo/uibase/NoScrollViewPager;->getCurrentItem()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/alien/demo/uibase/ViewPagerAdapter;->getItem(I)Landroid/support/v4/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/alien/demo/uibase/BaseFragment;

    .line 104
    .local v0, "sf":Lcom/alien/demo/uibase/BaseFragment;
    invoke-virtual {v0, p1, p2}, Lcom/alien/demo/uibase/BaseFragment;->onKeyDown(ILandroid/view/KeyEvent;)V

    .line 107
    .end local v0    # "sf":Lcom/alien/demo/uibase/BaseFragment;
    :cond_0
    invoke-super {p0, p1, p2}, Landroid/support/v4/app/FragmentActivity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v1

    return v1
.end method

.method public onKeyUp(ILandroid/view/KeyEvent;)Z
    .locals 3
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 112
    iget-object v1, p0, Lcom/alien/demo/uibase/BaseTabFragmentActivity;->mViewPager:Lcom/alien/demo/uibase/NoScrollViewPager;

    if-eqz v1, :cond_0

    .line 113
    iget-object v1, p0, Lcom/alien/demo/uibase/BaseTabFragmentActivity;->mViewPagerAdapter:Lcom/alien/demo/uibase/ViewPagerAdapter;

    iget-object v2, p0, Lcom/alien/demo/uibase/BaseTabFragmentActivity;->mViewPager:Lcom/alien/demo/uibase/NoScrollViewPager;

    invoke-virtual {v2}, Lcom/alien/demo/uibase/NoScrollViewPager;->getCurrentItem()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/alien/demo/uibase/ViewPagerAdapter;->getItem(I)Landroid/support/v4/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/alien/demo/uibase/BaseFragment;

    .line 114
    .local v0, "sf":Lcom/alien/demo/uibase/BaseFragment;
    invoke-virtual {v0, p1, p2}, Lcom/alien/demo/uibase/BaseFragment;->onKeyUp(ILandroid/view/KeyEvent;)V

    .line 116
    .end local v0    # "sf":Lcom/alien/demo/uibase/BaseFragment;
    :cond_0
    invoke-super {p0, p1, p2}, Landroid/support/v4/app/FragmentActivity;->onKeyUp(ILandroid/view/KeyEvent;)Z

    move-result v1

    return v1
.end method

.method protected onTabChanged(I)V
    .locals 0
    .param p1, "tab"    # I

    .prologue
    .line 90
    return-void
.end method

.method public selectFragment(I)V
    .locals 2
    .param p1, "pos"    # I

    .prologue
    .line 93
    iget-object v0, p0, Lcom/alien/demo/uibase/BaseTabFragmentActivity;->mActionBar:Landroid/app/ActionBar;

    iget-object v1, p0, Lcom/alien/demo/uibase/BaseTabFragmentActivity;->mActionBar:Landroid/app/ActionBar;

    invoke-virtual {v1, p1}, Landroid/app/ActionBar;->getTabAt(I)Landroid/app/ActionBar$Tab;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/ActionBar;->selectTab(Landroid/app/ActionBar$Tab;)V

    .line 94
    return-void
.end method
