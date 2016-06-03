.class public Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;
.super Ljava/util/AbstractCollection;
.source "ArrayDeque.java"

# interfaces
.implements Lcom/lidroid/xutils/util/core/compatible/Deque;
.implements Ljava/lang/Cloneable;
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lidroid/xutils/util/core/compatible/ArrayDeque$DeqIterator;,
        Lcom/lidroid/xutils/util/core/compatible/ArrayDeque$DescendingIterator;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/AbstractCollection",
        "<TE;>;",
        "Lcom/lidroid/xutils/util/core/compatible/Deque",
        "<TE;>;",
        "Ljava/lang/Cloneable;",
        "Ljava/io/Serializable;"
    }
.end annotation


# static fields
.field private static final MIN_INITIAL_CAPACITY:I = 0x8

.field private static final serialVersionUID:J = 0x207cda2e240da08bL


# instance fields
.field private transient elements:[Ljava/lang/Object;

.field private transient head:I

.field private transient tail:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 157
    .local p0, "this":Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;, "Lcom/lidroid/xutils/util/core/compatible/ArrayDeque<TE;>;"
    invoke-direct {p0}, Ljava/util/AbstractCollection;-><init>()V

    .line 158
    const/16 v0, 0x10

    new-array v0, v0, [Ljava/lang/Object;

    iput-object v0, p0, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->elements:[Ljava/lang/Object;

    .line 159
    return-void
.end method

.method public constructor <init>(I)V
    .locals 0
    .param p1, "numElements"    # I

    .prologue
    .line 167
    .local p0, "this":Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;, "Lcom/lidroid/xutils/util/core/compatible/ArrayDeque<TE;>;"
    invoke-direct {p0}, Ljava/util/AbstractCollection;-><init>()V

    .line 168
    invoke-direct {p0, p1}, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->allocateElements(I)V

    .line 169
    return-void
.end method

.method public constructor <init>(Ljava/util/Collection;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<+TE;>;)V"
        }
    .end annotation

    .prologue
    .line 181
    .local p0, "this":Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;, "Lcom/lidroid/xutils/util/core/compatible/ArrayDeque<TE;>;"
    .local p1, "c":Ljava/util/Collection;, "Ljava/util/Collection<+TE;>;"
    invoke-direct {p0}, Ljava/util/AbstractCollection;-><init>()V

    .line 182
    invoke-interface {p1}, Ljava/util/Collection;->size()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->allocateElements(I)V

    .line 183
    invoke-virtual {p0, p1}, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->addAll(Ljava/util/Collection;)Z

    .line 184
    return-void
.end method

.method static synthetic access$1(Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;)I
    .locals 1

    .prologue
    .line 75
    iget v0, p0, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->head:I

    return v0
.end method

.method static synthetic access$2(Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;)I
    .locals 1

    .prologue
    .line 81
    iget v0, p0, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->tail:I

    return v0
.end method

.method static synthetic access$3(Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;)[Ljava/lang/Object;
    .locals 1

    .prologue
    .line 68
    iget-object v0, p0, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->elements:[Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$4(Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;I)Z
    .locals 1

    .prologue
    .line 505
    invoke-direct {p0, p1}, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->delete(I)Z

    move-result v0

    return v0
.end method

.method private allocateElements(I)V
    .locals 2
    .param p1, "numElements"    # I

    .prologue
    .line 97
    .local p0, "this":Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;, "Lcom/lidroid/xutils/util/core/compatible/ArrayDeque<TE;>;"
    const/16 v0, 0x8

    .line 100
    .local v0, "initialCapacity":I
    if-lt p1, v0, :cond_0

    .line 101
    move v0, p1

    .line 102
    ushr-int/lit8 v1, v0, 0x1

    or-int/2addr v0, v1

    .line 103
    ushr-int/lit8 v1, v0, 0x2

    or-int/2addr v0, v1

    .line 104
    ushr-int/lit8 v1, v0, 0x4

    or-int/2addr v0, v1

    .line 105
    ushr-int/lit8 v1, v0, 0x8

    or-int/2addr v0, v1

    .line 106
    ushr-int/lit8 v1, v0, 0x10

    or-int/2addr v0, v1

    .line 107
    add-int/lit8 v0, v0, 0x1

    .line 109
    if-gez v0, :cond_0

    .line 110
    ushr-int/lit8 v0, v0, 0x1

    .line 112
    :cond_0
    new-array v1, v0, [Ljava/lang/Object;

    iput-object v1, p0, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->elements:[Ljava/lang/Object;

    .line 113
    return-void
.end method

.method private copyElements([Ljava/lang/Object;)[Ljava/lang/Object;
    .locals 5
    .param p1, "a"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;)[TT;"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;, "Lcom/lidroid/xutils/util/core/compatible/ArrayDeque<TE;>;"
    const/4 v4, 0x0

    .line 143
    iget v1, p0, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->head:I

    iget v2, p0, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->tail:I

    if-ge v1, v2, :cond_1

    .line 144
    iget-object v1, p0, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->elements:[Ljava/lang/Object;

    iget v2, p0, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->head:I

    invoke-virtual {p0}, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->size()I

    move-result v3

    invoke-static {v1, v2, p1, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 150
    :cond_0
    :goto_0
    return-object p1

    .line 145
    :cond_1
    iget v1, p0, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->head:I

    iget v2, p0, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->tail:I

    if-le v1, v2, :cond_0

    .line 146
    iget-object v1, p0, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->elements:[Ljava/lang/Object;

    array-length v1, v1

    iget v2, p0, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->head:I

    sub-int v0, v1, v2

    .line 147
    .local v0, "headPortionLen":I
    iget-object v1, p0, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->elements:[Ljava/lang/Object;

    iget v2, p0, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->head:I

    invoke-static {v1, v2, p1, v4, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 148
    iget-object v1, p0, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->elements:[Ljava/lang/Object;

    iget v2, p0, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->tail:I

    invoke-static {v1, v4, p1, v0, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_0
.end method

.method private static copyOfRange([Ljava/lang/Object;II)[Ljava/lang/Object;
    .locals 6
    .param p0, "original"    # [Ljava/lang/Object;
    .param p1, "start"    # I
    .param p2, "end"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;II)[TT;"
        }
    .end annotation

    .prologue
    .line 820
    array-length v1, p0

    .line 821
    .local v1, "originalLength":I
    if-le p1, p2, :cond_0

    .line 822
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "start > end"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 824
    :cond_0
    if-ltz p1, :cond_1

    if-le p1, v1, :cond_2

    .line 825
    :cond_1
    new-instance v4, Ljava/lang/ArrayIndexOutOfBoundsException;

    invoke-direct {v4}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>()V

    throw v4

    .line 827
    :cond_2
    sub-int v3, p2, p1

    .line 828
    .local v3, "resultLength":I
    sub-int v4, v1, p1

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 829
    .local v0, "copyLength":I
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v4

    invoke-static {v4, v3}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Ljava/lang/Object;

    .line 830
    .local v2, "result":[Ljava/lang/Object;
    const/4 v4, 0x0

    invoke-static {p0, p1, v2, v4, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 831
    return-object v2
.end method

.method private delete(I)Z
    .locals 10
    .param p1, "i"    # I

    .prologue
    .local p0, "this":Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;, "Lcom/lidroid/xutils/util/core/compatible/ArrayDeque<TE;>;"
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 507
    iget-object v1, p0, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->elements:[Ljava/lang/Object;

    .line 508
    .local v1, "elements":[Ljava/lang/Object;
    array-length v8, v1

    add-int/lit8 v4, v8, -0x1

    .line 509
    .local v4, "mask":I
    iget v3, p0, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->head:I

    .line 510
    .local v3, "h":I
    iget v5, p0, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->tail:I

    .line 511
    .local v5, "t":I
    sub-int v8, p1, v3

    and-int v2, v8, v4

    .line 512
    .local v2, "front":I
    sub-int v8, v5, p1

    and-int v0, v8, v4

    .line 515
    .local v0, "back":I
    sub-int v8, v5, v3

    and-int/2addr v8, v4

    if-lt v2, v8, :cond_0

    .line 516
    new-instance v6, Ljava/util/ConcurrentModificationException;

    invoke-direct {v6}, Ljava/util/ConcurrentModificationException;-><init>()V

    throw v6

    .line 519
    :cond_0
    if-ge v2, v0, :cond_2

    .line 520
    if-gt v3, p1, :cond_1

    .line 521
    add-int/lit8 v7, v3, 0x1

    invoke-static {v1, v3, v1, v7, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 527
    :goto_0
    const/4 v7, 0x0

    aput-object v7, v1, v3

    .line 528
    add-int/lit8 v7, v3, 0x1

    and-int/2addr v7, v4

    iput v7, p0, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->head:I

    .line 540
    :goto_1
    return v6

    .line 523
    :cond_1
    invoke-static {v1, v6, v1, v7, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 524
    aget-object v7, v1, v4

    aput-object v7, v1, v6

    .line 525
    add-int/lit8 v7, v3, 0x1

    sub-int v8, v4, v3

    invoke-static {v1, v3, v1, v7, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_0

    .line 531
    :cond_2
    if-ge p1, v5, :cond_3

    .line 532
    add-int/lit8 v6, p1, 0x1

    invoke-static {v1, v6, v1, p1, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 533
    add-int/lit8 v6, v5, -0x1

    iput v6, p0, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->tail:I

    :goto_2
    move v6, v7

    .line 540
    goto :goto_1

    .line 535
    :cond_3
    add-int/lit8 v8, p1, 0x1

    sub-int v9, v4, p1

    invoke-static {v1, v8, v1, p1, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 536
    aget-object v8, v1, v6

    aput-object v8, v1, v4

    .line 537
    invoke-static {v1, v7, v1, v6, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 538
    add-int/lit8 v6, v5, -0x1

    and-int/2addr v6, v4

    iput v6, p0, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->tail:I

    goto :goto_2
.end method

.method private doubleCapacity()V
    .locals 7

    .prologue
    .local p0, "this":Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;, "Lcom/lidroid/xutils/util/core/compatible/ArrayDeque<TE;>;"
    const/4 v6, 0x0

    .line 121
    iget v3, p0, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->head:I

    .line 122
    .local v3, "p":I
    iget-object v5, p0, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->elements:[Ljava/lang/Object;

    array-length v1, v5

    .line 123
    .local v1, "n":I
    sub-int v4, v1, v3

    .line 124
    .local v4, "r":I
    shl-int/lit8 v2, v1, 0x1

    .line 125
    .local v2, "newCapacity":I
    if-gez v2, :cond_0

    .line 126
    new-instance v5, Ljava/lang/IllegalStateException;

    const-string v6, "Sorry, deque too big"

    invoke-direct {v5, v6}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 127
    :cond_0
    new-array v0, v2, [Ljava/lang/Object;

    .line 128
    .local v0, "a":[Ljava/lang/Object;
    iget-object v5, p0, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->elements:[Ljava/lang/Object;

    invoke-static {v5, v3, v0, v6, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 129
    iget-object v5, p0, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->elements:[Ljava/lang/Object;

    invoke-static {v5, v6, v0, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 130
    iput-object v0, p0, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->elements:[Ljava/lang/Object;

    .line 131
    iput v6, p0, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->head:I

    .line 132
    iput v1, p0, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->tail:I

    .line 133
    return-void
.end method

.method private readObject(Ljava/io/ObjectInputStream;)V
    .locals 4
    .param p1, "s"    # Ljava/io/ObjectInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 864
    .local p0, "this":Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;, "Lcom/lidroid/xutils/util/core/compatible/ArrayDeque<TE;>;"
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->defaultReadObject()V

    .line 867
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readInt()I

    move-result v1

    .line 868
    .local v1, "size":I
    invoke-direct {p0, v1}, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->allocateElements(I)V

    .line 869
    const/4 v2, 0x0

    iput v2, p0, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->head:I

    .line 870
    iput v1, p0, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->tail:I

    .line 873
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-lt v0, v1, :cond_0

    .line 875
    return-void

    .line 874
    :cond_0
    iget-object v2, p0, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->elements:[Ljava/lang/Object;

    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v3

    aput-object v3, v2, v0

    .line 873
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method private writeObject(Ljava/io/ObjectOutputStream;)V
    .locals 3
    .param p1, "s"    # Ljava/io/ObjectOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 848
    .local p0, "this":Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;, "Lcom/lidroid/xutils/util/core/compatible/ArrayDeque<TE;>;"
    invoke-virtual {p1}, Ljava/io/ObjectOutputStream;->defaultWriteObject()V

    .line 851
    invoke-virtual {p0}, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->size()I

    move-result v2

    invoke-virtual {p1, v2}, Ljava/io/ObjectOutputStream;->writeInt(I)V

    .line 854
    iget-object v2, p0, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->elements:[Ljava/lang/Object;

    array-length v2, v2

    add-int/lit8 v1, v2, -0x1

    .line 855
    .local v1, "mask":I
    iget v0, p0, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->head:I

    .local v0, "i":I
    :goto_0
    iget v2, p0, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->tail:I

    if-ne v0, v2, :cond_0

    .line 857
    return-void

    .line 856
    :cond_0
    iget-object v2, p0, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->elements:[Ljava/lang/Object;

    aget-object v2, v2, v0

    invoke-virtual {p1, v2}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 855
    add-int/lit8 v2, v0, 0x1

    and-int v0, v2, v1

    goto :goto_0
.end method


# virtual methods
.method public add(Ljava/lang/Object;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)Z"
        }
    .end annotation

    .prologue
    .line 390
    .local p0, "this":Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;, "Lcom/lidroid/xutils/util/core/compatible/ArrayDeque<TE;>;"
    .local p1, "e":Ljava/lang/Object;, "TE;"
    invoke-virtual {p0, p1}, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->addLast(Ljava/lang/Object;)V

    .line 391
    const/4 v0, 0x1

    return v0
.end method

.method public addFirst(Ljava/lang/Object;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)V"
        }
    .end annotation

    .prologue
    .line 197
    .local p0, "this":Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;, "Lcom/lidroid/xutils/util/core/compatible/ArrayDeque<TE;>;"
    .local p1, "e":Ljava/lang/Object;, "TE;"
    if-nez p1, :cond_0

    .line 198
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "e == null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 199
    :cond_0
    iget-object v0, p0, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->elements:[Ljava/lang/Object;

    iget v1, p0, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->head:I

    add-int/lit8 v1, v1, -0x1

    iget-object v2, p0, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->elements:[Ljava/lang/Object;

    array-length v2, v2

    add-int/lit8 v2, v2, -0x1

    and-int/2addr v1, v2

    iput v1, p0, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->head:I

    aput-object p1, v0, v1

    .line 200
    iget v0, p0, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->head:I

    iget v1, p0, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->tail:I

    if-ne v0, v1, :cond_1

    .line 201
    invoke-direct {p0}, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->doubleCapacity()V

    .line 202
    :cond_1
    return-void
.end method

.method public addLast(Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)V"
        }
    .end annotation

    .prologue
    .line 213
    .local p0, "this":Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;, "Lcom/lidroid/xutils/util/core/compatible/ArrayDeque<TE;>;"
    .local p1, "e":Ljava/lang/Object;, "TE;"
    if-nez p1, :cond_0

    .line 214
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "e == null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 215
    :cond_0
    iget-object v0, p0, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->elements:[Ljava/lang/Object;

    iget v1, p0, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->tail:I

    aput-object p1, v0, v1

    .line 216
    iget v0, p0, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->tail:I

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->elements:[Ljava/lang/Object;

    array-length v1, v1

    add-int/lit8 v1, v1, -0x1

    and-int/2addr v0, v1

    iput v0, p0, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->tail:I

    iget v1, p0, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->head:I

    if-ne v0, v1, :cond_1

    .line 217
    invoke-direct {p0}, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->doubleCapacity()V

    .line 218
    :cond_1
    return-void
.end method

.method public clear()V
    .locals 6

    .prologue
    .line 706
    .local p0, "this":Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;, "Lcom/lidroid/xutils/util/core/compatible/ArrayDeque<TE;>;"
    iget v0, p0, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->head:I

    .line 707
    .local v0, "h":I
    iget v3, p0, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->tail:I

    .line 708
    .local v3, "t":I
    if-eq v0, v3, :cond_1

    .line 709
    const/4 v4, 0x0

    iput v4, p0, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->tail:I

    iput v4, p0, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->head:I

    .line 710
    move v1, v0

    .line 711
    .local v1, "i":I
    iget-object v4, p0, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->elements:[Ljava/lang/Object;

    array-length v4, v4

    add-int/lit8 v2, v4, -0x1

    .line 713
    .local v2, "mask":I
    :cond_0
    iget-object v4, p0, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->elements:[Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v5, v4, v1

    .line 714
    add-int/lit8 v4, v1, 0x1

    and-int v1, v4, v2

    .line 715
    if-ne v1, v3, :cond_0

    .line 717
    .end local v1    # "i":I
    .end local v2    # "mask":I
    :cond_1
    return-void
.end method

.method public clone()Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/lidroid/xutils/util/core/compatible/ArrayDeque",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 794
    .local p0, "this":Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;, "Lcom/lidroid/xutils/util/core/compatible/ArrayDeque<TE;>;"
    :try_start_0
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;

    .line 795
    .local v1, "result":Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;, "Lcom/lidroid/xutils/util/core/compatible/ArrayDeque<TE;>;"
    iget-object v2, p0, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->elements:[Ljava/lang/Object;

    const/4 v3, 0x0

    iget-object v4, p0, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->elements:[Ljava/lang/Object;

    array-length v4, v4

    invoke-static {v2, v3, v4}, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->copyOfRange([Ljava/lang/Object;II)[Ljava/lang/Object;

    move-result-object v2

    iput-object v2, v1, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->elements:[Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 796
    return-object v1

    .line 798
    .end local v1    # "result":Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;, "Lcom/lidroid/xutils/util/core/compatible/ArrayDeque<TE;>;"
    :catch_0
    move-exception v0

    .line 799
    .local v0, "e":Ljava/lang/CloneNotSupportedException;
    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->clone()Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;

    move-result-object v0

    return-object v0
.end method

.method public contains(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .local p0, "this":Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;, "Lcom/lidroid/xutils/util/core/compatible/ArrayDeque<TE;>;"
    const/4 v3, 0x0

    .line 671
    if-nez p1, :cond_1

    .line 681
    :cond_0
    :goto_0
    return v3

    .line 673
    :cond_1
    iget-object v4, p0, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->elements:[Ljava/lang/Object;

    array-length v4, v4

    add-int/lit8 v1, v4, -0x1

    .line 674
    .local v1, "mask":I
    iget v0, p0, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->head:I

    .line 676
    .local v0, "i":I
    :goto_1
    iget-object v4, p0, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->elements:[Ljava/lang/Object;

    aget-object v2, v4, v0

    .local v2, "x":Ljava/lang/Object;
    if-eqz v2, :cond_0

    .line 677
    invoke-virtual {p1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 678
    const/4 v3, 0x1

    goto :goto_0

    .line 679
    :cond_2
    add-int/lit8 v4, v0, 0x1

    and-int v0, v4, v1

    goto :goto_1
.end method

.method public descendingIterator()Ljava/util/Iterator;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 577
    .local p0, "this":Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;, "Lcom/lidroid/xutils/util/core/compatible/ArrayDeque<TE;>;"
    new-instance v0, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque$DescendingIterator;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque$DescendingIterator;-><init>(Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;Lcom/lidroid/xutils/util/core/compatible/ArrayDeque$DescendingIterator;)V

    return-object v0
.end method

.method public element()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .prologue
    .line 449
    .local p0, "this":Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;, "Lcom/lidroid/xutils/util/core/compatible/ArrayDeque<TE;>;"
    invoke-virtual {p0}, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->getFirst()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getFirst()Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .prologue
    .line 292
    .local p0, "this":Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;, "Lcom/lidroid/xutils/util/core/compatible/ArrayDeque<TE;>;"
    iget-object v1, p0, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->elements:[Ljava/lang/Object;

    iget v2, p0, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->head:I

    aget-object v0, v1, v2

    .line 293
    .local v0, "result":Ljava/lang/Object;, "TE;"
    if-nez v0, :cond_0

    .line 294
    new-instance v1, Ljava/util/NoSuchElementException;

    invoke-direct {v1}, Ljava/util/NoSuchElementException;-><init>()V

    throw v1

    .line 295
    :cond_0
    return-object v0
.end method

.method public getLast()Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .prologue
    .line 304
    .local p0, "this":Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;, "Lcom/lidroid/xutils/util/core/compatible/ArrayDeque<TE;>;"
    iget-object v1, p0, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->elements:[Ljava/lang/Object;

    iget v2, p0, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->tail:I

    add-int/lit8 v2, v2, -0x1

    iget-object v3, p0, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->elements:[Ljava/lang/Object;

    array-length v3, v3

    add-int/lit8 v3, v3, -0x1

    and-int/2addr v2, v3

    aget-object v0, v1, v2

    .line 305
    .local v0, "result":Ljava/lang/Object;, "TE;"
    if-nez v0, :cond_0

    .line 306
    new-instance v1, Ljava/util/NoSuchElementException;

    invoke-direct {v1}, Ljava/util/NoSuchElementException;-><init>()V

    throw v1

    .line 307
    :cond_0
    return-object v0
.end method

.method public isEmpty()Z
    .locals 2

    .prologue
    .line 561
    .local p0, "this":Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;, "Lcom/lidroid/xutils/util/core/compatible/ArrayDeque<TE;>;"
    iget v0, p0, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->head:I

    iget v1, p0, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->tail:I

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 573
    .local p0, "this":Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;, "Lcom/lidroid/xutils/util/core/compatible/ArrayDeque<TE;>;"
    new-instance v0, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque$DeqIterator;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque$DeqIterator;-><init>(Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;Lcom/lidroid/xutils/util/core/compatible/ArrayDeque$DeqIterator;)V

    return-object v0
.end method

.method public offer(Ljava/lang/Object;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)Z"
        }
    .end annotation

    .prologue
    .line 404
    .local p0, "this":Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;, "Lcom/lidroid/xutils/util/core/compatible/ArrayDeque<TE;>;"
    .local p1, "e":Ljava/lang/Object;, "TE;"
    invoke-virtual {p0, p1}, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->offerLast(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public offerFirst(Ljava/lang/Object;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)Z"
        }
    .end annotation

    .prologue
    .line 228
    .local p0, "this":Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;, "Lcom/lidroid/xutils/util/core/compatible/ArrayDeque<TE;>;"
    .local p1, "e":Ljava/lang/Object;, "TE;"
    invoke-virtual {p0, p1}, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->addFirst(Ljava/lang/Object;)V

    .line 229
    const/4 v0, 0x1

    return v0
.end method

.method public offerLast(Ljava/lang/Object;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)Z"
        }
    .end annotation

    .prologue
    .line 240
    .local p0, "this":Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;, "Lcom/lidroid/xutils/util/core/compatible/ArrayDeque<TE;>;"
    .local p1, "e":Ljava/lang/Object;, "TE;"
    invoke-virtual {p0, p1}, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->addLast(Ljava/lang/Object;)V

    .line 241
    const/4 v0, 0x1

    return v0
.end method

.method public peek()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .prologue
    .line 462
    .local p0, "this":Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;, "Lcom/lidroid/xutils/util/core/compatible/ArrayDeque<TE;>;"
    invoke-virtual {p0}, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->peekFirst()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public peekFirst()Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .prologue
    .line 311
    .local p0, "this":Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;, "Lcom/lidroid/xutils/util/core/compatible/ArrayDeque<TE;>;"
    iget-object v1, p0, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->elements:[Ljava/lang/Object;

    iget v2, p0, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->head:I

    aget-object v0, v1, v2

    .line 313
    .local v0, "result":Ljava/lang/Object;, "TE;"
    return-object v0
.end method

.method public peekLast()Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .prologue
    .line 318
    .local p0, "this":Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;, "Lcom/lidroid/xutils/util/core/compatible/ArrayDeque<TE;>;"
    iget-object v1, p0, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->elements:[Ljava/lang/Object;

    iget v2, p0, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->tail:I

    add-int/lit8 v2, v2, -0x1

    iget-object v3, p0, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->elements:[Ljava/lang/Object;

    array-length v3, v3

    add-int/lit8 v3, v3, -0x1

    and-int/2addr v2, v3

    aget-object v0, v1, v2

    .line 319
    .local v0, "result":Ljava/lang/Object;, "TE;"
    return-object v0
.end method

.method public poll()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .prologue
    .line 434
    .local p0, "this":Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;, "Lcom/lidroid/xutils/util/core/compatible/ArrayDeque<TE;>;"
    invoke-virtual {p0}, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->pollFirst()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public pollFirst()Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;, "Lcom/lidroid/xutils/util/core/compatible/ArrayDeque<TE;>;"
    const/4 v2, 0x0

    .line 267
    iget v0, p0, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->head:I

    .line 268
    .local v0, "h":I
    iget-object v3, p0, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->elements:[Ljava/lang/Object;

    aget-object v1, v3, v0

    .line 270
    .local v1, "result":Ljava/lang/Object;, "TE;"
    if-nez v1, :cond_0

    move-object v1, v2

    .line 274
    .end local v1    # "result":Ljava/lang/Object;, "TE;"
    :goto_0
    return-object v1

    .line 272
    .restart local v1    # "result":Ljava/lang/Object;, "TE;"
    :cond_0
    iget-object v3, p0, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->elements:[Ljava/lang/Object;

    aput-object v2, v3, v0

    .line 273
    add-int/lit8 v2, v0, 0x1

    iget-object v3, p0, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->elements:[Ljava/lang/Object;

    array-length v3, v3

    add-int/lit8 v3, v3, -0x1

    and-int/2addr v2, v3

    iput v2, p0, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->head:I

    goto :goto_0
.end method

.method public pollLast()Ljava/lang/Object;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;, "Lcom/lidroid/xutils/util/core/compatible/ArrayDeque<TE;>;"
    const/4 v2, 0x0

    .line 278
    iget v3, p0, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->tail:I

    add-int/lit8 v3, v3, -0x1

    iget-object v4, p0, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->elements:[Ljava/lang/Object;

    array-length v4, v4

    add-int/lit8 v4, v4, -0x1

    and-int v1, v3, v4

    .line 279
    .local v1, "t":I
    iget-object v3, p0, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->elements:[Ljava/lang/Object;

    aget-object v0, v3, v1

    .line 280
    .local v0, "result":Ljava/lang/Object;, "TE;"
    if-nez v0, :cond_0

    move-object v0, v2

    .line 284
    .end local v0    # "result":Ljava/lang/Object;, "TE;"
    :goto_0
    return-object v0

    .line 282
    .restart local v0    # "result":Ljava/lang/Object;, "TE;"
    :cond_0
    iget-object v3, p0, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->elements:[Ljava/lang/Object;

    aput-object v2, v3, v1

    .line 283
    iput v1, p0, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->tail:I

    goto :goto_0
.end method

.method public pop()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .prologue
    .line 492
    .local p0, "this":Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;, "Lcom/lidroid/xutils/util/core/compatible/ArrayDeque<TE;>;"
    invoke-virtual {p0}, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->removeFirst()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public push(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)V"
        }
    .end annotation

    .prologue
    .line 477
    .local p0, "this":Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;, "Lcom/lidroid/xutils/util/core/compatible/ArrayDeque<TE;>;"
    .local p1, "e":Ljava/lang/Object;, "TE;"
    invoke-virtual {p0, p1}, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->addFirst(Ljava/lang/Object;)V

    .line 478
    return-void
.end method

.method public remove()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .prologue
    .line 420
    .local p0, "this":Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;, "Lcom/lidroid/xutils/util/core/compatible/ArrayDeque<TE;>;"
    invoke-virtual {p0}, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->removeFirst()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public remove(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 698
    .local p0, "this":Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;, "Lcom/lidroid/xutils/util/core/compatible/ArrayDeque<TE;>;"
    invoke-virtual {p0, p1}, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->removeFirstOccurrence(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public removeFirst()Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .prologue
    .line 249
    .local p0, "this":Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;, "Lcom/lidroid/xutils/util/core/compatible/ArrayDeque<TE;>;"
    invoke-virtual {p0}, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->pollFirst()Ljava/lang/Object;

    move-result-object v0

    .line 250
    .local v0, "x":Ljava/lang/Object;, "TE;"
    if-nez v0, :cond_0

    .line 251
    new-instance v1, Ljava/util/NoSuchElementException;

    invoke-direct {v1}, Ljava/util/NoSuchElementException;-><init>()V

    throw v1

    .line 252
    :cond_0
    return-object v0
.end method

.method public removeFirstOccurrence(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .local p0, "this":Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;, "Lcom/lidroid/xutils/util/core/compatible/ArrayDeque<TE;>;"
    const/4 v3, 0x0

    .line 335
    if-nez p1, :cond_1

    .line 347
    :cond_0
    :goto_0
    return v3

    .line 337
    :cond_1
    iget-object v4, p0, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->elements:[Ljava/lang/Object;

    array-length v4, v4

    add-int/lit8 v1, v4, -0x1

    .line 338
    .local v1, "mask":I
    iget v0, p0, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->head:I

    .line 340
    .local v0, "i":I
    :goto_1
    iget-object v4, p0, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->elements:[Ljava/lang/Object;

    aget-object v2, v4, v0

    .local v2, "x":Ljava/lang/Object;
    if-eqz v2, :cond_0

    .line 341
    invoke-virtual {p1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 342
    invoke-direct {p0, v0}, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->delete(I)Z

    .line 343
    const/4 v3, 0x1

    goto :goto_0

    .line 345
    :cond_2
    add-int/lit8 v4, v0, 0x1

    and-int v0, v4, v1

    goto :goto_1
.end method

.method public removeLast()Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .prologue
    .line 260
    .local p0, "this":Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;, "Lcom/lidroid/xutils/util/core/compatible/ArrayDeque<TE;>;"
    invoke-virtual {p0}, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->pollLast()Ljava/lang/Object;

    move-result-object v0

    .line 261
    .local v0, "x":Ljava/lang/Object;, "TE;"
    if-nez v0, :cond_0

    .line 262
    new-instance v1, Ljava/util/NoSuchElementException;

    invoke-direct {v1}, Ljava/util/NoSuchElementException;-><init>()V

    throw v1

    .line 263
    :cond_0
    return-object v0
.end method

.method public removeLastOccurrence(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .local p0, "this":Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;, "Lcom/lidroid/xutils/util/core/compatible/ArrayDeque<TE;>;"
    const/4 v3, 0x0

    .line 363
    if-nez p1, :cond_1

    .line 375
    :cond_0
    :goto_0
    return v3

    .line 365
    :cond_1
    iget-object v4, p0, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->elements:[Ljava/lang/Object;

    array-length v4, v4

    add-int/lit8 v1, v4, -0x1

    .line 366
    .local v1, "mask":I
    iget v4, p0, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->tail:I

    add-int/lit8 v4, v4, -0x1

    and-int v0, v4, v1

    .line 368
    .local v0, "i":I
    :goto_1
    iget-object v4, p0, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->elements:[Ljava/lang/Object;

    aget-object v2, v4, v0

    .local v2, "x":Ljava/lang/Object;
    if-eqz v2, :cond_0

    .line 369
    invoke-virtual {p1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 370
    invoke-direct {p0, v0}, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->delete(I)Z

    .line 371
    const/4 v3, 0x1

    goto :goto_0

    .line 373
    :cond_2
    add-int/lit8 v4, v0, -0x1

    and-int v0, v4, v1

    goto :goto_1
.end method

.method public size()I
    .locals 2

    .prologue
    .line 552
    .local p0, "this":Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;, "Lcom/lidroid/xutils/util/core/compatible/ArrayDeque<TE;>;"
    iget v0, p0, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->tail:I

    iget v1, p0, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->head:I

    sub-int/2addr v0, v1

    iget-object v1, p0, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->elements:[Ljava/lang/Object;

    array-length v1, v1

    add-int/lit8 v1, v1, -0x1

    and-int/2addr v0, v1

    return v0
.end method

.method public toArray()[Ljava/lang/Object;
    .locals 1

    .prologue
    .line 733
    .local p0, "this":Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;, "Lcom/lidroid/xutils/util/core/compatible/ArrayDeque<TE;>;"
    invoke-virtual {p0}, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->size()I

    move-result v0

    new-array v0, v0, [Ljava/lang/Object;

    invoke-direct {p0, v0}, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->copyElements([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public toArray([Ljava/lang/Object;)[Ljava/lang/Object;
    .locals 2
    .param p1, "a"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;)[TT;"
        }
    .end annotation

    .prologue
    .line 774
    .local p0, "this":Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;, "Lcom/lidroid/xutils/util/core/compatible/ArrayDeque<TE;>;"
    invoke-virtual {p0}, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->size()I

    move-result v0

    .line 775
    .local v0, "size":I
    array-length v1, p1

    if-ge v1, v0, :cond_0

    .line 777
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v1

    .line 776
    invoke-static {v1, v0}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object p1

    .end local p1    # "a":[Ljava/lang/Object;
    check-cast p1, [Ljava/lang/Object;

    .line 778
    .restart local p1    # "a":[Ljava/lang/Object;
    :cond_0
    invoke-direct {p0, p1}, Lcom/lidroid/xutils/util/core/compatible/ArrayDeque;->copyElements([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 779
    array-length v1, p1

    if-le v1, v0, :cond_1

    .line 780
    const/4 v1, 0x0

    aput-object v1, p1, v0

    .line 781
    :cond_1
    return-object p1
.end method
