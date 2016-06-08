package com.lidroid.xutils.http.client.multipart;

import java.util.*;

class MinimalFieldHeader implements Iterable<MinimalField>
{
    private final Map<String, List<MinimalField>> fieldMap;
    private final List<MinimalField> fields;
    
    public MinimalFieldHeader() {
        this.fields = new LinkedList<MinimalField>();
        this.fieldMap = new HashMap<String, List<MinimalField>>();
    }
    
    public void addField(final MinimalField minimalField) {
        if (minimalField == null) {
            return;
        }
        final String lowerCase = minimalField.getName().toLowerCase(Locale.US);
        List<MinimalField> list;
        if ((list = this.fieldMap.get(lowerCase)) == null) {
            list = new LinkedList<MinimalField>();
            this.fieldMap.put(lowerCase, list);
        }
        list.add(minimalField);
        this.fields.add(minimalField);
    }
    
    public MinimalField getField(String lowerCase) {
        if (lowerCase != null) {
            lowerCase = lowerCase.toLowerCase(Locale.US);
            final List<MinimalField> list = this.fieldMap.get(lowerCase);
            if (list != null && !list.isEmpty()) {
                return list.get(0);
            }
        }
        return null;
    }
    
    public List<MinimalField> getFields() {
        return new ArrayList<MinimalField>(this.fields);
    }
    
    public List<MinimalField> getFields(String lowerCase) {
        if (lowerCase == null) {
            return null;
        }
        lowerCase = lowerCase.toLowerCase(Locale.US);
        final List<MinimalField> list = this.fieldMap.get(lowerCase);
        if (list == null || list.isEmpty()) {
            return Collections.emptyList();
        }
        return new ArrayList<MinimalField>(list);
    }
    
    @Override
    public Iterator<MinimalField> iterator() {
        return Collections.unmodifiableList((List<? extends MinimalField>)this.fields).iterator();
    }
    
    public int removeFields(String lowerCase) {
        if (lowerCase != null) {
            lowerCase = lowerCase.toLowerCase(Locale.US);
            final List<MinimalField> list = this.fieldMap.remove(lowerCase);
            if (list != null && !list.isEmpty()) {
                this.fields.removeAll(list);
                return list.size();
            }
        }
        return 0;
    }
    
    public void setField(final MinimalField minimalField) {
        if (minimalField == null) {
            return;
        }
        final List<MinimalField> list = this.fieldMap.get(minimalField.getName().toLowerCase(Locale.US));
        if (list == null || list.isEmpty()) {
            this.addField(minimalField);
            return;
        }
        list.clear();
        list.add(minimalField);
        int n = -1;
        int n2 = 0;
        final Iterator<MinimalField> iterator = this.fields.iterator();
        while (iterator.hasNext()) {
            int n3 = n;
            if (iterator.next().getName().equalsIgnoreCase(minimalField.getName())) {
                iterator.remove();
                if ((n3 = n) == -1) {
                    n3 = n2;
                }
            }
            ++n2;
            n = n3;
        }
        this.fields.add(n, minimalField);
    }
    
    @Override
    public String toString() {
        return this.fields.toString();
    }
}
