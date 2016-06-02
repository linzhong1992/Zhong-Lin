import javax.swing.JPanel;
import javax.swing.JButton;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import java.awt.Color;
import javax.swing.JLabel;

public class AntennaPanel extends JPanel {
	private final JButton btnAntenna1 = new JButton("Antenna 1");
	private final JButton btnAntenna2 = new JButton("Antenna 2");
	private final JButton btnAntenna3 = new JButton("Antenna 3");
	private final JButton btnAntenna4 = new JButton("Antenna 4");
	private final JButton button = new JButton("Back to Chip Options");
	private final JLabel lblPleaseChooseA = new JLabel("Please choose a antenna type");

	/**
	 * Create the panel.
	 */
	public AntennaPanel() {

		initGUI();
	}
	private void initGUI() {
		setBackground(new Color(51, 204, 204));
		setLayout(null);
		btnAntenna1.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
			}
		});
		btnAntenna1.setBounds(223, 100, 117, 29);
		
		add(btnAntenna1);
		btnAntenna2.setBounds(100, 100, 117, 29);
		
		add(btnAntenna2);
		btnAntenna3.setBounds(223, 165, 117, 29);
		
		add(btnAntenna3);
		btnAntenna4.setBounds(100, 165, 117, 29);
		
		add(btnAntenna4);
		button.setBounds(12, 13, 171, 25);
		
		add(button);
		lblPleaseChooseA.setBounds(139, 71, 187, 16);
		
		add(lblPleaseChooseA);
	}

}
