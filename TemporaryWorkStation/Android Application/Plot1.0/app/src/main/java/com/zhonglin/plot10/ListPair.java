package com.zhonglin.plot10;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by zhonglin on 6/29/2016.
 */
public class ListPair {
    public List xList;
    public List yList;
    public ListPair(List xList, List yList) {
        this.xList =(ArrayList) ((ArrayList) xList).clone();
        this.yList =(ArrayList) ((ArrayList) yList).clone();
    }
}
