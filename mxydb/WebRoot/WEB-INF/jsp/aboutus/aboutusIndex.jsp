<%@page contentType="text/html; charset=utf-8" import="java.net.URLEncoder,cn.edn.yan.domain.*,java.util.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<!-- saved from url=(0052)http://sxydb.yanan.gov.cn/Aboutus.asp?Title=成长历程 -->
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
		<META content="MSHTML 6.00.2900.3132" name=GENERATOR>
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
												href="${pageContext.request.contextPath}/jsp/main.action?"><SPAN
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
						<TD vAlign=center width=192 background=${pageContext.request.contextPath}/images/gov_wMcms_09.gif
							height=27>
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
						<TD vAlign=bottom width=800 background=${pageContext.request.contextPath}/images/gov_wMcms_09.gif
							height=27>
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
		<TABLE cellSpacing=0 cellPadding=0 width=992 align=center
			bgColor=#ffffff border=0>
			<TBODY>
				<TR>
					<TD height=5></TD>
				</TR>
				<TR>
					<TD height=172>
						<TABLE height="100%" cellSpacing=0 cellPadding=0 width=992
							align=center border=0>
							<TBODY>
								<TR>
									<TD vAlign=top align=middle width=225
										background=${pageContext.request.contextPath}/images/news-left-bg.gif height=220>
										<!--企业信息分类显示-->
										<TABLE cellSpacing=0 cellPadding=0 width=202 border=0>
											<TBODY>
												<TR>
													<TD height=10></TD>
												</TR>
												<TR>
													<TD align=middle background=${pageContext.request.contextPath}/images/aboutus.gif
														height=35>
														<DIV
															style="FONT-WEIGHT: bold; FONT-SIZE: 14px; COLOR: #ffffff; LINE-HEIGHT: 35px; HEIGHT: 35px">
															企业信息
														</DIV>
													</TD>
												</TR>
												<TR>
													<TD
														style="BORDER-RIGHT: #ff9933 1px solid; BORDER-TOP: #ff9933 1px solid; BACKGROUND: #ffffff; BORDER-LEFT: #ff9933 1px solid; BORDER-BOTTOM: #ff9933 1px solid"
														height=10>
														<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
															<TBODY>
																<c:forEach var="section" items="${XYDB_SECTIONS}">
																<TR>
																	<TD height=20>
																		<DIV align=center>
																			<A href="<%=request.getContextPath() %>/jsp/aboutus/aboutusInfo.action?sectionid=${section.id}">${section.name }</A>
																		</DIV>
																	</TD>
																</TR>
																<TR>
																	<TD background=${pageContext.request.contextPath}/images/naSzarym.gif colSpan=2
																		height=1>
																		<IMG height=1 src="${pageContext.request.contextPath}/images/1x1_pix.gif" width=10>
																	</TD>
																</TR>
																</c:forEach>
															</TBODY>
														</TABLE>
													</TD>
												</TR>
												<TR>
													<TD height=5></TD>
												</TR>
											</TBODY>
										</TABLE>
										<!--企业信息分类显示结束-->
										<!--            <TR> 
                <TD height=1 colspan="2" background=img/naSzarym.gif><IMG height=1 src="img/1x1_pix.gif" width=10></TD>
              </TR>        
            </table></td>
          <td width="6"></td>
