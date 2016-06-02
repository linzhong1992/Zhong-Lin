import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.*;

import org.apache.poi.ss.formula.eval.StringEval;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
/**
 * Created by zhonglin on 5/23/2016.
 */
public class ExcelReader {
    private String fileName;
    private String xName;
    private String yName;
    private List<DataPair> series = new ArrayList<>();
    public ExcelReader(String fileName) throws IOException{
//        ClassLoader classloader = getClass().getClassLoader();
//        File file = new File(classloader.getResource(fileName).getFile());
//        FileInputStream inputStream = new FileInputStream(file);
        ClassLoader classloader = getClass().getClassLoader();
        InputStream inputStream = classloader.getResourceAsStream(fileName);
        Workbook workbook = new XSSFWorkbook(inputStream);
        Sheet firstSheet = workbook.getSheetAt(0);
        Iterator<Row> iterator = firstSheet.iterator();
        Row variableNameRow = iterator.next();
        Iterator<Cell> variableNameIterator = variableNameRow.cellIterator();
        Cell cell = variableNameIterator.next();
        xName = cell.getStringCellValue();
        cell = variableNameIterator.next();
        yName = cell.getStringCellValue();
        while(iterator.hasNext()) {

            Row nextRow = iterator.next();
            Iterator<Cell> dataCellIterator = nextRow.cellIterator();
            double x = dataCellIterator.next().getNumericCellValue();
            //System.out.println(x);
            double y = dataCellIterator.next().getNumericCellValue();
            //System.out.println(y);
            series.add(new DataPair(x, y));
        }
    }
    public String getXName() {
        return xName;
    }
    public String getYName() {
        return yName;
    }
    public List<DataPair> getData() {
        return series;
    }

    public static void main(String[] args) throws IOException {
        ExcelReader reader = new ExcelReader("Test1.xlsx");
        List<DataPair> data = reader.getData();
        for(int i = 0; i < reader.getData().size(); i++) {
            System.out.print(data.get(i).x);
            System.out.print(" - ");
            System.out.println(data.get(i).y);

        }
    }
}

