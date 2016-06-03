.class public Lcom/alien/demo/Application;
.super Landroid/app/Application;
.source "Application.java"


# static fields
.field private static mContext:Landroid/content/Context;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 8
    invoke-direct {p0}, Landroid/app/Application;-><init>()V

    return-void
.end method

.method public static getContext()Landroid/content/Context;
    .locals 1

    .prologue
    .line 19
    sget-object v0, Lcom/alien/demo/Application;->mContext:Landroid/content/Context;

    return-object v0
.end method


# virtual methods
.method public onCreate()V
    .locals 1

    .prologue
    .line 14
    invoke-super {p0}, Landroid/app/Application;->onCreate()V

    .line 15
    invoke-virtual {p0}, Lcom/alien/demo/Application;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    sput-object v0, Lcom/alien/demo/Application;->mContext:Landroid/content/Context;

    .line 16
    return-void
.end method
