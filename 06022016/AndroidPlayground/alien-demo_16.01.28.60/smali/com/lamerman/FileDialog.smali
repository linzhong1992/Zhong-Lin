.class public Lcom/lamerman/FileDialog;
.super Landroid/app/ListActivity;
.source "FileDialog.java"


# static fields
.field public static final CAN_SELECT_DIR:Ljava/lang/String; = "CAN_SELECT_DIR"

.field public static final FORMAT_FILTER:Ljava/lang/String; = "FORMAT_FILTER"

.field private static final ITEM_IMAGE:Ljava/lang/String; = "image"

.field private static final ITEM_KEY:Ljava/lang/String; = "key"

.field public static final RESULT_PATH:Ljava/lang/String; = "RESULT_PATH"

.field private static final ROOT:Ljava/lang/String; = "/"

.field public static final SELECTION_MODE:Ljava/lang/String; = "SELECTION_MODE"

.field public static final START_PATH:Ljava/lang/String; = "START_PATH"


# instance fields
.field private canSelectDir:Z

.field private currentPath:Ljava/lang/String;

.field private formatFilter:[Ljava/lang/String;

.field private inputManager:Landroid/view/inputmethod/InputMethodManager;

.field private lastPositions:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private layoutCreate:Landroid/widget/LinearLayout;

.field private layoutSelect:Landroid/widget/LinearLayout;

.field private mFileName:Landroid/widget/EditText;

.field private mList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation
.end field

.field private myPath:Landroid/widget/TextView;

.field private parentPath:Ljava/lang/String;

.field private path:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private selectButton:Landroid/widget/Button;

.field private selectedFile:Ljava/io/File;

.field private selectionMode:I


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 30
    invoke-direct {p0}, Landroid/app/ListActivity;-><init>()V

    .line 77
    iput-object v2, p0, Lcom/lamerman/FileDialog;->path:Ljava/util/List;

    .line 88
    const-string v0, "/"

    iput-object v0, p0, Lcom/lamerman/FileDialog;->currentPath:Ljava/lang/String;

    .line 90
    iput v1, p0, Lcom/lamerman/FileDialog;->selectionMode:I

    .line 92
    iput-object v2, p0, Lcom/lamerman/FileDialog;->formatFilter:[Ljava/lang/String;

    .line 94
    iput-boolean v1, p0, Lcom/lamerman/FileDialog;->canSelectDir:Z

    .line 97
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/lamerman/FileDialog;->lastPositions:Ljava/util/HashMap;

    return-void
.end method

.method static synthetic access$000(Lcom/lamerman/FileDialog;)Ljava/io/File;
    .locals 1
    .param p0, "x0"    # Lcom/lamerman/FileDialog;

    .prologue
    .line 30
    iget-object v0, p0, Lcom/lamerman/FileDialog;->selectedFile:Ljava/io/File;

    return-object v0
.end method

.method static synthetic access$100(Lcom/lamerman/FileDialog;Landroid/view/View;)V
    .locals 0
    .param p0, "x0"    # Lcom/lamerman/FileDialog;
    .param p1, "x1"    # Landroid/view/View;

    .prologue
    .line 30
    invoke-direct {p0, p1}, Lcom/lamerman/FileDialog;->setCreateVisible(Landroid/view/View;)V

    return-void
.end method

.method static synthetic access$200(Lcom/lamerman/FileDialog;)Landroid/widget/EditText;
    .locals 1
    .param p0, "x0"    # Lcom/lamerman/FileDialog;

    .prologue
    .line 30
    iget-object v0, p0, Lcom/lamerman/FileDialog;->mFileName:Landroid/widget/EditText;

    return-object v0
.end method

.method static synthetic access$300(Lcom/lamerman/FileDialog;Landroid/view/View;)V
    .locals 0
    .param p0, "x0"    # Lcom/lamerman/FileDialog;
    .param p1, "x1"    # Landroid/view/View;

    .prologue
    .line 30
    invoke-direct {p0, p1}, Lcom/lamerman/FileDialog;->setSelectVisible(Landroid/view/View;)V

    return-void
.end method

.method static synthetic access$400(Lcom/lamerman/FileDialog;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/lamerman/FileDialog;

    .prologue
    .line 30
    iget-object v0, p0, Lcom/lamerman/FileDialog;->currentPath:Ljava/lang/String;

    return-object v0
.end method

.method private addItem(Ljava/lang/String;I)V
    .locals 3
    .param p1, "fileName"    # Ljava/lang/String;
    .param p2, "imageId"    # I

    .prologue
    .line 292
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 293
    .local v0, "item":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v1, "key"

    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 294
    const-string v1, "image"

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 295
    iget-object v1, p0, Lcom/lamerman/FileDialog;->mList:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 296
    return-void
.end method

.method private getDir(Ljava/lang/String;)V
    .locals 4
    .param p1, "dirPath"    # Ljava/lang/String;

    .prologue
    .line 188
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    iget-object v3, p0, Lcom/lamerman/FileDialog;->currentPath:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v2, v3, :cond_1

    const/4 v1, 0x1

    .line 190
    .local v1, "useAutoSelection":Z
    :goto_0
    iget-object v2, p0, Lcom/lamerman/FileDialog;->lastPositions:Ljava/util/HashMap;

    iget-object v3, p0, Lcom/lamerman/FileDialog;->parentPath:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 192
    .local v0, "position":Ljava/lang/Integer;
    invoke-direct {p0, p1}, Lcom/lamerman/FileDialog;->getDirImpl(Ljava/lang/String;)V

    .line 194
    if-eqz v0, :cond_0

    if-eqz v1, :cond_0

    .line 195
    invoke-virtual {p0}, Lcom/lamerman/FileDialog;->getListView()Landroid/widget/ListView;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/ListView;->setSelection(I)V

    .line 198
    :cond_0
    return-void

    .line 188
    .end local v0    # "position":Ljava/lang/Integer;
    .end local v1    # "useAutoSelection":Z
    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private getDirImpl(Ljava/lang/String;)V
    .locals 28
    .param p1, "dirPath"    # Ljava/lang/String;

    .prologue
    .line 208
    move-object/from16 v0, p1

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/lamerman/FileDialog;->currentPath:Ljava/lang/String;

    .line 210
    new-instance v25, Ljava/util/ArrayList;

    invoke-direct/range {v25 .. v25}, Ljava/util/ArrayList;-><init>()V

    .line 211
    .local v25, "item":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/lamerman/FileDialog;->path:Ljava/util/List;

    .line 212
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/lamerman/FileDialog;->mList:Ljava/util/ArrayList;

    .line 214
    new-instance v15, Ljava/io/File;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/lamerman/FileDialog;->currentPath:Ljava/lang/String;

    invoke-direct {v15, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 215
    .local v15, "f":Ljava/io/File;
    invoke-virtual {v15}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v19

    .line 216
    .local v19, "files":[Ljava/io/File;
    if-nez v19, :cond_0

    .line 217
    const-string v4, "/"

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/lamerman/FileDialog;->currentPath:Ljava/lang/String;

    .line 218
    new-instance v15, Ljava/io/File;

    .end local v15    # "f":Ljava/io/File;
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/lamerman/FileDialog;->currentPath:Ljava/lang/String;

    invoke-direct {v15, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 219
    .restart local v15    # "f":Ljava/io/File;
    invoke-virtual {v15}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v19

    .line 221
    :cond_0
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/lamerman/FileDialog;->myPath:Landroid/widget/TextView;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    sget v6, Lcom/lamerman/R$string;->location:I

    move-object/from16 v0, p0

    invoke-virtual {v0, v6}, Lcom/lamerman/FileDialog;->getText(I)Ljava/lang/CharSequence;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ": "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/lamerman/FileDialog;->currentPath:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 223
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/lamerman/FileDialog;->currentPath:Ljava/lang/String;

    const-string v5, "/"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 225
    const-string v4, "/"

    move-object/from16 v0, v25

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 226
    const-string v4, "/"

    sget v5, Lcom/lamerman/R$drawable;->folder:I

    move-object/from16 v0, p0

    invoke-direct {v0, v4, v5}, Lcom/lamerman/FileDialog;->addItem(Ljava/lang/String;I)V

    .line 227
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/lamerman/FileDialog;->path:Ljava/util/List;

    const-string v5, "/"

    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 229
    const-string v4, "../"

    move-object/from16 v0, v25

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 230
    const-string v4, "../"

    sget v5, Lcom/lamerman/R$drawable;->folder:I

    move-object/from16 v0, p0

    invoke-direct {v0, v4, v5}, Lcom/lamerman/FileDialog;->addItem(Ljava/lang/String;I)V

    .line 231
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/lamerman/FileDialog;->path:Ljava/util/List;

    invoke-virtual {v15}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 232
    invoke-virtual {v15}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/lamerman/FileDialog;->parentPath:Ljava/lang/String;

    .line 236
    :cond_1
    new-instance v13, Ljava/util/TreeMap;

    invoke-direct {v13}, Ljava/util/TreeMap;-><init>()V

    .line 237
    .local v13, "dirsMap":Ljava/util/TreeMap;, "Ljava/util/TreeMap<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v14, Ljava/util/TreeMap;

    invoke-direct {v14}, Ljava/util/TreeMap;-><init>()V

    .line 238
    .local v14, "dirsPathMap":Ljava/util/TreeMap;, "Ljava/util/TreeMap<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v20, Ljava/util/TreeMap;

    invoke-direct/range {v20 .. v20}, Ljava/util/TreeMap;-><init>()V

    .line 239
    .local v20, "filesMap":Ljava/util/TreeMap;, "Ljava/util/TreeMap<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v21, Ljava/util/TreeMap;

    invoke-direct/range {v21 .. v21}, Ljava/util/TreeMap;-><init>()V

    .line 240
    .local v21, "filesPathMap":Ljava/util/TreeMap;, "Ljava/util/TreeMap<Ljava/lang/String;Ljava/lang/String;>;"
    move-object/from16 v9, v19

    .local v9, "arr$":[Ljava/io/File;
    array-length v0, v9

    move/from16 v26, v0

    .local v26, "len$":I
    const/16 v24, 0x0

    .local v24, "i$":I
    :goto_0
    move/from16 v0, v24

    move/from16 v1, v26

    if-ge v0, v1, :cond_7

    aget-object v16, v9, v24

    .line 241
    .local v16, "file":Ljava/io/File;
    invoke-virtual/range {v16 .. v16}, Ljava/io/File;->isDirectory()Z

    move-result v4

    if-eqz v4, :cond_3

    .line 242
    invoke-virtual/range {v16 .. v16}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v12

    .line 243
    .local v12, "dirName":Ljava/lang/String;
    invoke-virtual {v13, v12, v12}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 244
    invoke-virtual/range {v16 .. v16}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v14, v12, v4}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 240
    .end local v12    # "dirName":Ljava/lang/String;
    :cond_2
    :goto_1
    add-int/lit8 v24, v24, 0x1

    goto :goto_0

    .line 246
    :cond_3
    invoke-virtual/range {v16 .. v16}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v17

    .line 247
    .local v17, "fileName":Ljava/lang/String;
    invoke-virtual/range {v17 .. v17}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v18

    .line 249
    .local v18, "fileNameLwr":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/lamerman/FileDialog;->formatFilter:[Ljava/lang/String;

    if-eqz v4, :cond_6

    .line 250
    const/4 v10, 0x0

    .line 251
    .local v10, "contains":Z
    const/16 v23, 0x0

    .local v23, "i":I
    :goto_2
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/lamerman/FileDialog;->formatFilter:[Ljava/lang/String;

    array-length v4, v4

    move/from16 v0, v23

    if-ge v0, v4, :cond_4

    .line 252
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/lamerman/FileDialog;->formatFilter:[Ljava/lang/String;

    aget-object v4, v4, v23

    invoke-virtual {v4}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v22

    .line 253
    .local v22, "formatLwr":Ljava/lang/String;
    move-object/from16 v0, v18

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 254
    const/4 v10, 0x1

    .line 258
    .end local v22    # "formatLwr":Ljava/lang/String;
    :cond_4
    if-eqz v10, :cond_2

    .line 259
    move-object/from16 v0, v20

    move-object/from16 v1, v17

    move-object/from16 v2, v17

    invoke-virtual {v0, v1, v2}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 260
    invoke-virtual/range {v16 .. v16}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, v21

    move-object/from16 v1, v17

    invoke-virtual {v0, v1, v4}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 251
    .restart local v22    # "formatLwr":Ljava/lang/String;
    :cond_5
    add-int/lit8 v23, v23, 0x1

    goto :goto_2

    .line 264
    .end local v10    # "contains":Z
    .end local v22    # "formatLwr":Ljava/lang/String;
    .end local v23    # "i":I
    :cond_6
    move-object/from16 v0, v20

    move-object/from16 v1, v17

    move-object/from16 v2, v17

    invoke-virtual {v0, v1, v2}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 265
    invoke-virtual/range {v16 .. v16}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, v21

    move-object/from16 v1, v17

    invoke-virtual {v0, v1, v4}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 269
    .end local v16    # "file":Ljava/io/File;
    .end local v17    # "fileName":Ljava/lang/String;
    .end local v18    # "fileNameLwr":Ljava/lang/String;
    :cond_7
    const-string v4, ""

    invoke-virtual {v13, v4}, Ljava/util/TreeMap;->tailMap(Ljava/lang/Object;)Ljava/util/SortedMap;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/SortedMap;->values()Ljava/util/Collection;

    move-result-object v4

    move-object/from16 v0, v25

    invoke-interface {v0, v4}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 270
    const-string v4, ""

    move-object/from16 v0, v20

    invoke-virtual {v0, v4}, Ljava/util/TreeMap;->tailMap(Ljava/lang/Object;)Ljava/util/SortedMap;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/SortedMap;->values()Ljava/util/Collection;

    move-result-object v4

    move-object/from16 v0, v25

    invoke-interface {v0, v4}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 271
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/lamerman/FileDialog;->path:Ljava/util/List;

    const-string v5, ""

    invoke-virtual {v14, v5}, Ljava/util/TreeMap;->tailMap(Ljava/lang/Object;)Ljava/util/SortedMap;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/SortedMap;->values()Ljava/util/Collection;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 272
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/lamerman/FileDialog;->path:Ljava/util/List;

    const-string v5, ""

    move-object/from16 v0, v21

    invoke-virtual {v0, v5}, Ljava/util/TreeMap;->tailMap(Ljava/lang/Object;)Ljava/util/SortedMap;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/SortedMap;->values()Ljava/util/Collection;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 274
    new-instance v3, Landroid/widget/SimpleAdapter;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/lamerman/FileDialog;->mList:Ljava/util/ArrayList;

    sget v6, Lcom/lamerman/R$layout;->file_dialog_row:I

    const/4 v4, 0x2

    new-array v7, v4, [Ljava/lang/String;

    const/4 v4, 0x0

    const-string v8, "key"

    aput-object v8, v7, v4

    const/4 v4, 0x1

    const-string v8, "image"

    aput-object v8, v7, v4

    const/4 v4, 0x2

    new-array v8, v4, [I

    const/4 v4, 0x0

    sget v27, Lcom/lamerman/R$id;->fdrowtext:I

    aput v27, v8, v4

    const/4 v4, 0x1

    sget v27, Lcom/lamerman/R$id;->fdrowimage:I

    aput v27, v8, v4

    move-object/from16 v4, p0

    invoke-direct/range {v3 .. v8}, Landroid/widget/SimpleAdapter;-><init>(Landroid/content/Context;Ljava/util/List;I[Ljava/lang/String;[I)V

    .line 277
    .local v3, "fileList":Landroid/widget/SimpleAdapter;
    const-string v4, ""

    invoke-virtual {v13, v4}, Ljava/util/TreeMap;->tailMap(Ljava/lang/Object;)Ljava/util/SortedMap;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/SortedMap;->values()Ljava/util/Collection;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v24

    .local v24, "i$":Ljava/util/Iterator;
    :goto_3
    invoke-interface/range {v24 .. v24}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_8

    invoke-interface/range {v24 .. v24}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    .line 278
    .local v11, "dir":Ljava/lang/String;
    sget v4, Lcom/lamerman/R$drawable;->folder:I

    move-object/from16 v0, p0

    invoke-direct {v0, v11, v4}, Lcom/lamerman/FileDialog;->addItem(Ljava/lang/String;I)V

    goto :goto_3

    .line 281
    .end local v11    # "dir":Ljava/lang/String;
    :cond_8
    const-string v4, ""

    move-object/from16 v0, v20

    invoke-virtual {v0, v4}, Ljava/util/TreeMap;->tailMap(Ljava/lang/Object;)Ljava/util/SortedMap;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/SortedMap;->values()Ljava/util/Collection;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v24

    :goto_4
    invoke-interface/range {v24 .. v24}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_9

    invoke-interface/range {v24 .. v24}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Ljava/lang/String;

    .line 282
    .local v16, "file":Ljava/lang/String;
    sget v4, Lcom/lamerman/R$drawable;->file:I

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v1, v4}, Lcom/lamerman/FileDialog;->addItem(Ljava/lang/String;I)V

    goto :goto_4

    .line 285
    .end local v16    # "file":Ljava/lang/String;
    :cond_9
    invoke-virtual {v3}, Landroid/widget/SimpleAdapter;->notifyDataSetChanged()V

    .line 287
    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lcom/lamerman/FileDialog;->setListAdapter(Landroid/widget/ListAdapter;)V

    .line 289
    return-void
.end method

.method private setCreateVisible(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v2, 0x0

    .line 367
    iget-object v0, p0, Lcom/lamerman/FileDialog;->layoutCreate:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 368
    iget-object v0, p0, Lcom/lamerman/FileDialog;->layoutSelect:Landroid/widget/LinearLayout;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 370
    iget-object v0, p0, Lcom/lamerman/FileDialog;->inputManager:Landroid/view/inputmethod/InputMethodManager;

    invoke-virtual {p1}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    move-result-object v1

    invoke-virtual {v0, v1, v2}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 371
    iget-object v0, p0, Lcom/lamerman/FileDialog;->selectButton:Landroid/widget/Button;

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setEnabled(Z)V

    .line 372
    return-void
.end method

.method private setSelectVisible(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v2, 0x0

    .line 380
    iget-object v0, p0, Lcom/lamerman/FileDialog;->layoutCreate:Landroid/widget/LinearLayout;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 381
    iget-object v0, p0, Lcom/lamerman/FileDialog;->layoutSelect:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 383
    iget-object v0, p0, Lcom/lamerman/FileDialog;->inputManager:Landroid/view/inputmethod/InputMethodManager;

    invoke-virtual {p1}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    move-result-object v1

    invoke-virtual {v0, v1, v2}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 384
    iget-object v0, p0, Lcom/lamerman/FileDialog;->selectButton:Landroid/widget/Button;

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setEnabled(Z)V

    .line 385
    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 9
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 105
    invoke-super {p0, p1}, Landroid/app/ListActivity;->onCreate(Landroid/os/Bundle;)V

    .line 106
    invoke-virtual {p0}, Lcom/lamerman/FileDialog;->getIntent()Landroid/content/Intent;

    move-result-object v5

    invoke-virtual {p0, v7, v5}, Lcom/lamerman/FileDialog;->setResult(ILandroid/content/Intent;)V

    .line 108
    sget v5, Lcom/lamerman/R$layout;->file_dialog_main:I

    invoke-virtual {p0, v5}, Lcom/lamerman/FileDialog;->setContentView(I)V

    .line 109
    sget v5, Lcom/lamerman/R$id;->path:I

    invoke-virtual {p0, v5}, Lcom/lamerman/FileDialog;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    iput-object v5, p0, Lcom/lamerman/FileDialog;->myPath:Landroid/widget/TextView;

    .line 110
    sget v5, Lcom/lamerman/R$id;->fdEditTextFile:I

    invoke-virtual {p0, v5}, Lcom/lamerman/FileDialog;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/EditText;

    iput-object v5, p0, Lcom/lamerman/FileDialog;->mFileName:Landroid/widget/EditText;

    .line 112
    const-string v5, "input_method"

    invoke-virtual {p0, v5}, Lcom/lamerman/FileDialog;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/view/inputmethod/InputMethodManager;

    iput-object v5, p0, Lcom/lamerman/FileDialog;->inputManager:Landroid/view/inputmethod/InputMethodManager;

    .line 114
    sget v5, Lcom/lamerman/R$id;->fdButtonSelect:I

    invoke-virtual {p0, v5}, Lcom/lamerman/FileDialog;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/Button;

    iput-object v5, p0, Lcom/lamerman/FileDialog;->selectButton:Landroid/widget/Button;

    .line 115
    iget-object v5, p0, Lcom/lamerman/FileDialog;->selectButton:Landroid/widget/Button;

    invoke-virtual {v5, v7}, Landroid/widget/Button;->setEnabled(Z)V

    .line 116
    iget-object v5, p0, Lcom/lamerman/FileDialog;->selectButton:Landroid/widget/Button;

    new-instance v6, Lcom/lamerman/FileDialog$1;

    invoke-direct {v6, p0}, Lcom/lamerman/FileDialog$1;-><init>(Lcom/lamerman/FileDialog;)V

    invoke-virtual {v5, v6}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 128
    sget v5, Lcom/lamerman/R$id;->fdButtonNew:I

    invoke-virtual {p0, v5}, Lcom/lamerman/FileDialog;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/Button;

    .line 129
    .local v3, "newButton":Landroid/widget/Button;
    new-instance v5, Lcom/lamerman/FileDialog$2;

    invoke-direct {v5, p0}, Lcom/lamerman/FileDialog$2;-><init>(Lcom/lamerman/FileDialog;)V

    invoke-virtual {v3, v5}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 140
    invoke-virtual {p0}, Lcom/lamerman/FileDialog;->getIntent()Landroid/content/Intent;

    move-result-object v5

    const-string v6, "SELECTION_MODE"

    invoke-virtual {v5, v6, v7}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v5

    iput v5, p0, Lcom/lamerman/FileDialog;->selectionMode:I

    .line 142
    invoke-virtual {p0}, Lcom/lamerman/FileDialog;->getIntent()Landroid/content/Intent;

    move-result-object v5

    const-string v6, "FORMAT_FILTER"

    invoke-virtual {v5, v6}, Landroid/content/Intent;->getStringArrayExtra(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/lamerman/FileDialog;->formatFilter:[Ljava/lang/String;

    .line 144
    invoke-virtual {p0}, Lcom/lamerman/FileDialog;->getIntent()Landroid/content/Intent;

    move-result-object v5

    const-string v6, "CAN_SELECT_DIR"

    invoke-virtual {v5, v6, v7}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v5

    iput-boolean v5, p0, Lcom/lamerman/FileDialog;->canSelectDir:Z

    .line 146
    iget v5, p0, Lcom/lamerman/FileDialog;->selectionMode:I

    if-ne v5, v8, :cond_0

    .line 147
    invoke-virtual {v3, v7}, Landroid/widget/Button;->setEnabled(Z)V

    .line 150
    :cond_0
    sget v5, Lcom/lamerman/R$id;->fdLinearLayoutSelect:I

    invoke-virtual {p0, v5}, Lcom/lamerman/FileDialog;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/LinearLayout;

    iput-object v5, p0, Lcom/lamerman/FileDialog;->layoutSelect:Landroid/widget/LinearLayout;

    .line 151
    sget v5, Lcom/lamerman/R$id;->fdLinearLayoutCreate:I

    invoke-virtual {p0, v5}, Lcom/lamerman/FileDialog;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/LinearLayout;

    iput-object v5, p0, Lcom/lamerman/FileDialog;->layoutCreate:Landroid/widget/LinearLayout;

    .line 152
    iget-object v5, p0, Lcom/lamerman/FileDialog;->layoutCreate:Landroid/widget/LinearLayout;

    const/16 v6, 0x8

    invoke-virtual {v5, v6}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 154
    sget v5, Lcom/lamerman/R$id;->fdButtonCancel:I

    invoke-virtual {p0, v5}, Lcom/lamerman/FileDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    .line 155
    .local v0, "cancelButton":Landroid/widget/Button;
    new-instance v5, Lcom/lamerman/FileDialog$3;

    invoke-direct {v5, p0}, Lcom/lamerman/FileDialog$3;-><init>(Lcom/lamerman/FileDialog;)V

    invoke-virtual {v0, v5}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 163
    sget v5, Lcom/lamerman/R$id;->fdButtonCreate:I

    invoke-virtual {p0, v5}, Lcom/lamerman/FileDialog;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    .line 164
    .local v1, "createButton":Landroid/widget/Button;
    new-instance v5, Lcom/lamerman/FileDialog$4;

    invoke-direct {v5, p0}, Lcom/lamerman/FileDialog$4;-><init>(Lcom/lamerman/FileDialog;)V

    invoke-virtual {v1, v5}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 176
    invoke-virtual {p0}, Lcom/lamerman/FileDialog;->getIntent()Landroid/content/Intent;

    move-result-object v5

    const-string v6, "START_PATH"

    invoke-virtual {v5, v6}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 177
    .local v4, "startPath":Ljava/lang/String;
    if-eqz v4, :cond_2

    .line 178
    :goto_0
    iget-boolean v5, p0, Lcom/lamerman/FileDialog;->canSelectDir:Z

    if-eqz v5, :cond_1

    .line 179
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 180
    .local v2, "file":Ljava/io/File;
    iput-object v2, p0, Lcom/lamerman/FileDialog;->selectedFile:Ljava/io/File;

    .line 181
    iget-object v5, p0, Lcom/lamerman/FileDialog;->selectButton:Landroid/widget/Button;

    invoke-virtual {v5, v8}, Landroid/widget/Button;->setEnabled(Z)V

    .line 183
    .end local v2    # "file":Ljava/io/File;
    :cond_1
    invoke-direct {p0, v4}, Lcom/lamerman/FileDialog;->getDir(Ljava/lang/String;)V

    .line 184
    return-void

    .line 177
    :cond_2
    const-string v4, "/"

    goto :goto_0
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 3
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    const/4 v2, 0x0

    .line 341
    const/4 v0, 0x4

    if-ne p1, v0, :cond_2

    .line 342
    iget-object v0, p0, Lcom/lamerman/FileDialog;->selectButton:Landroid/widget/Button;

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setEnabled(Z)V

    .line 344
    iget-object v0, p0, Lcom/lamerman/FileDialog;->layoutCreate:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    .line 345
    iget-object v0, p0, Lcom/lamerman/FileDialog;->layoutCreate:Landroid/widget/LinearLayout;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 346
    iget-object v0, p0, Lcom/lamerman/FileDialog;->layoutSelect:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 355
    :goto_0
    const/4 v0, 0x1

    .line 357
    :goto_1
    return v0

    .line 348
    :cond_0
    iget-object v0, p0, Lcom/lamerman/FileDialog;->currentPath:Ljava/lang/String;

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 349
    iget-object v0, p0, Lcom/lamerman/FileDialog;->parentPath:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/lamerman/FileDialog;->getDir(Ljava/lang/String;)V

    goto :goto_0

    .line 351
    :cond_1
    invoke-super {p0, p1, p2}, Landroid/app/ListActivity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    goto :goto_1

    .line 357
    :cond_2
    invoke-super {p0, p1, p2}, Landroid/app/ListActivity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    goto :goto_1
.end method

.method protected onListItemClick(Landroid/widget/ListView;Landroid/view/View;IJ)V
    .locals 5
    .param p1, "l"    # Landroid/widget/ListView;
    .param p2, "v"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "id"    # J

    .prologue
    const/4 v4, 0x1

    .line 307
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/lamerman/FileDialog;->path:Ljava/util/List;

    invoke-interface {v1, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 309
    .local v0, "file":Ljava/io/File;
    invoke-direct {p0, p2}, Lcom/lamerman/FileDialog;->setSelectVisible(Landroid/view/View;)V

    .line 311
    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 312
    iget-object v1, p0, Lcom/lamerman/FileDialog;->selectButton:Landroid/widget/Button;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setEnabled(Z)V

    .line 313
    invoke-virtual {v0}, Ljava/io/File;->canRead()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 314
    iget-object v1, p0, Lcom/lamerman/FileDialog;->lastPositions:Ljava/util/HashMap;

    iget-object v2, p0, Lcom/lamerman/FileDialog;->currentPath:Ljava/lang/String;

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 315
    iget-object v1, p0, Lcom/lamerman/FileDialog;->path:Ljava/util/List;

    invoke-interface {v1, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-direct {p0, v1}, Lcom/lamerman/FileDialog;->getDir(Ljava/lang/String;)V

    .line 316
    iget-boolean v1, p0, Lcom/lamerman/FileDialog;->canSelectDir:Z

    if-eqz v1, :cond_0

    .line 317
    iput-object v0, p0, Lcom/lamerman/FileDialog;->selectedFile:Ljava/io/File;

    .line 318
    invoke-virtual {p2, v4}, Landroid/view/View;->setSelected(Z)V

    .line 319
    iget-object v1, p0, Lcom/lamerman/FileDialog;->selectButton:Landroid/widget/Button;

    invoke-virtual {v1, v4}, Landroid/widget/Button;->setEnabled(Z)V

    .line 337
    :cond_0
    :goto_0
    return-void

    .line 322
    :cond_1
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    sget v2, Lcom/lamerman/R$drawable;->icon:I

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "] "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget v3, Lcom/lamerman/R$string;->cant_read_folder:I

    invoke-virtual {p0, v3}, Lcom/lamerman/FileDialog;->getText(I)Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "OK"

    new-instance v3, Lcom/lamerman/FileDialog$5;

    invoke-direct {v3, p0}, Lcom/lamerman/FileDialog$5;-><init>(Lcom/lamerman/FileDialog;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_0

    .line 333
    :cond_2
    iput-object v0, p0, Lcom/lamerman/FileDialog;->selectedFile:Ljava/io/File;

    .line 334
    invoke-virtual {p2, v4}, Landroid/view/View;->setSelected(Z)V

    .line 335
    iget-object v1, p0, Lcom/lamerman/FileDialog;->selectButton:Landroid/widget/Button;

    invoke-virtual {v1, v4}, Landroid/widget/Button;->setEnabled(Z)V

    goto :goto_0
.end method
