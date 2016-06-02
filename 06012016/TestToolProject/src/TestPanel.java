import javax.swing.JPanel;
import javax.swing.JButton;
import java.awt.Color;
import javax.swing.JLabel;

public class TestPanel extends JPanel {
	private final JButton btnTest1 = new JButton("Test 1");
	private final JButton btnTest2 = new JButton("Test 2");
	private final JButton btnTest3 = new JButton("Test3");
	private final JButton btnTest4 = new JButton("Test4");
	private final JButton btnBackToAntenna = new JButton("Back to Antenna Options");
	private final JLabel lblPleaseChooseA = new JLabel("Please choose a test type");

	/**
	 * Create the panel.
	 */
	public TestPanel() {

		initGUI();
	}
	private void initGUI() {
		setBackground(new Color(51, 204, 255));
		setLayout(null);
		btnTest1.setBounds(100, 100, 117, 29);
		
		add(btnTest1);
		btnTest2.setBounds(223, 100, 117, 29);
		
		add(btnTest2);
		btnTest3.setBounds(100, 166, 117, 29);
		
		add(btnTest3);
		btnTest4.setBounds(223, 166, 117, 29);
		
		add(btnTest4);
		btnBackToAntenna.setBounds(12, 13, 171, 25);
		
		add(btnBackToAntenna);
		lblPleaseChooseA.setBounds(149, 71, 164, 16);
		
		add(lblPleaseChooseA);
	}

}
