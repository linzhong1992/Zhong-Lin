package com.zhonglin.plot10;

import android.graphics.Color;
import android.os.Bundle;
import android.os.Environment;
import android.support.v7.app.AppCompatActivity;
import android.widget.Toast;
import com.androidplot.xy.*;

import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.List;

import jxl.read.biff.BiffException;

/**
 * Created by zhonglin on 6/15/2016.
 */
public class PlotActivity extends AppCompatActivity {
    private XYPlot plot;
    String fileName;
    private ExcelReader excelReader;
    //The list of lines(lists of ListPairs).
    private List lineList;
    //The formatters used for coloring plottings.
    private LineAndPointFormatter[] formatters = new LineAndPointFormatter[5];

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_plot);
        //Receiving message(the tag that you select) from TagActivity
        Bundle extras = getIntent().getExtras();
        fileName = extras.getString("fileName");
        //Get the directory of Downloads
        File dir = Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOWNLOADS);

        try {
            excelReader = new ExcelReader(dir.toString() + "/" + fileName);
            lineList = excelReader.getLineList();
        } catch (IOException e) {
            Toast.makeText(this, "Failed to read", Toast.LENGTH_LONG).show();
        } catch (BiffException e) {
            Toast.makeText(this, "Failed to read", Toast.LENGTH_LONG).show();
        }

        plot = (XYPlot) findViewById(R.id.plot);

        formatters[0] = new LineAndPointFormatter(Color.GREEN, Color.GREEN, null, null);
        formatters[1] = new LineAndPointFormatter(Color.RED, Color.RED, null, null);
        formatters[2] = new LineAndPointFormatter(Color.BLUE, Color.BLUE, null, null);
        formatters[3] = new LineAndPointFormatter(Color.YELLOW, Color.YELLOW, null, null);
        formatters[4] = new LineAndPointFormatter(Color.MAGENTA, Color.MAGENTA, null, null);

        //Add lines to the graph
        for(int i = 0; i < excelReader.getLineList().size(); i++) {
            XYSeries s1 = new SimpleXYSeries(((ListPair) excelReader.getLineList().get(i)).xList, ((ListPair) excelReader.getLineList().get(i)).yList, "");
            plot.addSeries(s1, formatters[i % 5]);
        }

        //Do some decorations to the plottings
        plot.setRangeStep(XYStepMode.INCREMENT_BY_VAL, 1);
        plot.setRangeValueFormat(new DecimalFormat("#"));
        plot.setDomainStep(XYStepMode.SUBDIVIDE, 9);
        plot.setDomainValueFormat(new DecimalFormat("#"));
        plot.getGraphWidget().setDomainLabelOrientation(-45);
        plot.getGraphWidget().setRangeLabelOrientation(-45);
    }

}
