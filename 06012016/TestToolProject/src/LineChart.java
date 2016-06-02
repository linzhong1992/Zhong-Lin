import java.awt.Color;
import java.awt.BasicStroke;
import java.awt.Image;
import java.awt.image.*;

import java.awt.Toolkit;
import java.io.IOException;
import java.io.InputStream;
import java.util.*;

import com.sun.xml.internal.ws.policy.privateutil.PolicyUtils;
import org.apache.poi.sl.usermodel.Line;
import org.jfree.chart.ChartPanel;
import org.jfree.chart.JFreeChart;
import org.jfree.data.xy.XYDataset;
import org.jfree.data.xy.XYSeries;
import org.jfree.ui.ApplicationFrame;
import org.jfree.ui.RefineryUtilities;
import org.jfree.chart.plot.XYPlot;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.xy.XYSeriesCollection;
import org.jfree.chart.renderer.xy.XYLineAndShapeRenderer;

import javax.imageio.ImageIO;
import javax.swing.JFrame;

public class LineChart extends JFrame
{
    public LineChart( String applicationTitle, String chartTitle, String fileName) throws IOException
    {
        super(applicationTitle);
        ExcelReader reader = new ExcelReader(fileName);
        ClassLoader classloader = getClass().getClassLoader();
        InputStream imgStream = classloader.getResourceAsStream("alien.png");
        BufferedImage myIcon = ImageIO.read(imgStream);
        setIconImage(myIcon);
        JFreeChart xylineChart = ChartFactory.createXYLineChart(
                chartTitle ,
                reader.getXName(),
                reader.getYName(),
                createDataset(reader.getData()) ,
                PlotOrientation.VERTICAL ,
                true , true , false);

        ChartPanel chartPanel = new ChartPanel( xylineChart );
        chartPanel.setPreferredSize( new java.awt.Dimension( 560 , 367 ) );
        final XYPlot plot = xylineChart.getXYPlot( );
        XYLineAndShapeRenderer renderer = new XYLineAndShapeRenderer( );
        renderer.setSeriesPaint( 0 , Color.RED );
//        renderer.setSeriesPaint( 1 , Color.GREEN );
//        renderer.setSeriesPaint( 2 , Color.YELLOW );
        renderer.setSeriesStroke( 0 , new BasicStroke( 4.0f ) );
//        renderer.setSeriesStroke( 1 , new BasicStroke( 3.0f ) );
//        renderer.setSeriesStroke( 2 , new BasicStroke( 2.0f ) );
        plot.setRenderer( renderer );
        setContentPane( chartPanel );
    }

    private XYDataset createDataset(List<DataPair> dataPairList)
    {
        final XYSeries test = new XYSeries( "test" );
        for(int i = 0; i < dataPairList.size(); i++) {
            test.add(dataPairList.get(i).x, dataPairList.get(i).y);
        }
//        final XYSeries chrome = new XYSeries( "Chrome" );
//        chrome.add( 1.0 , 4.0 );
//        chrome.add( 2.0 , 5.0 );
//        chrome.add( 3.0 , 6.0 );
//        final XYSeries iexplorer = new XYSeries( "InternetExplorer" );
//        iexplorer.add( 3.0 , 4.0 );
//        iexplorer.add( 4.0 , 5.0 );
//        iexplorer.add( 5.0 , 4.0 );
        final XYSeriesCollection dataset = new XYSeriesCollection( );
        dataset.addSeries( test );
//        dataset.addSeries( chrome );
//        dataset.addSeries( iexplorer );
        return dataset;
    }

    public static void main( String[ ] args ) throws IOException
    {
        LineChart chart = new LineChart("Lets do a test", "TEST", "Test1.xlsx");
        chart.pack( );
        RefineryUtilities.centerFrameOnScreen( chart );
        chart.setVisible( true );
    }
}