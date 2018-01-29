<%@page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<!-- saved from url=(0043)http://sxydb.yanan.gov.cn/ShowAff.asp?id=84 -->
<!--Include File="inc/Check_Sql.asp"-->
<!--include file="inc/conn.asp"-->
<HTML>
	<HEAD>
		<TITLE>延安信用担保网</TITLE>
		<STYLE type=text/css>
A {
	TEXT-DECORATION: none
}

A:link {
	COLOR: #000000
}

A:visited {
	COLOR: #000000
}

A:active {
	COLOR: #000000
}

A:hover {
	RIGHT: 0px;
	COLOR: #ff6600;
	POSITION: relative;
	TOP: 1px
}

BODY {
	FONT-SIZE: 9pt
}

TD {
	FONT-SIZE: 9pt;
	COLOR: #000000;
	LINE-HEIGHT: 150%;
	FONT-FAMILY: 宋体
}

INPUT {
	BORDER-RIGHT: #b2c2d7 1px solid;
	BORDER-TOP: #b2c2d7 1px solid;
	FONT-SIZE: 9pt;
	BORDER-LEFT: #b2c2d7 1px solid;
	COLOR: #205064;
	BORDER-BOTTOM: #b2c2d7 1px solid
}

BUTTON {
	FONT-SIZE: 9pt;
	HEIGHT: 20px
}

SELECT {
	FONT-SIZE: 9pt;
	HEIGHT: 20px
}

.border {
	BORDER-RIGHT: #a1a6ce 1px solid;
	BORDER-TOP: #a1a6ce 1px solid;
	BORDER-LEFT: #a1a6ce 1px solid;
	BORDER-BOTTOM: #a1a6ce 1px solid
}

.border2 {
	BORDER-RIGHT: #ffffff 1px solid;
	BORDER-TOP: #ffffff 1px solid;
	BORDER-LEFT: #ffffff 1px solid;
	BORDER-BOTTOM: #ffffff 1px solid
}

.FootBg {
	BACKGROUND: #eaeaea
}

.title {
	BACKGROUND: url(Skin/11/m-bg1-2.gif);
	HEIGHT: 31px
}

.tdbg {
	BACKGROUND: #f0f0f0
}

.txt_css {
	
}

.title_lefttxt {
	
}

.title_left {
	BACKGROUND: url(Skin/11/leftbg.gif);
	HEIGHT: 34px
}

.tdbg_left {
	BORDER-RIGHT: #a1a6ce 1px solid;
	BORDER-TOP: #a1a6ce 1px solid;
	BORDER-LEFT: #a1a6ce 1px solid;
	BORDER-BOTTOM: #a1a6ce 1px solid
}

.title_left2 {
	
}

.tdbg_left2 {
	
}

.tdbg_leftall {
	BORDER-RIGHT: #b2c2d7 1px solid;
	BACKGROUND: #fefaf1
}

.title_righttxt {
	
}

.title_right {
	BACKGROUND: url(skin/11/new_bg.gif);
	HEIGHT: 32px
}

.tdbg_right {
	
}

.title_right2 {
	
}

.tdbg_right2 {
	
}

.tdbg_rightall {
	
}

.tt_tj {
	DISPLAY: inline;
	FLOAT: right;
	WIDTH: 350px;
	MARGIN-RIGHT: 6px
}

.tiaotiao {
	BORDER-RIGHT: #fabfa3 1px solid;
	BORDER-TOP: #fabfa3 1px solid;
	FONT-WEIGHT: bold;
	FONT-SIZE: 25px;
	BACKGROUND: url(Images/toutiao_bg.gif);
	VERTICAL-ALIGN: middle;
	BORDER-LEFT: #fabfa3 1px solid;
	WIDTH: 100%;
	COLOR: #ff0000;
	LINE-HEIGHT: 53px;
	BORDER-BOTTOM: #fabfa3 1px solid;
	HEIGHT: 53px;
	TEXT-ALIGN: center
}

.tiaotiao A:link {
	COLOR: #f00;
	TEXT-DECORATION: none
}

.tiaotiao A:visited {
	COLOR: #f00;
	TEXT-DECORATION: none
}

.tiaotiao A:hover {
	BACKGROUND: #f7f7f7;
	COLOR: #cd1111;
	TEXT-DECORATION: none
}

