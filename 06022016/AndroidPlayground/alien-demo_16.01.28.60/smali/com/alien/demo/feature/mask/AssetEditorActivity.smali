.class public Lcom/alien/demo/feature/mask/AssetEditorActivity;
.super Landroid/app/Activity;
.source "AssetEditorActivity.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "AlienRFID-Asset Edit"


# instance fields
.field private asset:Lcom/alien/demo/data/Asset;

.field private barcodeReader:Lcom/alien/barcode/BarcodeReader;

.field private dummy:Landroid/view/View;

.field private etBarcode:Landroid/widget/EditText;

.field private etEpc:Landroid/widget/EditText;

.field private ivPhoto:Landroid/widget/ImageView;

.field private tagScanner:Lcom/alien/demo/rfid/TagScanner;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 35
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/alien/demo/feature/mask/AssetEditorActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/alien/demo/feature/mask/AssetEditorActivity;

    .prologue
    .line 35
    invoke-direct {p0}, Lcom/alien/demo/feature/mask/AssetEditorActivity;->selectPhoto()V

    return-void
.end method

.method static synthetic access$100(Lcom/alien/demo/feature/mask/AssetEditorActivity;)Landroid/widget/EditText;
    .locals 1
    .param p0, "x0"    # Lcom/alien/demo/feature/mask/AssetEditorActivity;

    .prologue
    .line 35
    iget-object v0, p0, Lcom/alien/demo/feature/mask/AssetEditorActivity;->etBarcode:Landroid/widget/EditText;

    return-object v0
.end method

