.class public Lcom/alien/demo/feature/mask/CustomFragment;
.super Lcom/alien/demo/uibase/BaseFragment;
.source "CustomFragment.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "AlienRFID-Mask Specify"


# instance fields
.field private btnClear:Landroid/widget/Button;

.field private btnOK:Landroid/widget/Button;

.field private context:Landroid/app/Activity;

.field private etData:Landroid/widget/EditText;

.field private etEpcStartWithData:Landroid/widget/EditText;

.field private etLen:Landroid/widget/EditText;

.field private etPtr:Landroid/widget/EditText;

.field private groupArbitrary:Landroid/view/View;

.field private groupEpcStartWith:Landroid/view/View;

.field private groups:Landroid/widget/RadioGroup;

.field private outputFilter:Lcom/alien/demo/rfid/TagMask;

.field private rbArbitrary:Landroid/widget/RadioButton;

.field private rbEpcStartWith:Landroid/widget/RadioButton;

.field private spBank:Landroid/widget/Spinner;

.field private specifyInfo:Lcom/alien/demo/feature/mask/SpecifyInfo;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 24
    invoke-direct {p0}, Lcom/alien/demo/uibase/BaseFragment;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/alien/demo/feature/mask/CustomFragment;Landroid/widget/RadioGroup;I)V
    .locals 0
    .param p0, "x0"    # Lcom/alien/demo/feature/mask/CustomFragment;
    .param p1, "x1"    # Landroid/widget/RadioGroup;
    .param p2, "x2"    # I

    .prologue
    .line 24
    invoke-direct {p0, p1, p2}, Lcom/alien/demo/feature/mask/CustomFragment;->onSpecifyGroupChanged(Landroid/widget/RadioGroup;I)V

    return-void
.end method

.method static synthetic access$100(Lcom/alien/demo/feature/mask/CustomFragment;Ljava/lang/CharSequence;)V
    .locals 0
    .param p0, "x0"    # Lcom/alien/demo/feature/mask/CustomFragment;
    .param p1, "x1"    # Ljava/lang/CharSequence;

    .prologue
    .line 24
    invoke-direct {p0, p1}, Lcom/alien/demo/feature/mask/CustomFragment;->onStartWithEpcDataChanged(Ljava/lang/CharSequence;)V

    return-void
.end method

