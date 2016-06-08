package com.lidroid.xutils.util.core.compatible;

import java.lang.reflect.*;
import java.io.*;
import java.util.*;

public class ArrayDeque<E> extends AbstractCollection<E> implements Deque<E>, Cloneable, Serializable
{
    private static final int MIN_INITIAL_CAPACITY = 8;
    private static final long serialVersionUID = 2340985798034038923L;
    private transient Object[] elements;
    private transient int head;
    private transient int tail;
    
    public ArrayDeque() {
        this.elements = new Object[16];
    }
    
    public ArrayDeque(final int n) {
        this.allocateElements(n);
    }
    
    public ArrayDeque(final Collection<? extends E> collection) {
        this.allocateElements(collection.size());
        this.addAll(collection);
    }
    
    private void allocateElements(int n) {
        int n2 = 8;
        if (n >= 8) {
            n |= n >>> 1;
            n |= n >>> 2;
            n |= n >>> 4;
            n |= n >>> 8;
            n = (n | n >>> 16) + 1;
            if ((n2 = n) < 0) {
                n2 = n >>> 1;
            }
        }
        this.elements = new Object[n2];
    }
    
    private <T> T[] copyElements(final T[] array) {
        if (this.head < this.tail) {
            System.arraycopy(this.elements, this.head, array, 0, this.size());
        }
        else if (this.head > this.tail) {
            final int n = this.elements.length - this.head;
            System.arraycopy(this.elements, this.head, array, 0, n);
            System.arraycopy(this.elements, 0, array, n, this.tail);
            return array;
        }
        return array;
    }
    
    private static <T> T[] copyOfRange(final T[] array, final int n, int n2) {
        final int length = array.length;
        if (n > n2) {
            throw new IllegalArgumentException("start > end");
        }
        if (n < 0 || n > length) {
            throw new ArrayIndexOutOfBoundsException();
        }
        n2 -= n;
        final int min = Math.min(n2, length - n);
        final Object[] array2 = (Object[])Array.newInstance(array.getClass().getComponentType(), n2);
        System.arraycopy(array, n, array2, 0, min);
        return (T[])array2;
    }
    
    private boolean delete(final int n) {
        final Object[] elements = this.elements;
        final int n2 = elements.length - 1;
        final int head = this.head;
        final int tail = this.tail;
        final int n3 = n - head & n2;
        final int n4 = tail - n & n2;
        if (n3 >= (tail - head & n2)) {
            throw new ConcurrentModificationException();
        }
        if (n3 < n4) {
            if (head <= n) {
                System.arraycopy(elements, head, elements, head + 1, n3);
            }
            else {
                System.arraycopy(elements, 0, elements, 1, n);
                elements[0] = elements[n2];
                System.arraycopy(elements, head, elements, head + 1, n2 - head);
            }
            elements[head] = null;
            this.head = (head + 1 & n2);
            return false;
        }
        if (n < tail) {
            System.arraycopy(elements, n + 1, elements, n, n4);
            this.tail = tail - 1;
        }
        else {
            System.arraycopy(elements, n + 1, elements, n, n2 - n);
            elements[n2] = elements[0];
            System.arraycopy(elements, 1, elements, 0, tail);
            this.tail = (tail - 1 & n2);
        }
        return true;
    }
    
    private void doubleCapacity() {
        final int head = this.head;
        final int length = this.elements.length;
        final int n = length - head;
        final int n2 = length << 1;
        if (n2 < 0) {
            throw new IllegalStateException("Sorry, deque too big");
        }
        final Object[] elements = new Object[n2];
        System.arraycopy(this.elements, head, elements, 0, n);
        System.arraycopy(this.elements, 0, elements, n, head);
        this.elements = elements;
        this.head = 0;
        this.tail = length;
    }
    
    private void readObject(final ObjectInputStream objectInputStream) throws IOException, ClassNotFoundException {
        objectInputStream.defaultReadObject();
        final int int1 = objectInputStream.readInt();
        this.allocateElements(int1);
        this.head = 0;
        this.tail = int1;
        for (int i = 0; i < int1; ++i) {
            this.elements[i] = objectInputStream.readObject();
        }
    }
    
