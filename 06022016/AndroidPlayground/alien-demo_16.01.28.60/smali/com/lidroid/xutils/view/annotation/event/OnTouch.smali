.class public interface abstract annotation Lcom/lidroid/xutils/view/annotation/event/OnTouch;
.super Ljava/lang/Object;
.source "OnTouch.java"

# interfaces
.implements Ljava/lang/annotation/Annotation;


# annotations
.annotation runtime Lcom/lidroid/xutils/view/annotation/event/EventBase;
    listenerSetter = "setOnTouchListener"
    listenerType = Landroid/view/View$OnTouchListener;
    methodName = "onTouch"
.end annotation

.annotation system Ldalvik/annotation/AnnotationDefault;
    value = .subannotation Lcom/lidroid/xutils/view/annotation/event/OnTouch;
        parentId = {
            0x0
        }
    .end subannotation
.end annotation

.annotation runtime Ljava/lang/annotation/Retention;
    value = .enum Ljava/lang/annotation/RetentionPolicy;->RUNTIME:Ljava/lang/annotation/RetentionPolicy;
.end annotation

.annotation runtime Ljava/lang/annotation/Target;
    value = {
        .enum Ljava/lang/annotation/ElementType;->METHOD:Ljava/lang/annotation/ElementType;
    }
.end annotation


# virtual methods
.method public abstract parentId()[I
.end method

.method public abstract value()[I
.end method
