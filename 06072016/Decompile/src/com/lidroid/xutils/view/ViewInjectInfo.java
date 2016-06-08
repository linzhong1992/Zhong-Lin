package com.lidroid.xutils.view;

public class ViewInjectInfo
{
    public int parentId;
    public Object value;
    
    @Override
    public boolean equals(final Object o) {
        if (this != o) {
            if (!(o instanceof ViewInjectInfo)) {
                return false;
            }
            final ViewInjectInfo viewInjectInfo = (ViewInjectInfo)o;
            if (this.parentId != viewInjectInfo.parentId) {
                return false;
            }
            if (this.value != null) {
                return this.value.equals(viewInjectInfo.value);
            }
            if (viewInjectInfo.value != null) {
                return false;
            }
        }
        return true;
    }
    
    @Override
    public int hashCode() {
        return this.value.hashCode() * 31 + this.parentId;
    }
}