-->
									<TD width=6></TD>
									<TD vAlign=top align=middle>
										<TABLE height="100%" cellSpacing=0 cellPadding=0 width="100%"
											border=0>
											<TBODY>
												<TR>
													<TD
														style="BORDER-RIGHT: #ff9933 1px solid; BORDER-TOP: #ff9933 1px solid; BACKGROUND: #ffffff; BORDER-LEFT: #ff9933 1px solid; BORDER-BOTTOM: #ff9933 1px solid"
														vAlign=top height=206>
														<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
															<TBODY>
																<TR>
																	<TD background=${pageContext.request.contextPath}/images/menu2bg.gif height=32>
																		&nbsp;&nbsp;&nbsp;
																		<IMG height=10 src="${pageContext.request.contextPath}/images/icon3.gif" width=10>
																		&nbsp;当前位置：
																		<A class=daohang_link href="<%=request.getContextPath() %>/jsp/main.action">网站首页</A>&nbsp;&gt;&gt;&nbsp;
																		<SPAN class=daohang_nonce>企业信息</SPAN>
																	</TD>
																</TR>
																<TR>
																	<TD>
																		<DIV align=center>
																			<IMG src="${pageContext.request.contextPath}/images/ad_new.gif">
																		</DIV>
																	</TD>
																</TR>
																<!--<tr><td><div align="center"><img src="images/ad_aboutus.jpg"></div></td></tr>-->
																<!--正文区-->
																<TR>
																	<TD height=2></TD>
																</TR>
																<TR>
																	<TD vAlign=top align=middle>
																	<c:forEach var="section" items="${XYDB_SECTIONS}">
																		<TABLE height=19 cellSpacing=0 cellPadding=0
																			width="100%" align=center border=0>
																			<TBODY>
																				<TR>
																					<TD width="21%"
																						background=${pageContext.request.contextPath}/images/m2.gif
																						bgColor=#eeeeee height=34>
																						&nbsp;&nbsp;
																						<A class=daohang_link
																							href="<%=request.getContextPath() %>/jsp/operation/aboutusInfo.action?sectionid=${section.id }">
																							${section.name }</A>
																					</TD>
																					<TD width="79%"
																						background=${pageContext.request.contextPath}/images/m2.gif
																						bgColor=#eeeeee>
																						&nbsp;
																					</TD>
																				</TR>
																				<TR>
																					<TD bgColor=#999999 colSpan=2 height=1></TD>
																				</TR>
																			</TBODY>
																		</TABLE>
																		<TABLE cellSpacing=3 cellPadding=0 width="100%"
																			align=center bgColor=#fbfeff border=0>
																			<TBODY>
																				<TR>
																					<TD height=8> </TD>
																				</TR>
																				<TR>
																				<TD>
																					<TABLE cellSpacing=0 cellPadding=0 width="100%"border=0>
																						<TBODY>
																							<%List<Information> informations=(List<Information>)session.getAttribute("XYDB_Infors"+((Section)pageContext.getAttribute("section")).getId());
																								if(informations.size()==0) {
																							%>
																								<TR>
																									<TD align="center" width="6%" height=24>
																										<IMG height=11
																										src="${pageContext.request.contextPath}/images/arrow_6.gif" width=11>
																									</TD>
																									<TD style="BORDER-BOTTOM: #999999 1px dotted"
																										width="75%" height=24>
																										暂无信息
																									</TD>
																								</TR>
																							<% 		
																								}else{
																								for(int i=0;i<informations.size();i++){
																									Information infor=informations.get(i);
																							 %>
																							 	<TR>
																									<TD align="center" width="6%" height=24>
																										<IMG height=11
																											src="${pageContext.request.contextPath}/images/arrow_6.gif"
																											width=11>
																									</TD>
																									<TD style="BORDER-BOTTOM: #999999 1px dotted"
																										width="75%" height=24>
																										<A title="标题：<%=infor.getName() %> "
																											href="${pageContext.request.contextPath}/jsp/news/showOperation.action?id=<%=infor.getId() %>"
																											target=_blank><%=infor.getName() %></A>
																									</TD>
																									<TD style="BORDER-BOTTOM: #999999 1px dotted"
																										width="19%">
																										<FONT color=#999999>[<%=infor.getCreatedate() %>](点击<FONT color=#ff0000><%=infor.getScansum() %></FONT>) </FONT>
																									</TD>
																								</TR>
																							<% 
																									} 
																								}
																							%>
																							</TBODY>
																						</TABLE>
																					</TD>
																				</TR>
																				<TR>
																					<TD height=8>
																						<DIV align=right>
																							<A
																								href="<%=request.getContextPath() %>/jsp/operation/operationList.action?sectionid=${section.id }">更多…</A>&nbsp;&nbsp;
																						</DIV>
																					</TD>
																				</TR>
																			</TBODY>
																		</TABLE>
																	</c:forEach>
																	</TD>
																</TR>
																<TR>
																	<TD></TD>
																</TR>
																<!--正文区结束-->
															</TBODY>
														</TABLE>
													</TD>
												</TR>
											</TBODY>
										</TABLE>
									</TD>
								</TR>
							</TBODY>
						</TABLE>
					</TD>
				</TR>
			</TBODY>
		</TABLE>
		<DIV align=center>
			<TABLE cellSpacing=0 cellPadding=0 width=992 border=0>
				<TBODY>
					<TR>
						<TD class=w-f align=middle
							background="${pageContext.request.contextPath}/images/foot-bg1(1).gif"
							height=33></TD>
					</TR>
					<TR>
						<TD align=middle background="${pageContext.request.contextPath}/"
							height=87>
							延安市中小企业信用担保有限责任公司 版权所有
							<BR>
							电话:0911-8231231 传真:0911-8231231 电子邮件:
							<A href="mailto:ma_xiaobin612@126.com">ma_xiaobin612@126.com</A>
							<BR>
							公司地址:延安市王家坪办公大楼8号楼
							<BR>
							<FONT color=#999999>页面执行时间：</FONT><FONT color=#ff0000>140.625</FONT><FONT
								color=#999999>毫秒</FONT>
						</TD>
					</TR>
				</TBODY>
			</TABLE>
		</DIV>
	</BODY>
</HTML>
