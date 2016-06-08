package com.rscja.utility;

public class a
{
    public static String a(final byte b) {
        try {
            String s2;
            final String s = s2 = Integer.toHexString(b & 0xFF);
            if (s.length() == 1) {
                s2 = "0" + s;
            }
            return String.valueOf("") + s2.toUpperCase();
        }
        catch (Exception ex) {
            ex.printStackTrace();
            return "";
        }
    }
    
    public static String a(final byte[] array, final int n) {
        String string = "";
        int i = 0;
        while (i < n) {
            try {
                String s2;
                final String s = s2 = Integer.toHexString(array[i] & 0xFF);
                if (s.length() == 1) {
                    s2 = "0" + s;
                }
                string = String.valueOf(string) + s2.toUpperCase();
                ++i;
            }
            catch (Exception ex) {
                ex.printStackTrace();
                return string;
            }
        }
        return string;
    }
}
