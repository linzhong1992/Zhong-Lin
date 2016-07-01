package com.zhonglin.plot10;

import android.content.Context;
import android.content.Intent;
import android.os.Environment;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;

import java.io.File;

public class MainActivity extends AppCompatActivity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {


        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        getSupportActionBar().setDefaultDisplayHomeAsUpEnabled(true);

    }
    @Override
    public boolean onCreateOptionsMenu(final Menu menu) {
        this.getMenuInflater().inflate(R.menu.menu_main, menu);
        return true;
    }
    public boolean onOptionsItemSelected(MenuItem item) {
        if(item.getItemId() == R.id.action_settings)
            return true;
        return super.onOptionsItemSelected(item);
    }
    public void onClickSelect(final View v) {
        startActivity(new Intent(this, TagActivity.class));
    }
}
