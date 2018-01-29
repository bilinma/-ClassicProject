<%@page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<title>无标题文档</title>
		<link rel="stylesheet" href="css/top.css" type="text/css">
		<script language="JavaScript" type="text/JavaScript">
			function MM_findObj(n, d) { //v4.01
			  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
			    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
			  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
			  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
			  if(!x && d.getElementById) x=d.getElementById(n); return x;
			}
			
			function MM_showHideLayers() { //v6.0
			  var i,p,v,obj,args=MM_showHideLayers.arguments;
			  for (i=0; i<(args.length-2); i+=3) if ((obj=MM_findObj(args[i]))!=null) { v=args[i+2];
			    if (obj.style) { obj=obj.style; v=(v=='show')?'visible':(v=='hide')?'hidden':v; }
			    obj.visibility=v; }
			}
			function returnProject(){
				parent.leftFrame.location="jsp/system/public/changewin3.jsp";
				parent.Main.location="projectItemQueryAction.do?method=doInitQuery";
			}
			function about(){
					var src = "about.html";
					window.showModalDialog("about.html","","dialogWidth:470px;dialogHeight:250px;");
			}
		</script>
		<style type="text/css">
<!--
body {
	background-image: url(image/top_bj.jpg);
}
-->
</style>
	</head>
	<body topMargin=0 leftmargin="0">
		<table width="100%" height="100" border="0" cellpadding="0"
			cellspacing="0">
			<tr>
				<td align="right" valign="bottom" class="bg_logo">
					<table width="100%" height="100" border="0" cellpadding="0"
						cellspacing="0">
						<tr>
							<td align="right" style="padding: 0px 10px 8px 0px;">
								<table height="20" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td>
											<a href="#" onclick="about()"><img src="image/top2.gif"
													width="16" height="16" border="0"
													style="margin-right: 4px;" align="absmiddle">关于&nbsp;&nbsp;</a>
										</td>
										<td>
											<a href="#" onclick="parent.location='main.jsp'"><img
													src="image/icon_top01.gif" width="16" height="16"
													border="0" style="margin-right: 4px;" align="absmiddle">回到首页&nbsp;&nbsp;</a>
										</td>
										<td>
											<a target="_blank"
												onclick="parent.opener=null;parent.close();"
												href="../login.jsp"><img src="image/icon_top02.gif"
													width="16" height="16" border="0"
													style="margin-right: 4px; margin-left: 5px;"
													align="absmiddle">注销&nbsp;&nbsp;</a>
										</td>
										<td>
											<a onclick="parent.parent.opener=null;parent.parent.close();"
												href="#"><img src="image/icon_top03.gif" width="17"
													height="16" border="0"
													style="margin-right: 4px; margin-left: 5px;"
													align="absmiddle">退出</a>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td align="right" style="padding: 0px 10px 0px 0px;">
								<table border="0" cellpadding="0" cellspacing="0">
								<!--	<tr>
										<td class="STYLE1" align="left">
											<h2 >信用担保网站后台管理系统</h2>
										</td>
										<td width="65%" class="STYLE2" id="inName">
										</td>
									</tr>
								  <tr>
										<td class="STYLE1">
											开始时间：
										</td>
										<td class="STYLE2" id="startTime">
										</td>
									</tr>
									<tr>
										<td class="STYLE1">
											结束时间：
										</td>
										<td class="STYLE2" id="endTime">
										</td>
									</tr>-->
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</body>
</html>
