.class public interface abstract annotation Lcom/lidroid/xutils/view/annotation/event/OnPreferenceChange;
.super Ljava/lang/Object;
.source "OnPreferenceChange.java"

# interfaces
.implements Ljava/lang/annotation/Annotation;


# annotations
.annotation runtime Lcom/lidroid/xutils/view/annotation/event/EventBase;
    listenerSetter = "setOnPreferenceChangeListener"
    listenerType = Landroid/preference/Preference$OnPreferenceChangeListener;
    methodName = "onPreferenceChange"
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
.method public abstract value()[Ljava/lang/String;
.end method
