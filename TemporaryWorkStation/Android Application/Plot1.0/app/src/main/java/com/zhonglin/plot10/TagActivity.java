package com.zhonglin.plot10;

import android.content.Intent;
        import android.os.Bundle;
        import android.os.Environment;
        import android.support.v7.app.AppCompatActivity;
        import android.util.Log;
        import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.Toast;

        import java.io.File;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by zhonglin on 6/13/2016.
 */
public class TagActivity extends AppCompatActivity implements AdapterView.OnItemClickListener{
    private ArrayList xlsFileList = new ArrayList();
    ArrayAdapter adapter;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        File dir = Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOWNLOADS);
        String[] fileList = dir.list();
        //Filter the .xls files
        for(int i = 0; i < fileList.length; i++) {
            if(fileList[i].endsWith(".xls")) {
                xlsFileList.add(fileList[i]);
            }
        }
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_manully_select);

        //display the file names of all .xls files under Downloads
        adapter = new ArrayAdapter(this, R.layout.activity_listview, xlsFileList);
        ListView listView = (ListView) findViewById(R.id.tag_list);
        listView.setAdapter(adapter);
        listView.setOnItemClickListener(this);

    }

    @Override
    public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
        String fileName = (String) adapter.getItem(position);
        Intent plotIntent = new Intent(this, PlotActivity.class);
        //Attach a message according to the tag you select
        plotIntent.putExtra("fileName", fileName);
        startActivity(plotIntent);
    }
}