    private void writeObject(final ObjectOutputStream objectOutputStream) throws IOException {
        objectOutputStream.defaultWriteObject();
        objectOutputStream.writeInt(this.size());
        for (int length = this.elements.length, i = this.head; i != this.tail; i = (i + 1 & length - 1)) {
            objectOutputStream.writeObject(this.elements[i]);
        }
    }
    
    @Override
    public boolean add(final E e) {
        this.addLast(e);
        return true;
    }
    
    @Override
    public void addFirst(final E e) {
        if (e == null) {
            throw new NullPointerException("e == null");
        }
        this.elements[this.head = (this.head - 1 & this.elements.length - 1)] = e;
        if (this.head == this.tail) {
            this.doubleCapacity();
        }
    }
    
    @Override
    public void addLast(final E e) {
        if (e == null) {
            throw new NullPointerException("e == null");
        }
        this.elements[this.tail] = e;
        if ((this.tail = (this.tail + 1 & this.elements.length - 1)) == this.head) {
            this.doubleCapacity();
        }
    }
    
    @Override
    public void clear() {
        int head = this.head;
        final int tail = this.tail;
        if (head != tail) {
            this.tail = 0;
            this.head = 0;
            do {
                this.elements[head] = null;
            } while ((head = (head + 1 & this.elements.length - 1)) != tail);
        }
    }
    
    public ArrayDeque<E> clone() {
        try {
            final ArrayDeque arrayDeque = (ArrayDeque)super.clone();
            arrayDeque.elements = copyOfRange(this.elements, 0, this.elements.length);
            return arrayDeque;
        }
        catch (CloneNotSupportedException ex) {
            throw new AssertionError();
        }
    }
    
    @Override
    public boolean contains(final Object o) {
        if (o != null) {
            final int length = this.elements.length;
            int head = this.head;
            while (true) {
                final Object o2 = this.elements[head];
                if (o2 == null) {
                    return false;
                }
                if (o.equals(o2)) {
                    break;
                }
                head = (head + 1 & length - 1);
            }
            return true;
        }
        return false;
    }
    
    @Override
    public Iterator<E> descendingIterator() {
        return new DescendingIterator((DescendingIterator)null);
    }
    
    @Override
    public E element() {
        return this.getFirst();
    }
    
    @Override
    public E getFirst() {
        final Object o = this.elements[this.head];
        if (o == null) {
            throw new NoSuchElementException();
        }
        return (E)o;
    }
    
    @Override
    public E getLast() {
        final Object o = this.elements[this.tail - 1 & this.elements.length - 1];
        if (o == null) {
            throw new NoSuchElementException();
        }
        return (E)o;
    }
    
    @Override
    public boolean isEmpty() {
        return this.head == this.tail;
    }
    
    @Override
    public Iterator<E> iterator() {
        return new DeqIterator((DeqIterator)null);
    }
    
    @Override
    public boolean offer(final E e) {
        return this.offerLast(e);
    }
    
    @Override
    public boolean offerFirst(final E e) {
        this.addFirst(e);
        return true;
    }
    
    @Override
    public boolean offerLast(final E e) {
        this.addLast(e);
        return true;
    }
    
    @Override
    public E peek() {
        return this.peekFirst();
    }
    
    @Override
    public E peekFirst() {
        return (E)this.elements[this.head];
    }
    
    @Override
    public E peekLast() {
        return (E)this.elements[this.tail - 1 & this.elements.length - 1];
    }
    
    @Override
    public E poll() {
        return this.pollFirst();
    }
    
    @Override
    public E pollFirst() {
        final int head = this.head;
        final Object o = this.elements[head];
        if (o == null) {
            return null;
        }
        this.elements[head] = null;
        this.head = (head + 1 & this.elements.length - 1);
        return (E)o;
    }
    
    @Override
    public E pollLast() {
        final int tail = this.tail - 1 & this.elements.length - 1;
        final Object o = this.elements[tail];
        if (o == null) {
            return null;
        }
        this.elements[tail] = null;
        this.tail = tail;
        return (E)o;
    }
    
    @Override
    public E pop() {
        return this.removeFirst();
    }
    
    @Override
    public void push(final E e) {
        this.addFirst(e);
    }
    
    @Override
    public E remove() {
        return this.removeFirst();
    }
    
    @Override
    public boolean remove(final Object o) {
        return this.removeFirstOccurrence(o);
    }
    
