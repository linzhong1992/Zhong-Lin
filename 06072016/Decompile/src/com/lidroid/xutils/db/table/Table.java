package com.lidroid.xutils.db.table;

import com.lidroid.xutils.*;
import android.text.*;
import java.util.*;

public class Table
{
    private static final HashMap<String, Table> tableMap;
    private boolean checkedDatabase;
    public final HashMap<String, Column> columnMap;
    private Id id;
    private String tableName;
    
    static {
        tableMap = new HashMap<String, Table>();
    }
    
    private Table(final Class<?> clazz) {
        this.tableName = TableUtils.getTableName(clazz);
        this.id = TableUtils.getId(clazz);
        this.columnMap = TableUtils.getColumnMap(clazz);
    }
    
    public static Table get(final DbUtils dbUtils, final Class<?> clazz) {
        synchronized (Table.class) {
            final String string = String.valueOf(dbUtils.getDaoConfig().getDbName()) + "#" + clazz.getCanonicalName();
            Table table;
            if ((table = Table.tableMap.get(string)) == null) {
                table = new Table(clazz);
                Table.tableMap.put(string, table);
            }
            return table;
        }
    }
    
    public static void remove(final DbUtils dbUtils, final Class<?> clazz) {
        synchronized (Table.class) {
            Table.tableMap.remove(String.valueOf(dbUtils.getDaoConfig().getDbName()) + "#" + clazz.getCanonicalName());
        }
    }
    
    public static void remove(final DbUtils dbUtils, final String s) {
        synchronized (Table.class) {
            if (Table.tableMap.size() > 0) {
                CharSequence charSequence = null;
                for (final Map.Entry<String, Table> entry : Table.tableMap.entrySet()) {
                    final Table table = entry.getValue();
                    if (table != null && table.getTableName().equals(s)) {
                        final String s2 = entry.getKey();
                        final boolean startsWith = s2.startsWith(String.valueOf(dbUtils.getDaoConfig().getDbName()) + "#");
                        charSequence = s2;
                        if (startsWith) {
                            charSequence = s2;
                            break;
                        }
                        continue;
                    }
                }
                if (TextUtils.isEmpty(charSequence)) {
                    Table.tableMap.remove(charSequence);
                }
            }
        }
    }
    
    public Id getId() {
        return this.id;
    }
    
    public String getTableName() {
        return this.tableName;
    }
    
    public boolean isCheckedDatabase() {
        return this.checkedDatabase;
    }
    
    public void setCheckedDatabase(final boolean checkedDatabase) {
        this.checkedDatabase = checkedDatabase;
    }
}