.title_kai {
	PADDING-RIGHT: 10px;
	BACKGROUND-POSITION: 50% top;
	PADDING-LEFT: 10px;
	FONT-WEIGHT: bold;
	FONT-SIZE: 25px;
	BACKGROUND-IMAGE: url(images/tit_bg.gif);
	PADDING-BOTTOM: 10px;
	VERTICAL-ALIGN: middle;
	WIDTH: 100%;
	COLOR: #000099;
	LINE-HEIGHT: 30px;
	PADDING-TOP: 10px;
	BACKGROUND-REPEAT: repeat-x;
	FONT-FAMILY: "楷体_GB2312";
	HEIGHT: 53px;
	TEXT-ALIGN: center
}

.daohang_link {
	FONT-WEIGHT: bold;
	FONT-SIZE: 12px;
	COLOR: #003399;
	BACKGROUND-REPEAT: repeat-x
}

.daohang_link:link {
	FONT-WEIGHT: bold;
	FONT-SIZE: 12px;
	COLOR: #336666;
	TEXT-DECORATION: none
}

.daohang_link:visited {
	FONT-WEIGHT: bolder;
	FONT-SIZE: 12px;
	COLOR: #336666;
	TEXT-DECORATION: none
}

.daohang_link:hover {
	FONT-WEIGHT: bolder;
	FONT-SIZE: 12px;
	COLOR: #336666;
	TEXT-DECORATION: underline
}

.daohang_link_left {
	FONT-WEIGHT: bold;
	FONT-SIZE: 14px;
	COLOR: #ffffff;
	LINE-HEIGHT: 35px;
	BACKGROUND-REPEAT: repeat-x;
	HEIGHT: 35px
}

.daohang_link_left:link {
	FONT-WEIGHT: bold;
	FONT-SIZE: 14px;
	COLOR: #ffffff;
	TEXT-DECORATION: none
}

.daohang_link_left:visited {
	FONT-WEIGHT: bold;
	FONT-SIZE: 14px;
	COLOR: #ffffff;
	TEXT-DECORATION: none
}

.daohang_link_left:hover {
	FONT-WEIGHT: bold;
	FONT-SIZE: 14px;
	COLOR: #ffffff;
	TEXT-DECORATION: underline
}

.daohang_nonce {
	FONT-WEIGHT: bold;
	FONT-SIZE: 12px;
	COLOR: #ff9900;
	BACKGROUND-REPEAT: repeat-x
}
</STYLE>
		<!-- include file="inc/config.asp" -->
		<!--include file="inc/Function.asp"-->
		<SCRIPT language=JavaScript1.2 src="${pageContext.request.contextPath}/images/Southidcmenu.js"
			type=text/javascript></SCRIPT>

		<STYLE type=text/css>
.STYLE1 {
	COLOR: #ffffff
}

.STYLE3 {
	COLOR: #000033
}

BODY {
	BACKGROUND-IMAGE: url(Images/bg.jpg)
}
</STYLE>

		<META http-equiv=Content-Type content="text/html; charset=utf-8">
		<META
			content=信用担保网,延安信用担保网,延安市中小企业信用担保有限责任公司，延安信用担保，延安信用担保公司，中小企业信用担保公司
			name=keywords>
		<META content="MSHTML 6.00.2900.3676" name=GENERATOR>
	</HEAD>
	<BODY leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">
		<STYLE type=text/css>