.method static synthetic access$200(Lcom/alien/demo/feature/mask/AssetEditorActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/alien/demo/feature/mask/AssetEditorActivity;

    .prologue
    .line 35
    invoke-direct {p0}, Lcom/alien/demo/feature/mask/AssetEditorActivity;->nextFocus()V

    return-void
.end method

.method private clearPhoto()V
    .locals 2

    .prologue
    .line 132
    iget-object v0, p0, Lcom/alien/demo/feature/mask/AssetEditorActivity;->ivPhoto:Landroid/widget/ImageView;

    const v1, 0x106000d

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 133
    iget-object v0, p0, Lcom/alien/demo/feature/mask/AssetEditorActivity;->asset:Lcom/alien/demo/data/Asset;

    invoke-virtual {v0}, Lcom/alien/demo/data/Asset;->clearImage()V

    .line 134
    return-void
.end method

.method private hideKeyboard()V
    .locals 4

    .prologue
    .line 98
    invoke-virtual {p0}, Lcom/alien/demo/feature/mask/AssetEditorActivity;->getCurrentFocus()Landroid/view/View;

    move-result-object v1

    .line 99
    .local v1, "view":Landroid/view/View;
    if-eqz v1, :cond_0

    .line 100
    const-string v2, "input_method"

    invoke-virtual {p0, v2}, Lcom/alien/demo/feature/mask/AssetEditorActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 101
    .local v0, "imm":Landroid/view/inputmethod/InputMethodManager;
    invoke-virtual {v1}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 103
    .end local v0    # "imm":Landroid/view/inputmethod/InputMethodManager;
    :cond_0
    return-void
.end method

.method private loadPhoto(Ljava/io/InputStream;)V
    .locals 2
    .param p1, "in"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 143
    invoke-virtual {p1}, Ljava/io/InputStream;->available()I

    move-result v1

    new-array v0, v1, [B

    .line 144
    .local v0, "buf":[B
    invoke-virtual {p1, v0}, Ljava/io/InputStream;->read([B)I

    .line 145
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V

    .line 146
    iget-object v1, p0, Lcom/alien/demo/feature/mask/AssetEditorActivity;->asset:Lcom/alien/demo/data/Asset;

    invoke-virtual {v1, v0}, Lcom/alien/demo/data/Asset;->setImage([B)V

    .line 147
    invoke-direct {p0, v0}, Lcom/alien/demo/feature/mask/AssetEditorActivity;->loadPhotoForView([B)V

    .line 148
    invoke-direct {p0}, Lcom/alien/demo/feature/mask/AssetEditorActivity;->nextFocus()V

    .line 149
    return-void
.end method

.method private loadPhotoForView([B)V
    .locals 6
    .param p1, "buf"    # [B

    .prologue
    const/4 v5, 0x0

    .line 152
    if-nez p1, :cond_0

    .line 160
    :goto_0
    return-void

    .line 155
    :cond_0
    array-length v4, p1

    invoke-static {p1, v5, v4}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 156
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    .line 157
    .local v3, "width":I
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    .line 158
    .local v1, "height":I
    if-ge v3, v1, :cond_1

    move v2, v3

    .line 159
    .local v2, "min":I
    :goto_1
    iget-object v4, p0, Lcom/alien/demo/feature/mask/AssetEditorActivity;->ivPhoto:Landroid/widget/ImageView;

    invoke-static {v0, v5, v5, v2, v2}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIII)Landroid/graphics/Bitmap;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    goto :goto_0

    .end local v2    # "min":I
    :cond_1
    move v2, v1

    .line 158
    goto :goto_1
.end method

.method private nextFocus()V
    .locals 1

    .prologue
    .line 106
    iget-object v0, p0, Lcom/alien/demo/feature/mask/AssetEditorActivity;->etEpc:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 107
    iget-object v0, p0, Lcom/alien/demo/feature/mask/AssetEditorActivity;->etEpc:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->requestFocus()Z

    .line 114
    :goto_0
    invoke-direct {p0}, Lcom/alien/demo/feature/mask/AssetEditorActivity;->hideKeyboard()V

    .line 115
    return-void

    .line 108
    :cond_0
    iget-object v0, p0, Lcom/alien/demo/feature/mask/AssetEditorActivity;->etBarcode:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 109
    iget-object v0, p0, Lcom/alien/demo/feature/mask/AssetEditorActivity;->etBarcode:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->requestFocus()Z

    goto :goto_0

    .line 110
    :cond_1
    iget-object v0, p0, Lcom/alien/demo/feature/mask/AssetEditorActivity;->asset:Lcom/alien/demo/data/Asset;

    invoke-virtual {v0}, Lcom/alien/demo/data/Asset;->getImage()[B

    move-result-object v0

    if-nez v0, :cond_2

    .line 111
    iget-object v0, p0, Lcom/alien/demo/feature/mask/AssetEditorActivity;->ivPhoto:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->requestFocus()Z

    goto :goto_0

    .line 113
    :cond_2
    iget-object v0, p0, Lcom/alien/demo/feature/mask/AssetEditorActivity;->dummy:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    goto :goto_0
.end method

.method private scanBarcode()V
    .locals 2

    .prologue
    .line 201
    iget-object v0, p0, Lcom/alien/demo/feature/mask/AssetEditorActivity;->barcodeReader:Lcom/alien/barcode/BarcodeReader;

    invoke-virtual {v0}, Lcom/alien/barcode/BarcodeReader;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 212
    :goto_0
    return-void

    .line 204
    :cond_0
    iget-object v0, p0, Lcom/alien/demo/feature/mask/AssetEditorActivity;->barcodeReader:Lcom/alien/barcode/BarcodeReader;

    new-instance v1, Lcom/alien/demo/feature/mask/AssetEditorActivity$2;

    invoke-direct {v1, p0}, Lcom/alien/demo/feature/mask/AssetEditorActivity$2;-><init>(Lcom/alien/demo/feature/mask/AssetEditorActivity;)V

    invoke-virtual {v0, v1}, Lcom/alien/barcode/BarcodeReader;->start(Lcom/alien/barcode/BarcodeCallback;)V

    goto :goto_0
.end method

.method private scanEpc()V
    .locals 3

    .prologue
    .line 191
    iget-object v1, p0, Lcom/alien/demo/feature/mask/AssetEditorActivity;->tagScanner:Lcom/alien/demo/rfid/TagScanner;

    invoke-virtual {v1}, Lcom/alien/demo/rfid/TagScanner;->scanSingle()Lcom/alien/rfid/Tag;

    move-result-object v0

    .line 192
    .local v0, "tag":Lcom/alien/rfid/Tag;
    if-eqz v0, :cond_0

    .line 193
    iget-object v1, p0, Lcom/alien/demo/feature/mask/AssetEditorActivity;->etEpc:Landroid/widget/EditText;

    invoke-virtual {v0}, Lcom/alien/rfid/Tag;->getEPC()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 194
    invoke-static {p0}, Lcom/alien/demo/system/Sound;->playSuccess(Landroid/content/Context;)V

    .line 195
    invoke-direct {p0}, Lcom/alien/demo/feature/mask/AssetEditorActivity;->nextFocus()V

    .line 198
    :goto_0
    return-void

    .line 197
    :cond_0
    invoke-static {p0}, Lcom/alien/demo/system/Sound;->playError(Landroid/content/Context;)V

    goto :goto_0
.end method

.method private selectPhoto()V
    .locals 2

    .prologue
    .line 137
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.GET_CONTENT"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 138
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "image/*"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 139
    const/4 v1, 0x3

    invoke-virtual {p0, v0, v1}, Lcom/alien/demo/feature/mask/AssetEditorActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 140
    return-void
.end method


# virtual methods
.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 4
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 164
    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onActivityResult(IILandroid/content/Intent;)V

    .line 165
    const/4 v1, 0x3

    if-ne p1, v1, :cond_0

    const/4 v1, -0x1

    if-ne p2, v1, :cond_0

    .line 166
    if-nez p3, :cond_1

    .line 177
    :cond_0
    :goto_0
    return-void

    .line 170
    :cond_1
    :try_start_0
    invoke-virtual {p0}, Lcom/alien/demo/feature/mask/AssetEditorActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/alien/demo/feature/mask/AssetEditorActivity;->loadPhoto(Ljava/io/InputStream;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 171
    :catch_0
    move-exception v0

    .line 172
    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "AlienRFID-Asset Edit"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Error loading photo: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 173
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 174
    const v1, 0x7f05004c

    invoke-static {p0, v1}, Lcom/alien/demo/uibase/UIHelper;->ToastMessage(Landroid/content/Context;I)V

    goto :goto_0
.end method

.method public onClickCancel(Landroid/view/View;)V
    .locals 0
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 128
    invoke-virtual {p0}, Lcom/alien/demo/feature/mask/AssetEditorActivity;->finish()V

    .line 129
    return-void
.end method

.method public onClickSave(Landroid/view/View;)V
    .locals 3
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 118
    iget-object v1, p0, Lcom/alien/demo/feature/mask/AssetEditorActivity;->asset:Lcom/alien/demo/data/Asset;

    iget-object v2, p0, Lcom/alien/demo/feature/mask/AssetEditorActivity;->etEpc:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/alien/demo/data/Asset;->setEpc(Ljava/lang/String;)V

    .line 119
    iget-object v1, p0, Lcom/alien/demo/feature/mask/AssetEditorActivity;->asset:Lcom/alien/demo/data/Asset;

    iget-object v2, p0, Lcom/alien/demo/feature/mask/AssetEditorActivity;->etBarcode:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/alien/demo/data/Asset;->setBarcode(Ljava/lang/String;)V

    .line 121
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 122
    .local v0, "data":Landroid/content/Intent;
    const-string v1, "asset_data"

    iget-object v2, p0, Lcom/alien/demo/feature/mask/AssetEditorActivity;->asset:Lcom/alien/demo/data/Asset;

    invoke-virtual {v2}, Lcom/alien/demo/data/Asset;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 123
    const/4 v1, -0x1

    invoke-virtual {p0, v1, v0}, Lcom/alien/demo/feature/mask/AssetEditorActivity;->setResult(ILandroid/content/Intent;)V

    .line 124
    invoke-virtual {p0}, Lcom/alien/demo/feature/mask/AssetEditorActivity;->finish()V

    .line 125
    return-void
.end method

.method public onContextItemSelected(Landroid/view/MenuItem;)Z
    .locals 2
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    const/4 v0, 0x1

    .line 272
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 280
    invoke-super {p0, p1}, Landroid/app/Activity;->onContextItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    :goto_0
    return v0

    .line 274
    :pswitch_0
    invoke-direct {p0}, Lcom/alien/demo/feature/mask/AssetEditorActivity;->selectPhoto()V

    goto :goto_0

    .line 277
    :pswitch_1
    invoke-direct {p0}, Lcom/alien/demo/feature/mask/AssetEditorActivity;->clearPhoto()V

    goto :goto_0

    .line 272
    nop

    :pswitch_data_0
    .packed-switch 0x7f0c00f5
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 50
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 51
    const v0, 0x7f030019

    invoke-virtual {p0, v0}, Lcom/alien/demo/feature/mask/AssetEditorActivity;->setContentView(I)V

    .line 52
    invoke-virtual {p0}, Lcom/alien/demo/feature/mask/AssetEditorActivity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    .line 53
    invoke-virtual {p0}, Lcom/alien/demo/feature/mask/AssetEditorActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/16 v1, 0x80

    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    .line 54
    invoke-virtual {p0}, Lcom/alien/demo/feature/mask/AssetEditorActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Landroid/view/Window;->setSoftInputMode(I)V

    .line 56
    invoke-virtual {p0}, Lcom/alien/demo/feature/mask/AssetEditorActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "asset_data"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 57
    invoke-virtual {p0}, Lcom/alien/demo/feature/mask/AssetEditorActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "asset_data"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/alien/demo/data/Asset;->loadFromString(Ljava/lang/String;)Lcom/alien/demo/data/Asset;

    move-result-object v0

    iput-object v0, p0, Lcom/alien/demo/feature/mask/AssetEditorActivity;->asset:Lcom/alien/demo/data/Asset;

    .line 61
    :goto_0
    const v0, 0x7f0c006c

    invoke-virtual {p0, v0}, Lcom/alien/demo/feature/mask/AssetEditorActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/alien/demo/feature/mask/AssetEditorActivity;->etEpc:Landroid/widget/EditText;

    .line 69
    const v0, 0x7f0c006d

    invoke-virtual {p0, v0}, Lcom/alien/demo/feature/mask/AssetEditorActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/alien/demo/feature/mask/AssetEditorActivity;->etBarcode:Landroid/widget/EditText;

    .line 77
    const v0, 0x7f0c006e

    invoke-virtual {p0, v0}, Lcom/alien/demo/feature/mask/AssetEditorActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/alien/demo/feature/mask/AssetEditorActivity;->ivPhoto:Landroid/widget/ImageView;

    .line 78
    iget-object v0, p0, Lcom/alien/demo/feature/mask/AssetEditorActivity;->ivPhoto:Landroid/widget/ImageView;

    new-instance v1, Lcom/alien/demo/feature/mask/AssetEditorActivity$1;

    invoke-direct {v1, p0}, Lcom/alien/demo/feature/mask/AssetEditorActivity$1;-><init>(Lcom/alien/demo/feature/mask/AssetEditorActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 84
    iget-object v0, p0, Lcom/alien/demo/feature/mask/AssetEditorActivity;->ivPhoto:Landroid/widget/ImageView;

    invoke-virtual {p0, v0}, Lcom/alien/demo/feature/mask/AssetEditorActivity;->registerForContextMenu(Landroid/view/View;)V

    .line 85
    const v0, 0x7f0c0069

    invoke-virtual {p0, v0}, Lcom/alien/demo/feature/mask/AssetEditorActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/alien/demo/feature/mask/AssetEditorActivity;->dummy:Landroid/view/View;

    .line 87
    new-instance v0, Lcom/alien/barcode/BarcodeReader;

    invoke-direct {v0, p0}, Lcom/alien/barcode/BarcodeReader;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/alien/demo/feature/mask/AssetEditorActivity;->barcodeReader:Lcom/alien/barcode/BarcodeReader;

    .line 88
    new-instance v0, Lcom/alien/demo/rfid/TagScanner;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/alien/demo/rfid/TagScanner;-><init>(Lcom/alien/rfid/RFIDCallback;)V

    iput-object v0, p0, Lcom/alien/demo/feature/mask/AssetEditorActivity;->tagScanner:Lcom/alien/demo/rfid/TagScanner;

    .line 90
    iget-object v0, p0, Lcom/alien/demo/feature/mask/AssetEditorActivity;->etEpc:Landroid/widget/EditText;

    iget-object v1, p0, Lcom/alien/demo/feature/mask/AssetEditorActivity;->asset:Lcom/alien/demo/data/Asset;

    invoke-virtual {v1}, Lcom/alien/demo/data/Asset;->getEpc()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 91
    iget-object v0, p0, Lcom/alien/demo/feature/mask/AssetEditorActivity;->etBarcode:Landroid/widget/EditText;

    iget-object v1, p0, Lcom/alien/demo/feature/mask/AssetEditorActivity;->asset:Lcom/alien/demo/data/Asset;

    invoke-virtual {v1}, Lcom/alien/demo/data/Asset;->getBarcode()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 92
    iget-object v0, p0, Lcom/alien/demo/feature/mask/AssetEditorActivity;->asset:Lcom/alien/demo/data/Asset;

    invoke-virtual {v0}, Lcom/alien/demo/data/Asset;->getImage()[B

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/alien/demo/feature/mask/AssetEditorActivity;->loadPhotoForView([B)V

    .line 94
    invoke-direct {p0}, Lcom/alien/demo/feature/mask/AssetEditorActivity;->nextFocus()V

    .line 95
    return-void

    .line 59
    :cond_0
    new-instance v0, Lcom/alien/demo/data/Asset;

    invoke-direct {v0}, Lcom/alien/demo/data/Asset;-><init>()V

    iput-object v0, p0, Lcom/alien/demo/feature/mask/AssetEditorActivity;->asset:Lcom/alien/demo/data/Asset;

    goto :goto_0
.end method

.method public onCreateContextMenu(Landroid/view/ContextMenu;Landroid/view/View;Landroid/view/ContextMenu$ContextMenuInfo;)V
    .locals 2
    .param p1, "menu"    # Landroid/view/ContextMenu;
    .param p2, "v"    # Landroid/view/View;
    .param p3, "menuInfo"    # Landroid/view/ContextMenu$ContextMenuInfo;

    .prologue
    .line 262
    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onCreateContextMenu(Landroid/view/ContextMenu;Landroid/view/View;Landroid/view/ContextMenu$ContextMenuInfo;)V

    .line 264
    invoke-virtual {p2}, Landroid/view/View;->getId()I

    move-result v0

    const v1, 0x7f0c006e

    if-ne v0, v1, :cond_0

    .line 265
    invoke-virtual {p0}, Lcom/alien/demo/feature/mask/AssetEditorActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    const v1, 0x7f0d0001

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 267
    :cond_0
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    .line 240
    invoke-virtual {p0}, Lcom/alien/demo/feature/mask/AssetEditorActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    const/high16 v1, 0x7f0d0000

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 241
    const/4 v0, 0x1

    return v0
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 1
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 220
    const/16 v0, 0x8b

    if-ne p1, v0, :cond_0

    invoke-virtual {p2}, Landroid/view/KeyEvent;->getRepeatCount()I

    move-result v0

    if-nez v0, :cond_0

    .line 221
    invoke-direct {p0}, Lcom/alien/demo/feature/mask/AssetEditorActivity;->hideKeyboard()V

    .line 222
    invoke-virtual {p0}, Lcom/alien/demo/feature/mask/AssetEditorActivity;->scan()V

    .line 223
    const/4 v0, 0x1

    .line 225
    :goto_0
    return v0

    :cond_0
    invoke-super {p0, p1, p2}, Landroid/app/Activity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    goto :goto_0
.end method

.method public onKeyUp(ILandroid/view/KeyEvent;)Z
    .locals 1
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 230
    const/16 v0, 0x8b

    if-ne p1, v0, :cond_0

    .line 231
    invoke-virtual {p0}, Lcom/alien/demo/feature/mask/AssetEditorActivity;->stopScan()V

    .line 232
    const/4 v0, 0x1

    .line 234
    :goto_0
    return v0

    :cond_0
    invoke-super {p0, p1, p2}, Landroid/app/Activity;->onKeyUp(ILandroid/view/KeyEvent;)Z

    move-result v0

    goto :goto_0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 249
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    .line 251
    .local v0, "id":I
    packed-switch v0, :pswitch_data_0

    .line 257
    invoke-super {p0, p1}, Landroid/app/Activity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v1

    :goto_0
    return v1

    .line 253
    :pswitch_0
    invoke-virtual {p0}, Lcom/alien/demo/feature/mask/AssetEditorActivity;->onBackPressed()V

    .line 254
    const/4 v1, 0x1

    goto :goto_0

    .line 251
    nop

    :pswitch_data_0
    .packed-switch 0x102002c
        :pswitch_0
    .end packed-switch
.end method

.method public scan()V
    .locals 1

    .prologue
    .line 180
    iget-object v0, p0, Lcom/alien/demo/feature/mask/AssetEditorActivity;->etEpc:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->isFocused()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 181
    invoke-direct {p0}, Lcom/alien/demo/feature/mask/AssetEditorActivity;->scanEpc()V

    .line 188
    :cond_0
    :goto_0
    return-void

    .line 182
    :cond_1
    iget-object v0, p0, Lcom/alien/demo/feature/mask/AssetEditorActivity;->etBarcode:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->isFocused()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 183
    invoke-direct {p0}, Lcom/alien/demo/feature/mask/AssetEditorActivity;->scanBarcode()V

    goto :goto_0

    .line 185
    :cond_2
    iget-object v0, p0, Lcom/alien/demo/feature/mask/AssetEditorActivity;->ivPhoto:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->isFocused()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 186
    invoke-direct {p0}, Lcom/alien/demo/feature/mask/AssetEditorActivity;->selectPhoto()V

    goto :goto_0
.end method

.method public declared-synchronized stopScan()V
    .locals 1

    .prologue
    .line 215
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/alien/demo/feature/mask/AssetEditorActivity;->barcodeReader:Lcom/alien/barcode/BarcodeReader;

    invoke-virtual {v0}, Lcom/alien/barcode/BarcodeReader;->stop()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 216
    monitor-exit p0

    return-void

    .line 215
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
