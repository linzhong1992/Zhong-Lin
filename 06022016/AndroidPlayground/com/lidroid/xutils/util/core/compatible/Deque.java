package com.lidroid.xutils.util.core.compatible;

import java.util.Iterator;
import java.util.Queue;

public abstract interface Deque<E>
  extends Queue<E>
{
  public abstract boolean add(E paramE);
  
  public abstract void addFirst(E paramE);
  
  public abstract void addLast(E paramE);
  
  public abstract boolean contains(Object paramObject);
  
  public abstract Iterator<E> descendingIterator();
  
  public abstract E element();
  
  public abstract E getFirst();
  
  public abstract E getLast();
  
  public abstract Iterator<E> iterator();
  
  public abstract boolean offer(E paramE);
  
  public abstract boolean offerFirst(E paramE);
  
  public abstract boolean offerLast(E paramE);
  
  public abstract E peek();
  
  public abstract E peekFirst();
  
  public abstract E peekLast();
  
  public abstract E poll();
  
  public abstract E pollFirst();
  
  public abstract E pollLast();
  
  public abstract E pop();
  
  public abstract void push(E paramE);
  
  public abstract E remove();
  
  public abstract boolean remove(Object paramObject);
  
  public abstract E removeFirst();
  
  public abstract boolean removeFirstOccurrence(Object paramObject);
  
  public abstract E removeLast();
  
  public abstract boolean removeLastOccurrence(Object paramObject);
  
  public abstract int size();
}


/* Location:              C:\playground\dex2jar-2.0\dex2jar-2.0\classes-dex2jar.jar!\com\lidroid\xutils\util\core\compatible\Deque.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */