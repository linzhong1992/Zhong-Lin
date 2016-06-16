package com.example.alien.sampleinventory;

import android.content.Context;
import android.graphics.Color;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.KeyEvent;
import android.view.View;
import android.view.Menu;
import android.view.MenuItem;
import android.view.WindowManager;
import android.view.inputmethod.InputMethodManager;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.SimpleAdapter;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;

import com.alien.common.KeyCode;
import com.alien.rfid.Bank;
import com.alien.rfid.InvalidParamException;
import com.alien.rfid.Mask;
import com.alien.rfid.RFID;
import com.alien.rfid.RFIDCallback;
import com.alien.rfid.RFIDReader;
import com.alien.rfid.RFIDResult;
import com.alien.rfid.ReaderException;
import com.alien.rfid.Tag;

import java.util.ArrayList;
import java.util.HashMap;

public class InventoryActivity extends AppCompatActivity {

	private RFIDReader reader;

	private ListView      lvTags;
	private SimpleAdapter taglistAdapter;

	private static final String TAG_EPC = "colEPC";
	private static final String TAG_COUNT = "colCount";
	private ArrayList<HashMap<String, String>> tagList;
	private Spinner spinBanks;
	private Button  btnScan;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_inventory);
		Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
		setSupportActionBar(toolbar);

		getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_STATE_ALWAYS_HIDDEN);

		// create an array of EPC-hashed items to store tags
		if (tagList == null)
			tagList = new ArrayList<HashMap<String, String>>();

		lvTags = (ListView)findViewById(R.id.listTags);
		taglistAdapter = new SimpleAdapter(this, tagList, R.layout.taglist_item,
				new String[] { TAG_EPC, TAG_COUNT},
				new int[] { R.id.epc, R.id.count});
		lvTags.setAdapter(taglistAdapter);

		lvTags.requestFocus();

		spinBanks = (Spinner)findViewById(R.id.spinBank);
		spinBanks.setSelection(1);

		Button btn = (Button) findViewById(R.id.btnScan);
		btn.setText("START");
		btn.setBackgroundColor(0xff007f00); // gray
		btn.setTextColor(Color.WHITE);

		btn = (Button) findViewById(R.id.btnRead);
		btn.setBackgroundColor(0xffffffff);
		btn.setTextColor(Color.BLACK);

		btn = (Button) findViewById(R.id.btnClear);
		btn.setBackgroundColor(0xffffffff);
		btn.setTextColor(Color.BLACK);

		btn = (Button) findViewById(R.id.btnMaskSet);
		btn.setBackgroundColor(0xffffffff);
		btn.setTextColor(Color.BLACK);

		btn = (Button) findViewById(R.id.btnMaskClear);
		btn.setBackgroundColor(0xffffffff);
		btn.setTextColor(Color.BLACK);

		EditText edit = (EditText) findViewById(R.id.editBitPtr);
		edit.setText("32");

		edit = (EditText) findViewById(R.id.editBitLen);
		edit.setText("8");

		try {
			// initialize RFID interface and obtain a global RFID Reader instance
			reader = RFID.open();
		}
		catch(ReaderException e) {
			Toast.makeText(this, "RFID init failed: " + e, Toast.LENGTH_LONG).show();
		}
	}

	@Override
	protected void onDestroy() {
		// close RFID interface
		if (reader != null) reader.close();
		super.onDestroy();
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.menu_inventory, menu);
		return true;
	}

	@Override
	public boolean onOptionsItemSelected(MenuItem item) {
		// Handle action bar item clicks here. The action bar will
		// automatically handle clicks on the Home/Up button, so long
		// as you specify a parent activity in AndroidManifest.xml.
		int id = item.getItemId();

		return super.onOptionsItemSelected(item);
	}

	@Override
	public boolean onKeyDown(int keyCode, KeyEvent event) {
		if (keyCode == KeyCode.ALR_H450.SCAN && event.getRepeatCount() == 0) {
			startScan();
			return true;
		}
		return super.onKeyDown(keyCode, event);
	}

	@Override
	public boolean onKeyUp(int keyCode, KeyEvent event) {
		if (keyCode == KeyCode.ALR_H450.SCAN) {
			stopScan();
			return true;
		}
		return super.onKeyUp(keyCode, event);
	}

	private void startScan() {
		if (reader == null || reader.isRunning()) return;

		try {
			// start continuous inventory
			Button btn = (Button) findViewById(R.id.btnScan);
			btn.setText("STOP");
			btn.setBackgroundColor(0xffff0000);

			// create a callback to receive tag data
			reader.inventory(new RFIDCallback() {
				@Override
				public void onTagRead(Tag tag) {
					addTag(tag);
				}
			});
		}
		catch (ReaderException e) {
			Toast.makeText(this, "ERROR: " + e, Toast.LENGTH_LONG).show();
		}
	}

	private void stopScan() {
		if (reader == null || !reader.isRunning()) return;

		// stop continuous inventory
		try {
			reader.stop();

			Button btn = (Button) findViewById(R.id.btnScan);
			btn.setText("START");
			btn.setBackgroundColor(0xff007f00);
		}
		catch(ReaderException e) {
			Toast.makeText(this, "ERROR: " + e, Toast.LENGTH_LONG).show();
		}
	}

	public void onRead(View view) {
		if (reader == null) return;

		try {
			// Read a single tag and add it to the list
			RFIDResult result = reader.read();
			if (!result.isSuccess()) {
				Toast.makeText(this, "No tags found", Toast.LENGTH_LONG).show();
				return;
			}
			addTag ((Tag)result.getData());
		}
		catch (ReaderException e) {
			Toast.makeText(this, "ERROR: " + e, Toast.LENGTH_LONG).show();
		}
	}

	public void onClear(View view) {
		// clear taglist
		tagList.clear();
		taglistAdapter.notifyDataSetChanged();
	}

	public void onScan(View view) {
		if (reader.isRunning())
			stopScan();
		else
			startScan();
	}

	public void onMaskSet(View view) {
		Bank bank= Bank.EPC;
		EditText e;

		// hide virtual keyboard
		InputMethodManager inputManager = (InputMethodManager)
				getSystemService(Context.INPUT_METHOD_SERVICE);

		inputManager.hideSoftInputFromWindow(getCurrentFocus().getWindowToken(),
				InputMethodManager.HIDE_NOT_ALWAYS);

		switch (spinBanks.getSelectedItemPosition()) {
			case 0: bank= Bank.RESERVED; break;
			case 1: bank= Bank.EPC; break;
			case 2: bank= Bank.TID; break;
			case 3: bank= Bank.USER; break;
			default: break;
		}

		try {
			e = (EditText)findViewById(R.id.editBitPtr);
			int ptr = Integer.parseInt(e.getText().toString(), 10);

			e = (EditText)findViewById(R.id.editBitLen);
			int len = Integer.parseInt(e.getText().toString(), 10);

			e = (EditText)findViewById(R.id.editData);
			String data = e.getText().toString();
			if (data.isEmpty()) {
				throw (new InvalidParamException("Mask Data is empty!"));
			}

			// set mask
			reader.setMask(new Mask(bank, ptr, len, data));

			TextView t = (TextView)findViewById(R.id.txtMask);
			t.setTextColor(Color.YELLOW);

			String[] sBank = new String[] {"RSVD", "EPC", "TID", "USER"};
			t.setText("MASK: " + sBank[bank.getValue()] + ", " + ptr + ", " + len + ", " + data);
		}
		catch (InvalidParamException ex) {
			Toast t = Toast.makeText(this, "ERROR: " + ex.getMessage(), Toast.LENGTH_LONG);
			TextView text = (TextView) t.getView().findViewById(android.R.id.message);
			text.setTextColor(Color.YELLOW);
			t.show();
		}
	}

	public void onMaskClear(View view) {
		// hide virtual keyboard
		InputMethodManager inputManager = (InputMethodManager)
				getSystemService(Context.INPUT_METHOD_SERVICE);

		inputManager.hideSoftInputFromWindow(getCurrentFocus().getWindowToken(),
				InputMethodManager.HIDE_NOT_ALWAYS);

		try {
			// clear mask by supplying 0 value for the BiLength parameter
			reader.setMask(new Mask(Bank.EPC, 0, 0, ""));

			TextView t = (TextView)findViewById(R.id.txtMask);
			t.setTextColor(Color.LTGRAY);
			t.setText("MASK");
		}
		catch (InvalidParamException e) {
			Toast.makeText(this, "ERROR: " + e.getMessage(), Toast.LENGTH_LONG).show();
		}
	}

	public void addTag(final Tag tag) {
		if(tag.getEPC().isEmpty()) return;

		// update TagList (must be done on the UI thread)
		runOnUiThread(new Runnable() {
			@Override
			public void run() {
				// if this tag is already in the list, increment the count
				for (HashMap<String, String> item : tagList) {
					if (item.get(TAG_EPC).equals(tag.getEPC())) {
						int c = Integer.parseInt(item.get(TAG_COUNT)) + 1;
						item.put(TAG_COUNT, String.valueOf(c));
						taglistAdapter.notifyDataSetChanged();
						return;
					}
				}
				// this is a new tag, add it to the list
				HashMap<String, String> hm = new HashMap<String, String>();
				hm.put(TAG_EPC, tag.getEPC());
				hm.put(TAG_COUNT, "1");
				tagList.add(hm);
				taglistAdapter.notifyDataSetChanged();
			}
		});
	}
}
