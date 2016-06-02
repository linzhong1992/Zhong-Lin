import javax.swing.JPanel;
import javax.swing.JButton;
import java.awt.Color;
import javax.swing.JLabel;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;

public class ChipPanel extends JPanel {

	/**
	 * Create the panel.
	 */
	public ChipPanel() {

		initGUI();
	}
	private void initGUI() {
		setBackground(new Color(51, 204, 153));
		setLayout(null);
		
		JLabel lblPleaseChooseA = new JLabel("Please choose a chip type");
		lblPleaseChooseA.setBounds(151, 71, 163, 16);
		add(lblPleaseChooseA);
		
		JButton btnChip1 = new JButton("Chip 1");
		btnChip1.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				AntennaPanel antennaPanel = new AntennaPanel();
				
			}
		});
		btnChip1.setBounds(100, 100, 117, 29);
		add(btnChip1);
		
		JButton btnChip2 = new JButton("Chip 2");
		btnChip2.setBounds(223, 100, 117, 29);
		add(btnChip2);
		
		JButton btnChip3 = new JButton("Chip 3");
		btnChip3.setBounds(100, 165, 117, 29);
		add(btnChip3);
	}
}
