package com.cvicse.work;

import java.awt.BorderLayout;
import java.awt.FlowLayout;
import java.awt.Font;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.swing.JButton;
import javax.swing.JDialog;
import javax.swing.JFileChooser;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JMenu;
import javax.swing.JMenuBar;
import javax.swing.JMenuItem;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;

import com.cvicse.bo.CodeLookUp;
/**
 * 
 * @author ma_xbin
 *
 */
public class CodeLookView implements ActionListener{
	
	private JFrame jf=new JFrame("�����߲���ܹ���V1.0");
	public static JTextArea jta=new JTextArea(20,40);
	JFileChooser chooser =new JFileChooser();
	JTextField jtf1 = new JTextField(20);
	File f;
	private JDialog jd;
	public CodeLookView(){
		JMenuBar jmb=new JMenuBar();
		String[] s1={"�ļ�","����"};
		String[][] s2={{"��","����","","�˳�"},
						{"���ڹ���"}};
		JMenu[] jm=new JMenu[s1.length];
		for(int i=0;i<jm.length;i++){
			jm[i]=new JMenu(s1[i]);
			jmb.add(jm[i]);
			for(int j=0;j<s2[i].length;j++){
				if("".equals(s2[i][j])){
					jm[i].addSeparator();
				}else {
					JMenuItem jmi=new JMenuItem(s2[i][j]);
					jm[i].add(jmi);
					jmi.addActionListener(this);
				}
			}
		}
		jf.setJMenuBar(jmb);
		
		
		JLabel jl1 = new JLabel("choose folder   �� ");
		jtf1.addActionListener(this);
		
		JButton open=new JButton(" open ");
		open.addActionListener(this);
		
		JButton run =new JButton(" run ");
		run.addActionListener(this);
		
		JButton help =new JButton("help");
		help.addActionListener(this);
		
		String choosertitle="ѡ���ļ���";
		chooser.setCurrentDirectory(new java.io.File("C:/"));
		chooser.setDialogTitle(choosertitle);
		chooser.setFileSelectionMode(JFileChooser.DIRECTORIES_ONLY);
		chooser.setAcceptAllFileFilterUsed(false);
		
		JPanel jp1=new JPanel();
		jp1.setLayout(new FlowLayout());
		jf.add(jp1,BorderLayout.NORTH);
		jp1.add(jl1);
		jp1.add(jtf1);
		jp1.add(open);
		jp1.add(run);
		jp1.add(help);
		jta.setText("ע�⣺      1�����ܺõ�������ȥC�̸�Ŀ¼���ң� 2����һ�߲�ʱ��ע�������Ƿ���ȷ��\n ");
		
		jf.add(new JScrollPane(jta));
		jf.setSize(600,450);
//		jf.pack();
		jf.setLocation(250, 200);
		jf.setVisible(true);
		jf.setIconImage(jf.getToolkit().getImage(this.getClass().getResource("icon/icon_paint.png")));
		jf.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		jf.setResizable(false);
	}
	public static void main(String[] args) {
		new CodeLookView();
	}

	public void actionPerformed(ActionEvent ae){
    	String comm = ae.getActionCommand();
    	System.out.println(comm);
    	CodeLookView.jta.setText(CodeLookView.jta.getText()+"������"+comm+"\n");
    	if("open".equals(ae.getActionCommand().trim())||"��".equals(ae.getActionCommand().trim())){
    		if (chooser.showOpenDialog(null) == JFileChooser.APPROVE_OPTION){
    			f=chooser.getSelectedFile();
    			String path=f.toString();
    			jtf1.setText(path);
    		}
    	}
    	if("run".equals(ae.getActionCommand().trim())){
    		String path=jtf1.getText().trim();
			if(!"".equals(path)){
				File file=new File(path);
				if(file.exists()){
					List<CodeLookUp> codeLookUpList=ExcelCreateUtil.readExcel(path);
					Date date = new Date();
					SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM");
					SimpleDateFormat sf = new SimpleDateFormat("dd");
					int day = Integer.parseInt(sf.format(date)) - 1;
					String createDate = simpleDateFormat.format(date) + "-" + day;
					ExcelCreateUtil.writeExcel("c:/�����߲����"+createDate+".xls", codeLookUpList);
				}else{
	    			CodeLookView.jta.setText("���ļ��в����ڣ�����\n");
	    		}
			}else{
				jta.setText("���ļ��У�����\n");
				System.out.println("���ļ��У�����");
			}
		}
    	if("�˳�".equals(ae.getActionCommand())){
			System.exit(0);
    	} 
    	if("���ڹ���".equals(ae.getActionCommand())||"help".equals(ae.getActionCommand())){
    		jd=new JDialog(jf,"˵��");
    		jd.setVisible(true);
    		jd.setLayout(new GridLayout(3,1));
    		JPanel jp1=new JPanel();
    		JPanel jp2=new JPanel();
    		JPanel jp3=new JPanel();
    		JLabel jl1=new JLabel("�������޹���������");
			Font font=new Font("Dialog",Font.BOLD+Font.ITALIC,18);
			jl1.setFont(font);
			jp1.add(jl1);
    		jd.add(jp1);
    		JLabel jl2=new JLabel(" ���ߣ���С��      ��;������ר�ã�");
    		jp2.add(jl2);
    		jd.add(jp2);
    		JLabel jl3=new JLabel("2010��11��06");
    		jp3.add(jl3);
    		jd.add(jp3);
    		jd.setLocation(380, 350);
    		jd.setSize(300,150);
    	} 
	}
}
