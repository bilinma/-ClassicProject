package cn.edn.yan.util;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.util.Random;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;


public class ImageAction extends ActionSupport {
	
//	public String execute() {
//		try {
//			HttpServletRequest request = ServletActionContext.getRequest();//得到request
//			HttpServletResponse response = ServletActionContext.getResponse();//得到response
//			
//			 response.setContentType("image/jpeg");
//				// 设置图片大小，指的是内存中图片的大小
//				//构造中第一个参数是长 第二 个是宽第三个参数是将要应用的色彩格式
//				//通常情况下用的是三原色的色彩格式
//				BufferedImage image = new BufferedImage(80, 40,
//						BufferedImage.TYPE_INT_RGB);
//				//获得一个随即数对象
//				Random random = new Random();
//				//获得画笔
//				Graphics g = image.getGraphics();
//				Graphics2D g2 = (Graphics2D) g;
//				// 画背景，先给画笔填充颜色
//				g2.setColor(Color.WHITE);
//				//在规定区域内填充颜色
//				g2.fillRect(0, 0, 80, 40);
//				
//				// 随机画线
//				for (int i = 0; i < 10; i++) {
//					//y1和y2是0到39中任意一个整数
//					int y1 = random.nextInt(40);
//					int y2 = random.nextInt(40);
//					g2.setColor(getColor());
//					//划线
//					g2.drawLine(0, y1, 80, y2);
//				}
//				// 产生随机的字母与数字
//				char[] c = new char[36];
//				//产生数字
//				for (int i = 48; i < 58; i++) {
//					c[i - 48] = (char) i;
//				}
//				//产生字母
//				for (int i = 65; i < 91; i++) {
//					c[i - 55] = (char) i;
//				}
//				String str = "";
//				//设置字体的格式
//				g2.setFont(new Font("Sans", Font.BOLD, 20));
//				for (int i = 0; i < 4; i++) {
//					int k = random.nextInt(36);
//					g2.setColor(getColor());
//					//向内存中画字符是通过drawString();
//					g2.drawString(String.valueOf(c[k]), 8 + i * 20, 25);
//					str += c[k];
//				}
//				// 保存产生的字母数字组合
//				request.getSession().setAttribute("number",str);
//				System.out.println("验证码："+str);
//				// 以JPEG格式压缩并输出
//				//将内存中的图片区域压缩成JPEG格式。并且获得流
//				JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(response
//						.getOutputStream());
//				//将压缩好的图片发送到请求的地方
//				encoder.encode(image);
//			}catch(Exception e){
//				e.printStackTrace();
//			}
//			return null;
//	}
//	/**
//	* 随机获取一种RGB颜色
//	* 
//	* @return
//	*/
//	private Color getColor() {
//		Random random = new Random();
//		int r = random.nextInt(255);
//		int gr = random.nextInt(255);
//		int b = random.nextInt(255);
//		return new Color(r, gr, b);
//	}
	
	public String execute() {
		try {
				HttpServletRequest request = ServletActionContext.getRequest();
				HttpServletResponse response = ServletActionContext.getResponse();
				response.setContentType("image/jpeg");
			    //产生随机数，绘制成图像 输出图像
			    Random r=new Random();
			    String scode="";
			    for(int i=0;i<4;i++){
			        scode=scode+r.nextInt(10)+"";
			    }
			    //产生缓冲图像
			    BufferedImage imgbuf=new BufferedImage(60,20,BufferedImage.TYPE_INT_BGR);
			    //取得缓冲的绘制环境
			    Graphics2D g=imgbuf.createGraphics();
			    //开始绘制
			    g.setColor(Color.white);
			    g.fillRect(0, 0, 60, 20);//填充指定颜色
			    g.setColor(Color.blue);
			    g.setFont(new Font("宋体",Font.BOLD,18));
			    g.drawString(scode,3,18);
				// 保存产生的字母数字组合
				request.getSession().setAttribute("number",scode);
				System.out.println("验证码："+scode);
			    //转码
			    ServletOutputStream out=response.getOutputStream();
			    //将内存中的图片区域压缩成JPEG格式。并且获得流
			    JPEGImageEncoder encoder =JPEGCodec.createJPEGEncoder(out);
			    encoder.encode(imgbuf);
			    out.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

}