    @Override
    public E removeFirst() {
        final E pollFirst = this.pollFirst();
        if (pollFirst == null) {
            throw new NoSuchElementException();
        }
        return pollFirst;
    }
    
    @Override
    public boolean removeFirstOccurrence(final Object o) {
        if (o != null) {
            final int length = this.elements.length;
            int head = this.head;
            while (true) {
                final Object o2 = this.elements[head];
                if (o2 == null) {
                    return false;
                }
                if (o.equals(o2)) {
                    break;
                }
                head = (head + 1 & length - 1);
            }
            this.delete(head);
            return true;
        }
        return false;
    }
    
    @Override
    public E removeLast() {
        final E pollLast = this.pollLast();
        if (pollLast == null) {
            throw new NoSuchElementException();
        }
        return pollLast;
    }
    
    @Override
    public boolean removeLastOccurrence(final Object o) {
        if (o != null) {
            final int n = this.elements.length - 1;
            int n2 = this.tail - 1 & n;
            while (true) {
                final Object o2 = this.elements[n2];
                if (o2 == null) {
                    return false;
                }
                if (o.equals(o2)) {
                    break;
                }
                n2 = (n2 - 1 & n);
            }
            this.delete(n2);
            return true;
        }
        return false;
    }
    
    @Override
    public int size() {
        return this.tail - this.head & this.elements.length - 1;
    }
    
    @Override
    public Object[] toArray() {
        return this.copyElements(new Object[this.size()]);
    }
    
    @Override
    public <T> T[] toArray(final T[] array) {
        final int size = this.size();
        Object[] array2 = array;
        if (array.length < size) {
            array2 = (Object[])Array.newInstance(array.getClass().getComponentType(), size);
        }
        this.copyElements(array2);
        if (array2.length > size) {
            array2[size] = null;
        }
        return (T[])array2;
    }
    
    private class DeqIterator implements Iterator<E>
    {
        private int cursor;
        private int fence;
        private int lastRet;
        
        private DeqIterator() {
            this.cursor = ArrayDeque.this.head;
            this.fence = ArrayDeque.this.tail;
            this.lastRet = -1;
        }
        
        @Override
        public boolean hasNext() {
            return this.cursor != this.fence;
        }
        
        @Override
        public E next() {
            if (this.cursor == this.fence) {
                throw new NoSuchElementException();
            }
            final Object o = ArrayDeque.this.elements[this.cursor];
            if (ArrayDeque.this.tail != this.fence || o == null) {
                throw new ConcurrentModificationException();
            }
            this.lastRet = this.cursor;
            this.cursor = (this.cursor + 1 & ArrayDeque.this.elements.length - 1);
            return (E)o;
        }
        
        @Override
        public void remove() {
            if (this.lastRet < 0) {
                throw new IllegalStateException();
            }
            if (ArrayDeque.this.delete(this.lastRet)) {
                this.cursor = (this.cursor - 1 & ArrayDeque.this.elements.length - 1);
                this.fence = ArrayDeque.this.tail;
            }
            this.lastRet = -1;
        }
    }
    
    private class DescendingIterator implements Iterator<E>
    {
        private int cursor;
        private int fence;
        private int lastRet;
        
        private DescendingIterator() {
            this.cursor = ArrayDeque.this.tail;
            this.fence = ArrayDeque.this.head;
            this.lastRet = -1;
        }
        
        @Override
        public boolean hasNext() {
            return this.cursor != this.fence;
        }
        
        @Override
        public E next() {
            if (this.cursor == this.fence) {
                throw new NoSuchElementException();
            }
            this.cursor = (this.cursor - 1 & ArrayDeque.this.elements.length - 1);
            final Object o = ArrayDeque.this.elements[this.cursor];
            if (ArrayDeque.this.head != this.fence || o == null) {
                throw new ConcurrentModificationException();
            }
            this.lastRet = this.cursor;
            return (E)o;
        }
        
        @Override
        public void remove() {
            if (this.lastRet < 0) {
                throw new IllegalStateException();
            }
            if (!ArrayDeque.this.delete(this.lastRet)) {
                this.cursor = (this.cursor + 1 & ArrayDeque.this.elements.length - 1);
                this.fence = ArrayDeque.this.head;
            }
            this.lastRet = -1;
        }
    }
}
