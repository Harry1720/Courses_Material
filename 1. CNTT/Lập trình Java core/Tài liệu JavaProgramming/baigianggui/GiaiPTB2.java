package baigianggui;

import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JButton;
import java.awt.BorderLayout;
import javax.swing.JLabel;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import javax.swing.JTextField;

import com.sun.javafx.scene.layout.region.Margins.Converter;

public class GiaiPTB2 {

	private JFrame frame;
	private JTextField txtA;
	private JTextField txtB;
	private JTextField txtC;
	JLabel lblKQ;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					GiaiPTB2 window = new GiaiPTB2();
					window.frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the application.
	 */
	public GiaiPTB2() {
		initialize();
	}

	/**
	 * Initialize the contents of the frame.
	 */
	private void initialize() {
		frame = new JFrame();
		frame.setBounds(91, -39, 340, 233);
		frame.setTitle("Giải phương trình bậc 2");
		frame.setExtendedState(JFrame.MAXIMIZED_BOTH); 
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.getContentPane().setLayout(null);

		JLabel lblHSA = new JLabel("Hệ số a:");
		lblHSA.setBounds(378, 164, 70, 14);
		frame.getContentPane().add(lblHSA);

		JLabel lblHeejSB = new JLabel("Hệ số b:");
		lblHeejSB.setBounds(378, 189, 70, 14);
		frame.getContentPane().add(lblHeejSB);

		JLabel lblHeejSC = new JLabel("Hệ số c:");
		lblHeejSC.setBounds(378, 215, 70, 14);
		frame.getContentPane().add(lblHeejSC);

		txtA = new JTextField();
		txtA.setBounds(502, 161, 151, 20);
		frame.getContentPane().add(txtA);
		txtA.setColumns(10);

		txtB = new JTextField();
		txtB.setColumns(10);
		txtB.setBounds(502, 186, 151, 20);
		frame.getContentPane().add(txtB);

		txtC = new JTextField();
		txtC.setColumns(10);
		txtC.setBounds(502, 212, 151, 20);
		frame.getContentPane().add(txtC);

		JButton btnNewButton = new JButton("Giải");
		btnNewButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				double a = Double.parseDouble(txtA.getText());
				double b = Double.parseDouble(txtB.getText());
				double c = Double.parseDouble(txtC.getText());
				PTB2 pt = new PTB2();
				pt.setA(a);
				pt.setB(b);
				pt.setC(c);
				Nghiem n = pt.giai();
				if (n == null)
					lblKQ.setText("vô nghiệm");
				else
					lblKQ.setText("nghiệm: " + n.toString());
			}
		});
		btnNewButton.setBounds(488, 298, 89, 23);
		frame.getContentPane().add(btnNewButton);
		lblKQ = new JLabel("asdfasdf");
		lblKQ.setBounds(378, 259, 210, 14);
		frame.getContentPane().add(lblKQ);
	}
}
