<%@ page language="java" contentType="text/html;charset=utf-8" 
	import="org.springframework.context.ApplicationContext,org.springframework.context.support.ClassPathXmlApplicationContext,cn.edn.yan.service.SectionService,java.util.*,cn.edn.yan.domain.Section"%>
<%
	
    out.println("<select>"); // select 标签开始
    //*********************//
    // 
    //数据库连接代码
    //String para = request.getParameter("id");
    //String sql = "select id,name from table list where class_id = "+para ;
    // 运行sql
    //ResultSet rs = null;
    //StringBuffer sb = new StringBuffer();
    //while(rs.next()){
    //    sb.append("<op value=\""+rs.getString("id")+"\" text=\""+rs.getString("id")+"\"/>");
    //}
    
    //out.print(sb.toString());
    
    //*************************//
    // 由于没有连接数据库，下面直接用结果测试
    ApplicationContext context=new ClassPathXmlApplicationContext("applicationContext.xml");
	SectionService sectionService=(SectionService)context.getBean("sectionService");
    String id = request.getParameter("id");
    int moduleid=Integer.parseInt(id);
	List<Section> sections=sectionService.findByModuleid(moduleid);
     for(Section section:sections){
    	System.out.println("sectionid============"+section);
   	 	out.print("<option value=\""+section.getId()+"\" text=\""+section.getName()+"\"/>");
    }
    out.println("</select>"); // select 标签结束
    
    //**********************
    //实际上应该输出的xml文件应该是
    //<?xml version="1.0" encoding="GBK" ?>
    //<select>
    //    <L1 Value="1" Text="123"/>
    //    <L1 Value="2" Text="234"/>
    //</select>
    //************************
%>