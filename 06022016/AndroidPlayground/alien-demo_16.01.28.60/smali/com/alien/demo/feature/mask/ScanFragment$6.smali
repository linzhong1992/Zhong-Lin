.class Lcom/alien/demo/feature/mask/ScanFragment$6;
.super Ljava/lang/Object;
.source "ScanFragment.java"

# interfaces
.implements Landroid/media/MediaPlayer$OnCompletionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/alien/demo/feature/mask/ScanFragment;->playDetectSound()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/alien/demo/feature/mask/ScanFragment;


# direct methods
.method constructor <init>(Lcom/alien/demo/feature/mask/ScanFragment;)V
    .locals 0

    .prologue
    .line 247
    iput-object p1, p0, Lcom/alien/demo/feature/mask/ScanFragment$6;->this$0:Lcom/alien/demo/feature/mask/ScanFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompletion(Landroid/media/MediaPlayer;)V
    .locals 0
    .param p1, "mediaPlayer"    # Landroid/media/MediaPlayer;

    .prologue
    .line 250
    invoke-virtual {p1}, Landroid/media/MediaPlayer;->release()V

    .line 251
    return-void
.end method
