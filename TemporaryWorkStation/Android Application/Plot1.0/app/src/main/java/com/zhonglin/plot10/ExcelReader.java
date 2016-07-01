package com.zhonglin.plot10;

import android.os.Environment;
import android.util.Log;
import android.widget.Toast;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import jxl.Cell;
import jxl.NumberCell;
import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;

/**
 * Created by zhonglin on 6/28/2016.
 */
public class ExcelReader {
    private List lineList = new ArrayList();
    public List xList = new ArrayList();
    public List yList = new ArrayList();
    private String xName;
    private String yName;
    private int row;
    private int col;

    public ExcelReader(String fileName) throws IOException, BiffException {
        File file = new File(fileName);
        InputStream inputStream = new FileInputStream(file);
        Workbook wb = Workbook.getWorkbook(inputStream);

        Sheet s = wb.getSheet(0);
        row = s.getRows();
        col = s.getColumns();
        xName = s.getCell(0, 0).getContents();
        yName = s.getCell(1, 0).getContents();
        for(int i = 0; i < col; i = i + 2) {
            for (int j = 1; j < row; j++) {
                xList.add(((NumberCell) s.getCell(i, j)).getValue());
                yList.add(((NumberCell) s.getCell(i + 1, j)).getValue());
            }
            lineList.add(new ListPair(xList, yList));
            xList.clear();
            yList.clear();
        }
    }
    public String getXName() {
        return xName;
    }
    public String getYName() {
        return yName;
    }
    public List getLineList() {
        return lineList;
    }
    public int getRow() {
        return row;
    }
    public int getColumn() {
        return col;
    }
}