.method static synthetic access$200(Lcom/alien/demo/feature/mask/CustomFragment;Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 0
    .param p0, "x0"    # Lcom/alien/demo/feature/mask/CustomFragment;
    .param p1, "x1"    # Landroid/widget/AdapterView;
    .param p2, "x2"    # Landroid/view/View;
    .param p3, "x3"    # I
    .param p4, "x4"    # J

    .prologue
    .line 24
    invoke-direct/range {p0 .. p5}, Lcom/alien/demo/feature/mask/CustomFragment;->onArbitraryBankChanged(Landroid/widget/AdapterView;Landroid/view/View;IJ)V

    return-void
.end method

.method static synthetic access$300(Lcom/alien/demo/feature/mask/CustomFragment;Ljava/lang/CharSequence;)V
    .locals 0
    .param p0, "x0"    # Lcom/alien/demo/feature/mask/CustomFragment;
    .param p1, "x1"    # Ljava/lang/CharSequence;

    .prologue
    .line 24
    invoke-direct {p0, p1}, Lcom/alien/demo/feature/mask/CustomFragment;->onArbitraryPtrChanged(Ljava/lang/CharSequence;)V

    return-void
.end method

.method static synthetic access$400(Lcom/alien/demo/feature/mask/CustomFragment;Ljava/lang/CharSequence;)V
    .locals 0
    .param p0, "x0"    # Lcom/alien/demo/feature/mask/CustomFragment;
    .param p1, "x1"    # Ljava/lang/CharSequence;

    .prologue
    .line 24
    invoke-direct {p0, p1}, Lcom/alien/demo/feature/mask/CustomFragment;->onArbitraryLenChanged(Ljava/lang/CharSequence;)V

    return-void
.end method

.method static synthetic access$500(Lcom/alien/demo/feature/mask/CustomFragment;Ljava/lang/CharSequence;)V
    .locals 0
    .param p0, "x0"    # Lcom/alien/demo/feature/mask/CustomFragment;
    .param p1, "x1"    # Ljava/lang/CharSequence;

    .prologue
    .line 24
    invoke-direct {p0, p1}, Lcom/alien/demo/feature/mask/CustomFragment;->onArbitraryDataChanged(Ljava/lang/CharSequence;)V

    return-void
.end method

.method static synthetic access$600(Lcom/alien/demo/feature/mask/CustomFragment;Landroid/view/View;)V
    .locals 0
    .param p0, "x0"    # Lcom/alien/demo/feature/mask/CustomFragment;
    .param p1, "x1"    # Landroid/view/View;

    .prologue
    .line 24
    invoke-direct {p0, p1}, Lcom/alien/demo/feature/mask/CustomFragment;->onClickOk(Landroid/view/View;)V

    return-void
.end method

.method static synthetic access$700(Lcom/alien/demo/feature/mask/CustomFragment;Landroid/view/View;)V
    .locals 0
    .param p0, "x0"    # Lcom/alien/demo/feature/mask/CustomFragment;
    .param p1, "x1"    # Landroid/view/View;

    .prologue
    .line 24
    invoke-direct {p0, p1}, Lcom/alien/demo/feature/mask/CustomFragment;->onClickClear(Landroid/view/View;)V

    return-void
.end method

.method private onArbitraryBankChanged(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 1
    .param p2, "selectedItemView"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "id"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .line 212
    .local p1, "parentView":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    iget-object v0, p0, Lcom/alien/demo/feature/mask/CustomFragment;->specifyInfo:Lcom/alien/demo/feature/mask/SpecifyInfo;

    invoke-virtual {v0, p3}, Lcom/alien/demo/feature/mask/SpecifyInfo;->setArbitraryBank(I)V

    .line 213
    return-void
.end method

.method private onArbitraryDataChanged(Ljava/lang/CharSequence;)V
    .locals 2
    .param p1, "s"    # Ljava/lang/CharSequence;

    .prologue
    .line 230
    iget-object v0, p0, Lcom/alien/demo/feature/mask/CustomFragment;->specifyInfo:Lcom/alien/demo/feature/mask/SpecifyInfo;

    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/alien/demo/feature/mask/SpecifyInfo;->setArbitraryData(Ljava/lang/String;)V

    .line 231
    return-void
.end method

.method private onArbitraryLenChanged(Ljava/lang/CharSequence;)V
    .locals 2
    .param p1, "s"    # Ljava/lang/CharSequence;

    .prologue
    .line 223
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 224
    iget-object v0, p0, Lcom/alien/demo/feature/mask/CustomFragment;->specifyInfo:Lcom/alien/demo/feature/mask/SpecifyInfo;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/alien/demo/feature/mask/SpecifyInfo;->setArbitraryLen(I)V

    .line 227
    :goto_0
    return-void

    .line 226
    :cond_0
    iget-object v0, p0, Lcom/alien/demo/feature/mask/CustomFragment;->specifyInfo:Lcom/alien/demo/feature/mask/SpecifyInfo;

    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/alien/demo/feature/mask/SpecifyInfo;->setArbitraryLen(I)V

    goto :goto_0
.end method

.method private onArbitraryPtrChanged(Ljava/lang/CharSequence;)V
    .locals 2
    .param p1, "s"    # Ljava/lang/CharSequence;

    .prologue
    .line 216
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 217
    iget-object v0, p0, Lcom/alien/demo/feature/mask/CustomFragment;->specifyInfo:Lcom/alien/demo/feature/mask/SpecifyInfo;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/alien/demo/feature/mask/SpecifyInfo;->setArbitraryPtr(I)V

    .line 220
    :goto_0
    return-void

    .line 219
    :cond_0
    iget-object v0, p0, Lcom/alien/demo/feature/mask/CustomFragment;->specifyInfo:Lcom/alien/demo/feature/mask/SpecifyInfo;

    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/alien/demo/feature/mask/SpecifyInfo;->setArbitraryPtr(I)V

    goto :goto_0
.end method

.method private onClickClear(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v2, 0x0

    .line 253
    iget-object v0, p0, Lcom/alien/demo/feature/mask/CustomFragment;->specifyInfo:Lcom/alien/demo/feature/mask/SpecifyInfo;

    const-string v1, ""

    invoke-virtual {v0, v1}, Lcom/alien/demo/feature/mask/SpecifyInfo;->setEpcStartWithData(Ljava/lang/String;)V

    .line 254
    iget-object v0, p0, Lcom/alien/demo/feature/mask/CustomFragment;->specifyInfo:Lcom/alien/demo/feature/mask/SpecifyInfo;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/alien/demo/feature/mask/SpecifyInfo;->setArbitraryBank(I)V

    .line 255
    iget-object v0, p0, Lcom/alien/demo/feature/mask/CustomFragment;->specifyInfo:Lcom/alien/demo/feature/mask/SpecifyInfo;

    invoke-virtual {v0, v2}, Lcom/alien/demo/feature/mask/SpecifyInfo;->setArbitraryPtr(I)V

    .line 256
    iget-object v0, p0, Lcom/alien/demo/feature/mask/CustomFragment;->specifyInfo:Lcom/alien/demo/feature/mask/SpecifyInfo;

    invoke-virtual {v0, v2}, Lcom/alien/demo/feature/mask/SpecifyInfo;->setArbitraryLen(I)V

    .line 257
    iget-object v0, p0, Lcom/alien/demo/feature/mask/CustomFragment;->specifyInfo:Lcom/alien/demo/feature/mask/SpecifyInfo;

    const-string v1, ""

    invoke-virtual {v0, v1}, Lcom/alien/demo/feature/mask/SpecifyInfo;->setArbitraryData(Ljava/lang/String;)V

    .line 258
    invoke-direct {p0}, Lcom/alien/demo/feature/mask/CustomFragment;->reloadUI()V

    .line 259
    return-void
.end method

.method private onClickOk(Landroid/view/View;)V
    .locals 6
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v5, 0x1

    .line 234
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 235
    .local v0, "data":Landroid/content/Intent;
    iget-object v1, p0, Lcom/alien/demo/feature/mask/CustomFragment;->groups:Landroid/widget/RadioGroup;

    invoke-virtual {v1}, Landroid/widget/RadioGroup;->getCheckedRadioButtonId()I

    move-result v1

    iget-object v2, p0, Lcom/alien/demo/feature/mask/CustomFragment;->rbEpcStartWith:Landroid/widget/RadioButton;

    invoke-virtual {v2}, Landroid/widget/RadioButton;->getId()I

    move-result v2

    if-ne v1, v2, :cond_1

    .line 236
    iget-object v1, p0, Lcom/alien/demo/feature/mask/CustomFragment;->outputFilter:Lcom/alien/demo/rfid/TagMask;

    invoke-virtual {v1, v5}, Lcom/alien/demo/rfid/TagMask;->setMaskedBank(I)V

    .line 237
    iget-object v1, p0, Lcom/alien/demo/feature/mask/CustomFragment;->outputFilter:Lcom/alien/demo/rfid/TagMask;

    const/16 v2, 0x20

    iget-object v3, p0, Lcom/alien/demo/feature/mask/CustomFragment;->etEpcStartWithData:Landroid/widget/EditText;

    invoke-virtual {v3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    mul-int/lit8 v3, v3, 0x4

    iget-object v4, p0, Lcom/alien/demo/feature/mask/CustomFragment;->etEpcStartWithData:Landroid/widget/EditText;

    invoke-virtual {v4}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v5, v2, v3, v4}, Lcom/alien/demo/rfid/TagMask;->setMaskInfo(IIILjava/lang/String;)Z

    .line 239
    const-string v1, "filter_data"

    iget-object v2, p0, Lcom/alien/demo/feature/mask/CustomFragment;->outputFilter:Lcom/alien/demo/rfid/TagMask;

    invoke-virtual {v2}, Lcom/alien/demo/rfid/TagMask;->convertToString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 247
    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/alien/demo/feature/mask/CustomFragment;->context:Landroid/app/Activity;

    iget-object v2, p0, Lcom/alien/demo/feature/mask/CustomFragment;->context:Landroid/app/Activity;

    const/4 v2, -0x1

    invoke-virtual {v1, v2, v0}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 248
    iget-object v1, p0, Lcom/alien/demo/feature/mask/CustomFragment;->context:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->finish()V

    .line 250
    return-void

    .line 241
    :cond_1
    iget-object v1, p0, Lcom/alien/demo/feature/mask/CustomFragment;->groups:Landroid/widget/RadioGroup;

    invoke-virtual {v1}, Landroid/widget/RadioGroup;->getCheckedRadioButtonId()I

    move-result v1

    iget-object v2, p0, Lcom/alien/demo/feature/mask/CustomFragment;->rbArbitrary:Landroid/widget/RadioButton;

    invoke-virtual {v2}, Landroid/widget/RadioButton;->getId()I

    move-result v2

    if-ne v1, v2, :cond_0

    .line 242
    iget-object v1, p0, Lcom/alien/demo/feature/mask/CustomFragment;->outputFilter:Lcom/alien/demo/rfid/TagMask;

    iget-object v2, p0, Lcom/alien/demo/feature/mask/CustomFragment;->specifyInfo:Lcom/alien/demo/feature/mask/SpecifyInfo;

    invoke-virtual {v2}, Lcom/alien/demo/feature/mask/SpecifyInfo;->getArbitraryBank()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/alien/demo/rfid/TagMask;->setMaskedBank(I)V

    .line 243
    iget-object v1, p0, Lcom/alien/demo/feature/mask/CustomFragment;->outputFilter:Lcom/alien/demo/rfid/TagMask;

    iget-object v2, p0, Lcom/alien/demo/feature/mask/CustomFragment;->specifyInfo:Lcom/alien/demo/feature/mask/SpecifyInfo;

    invoke-virtual {v2}, Lcom/alien/demo/feature/mask/SpecifyInfo;->getArbitraryBank()I

    move-result v2

    iget-object v3, p0, Lcom/alien/demo/feature/mask/CustomFragment;->specifyInfo:Lcom/alien/demo/feature/mask/SpecifyInfo;

    invoke-virtual {v3}, Lcom/alien/demo/feature/mask/SpecifyInfo;->getArbitraryPtr()I

    move-result v3

    iget-object v4, p0, Lcom/alien/demo/feature/mask/CustomFragment;->specifyInfo:Lcom/alien/demo/feature/mask/SpecifyInfo;

    invoke-virtual {v4}, Lcom/alien/demo/feature/mask/SpecifyInfo;->getArbitraryLen()I

    move-result v4

    iget-object v5, p0, Lcom/alien/demo/feature/mask/CustomFragment;->specifyInfo:Lcom/alien/demo/feature/mask/SpecifyInfo;

    invoke-virtual {v5}, Lcom/alien/demo/feature/mask/SpecifyInfo;->getArbitraryData()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v2, v3, v4, v5}, Lcom/alien/demo/rfid/TagMask;->setMaskInfo(IIILjava/lang/String;)Z

    .line 245
    const-string v1, "filter_data"

    iget-object v2, p0, Lcom/alien/demo/feature/mask/CustomFragment;->outputFilter:Lcom/alien/demo/rfid/TagMask;

    invoke-virtual {v2}, Lcom/alien/demo/rfid/TagMask;->convertToString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_0
.end method

.method private onSpecifyGroupChanged(Landroid/widget/RadioGroup;I)V
    .locals 3
    .param p1, "radioGroup"    # Landroid/widget/RadioGroup;
    .param p2, "checkedId"    # I

    .prologue
    const/16 v2, 0x8

    const/4 v1, 0x0

    .line 194
    iget-object v0, p0, Lcom/alien/demo/feature/mask/CustomFragment;->groupEpcStartWith:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 195
    iget-object v0, p0, Lcom/alien/demo/feature/mask/CustomFragment;->groupArbitrary:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 197
    iget-object v0, p0, Lcom/alien/demo/feature/mask/CustomFragment;->rbEpcStartWith:Landroid/widget/RadioButton;

    invoke-virtual {v0}, Landroid/widget/RadioButton;->getId()I

    move-result v0

    if-ne p2, v0, :cond_0

    .line 198
    iget-object v0, p0, Lcom/alien/demo/feature/mask/CustomFragment;->groupEpcStartWith:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 199
    iget-object v0, p0, Lcom/alien/demo/feature/mask/CustomFragment;->specifyInfo:Lcom/alien/demo/feature/mask/SpecifyInfo;

    sget-object v1, Lcom/alien/demo/feature/mask/SpecifyInfo$SpecifyModeEnum;->START_WITH_EPC:Lcom/alien/demo/feature/mask/SpecifyInfo$SpecifyModeEnum;

    invoke-virtual {v0, v1}, Lcom/alien/demo/feature/mask/SpecifyInfo;->setSpecifyMode(Lcom/alien/demo/feature/mask/SpecifyInfo$SpecifyModeEnum;)V

    .line 205
    :goto_0
    return-void

    .line 202
    :cond_0
    iget-object v0, p0, Lcom/alien/demo/feature/mask/CustomFragment;->groupArbitrary:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 203
    iget-object v0, p0, Lcom/alien/demo/feature/mask/CustomFragment;->specifyInfo:Lcom/alien/demo/feature/mask/SpecifyInfo;

    sget-object v1, Lcom/alien/demo/feature/mask/SpecifyInfo$SpecifyModeEnum;->ARBITRATY:Lcom/alien/demo/feature/mask/SpecifyInfo$SpecifyModeEnum;

    invoke-virtual {v0, v1}, Lcom/alien/demo/feature/mask/SpecifyInfo;->setSpecifyMode(Lcom/alien/demo/feature/mask/SpecifyInfo$SpecifyModeEnum;)V

    goto :goto_0
.end method

.method private onStartWithEpcDataChanged(Ljava/lang/CharSequence;)V
    .locals 2
    .param p1, "s"    # Ljava/lang/CharSequence;

    .prologue
    .line 208
    iget-object v0, p0, Lcom/alien/demo/feature/mask/CustomFragment;->specifyInfo:Lcom/alien/demo/feature/mask/SpecifyInfo;

    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/alien/demo/feature/mask/SpecifyInfo;->setEpcStartWithData(Ljava/lang/String;)V

    .line 209
    return-void
.end method

.method private reloadUI()V
    .locals 3

    .prologue
    .line 59
    iget-object v0, p0, Lcom/alien/demo/feature/mask/CustomFragment;->etEpcStartWithData:Landroid/widget/EditText;

    iget-object v1, p0, Lcom/alien/demo/feature/mask/CustomFragment;->specifyInfo:Lcom/alien/demo/feature/mask/SpecifyInfo;

    invoke-virtual {v1}, Lcom/alien/demo/feature/mask/SpecifyInfo;->getEpcStartWithData()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 60
    iget-object v0, p0, Lcom/alien/demo/feature/mask/CustomFragment;->spBank:Landroid/widget/Spinner;

    iget-object v1, p0, Lcom/alien/demo/feature/mask/CustomFragment;->specifyInfo:Lcom/alien/demo/feature/mask/SpecifyInfo;

    invoke-virtual {v1}, Lcom/alien/demo/feature/mask/SpecifyInfo;->getArbitraryBank()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/Spinner;->setSelection(I)V

    .line 61
    iget-object v0, p0, Lcom/alien/demo/feature/mask/CustomFragment;->etPtr:Landroid/widget/EditText;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/alien/demo/feature/mask/CustomFragment;->specifyInfo:Lcom/alien/demo/feature/mask/SpecifyInfo;

    invoke-virtual {v2}, Lcom/alien/demo/feature/mask/SpecifyInfo;->getArbitraryPtr()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 62
    iget-object v0, p0, Lcom/alien/demo/feature/mask/CustomFragment;->etLen:Landroid/widget/EditText;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/alien/demo/feature/mask/CustomFragment;->specifyInfo:Lcom/alien/demo/feature/mask/SpecifyInfo;

    invoke-virtual {v2}, Lcom/alien/demo/feature/mask/SpecifyInfo;->getArbitraryLen()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 63
    iget-object v0, p0, Lcom/alien/demo/feature/mask/CustomFragment;->etData:Landroid/widget/EditText;

    iget-object v1, p0, Lcom/alien/demo/feature/mask/CustomFragment;->specifyInfo:Lcom/alien/demo/feature/mask/SpecifyInfo;

    invoke-virtual {v1}, Lcom/alien/demo/feature/mask/SpecifyInfo;->getArbitraryData()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 65
    iget-object v0, p0, Lcom/alien/demo/feature/mask/CustomFragment;->specifyInfo:Lcom/alien/demo/feature/mask/SpecifyInfo;

    invoke-virtual {v0}, Lcom/alien/demo/feature/mask/SpecifyInfo;->getSpecifyMode()Lcom/alien/demo/feature/mask/SpecifyInfo$SpecifyModeEnum;

    move-result-object v0

    sget-object v1, Lcom/alien/demo/feature/mask/SpecifyInfo$SpecifyModeEnum;->START_WITH_EPC:Lcom/alien/demo/feature/mask/SpecifyInfo$SpecifyModeEnum;

    if-ne v0, v1, :cond_0

    .line 66
    iget-object v0, p0, Lcom/alien/demo/feature/mask/CustomFragment;->groups:Landroid/widget/RadioGroup;

    iget-object v1, p0, Lcom/alien/demo/feature/mask/CustomFragment;->rbEpcStartWith:Landroid/widget/RadioButton;

    invoke-virtual {v1}, Landroid/widget/RadioButton;->getId()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/RadioGroup;->check(I)V

    .line 71
    :goto_0
    return-void

    .line 69
    :cond_0
    iget-object v0, p0, Lcom/alien/demo/feature/mask/CustomFragment;->groups:Landroid/widget/RadioGroup;

    iget-object v1, p0, Lcom/alien/demo/feature/mask/CustomFragment;->rbArbitrary:Landroid/widget/RadioButton;

    invoke-virtual {v1}, Landroid/widget/RadioButton;->getId()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/RadioGroup;->check(I)V

    goto :goto_0
.end method


# virtual methods
.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 80
    invoke-super {p0, p1}, Lcom/alien/demo/uibase/BaseFragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 81
    invoke-virtual {p0}, Lcom/alien/demo/feature/mask/CustomFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    iput-object v0, p0, Lcom/alien/demo/feature/mask/CustomFragment;->context:Landroid/app/Activity;

    .line 82
    iget-object v0, p0, Lcom/alien/demo/feature/mask/CustomFragment;->context:Landroid/app/Activity;

    check-cast v0, Lcom/alien/demo/feature/mask/MaskInterface;

    invoke-interface {v0}, Lcom/alien/demo/feature/mask/MaskInterface;->getMaskInfo()Lcom/alien/demo/feature/mask/MaskInfo;

    move-result-object v0

    invoke-virtual {v0}, Lcom/alien/demo/feature/mask/MaskInfo;->getSpecifyInfo()Lcom/alien/demo/feature/mask/SpecifyInfo;

    move-result-object v0

    iput-object v0, p0, Lcom/alien/demo/feature/mask/CustomFragment;->specifyInfo:Lcom/alien/demo/feature/mask/SpecifyInfo;

    .line 84
    iget-object v0, p0, Lcom/alien/demo/feature/mask/CustomFragment;->context:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "filter_data"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/alien/demo/rfid/TagMask;->createFromString(Ljava/lang/String;)Lcom/alien/demo/rfid/TagMask;

    move-result-object v0

    iput-object v0, p0, Lcom/alien/demo/feature/mask/CustomFragment;->outputFilter:Lcom/alien/demo/rfid/TagMask;

    .line 86
    iget-object v0, p0, Lcom/alien/demo/feature/mask/CustomFragment;->context:Landroid/app/Activity;

    const v1, 0x7f0c00ca

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RadioGroup;

    iput-object v0, p0, Lcom/alien/demo/feature/mask/CustomFragment;->groups:Landroid/widget/RadioGroup;

    .line 87
    iget-object v0, p0, Lcom/alien/demo/feature/mask/CustomFragment;->groups:Landroid/widget/RadioGroup;

    new-instance v1, Lcom/alien/demo/feature/mask/CustomFragment$1;

    invoke-direct {v1, p0}, Lcom/alien/demo/feature/mask/CustomFragment$1;-><init>(Lcom/alien/demo/feature/mask/CustomFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/RadioGroup;->setOnCheckedChangeListener(Landroid/widget/RadioGroup$OnCheckedChangeListener;)V

    .line 95
    iget-object v0, p0, Lcom/alien/demo/feature/mask/CustomFragment;->context:Landroid/app/Activity;

    const v1, 0x7f0c00ce

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/alien/demo/feature/mask/CustomFragment;->groupEpcStartWith:Landroid/view/View;

    .line 96
    iget-object v0, p0, Lcom/alien/demo/feature/mask/CustomFragment;->context:Landroid/app/Activity;

    const v1, 0x7f0c00cb

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RadioButton;

    iput-object v0, p0, Lcom/alien/demo/feature/mask/CustomFragment;->rbEpcStartWith:Landroid/widget/RadioButton;

    .line 97
    iget-object v0, p0, Lcom/alien/demo/feature/mask/CustomFragment;->context:Landroid/app/Activity;

    const v1, 0x7f0c00cf

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/alien/demo/feature/mask/CustomFragment;->etEpcStartWithData:Landroid/widget/EditText;

    .line 98
    iget-object v0, p0, Lcom/alien/demo/feature/mask/CustomFragment;->etEpcStartWithData:Landroid/widget/EditText;

    new-instance v1, Lcom/alien/demo/feature/mask/CustomFragment$2;

    invoke-direct {v1, p0}, Lcom/alien/demo/feature/mask/CustomFragment$2;-><init>(Lcom/alien/demo/feature/mask/CustomFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 114
    iget-object v0, p0, Lcom/alien/demo/feature/mask/CustomFragment;->context:Landroid/app/Activity;

    const v1, 0x7f0c00d0

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/alien/demo/feature/mask/CustomFragment;->groupArbitrary:Landroid/view/View;

    .line 115
    iget-object v0, p0, Lcom/alien/demo/feature/mask/CustomFragment;->context:Landroid/app/Activity;

    const v1, 0x7f0c00cc

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RadioButton;

    iput-object v0, p0, Lcom/alien/demo/feature/mask/CustomFragment;->rbArbitrary:Landroid/widget/RadioButton;

    .line 116
    iget-object v0, p0, Lcom/alien/demo/feature/mask/CustomFragment;->context:Landroid/app/Activity;

    const v1, 0x7f0c00d1

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Spinner;

    iput-object v0, p0, Lcom/alien/demo/feature/mask/CustomFragment;->spBank:Landroid/widget/Spinner;

    .line 117
    iget-object v0, p0, Lcom/alien/demo/feature/mask/CustomFragment;->spBank:Landroid/widget/Spinner;

    new-instance v1, Lcom/alien/demo/feature/mask/CustomFragment$3;

    invoke-direct {v1, p0}, Lcom/alien/demo/feature/mask/CustomFragment$3;-><init>(Lcom/alien/demo/feature/mask/CustomFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 128
    iget-object v0, p0, Lcom/alien/demo/feature/mask/CustomFragment;->context:Landroid/app/Activity;

    const v1, 0x7f0c00d2

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/alien/demo/feature/mask/CustomFragment;->etPtr:Landroid/widget/EditText;

    .line 129
    iget-object v0, p0, Lcom/alien/demo/feature/mask/CustomFragment;->etPtr:Landroid/widget/EditText;

    new-instance v1, Lcom/alien/demo/feature/mask/CustomFragment$4;

    invoke-direct {v1, p0}, Lcom/alien/demo/feature/mask/CustomFragment$4;-><init>(Lcom/alien/demo/feature/mask/CustomFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 144
    iget-object v0, p0, Lcom/alien/demo/feature/mask/CustomFragment;->context:Landroid/app/Activity;

    const v1, 0x7f0c00d3

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/alien/demo/feature/mask/CustomFragment;->etLen:Landroid/widget/EditText;

    .line 145
    iget-object v0, p0, Lcom/alien/demo/feature/mask/CustomFragment;->etLen:Landroid/widget/EditText;

    new-instance v1, Lcom/alien/demo/feature/mask/CustomFragment$5;

    invoke-direct {v1, p0}, Lcom/alien/demo/feature/mask/CustomFragment$5;-><init>(Lcom/alien/demo/feature/mask/CustomFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 160
    iget-object v0, p0, Lcom/alien/demo/feature/mask/CustomFragment;->context:Landroid/app/Activity;

    const v1, 0x7f0c00d4

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/alien/demo/feature/mask/CustomFragment;->etData:Landroid/widget/EditText;

    .line 161
    iget-object v0, p0, Lcom/alien/demo/feature/mask/CustomFragment;->etData:Landroid/widget/EditText;

    new-instance v1, Lcom/alien/demo/feature/mask/CustomFragment$6;

    invoke-direct {v1, p0}, Lcom/alien/demo/feature/mask/CustomFragment$6;-><init>(Lcom/alien/demo/feature/mask/CustomFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 176
    iget-object v0, p0, Lcom/alien/demo/feature/mask/CustomFragment;->context:Landroid/app/Activity;

    const v1, 0x7f0c00c8

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/alien/demo/feature/mask/CustomFragment;->btnOK:Landroid/widget/Button;

    .line 177
    iget-object v0, p0, Lcom/alien/demo/feature/mask/CustomFragment;->btnOK:Landroid/widget/Button;

    new-instance v1, Lcom/alien/demo/feature/mask/CustomFragment$7;

    invoke-direct {v1, p0}, Lcom/alien/demo/feature/mask/CustomFragment$7;-><init>(Lcom/alien/demo/feature/mask/CustomFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 184
    iget-object v0, p0, Lcom/alien/demo/feature/mask/CustomFragment;->context:Landroid/app/Activity;

    const v1, 0x7f0c00c9

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/alien/demo/feature/mask/CustomFragment;->btnClear:Landroid/widget/Button;

    .line 185
    iget-object v0, p0, Lcom/alien/demo/feature/mask/CustomFragment;->btnClear:Landroid/widget/Button;

    new-instance v1, Lcom/alien/demo/feature/mask/CustomFragment$8;

    invoke-direct {v1, p0}, Lcom/alien/demo/feature/mask/CustomFragment$8;-><init>(Lcom/alien/demo/feature/mask/CustomFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 191
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 75
    const v0, 0x7f030033

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public onResume()V
    .locals 0

    .prologue
    .line 53
    invoke-super {p0}, Lcom/alien/demo/uibase/BaseFragment;->onResume()V

    .line 54
    invoke-direct {p0}, Lcom/alien/demo/feature/mask/CustomFragment;->reloadUI()V

    .line 55
    return-void
.end method
