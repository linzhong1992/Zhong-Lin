.class public interface abstract annotation Lcom/lidroid/xutils/view/annotation/ResInject;
.super Ljava/lang/Object;
.source "ResInject.java"

# interfaces
.implements Ljava/lang/annotation/Annotation;


# annotations
.annotation runtime Ljava/lang/annotation/Retention;
    value = .enum Ljava/lang/annotation/RetentionPolicy;->RUNTIME:Ljava/lang/annotation/RetentionPolicy;
.end annotation

.annotation runtime Ljava/lang/annotation/Target;
    value = {
        .enum Ljava/lang/annotation/ElementType;->FIELD:Ljava/lang/annotation/ElementType;
    }
.end annotation


# virtual methods
.method public abstract id()I
.end method

.method public abstract type()Lcom/lidroid/xutils/view/ResType;
.end method
