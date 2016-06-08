package com.lidroid.xutils.http.client.multipart;

class MinimalField
{
    private final String name;
    private final String value;
    
    MinimalField(final String name, final String value) {
        this.name = name;
        this.value = value;
    }
    
    public String getBody() {
        return this.value;
    }
    
    public String getName() {
        return this.name;
    }
    
    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder();
        sb.append(this.name);
        sb.append(": ");
        sb.append(this.value);
        return sb.toString();
    }
}