.menu_txt {
	FONT-WEIGHT: bold;
	FONT-SIZE: 14px;
	FILTER: glow(color = #015DA5, strength = 1);
	COLOR: #ffffff;
	TEXT-DECORATION: none
}
</STYLE>

		<DIV align=center>
			<!--第一行表格开始-->
			<TABLE cellSpacing=0 cellPadding=0 width=992 align=center border=0>
				<TBODY>
					<TR>
						<!--第一个单元格-->
						<TD width=300 background=${pageContext.request.contextPath}/images/foot-bg1.gif height=33>
							<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
								<TBODY>
									<TR>
										<TD width=30>
											&nbsp;
										</TD>
										<TD vAlign=center width=20 height=33>
											<IMG src="${pageContext.request.contextPath}/images/admin_home.gif">
										</TD>
										<TD vAlign=center align=left width=72>
											<A
												onclick="window.external.addFavorite('sxydb.yanan.gov.cn','延安信用担保网')"
												href="${pageContext.request.contextPath}/jsp/main.action"><SPAN
												class=STYLE1>收藏本站</SPAN>
											</A>
										</TD>
										<TD width=20>
											<IMG src="${pageContext.request.contextPath}/images/email1.gif">
										</TD>
										<TD width=157>
											<A href="${pageContext.request.contextPath}/jsp/aboutus/relationUs.action?sname=联系我们"><SPAN
												class=STYLE1>联系我们</SPAN>
											</A>
										</TD>
									</TR>
								</TBODY>
							</TABLE>
						</TD>
						<!--第二个单元格开始-->
						<TD background=${pageContext.request.contextPath}/images/foot-bg1.gif>
							<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
								<TBODY>
									<TR>
										<TD align=right height=33></TD>
									</TR>
								</TBODY>
							</TABLE>
						</TD>
						<!--第二个单元格结束-->
					</TR>
				</TBODY>
			</TABLE>
			<!--顶部第一个表格结束-->
			<!--顶部第二个表格开始 flash图992*180-->
			<TABLE cellSpacing=0 cellPadding=0 width=992 align=center border=0>
				<TBODY>
					<TR>
						<!--一个单元格-->
						<TD height=180>
							<OBJECT
								codeBase=http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0
								height=179 width=992
								classid=clsid:D27CDB6E-AE6D-11cf-96B8-444553540000>
								<PARAM NAME="movie" VALUE="${pageContext.request.contextPath}/images/top.swf">
								<PARAM NAME="quality" VALUE="high">
								<embed src="${pageContext.request.contextPath}/images/top.swf" quality="high"
									pluginspage="http://www.macromedia.com/go/getflashplayer"
									type="application/x-shockwave-flash" width="992" height="179"></embed>
							</OBJECT>
						</TD>
					</TR>
					<DIV style="LEFT: -999px; POSITION: absolute; TOP: -999px">
						<A href="http://www.infowowgold.com/power-leveling/">wow power
							leveling</A>
					</DIV>
				</TBODY>
			</TABLE>
			<!--顶部第二个表格结束-->
			<!--顶部第三个表格开始 显示日期 菜单-->
			<TABLE cellSpacing=0 cellPadding=0 width=992 align=center border=0>
				<TBODY>
					<TR>
						<TD width=10 background=${pageContext.request.contextPath}/images/gov_wMcms_09.gif>
							&nbsp;
						</TD>
						<TD vAlign=center width=192
							background=${pageContext.request.contextPath}/images/gov_wMcms_09.gif height=27>
							<SCRIPT language=JavaScript>
						today=new Date();
						function initArray(){
						this.length=initArray.arguments.length
						for(var i=0;i<this.length;i++)
						this[i+1]=initArray.arguments[i]  }
						var d=new initArray(
						" 星期日",
						" 星期一",
						" 星期二",
						" 星期三",
						" 星期四",
						" 星期五",
						" 星期六");
						document.write(
						"<font color=#FF0000 style='font-size:11px;font-family: verdana'> ",
						today.getYear(),"年",
						today.getMonth()+1,"月",
						today.getDate(),"日",
						d[today.getDay()+1],
						"</font>" ); 
						</SCRIPT>
						</TD>
						<TD vAlign=bottom width=800
							background=${pageContext.request.contextPath}/images/gov_wMcms_09.gif height=27>
							<a href="<%=request.getContextPath() %>/jsp/main.action">网站首页</a><span class="STYLE4"> | </span>
							<c:forEach var="module" items="${XYDB_MODULES}">
								<a
									href="<%=request.getContextPath() %>/jsp/${module.url }?mname=${module.name }&moduleid=${module.id }">${module.name
									}</a>
								<span class="STYLE4"> | </span>
							</c:forEach>
						</TD>
					</TR>
				</TBODY>
			</TABLE>
		</DIV>
		<!--顶部第三个表格结束 -->
		<STYLE type=text/css>
		.tit {
			FONT-SIZE: 14px
		}
		
		.black {
			FONT-SIZE: 14px;
			COLOR: #000000;
			FONT-FAMILY: "Verdana", "宋体"
		}
		
		A.black:link {
			COLOR: #000066;
			TEXT-DECORATION: none
		}
		
		A.black:visited {
			COLOR: #330000;
			TEXT-DECORATION: none
		}
		
		A.black:active {
			COLOR: #ffffff;
			TEXT-DECORATION: none
		}
		
		A.black:hover {
			COLOR: #ff0000;
			TEXT-DECORATION: none
		}
		</STYLE>
		
				<SCRIPT language=JavaScript type=text/JavaScript>
		function fontZoom(size){
		 document.getElementById('fontZoom').style.fontSize=size+'px'
		}
		</SCRIPT>

		<SCRIPT language=JavaScript>
			var currentpos,timer;
			
			function initialize()
			{
			timer=setInterval("scrollwindow()",50);
			}
			function sc(){
			clearInterval(timer);
			}
			function scrollwindow()
			{
			currentpos=document.body.scrollTop;
			window.scroll(0,++currentpos);
			if (currentpos != document.body.scrollTop)
			sc();
			}
			document.onmousedown=sc
			document.ondblclick=initialize
			
			//图片缩放
			function zoom_img(e, o)
			{
			var zoom = parseInt(o.style.zoom, 10) || 100;
			zoom += event.wheelDelta / 12;
			if (zoom > 0) o.style.zoom = zoom + '%';
			return false;
			}
			
		</SCRIPT>

		<DIV align=center>
			<TABLE cellSpacing=0 cellPadding=0 width=992 align=center
				bgColor=#ffffff border=0>
				<TBODY>
					<TR>
						<TD height=5></TD>
					</TR>
					<TR>
						<TD width=992 height=172>
							<TABLE height="100%" cellSpacing=0 cellPadding=0 width=992
								align=center border=0>
								<TBODY>
									<TR>
										<!--左栏-->
										<TD vAlign=top align=middle width=225
											background=${pageContext.request.contextPath}/images/news-left-bg.gif height=179>
											<!--最新公告-->
											<TABLE id=AutoNumber4 style="BORDER-COLLAPSE: collapse"
												height=35 cellSpacing=0 cellPadding=0 width=202 border=0>
												<TBODY>
												<TR>
													<TD align=middle height=10></TD>
												</TR>
												<TR>
													<TD align=middle
														background=${pageContext.request.contextPath}/images/gonggao_left_bg.jpg
														height=35>
														<DIV
															style="FONT-WEIGHT: bold; FONT-SIZE: 14px; COLOR: #ffffff; LINE-HEIGHT: 35px; HEIGHT: 35px">
															最新公告
														</DIV>
													</TD>
												</TR>
													<TR>
														<TD
															style="BORDER-RIGHT: #ff9933 1px solid; BORDER-TOP: #ff9933 1px solid; BACKGROUND: #ffffff; BORDER-LEFT: #ff9933 1px solid; BORDER-BOTTOM: #ff9933 1px solid"
															align=left width="100%" height=20>
															<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
																<!--最新公告内容-->
																<TBODY>
																<c:forEach var="affiche" items="${XYDB_AFFICHES}">
																	<TR>
																		<TD style="BORDER-BOTTOM: #cccccc 1px dashed"
																			align=left width="88%" height=22>
																			<A title=${affiche.name }
																				href="${pageContext.request.contextPath}/jsp/afficheall/showAff.action?id=${affiche.id }">&nbsp;·${affiche.name }</A>
																		</TD>
																	<!-- 	<TD style="BORDER-BOTTOM: #cccccc 1px dashed"
																			align=right width="32%">
																			${affiche.createdate }&nbsp; 
																		</TD> -->
																	</TR>
																</c:forEach>	
																</TBODY>
															</TABLE>
														</TD>
													</TR>
												</TBODY>
											</TABLE>
										</TD>
										<!--左栏结束-->
										<TD vAlign=top width=767 bgColor=#ffffff>
											<!-- 正文显示区 嵌套有表格-->
											<TABLE height="100%" cellSpacing=0 cellPadding=0 border=0>
												<!--第一行表头-->
												<!-- 先去掉 
			 <tr> <td width="767" height="36" valign="middle" background="Images/position_bg.gif" >&nbsp;&nbsp;<img src="Images/lm_dot.gif">&nbsp;新闻资讯</td>	</tr>
			先去掉 -->
												<!--第二行 空白行-->
												<TBODY>
													<TR>
														<TD vAlign=top align=middle width=767 bgColor=#ffffff
															height=10></TD>
													</TR>
													<TR>
														<TD vAlign=top align=middle width=767 bgColor=#ffffff>
															<TABLE cellSpacing=0 cellPadding=0 width=750 border=0>
																<TBODY>
																	<TR>
																		<TD
																			style="BORDER-RIGHT: #ff9933 1px solid; BORDER-TOP: #ff9933 1px solid; BACKGROUND: #ffffff; BORDER-LEFT: #ff9933 1px solid; BORDER-BOTTOM: #ff9933 1px solid">
																			<TABLE cellSpacing=0 cellPadding=0 width=750 border=0>
																				<TBODY>
																					<TR>
																						<TD class=title_kai vAlign=center align=middle
																							width=750 height=100>
																							${XYDB_AFFICHE.name }
																						</TD>
																					</TR>
																					<TR>
																						<TD background=${pageContext.request.contextPath}/images/title_line.gif
																							height=20>
																							&nbsp;
																						</TD>
																					</TR>
																					<!--正文区表格-->
																					<TR>
																						<TD align=middle>
																							<TABLE cellSpacing=0 cellPadding=0 width=730
																								border=0>
																								<TBODY>
																									<TR>
																										<TD align=middle bgColor=#ffffcc height=24>
																											<FONT color=#006699>发表日期：</FONT><FONT
																												color=#ff0000> ${XYDB_AFFICHE.createdate } </FONT><FONT
																												color=#006699>编辑录入：</FONT><FONT
																												color=#ff0000>${XYDB_AFFICHE.author }</FONT> 【字体：
																											<A href="javascript:fontZoom(16)">放大</A>
																											<A href="javascript:fontZoom(14)">正常</A>
																											<A href="javascript:fontZoom(12)">缩小</A>】
																										</TD>
																									</TR>
																									<TR>
																										<TD height=5></TD>
																										&nbsp;
																									</TR>
																									<TR>
																										<TD id=fontZoom>
																											<!--<P align=center>
																												 <FONT size=3><STRONG>${XYDB_AFFICHE.name }</STRONG> 
																												<BR>
																												</FONT><FONT color=#ff0000>（${XYDB_AFFICHE.createdate }）</FONT>
																											</P>-->
																											<P>
																												${XYDB_AFFICHE.context }
																											</P>
																											<P>
																												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																												<STRONG>${XYDB_AFFICHE.releaseunit }</STRONG>
																											</P>
																											<P>
																												<STRONG> ${XYDB_AFFICHE.createdate }</STRONG>
																											</P>
																										</TD>
																									</TR>
																									<TR>
																										<TD bgColor=#ffffcc height=24>
																											&nbsp;
																											<!-- <B><IMG src="${pageContext.request.contextPath}/images/new_win.gif">&nbsp;上一篇：</B>
																											<A href="http://sxydb.yanan.gov.cn/showAff.asp?id=83"></A> -->
																										</TD>
																									</TR>
																									<TR>
																										<TD bgColor=#ffffcc height=24>
																											&nbsp;
																											<!-- <B><IMG src="${pageContext.request.contextPath}/images/new_win.gif">&nbsp;下一篇：</B>
																											<FONT class=gray></FONT> -->
																										</TD>
																									</TR>
																									<TR>
																										<TD></TD>
																									</TR>
																								</TBODY>
																							</TABLE>
																						</TD>
																					</TR>
																					<!--正文区表格结束-->
																					<TR>
																						<TD background=${pageContext.request.contextPath}/images/title_line.gif
																							height=20>
																							&nbsp;
																						</TD>
																					</TR>
																					<TR>
																						<TD vAlign=center align=right height=40>
																							<!--打印和关闭-->
																							<TABLE240>
                                
																				<TBODY>
                                <TR>
                                <TD vAlign=center width=150><A class=bottom 
                                href="javascript:window.print()"><IMG 
                                src="${pageContext.request.contextPath}/images/printer.gif" 
                                border=0>&nbsp;打印本页</A></TD>
                                <TD width=90><INPUT onclick="window.close();return false;" type=button value=关闭窗口 name=close2></TD></TR></TBODY></TABLE>
																			<!--打印关闭结束--></TD>
																	</TR>
																</TBODY>
															</TABLE>
														</TD>
													</TR>
												</TBODY>
											</TABLE>
										</TD>
									</TR>
									<!--第三行-->
              <TR>
                <TD></TD></TR><!--第四行--></TBODY>
							</TABLE>
							<!--正文显示区结束--></TD>
					</TR>
				</TBODY>
			</TABLE>
		<DIV align=center>
			<TABLE cellSpacing=0 cellPadding=0 width=992 border=0>
				<TBODY>
					<TR>
						<TD class=w-f align=middle
							background=${pageContext.request.contextPath}/images/foot-bg1(1).gif
							height=33></TD>
					</TR>
					<TR>
						<TD align=middle background="" height=87>
							延安市中小企业信用担保有限责任公司 版权所有
							<BR>
							电话:0911-8210739 传真:0911-8210739 电子邮件:
							<A href="mailto:yasdbgs@163.com">yasdbgs@163.com</A>
							<BR>
							公司地址:延安市财政局办公大楼
							<BR>
							<FONT color=#999999>页面执行时间：</FONT><FONT color=#ff0000>93.750</FONT><FONT
								color=#999999>毫秒</FONT>
						</TD>
					</TR>
				</TBODY>
			</TABLE>
		</DIV>
	</BODY>
</HTML>
