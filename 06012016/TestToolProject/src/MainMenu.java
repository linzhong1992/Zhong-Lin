import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;

import org.jfree.ui.RefineryUtilities;

import javax.swing.JButton;
import java.awt.event.ActionListener;
import java.io.IOException;
import java.awt.event.ActionEvent;
import javax.swing.JMenuBar;
import javax.swing.JMenu;
import javax.swing.JMenuItem;
import javax.swing.JLabel;
import java.awt.CardLayout;

public class MainMenu extends JFrame {

	private JPanel contentPane;
	private final JMenuBar menuBar = new JMenuBar();
	private final JMenu mnFile = new JMenu("File");
	private final JMenuItem mntmExit = new JMenuItem("Exit");
	private final JPanel chipPanel = new JPanel();
	private final JButton btnChip1 = new JButton("Chip 1");
	private final JLabel lblChip = new JLabel("Please choose a chip type");
	private final JButton btnChip2 = new JButton("Chip 2");
	private final JButton btnChip3 = new JButton("Chip 3");
	private final JPanel antennaPanel = new JPanel();
	private final JButton btnBkAntenna = new JButton("Back to Chip Options");
	private final JButton btnAntenna1 = new JButton("Antenna 1");
	private final JButton btnAntenna2 = new JButton("Antenna 2");
	private final JLabel lblAntenna = new JLabel("Please choose a antenna type");
	private final JButton btnAntenna3 = new JButton("Antenna 3");
	private final JButton btnAntenna4 = new JButton("Antenna 4");
	private final JPanel testPanel = new JPanel();
	private final JButton btnBkTest = new JButton("Back to Antenna Options");
	private final JLabel lblTest = new JLabel("Please choose a test type");
	private final JButton btnTest1 = new JButton("Test 1");
	private final JButton btnTest2 = new JButton("Test 2");
	private final JButton btnTest3 = new JButton("Test3");
	private final JButton btnTest4 = new JButton("Test4");

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					MainMenu frame = new MainMenu();
					frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the frame.
	 */
	public MainMenu() {
		initGUI();
		//initialize the default visible panel as chipPanel
		chipPanel.setVisible(true);
		antennaPanel.setVisible(false);
		testPanel.setVisible(false);
	}
	private void initGUI() {
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 555, 447);
		
		//set up menu bar
		setJMenuBar(menuBar);
		
		menuBar.add(mnFile);
		mntmExit.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				System.exit(0);
			}
		});
		
		mnFile.add(mntmExit);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		
		contentPane.setLayout(new CardLayout(0, 0));
		
		//add chipPanel
		contentPane.add(chipPanel, "name_15662164716940");
		chipPanel.setLayout(null);
		btnChip1.setBounds(145, 130, 117, 29);
		
		chipPanel.add(btnChip1);
		btnChip1.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				chipPanel.setVisible(false);
				antennaPanel.setVisible(true);
				testPanel.setVisible(false);
			}
		});
		lblChip.setBounds(182, 101, 163, 16);
		
		chipPanel.add(lblChip);
		btnChip2.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				chipPanel.setVisible(false);
				antennaPanel.setVisible(true);
				testPanel.setVisible(false);
			}
		});
		btnChip2.setBounds(268, 130, 117, 29);
		
		chipPanel.add(btnChip2);
		btnChip3.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				chipPanel.setVisible(false);
				antennaPanel.setVisible(true);
				testPanel.setVisible(false);
			}
		});
		btnChip3.setBounds(145, 195, 117, 29);
		
		chipPanel.add(btnChip3);
		
		//add antennaPanel
		contentPane.add(antennaPanel, "name_15751531564952");
		antennaPanel.setLayout(null);
		btnBkAntenna.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				chipPanel.setVisible(true);
				antennaPanel.setVisible(false);
				testPanel.setVisible(false);
			}
		});
		btnBkAntenna.setBounds(12, 13, 171, 25);
		
		antennaPanel.add(btnBkAntenna);
		btnAntenna1.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				chipPanel.setVisible(false);
				antennaPanel.setVisible(false);
				testPanel.setVisible(true);
			}
		});
		btnAntenna1.setBounds(145, 130, 117, 29);
		
		antennaPanel.add(btnAntenna1);
		btnAntenna2.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				chipPanel.setVisible(false);
				antennaPanel.setVisible(false);
				testPanel.setVisible(true);
			}
		});
		btnAntenna2.setBounds(268, 130, 117, 29);
		
		antennaPanel.add(btnAntenna2);
		lblAntenna.setBounds(170, 101, 187, 16);
		
		antennaPanel.add(lblAntenna);
		btnAntenna3.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				chipPanel.setVisible(false);
				antennaPanel.setVisible(false);
				testPanel.setVisible(true);
			}
		});
		btnAntenna3.setBounds(145, 195, 117, 29);
		
		antennaPanel.add(btnAntenna3);
		btnAntenna4.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				chipPanel.setVisible(false);
				antennaPanel.setVisible(false);
				testPanel.setVisible(true);
			}
		});
		btnAntenna4.setBounds(268, 195, 117, 29);
		
		antennaPanel.add(btnAntenna4);
		
		//add testPanel
		contentPane.add(testPanel, "name_15813866102218");
		testPanel.setLayout(null);
		btnBkTest.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				chipPanel.setVisible(false);
				antennaPanel.setVisible(true);
				testPanel.setVisible(false);
			}
		});
		btnBkTest.setBounds(12, 13, 188, 25);
		
		testPanel.add(btnBkTest);
		lblTest.setBounds(181, 101, 164, 16);
		
		testPanel.add(lblTest);
		btnTest1.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				LineChart chart;
				try {
					chart = new LineChart("Lets do a test", "TEST", "Test1.xlsx");
					chart.pack( );
		            RefineryUtilities.centerFrameOnScreen( chart );
		            chart.setVisible( true );
				} catch (IOException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}     
			}
		});
		btnTest1.setBounds(145, 130, 117, 29);
		
		testPanel.add(btnTest1);
		btnTest2.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				LineChart chart;
				try {
					chart = new LineChart("Lets do a test", "TEST", "Test1.xlsx");
					chart.pack( );
		            RefineryUtilities.centerFrameOnScreen( chart );
		            chart.setVisible( true );
		            chart.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
				} catch (IOException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				} 
			}
		});
		btnTest2.setBounds(268, 130, 117, 29);
		
		testPanel.add(btnTest2);
		btnTest3.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				LineChart chart;
				try {
					chart = new LineChart("Lets do a test", "TEST", "Test1.xlsx");
					chart.pack( );
		            RefineryUtilities.centerFrameOnScreen( chart );
		            chart.setVisible( true );
				} catch (IOException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				} 
			}
		});
		btnTest3.setBounds(145, 196, 117, 29);
		
		testPanel.add(btnTest3);
		btnTest4.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				LineChart chart;
				try {
					chart = new LineChart("Lets do a test", "TEST", "Test1.xlsx");
					chart.pack( );
		            RefineryUtilities.centerFrameOnScreen( chart );
		            chart.setVisible( true );
				} catch (IOException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				} 
			}
		});
		btnTest4.setBounds(268, 196, 117, 29);
		
		testPanel.add(btnTest4);
	}
}
