.class Lcom/alien/demo/feature/geiger/GeigerActivity$2;
.super Ljava/lang/Object;
.source "GeigerActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/alien/demo/feature/geiger/GeigerActivity;->startSoundFeedbackThread()V
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
    .line 165
    iput-object p1, p0, Lcom/alien/demo/feature/geiger/GeigerActivity$2;->this$0:Lcom/alien/demo/feature/geiger/GeigerActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 167
    :goto_0
    iget-object v2, p0, Lcom/alien/demo/feature/geiger/GeigerActivity$2;->this$0:Lcom/alien/demo/feature/geiger/GeigerActivity;

    # getter for: Lcom/alien/demo/feature/geiger/GeigerActivity;->closing:Z
    invoke-static {v2}, Lcom/alien/demo/feature/geiger/GeigerActivity;->access$700(Lcom/alien/demo/feature/geiger/GeigerActivity;)Z

    move-result v2

    if-nez v2, :cond_3

    .line 168
    iget-object v2, p0, Lcom/alien/demo/feature/geiger/GeigerActivity$2;->this$0:Lcom/alien/demo/feature/geiger/GeigerActivity;

    # invokes: Lcom/alien/demo/feature/geiger/GeigerActivity;->refreshDetection()V
    invoke-static {v2}, Lcom/alien/demo/feature/geiger/GeigerActivity;->access$800(Lcom/alien/demo/feature/geiger/GeigerActivity;)V

    .line 170
    iget-object v2, p0, Lcom/alien/demo/feature/geiger/GeigerActivity$2;->this$0:Lcom/alien/demo/feature/geiger/GeigerActivity;

    # getter for: Lcom/alien/demo/feature/geiger/GeigerActivity;->currentRangeLevel:I
    invoke-static {v2}, Lcom/alien/demo/feature/geiger/GeigerActivity;->access$900(Lcom/alien/demo/feature/geiger/GeigerActivity;)I

    move-result v1

    .line 171
    .local v1, "oldRangeLevel":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget-object v2, p0, Lcom/alien/demo/feature/geiger/GeigerActivity$2;->this$0:Lcom/alien/demo/feature/geiger/GeigerActivity;

    # getter for: Lcom/alien/demo/feature/geiger/GeigerActivity;->ranges:[Lcom/alien/demo/feature/geiger/GeigerActivity$RangeLevel;
    invoke-static {v2}, Lcom/alien/demo/feature/geiger/GeigerActivity;->access$1000(Lcom/alien/demo/feature/geiger/GeigerActivity;)[Lcom/alien/demo/feature/geiger/GeigerActivity$RangeLevel;

    move-result-object v2

    array-length v2, v2

    if-ge v0, v2, :cond_0

    .line 172
    iget-object v2, p0, Lcom/alien/demo/feature/geiger/GeigerActivity$2;->this$0:Lcom/alien/demo/feature/geiger/GeigerActivity;

    # getter for: Lcom/alien/demo/feature/geiger/GeigerActivity;->tagRange:I
    invoke-static {v2}, Lcom/alien/demo/feature/geiger/GeigerActivity;->access$300(Lcom/alien/demo/feature/geiger/GeigerActivity;)I

    move-result v2

    iget-object v3, p0, Lcom/alien/demo/feature/geiger/GeigerActivity$2;->this$0:Lcom/alien/demo/feature/geiger/GeigerActivity;

    # getter for: Lcom/alien/demo/feature/geiger/GeigerActivity;->ranges:[Lcom/alien/demo/feature/geiger/GeigerActivity$RangeLevel;
    invoke-static {v3}, Lcom/alien/demo/feature/geiger/GeigerActivity;->access$1000(Lcom/alien/demo/feature/geiger/GeigerActivity;)[Lcom/alien/demo/feature/geiger/GeigerActivity$RangeLevel;

    move-result-object v3

    aget-object v3, v3, v0

    iget v3, v3, Lcom/alien/demo/feature/geiger/GeigerActivity$RangeLevel;->value:I

    if-gt v2, v3, :cond_2

    .line 173
    iget-object v2, p0, Lcom/alien/demo/feature/geiger/GeigerActivity$2;->this$0:Lcom/alien/demo/feature/geiger/GeigerActivity;

    # setter for: Lcom/alien/demo/feature/geiger/GeigerActivity;->currentRangeLevel:I
    invoke-static {v2, v0}, Lcom/alien/demo/feature/geiger/GeigerActivity;->access$902(Lcom/alien/demo/feature/geiger/GeigerActivity;I)I

    .line 179
    :cond_0
    iget-object v2, p0, Lcom/alien/demo/feature/geiger/GeigerActivity$2;->this$0:Lcom/alien/demo/feature/geiger/GeigerActivity;

    # getter for: Lcom/alien/demo/feature/geiger/GeigerActivity;->currentRangeLevel:I
    invoke-static {v2}, Lcom/alien/demo/feature/geiger/GeigerActivity;->access$900(Lcom/alien/demo/feature/geiger/GeigerActivity;)I

    move-result v2

    if-eq v1, v2, :cond_1

    .line 180
    iget-object v2, p0, Lcom/alien/demo/feature/geiger/GeigerActivity$2;->this$0:Lcom/alien/demo/feature/geiger/GeigerActivity;

    # getter for: Lcom/alien/demo/feature/geiger/GeigerActivity;->ranges:[Lcom/alien/demo/feature/geiger/GeigerActivity$RangeLevel;
    invoke-static {v2}, Lcom/alien/demo/feature/geiger/GeigerActivity;->access$1000(Lcom/alien/demo/feature/geiger/GeigerActivity;)[Lcom/alien/demo/feature/geiger/GeigerActivity$RangeLevel;

    move-result-object v2

    aget-object v2, v2, v1

    invoke-virtual {v2}, Lcom/alien/demo/feature/geiger/GeigerActivity$RangeLevel;->pause()V

    .line 181
    iget-object v2, p0, Lcom/alien/demo/feature/geiger/GeigerActivity$2;->this$0:Lcom/alien/demo/feature/geiger/GeigerActivity;

    # getter for: Lcom/alien/demo/feature/geiger/GeigerActivity;->ranges:[Lcom/alien/demo/feature/geiger/GeigerActivity$RangeLevel;
    invoke-static {v2}, Lcom/alien/demo/feature/geiger/GeigerActivity;->access$1000(Lcom/alien/demo/feature/geiger/GeigerActivity;)[Lcom/alien/demo/feature/geiger/GeigerActivity$RangeLevel;

    move-result-object v2

    iget-object v3, p0, Lcom/alien/demo/feature/geiger/GeigerActivity$2;->this$0:Lcom/alien/demo/feature/geiger/GeigerActivity;

    # getter for: Lcom/alien/demo/feature/geiger/GeigerActivity;->currentRangeLevel:I
    invoke-static {v3}, Lcom/alien/demo/feature/geiger/GeigerActivity;->access$900(Lcom/alien/demo/feature/geiger/GeigerActivity;)I

    move-result v3

    aget-object v2, v2, v3

    invoke-virtual {v2}, Lcom/alien/demo/feature/geiger/GeigerActivity$RangeLevel;->play()V

    .line 185
    :cond_1
    const-wide/16 v2, 0x64

    :try_start_0
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 186
    :catch_0
    move-exception v2

    goto :goto_0

    .line 171
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 189
    .end local v0    # "i":I
    .end local v1    # "oldRangeLevel":I
    :cond_3
    return-void
.end method
