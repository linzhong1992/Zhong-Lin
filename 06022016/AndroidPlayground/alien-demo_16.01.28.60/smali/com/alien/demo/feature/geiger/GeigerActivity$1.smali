.class Lcom/alien/demo/feature/geiger/GeigerActivity$1;
.super Landroid/os/Handler;
.source "GeigerActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/alien/demo/feature/geiger/GeigerActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/alien/demo/feature/geiger/GeigerActivity;


# direct methods
.method constructor <init>(Lcom/alien/demo/feature/geiger/GeigerActivity;)V
    .locals 0

    .prologue
    .line 129
    iput-object p1, p0, Lcom/alien/demo/feature/geiger/GeigerActivity$1;->this$0:Lcom/alien/demo/feature/geiger/GeigerActivity;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 8
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 132
    iget-object v5, p0, Lcom/alien/demo/feature/geiger/GeigerActivity$1;->this$0:Lcom/alien/demo/feature/geiger/GeigerActivity;

    # getter for: Lcom/alien/demo/feature/geiger/GeigerActivity;->tagEpc:Ljava/lang/String;
    invoke-static {v5}, Lcom/alien/demo/feature/geiger/GeigerActivity;->access$100(Lcom/alien/demo/feature/geiger/GeigerActivity;)Ljava/lang/String;

    move-result-object v0

    .line 133
    .local v0, "epc":Ljava/lang/String;
    iget-object v5, p0, Lcom/alien/demo/feature/geiger/GeigerActivity$1;->this$0:Lcom/alien/demo/feature/geiger/GeigerActivity;

    # getter for: Lcom/alien/demo/feature/geiger/GeigerActivity;->tagRssi:Ljava/lang/String;
    invoke-static {v5}, Lcom/alien/demo/feature/geiger/GeigerActivity;->access$200(Lcom/alien/demo/feature/geiger/GeigerActivity;)Ljava/lang/String;

    move-result-object v3

    .line 134
    .local v3, "rssi":Ljava/lang/String;
    iget-object v5, p0, Lcom/alien/demo/feature/geiger/GeigerActivity$1;->this$0:Lcom/alien/demo/feature/geiger/GeigerActivity;

    # getter for: Lcom/alien/demo/feature/geiger/GeigerActivity;->tagRange:I
    invoke-static {v5}, Lcom/alien/demo/feature/geiger/GeigerActivity;->access$300(Lcom/alien/demo/feature/geiger/GeigerActivity;)I

    move-result v2

    .line 136
    .local v2, "range":I
    const/4 v1, 0x0

    .line 137
    .local v1, "index":I
    const-string v4, ""

    .line 138
    .local v4, "sEpc":Ljava/lang/String;
    :goto_0
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v5

    if-ge v1, v5, :cond_1

    .line 139
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    add-int/lit8 v6, v1, 0x4

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v7

    invoke-static {v6, v7}, Ljava/lang/Math;->min(II)I

    move-result v6

    invoke-virtual {v0, v1, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 140
    add-int/lit8 v1, v1, 0x4

    .line 141
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    rem-int/lit8 v5, v1, 0xc

    if-eqz v5, :cond_0

    const-string v5, " "

    :goto_1
    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_0

    :cond_0
    const-string v5, "\n"

    goto :goto_1

    .line 143
    :cond_1
    iget-object v5, p0, Lcom/alien/demo/feature/geiger/GeigerActivity$1;->this$0:Lcom/alien/demo/feature/geiger/GeigerActivity;

    # getter for: Lcom/alien/demo/feature/geiger/GeigerActivity;->txtEpc:Landroid/widget/TextView;
    invoke-static {v5}, Lcom/alien/demo/feature/geiger/GeigerActivity;->access$400(Lcom/alien/demo/feature/geiger/GeigerActivity;)Landroid/widget/TextView;

    move-result-object v5

    invoke-virtual {v5, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 144
    iget-object v5, p0, Lcom/alien/demo/feature/geiger/GeigerActivity$1;->this$0:Lcom/alien/demo/feature/geiger/GeigerActivity;

    # getter for: Lcom/alien/demo/feature/geiger/GeigerActivity;->txtRssi:Landroid/widget/TextView;
    invoke-static {v5}, Lcom/alien/demo/feature/geiger/GeigerActivity;->access$500(Lcom/alien/demo/feature/geiger/GeigerActivity;)Landroid/widget/TextView;

    move-result-object v5

    invoke-virtual {v5, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 145
    iget-object v5, p0, Lcom/alien/demo/feature/geiger/GeigerActivity$1;->this$0:Lcom/alien/demo/feature/geiger/GeigerActivity;

    # getter for: Lcom/alien/demo/feature/geiger/GeigerActivity;->progressBar:Landroid/widget/ProgressBar;
    invoke-static {v5}, Lcom/alien/demo/feature/geiger/GeigerActivity;->access$600(Lcom/alien/demo/feature/geiger/GeigerActivity;)Landroid/widget/ProgressBar;

    move-result-object v5

    invoke-virtual {v5, v2}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 146
    return-void
.end method
