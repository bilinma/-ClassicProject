<%@page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<!-- saved from url=(0035)http://sxydb.yanan.gov.cn/index.asp -->
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
	FONT-SIZE: 20px;
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

		<STYLE type=text/css>
BODY {
	BACKGROUND-POSITION: center 50%;
	BACKGROUND-REPEAT: repeat-y;
	BACKGROUND-COLOR: #ffffff;
	background-images: url(Images/bg.jpg)
}

.STYLE1 {
	COLOR: #ffffff
}

.STYLE2 {
	COLOR: #333333
}
</STYLE>

		<SCRIPT language=JavaScript1.2
			src="${pageContext.request.contextPath}/images/Southidcmenu.js"
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
	FILTER: glow(color =     #015DA5, strength =     1);
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
						<TD width=300
							background=${pageContext.request.contextPath}/images/foot-bg1.gif
							height=33>
							<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
								<TBODY>
									<TR>
										<TD width=30>
											&nbsp;
										</TD>
										<TD Align=center width=20 height=33>
											<IMG
												src="${pageContext.request.contextPath}/images/admin_home.gif">
										</TD>
										<TD Align=center align=left width=72>
											<A
												onclick="window.external.addFavorite('sxydb.yanan.gov.cn','延安信用担保网')"
												href="${pageContext.request.contextPath}/jsp/main.action"><SPAN
												class=STYLE1>收藏本站</SPAN> </A>
										</TD>
										<TD width=20>
											<IMG
												src="${pageContext.request.contextPath}/images/email1.gif">
										</TD>
										<TD width=157>
											<A href="${pageContext.request.contextPath}/jsp/aboutus/relationUs.action?sname=联系我们"><SPAN
												class=STYLE1>联系我们</SPAN> </A>
										</TD>
									</TR>
								</TBODY>
							</TABLE>
						</TD>
						<!--第二个单元格开始-->
						<TD
							background=${pageContext.request.contextPath}/images/foot-bg1.gif>
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
								<embed src="${pageContext.request.contextPath}/images/top.swf"
									quality="high"
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
						<TD width=10
							background=${pageContext.request.contextPath}/images/gov_wMcms_09.gif>
							&nbsp;
						</TD>
						<TD vAlign=center width=192
							background=${pageContext.request.contextPath}/images/gov_wMcms_09.gif
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
						<TD vAlign=bottom width=800
							background=${pageContext.request.contextPath}/images/gov_wMcms_09.gif
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
		<!--此处去掉第一片JS脚本-->
		<!--*************-->
		<DIV align=center>
			<TABLE cellSpacing=0 cellPadding=0 width=992 align=center
				bgColor=#ffffff>
				<TBODY>
					<TR>
						<TD vAlign=top width=778>
							<!--第一列-->
							<!--左栏第一项 新闻动态 推荐图片新闻-->
							<DIV style="PADDING-TOP: 10px" align=left>
								<TABLE
									style="BORDER-RIGHT: #ff9933 1px solid; BORDER-TOP: #ff9933 1px solid; BORDER-LEFT: #ff9933 1px solid; BORDER-BOTTOM: #ff9933 1px solid"
									cellSpacing=0 cellPadding=0 width=774 border=0>
									<TBODY>
										<TR>
											<TD align=left width=300
												background=${pageContext.request.contextPath}/images/news-bg.gif
												height=41>
												<IMG
													src="${pageContext.request.contextPath}/images/news.gif">
											</TD>
											<TD class=w-f width=380
												background=${pageContext.request.contextPath}/images/news-bg.gif
												height=41>
												<IMG
													src="${pageContext.request.contextPath}/images/ico2.gif"
													border=0>
											</TD>
											<TD align=middle width=68
												background=${pageContext.request.contextPath}/images/news-bg.gif>
												<A class=daohang_link_left
													href="${pageContext.request.contextPath}/jsp/news/newsIndex.action?mname=<%=java.net.URLEncoder.encode("新闻资讯", "UTF-8")%>" target=_blank>更多…</A>
											</TD>
											<TD width=1 height=41></TD>
										</TR>
										<TR>
											<TD vAlign=top colSpan=4 height=260>
												<!--里面有表格分为二列 第一列图片轮换 第二列新闻文字-->
												<TABLE cellSpacing=2 cellPadding=5 border=0>
													<TBODY>
														<TR>
															<TD>
																<IFRAME id=movie name=movie marginWidth=0 marginHeight=0
																	src="${pageContext.request.contextPath}/NewpicIE.jsp"
																	frameBorder=0 width=320 scrolling=no height=260>
																</IFRAME>
															</TD>
															<TD vAlign=top width=437>
																<!--新闻列表 开始-->
																<TABLE cellSpacing=0 cellPadding=0 border=0>
																	<TBODY>
																		<TR>
																			<TD colSpan=2 height=53 align="left">
																				<DIV class=tiaotiao align="left">
																					<A title=${XYDB_HEADNEWS.name } 
																						href="${pageContext.request.contextPath}/jsp/policy/showNews.action?id=${XYDB_HEADNEWS.id }&mname=<%=java.net.URLEncoder.encode("新闻资讯", "UTF-8")%>"
																						target=_blank >${XYDB_HEADNEWS.name }</A>
																				</DIV>
																			</TD>
																		</TR>
																		<c:forEach var="news" items="${XYDB_NEWSS}">
																			<TR>
																				<TD style="BORDER-BOTTOM: #cccccc 1px dashed"
																					width=350 height=23>
																					<IMG
																						src="${pageContext.request.contextPath}/images/ico1.gif">
																					&nbsp;
																					<A class=middle title=${news.name }
																						href="<%=request.getContextPath() %>/jsp/news/showNews.action?id=${news.id }&mname=<%=java.net.URLEncoder.encode("新闻资讯", "UTF-8")%>"
																						target=_blank>${news.name }</A>
																				</TD>
																				<TD style="BORDER-BOTTOM: #cccccc 1px dashed" width=80>
																					<FONT color=#999999>[${news.createdate }] </FONT>
																				</TD>
																			</TR>
																		</c:forEach>
																	</TBODY>
																</TABLE>
																<!--新闻列表 结束-->
															</TD>
														</TR>
													</TBODY>
												</TABLE>
											</TD>
										</TR>
									</TBODY>
								</TABLE>
							</DIV>
							<!--新闻动态结束-->
							<!--中部图片条-->
							<DIV style="PADDING-TOP: 7px" align=center>
								<TABLE height=115 cellSpacing=0 cellPadding=0 width=774 border=0
									valign="top">
									<TBODY>
										<TR>
											<TD background=${pageContext.request.contextPath}/images/ad.jpg
												height=115>
												<EMBED
													pluginspage=http://www.macromedia.com/go/getflashplayer
													src=images/3.swf width=774 height=115
													type=application/x-shockwave-flash quality="high"
													wmode="transparent"></EMBED>
											</TD>
										</TR>
									</TBODY>
								</TABLE>
							</DIV>
							<!--中部图片条结束-->
							<!--中部图片条结束-->
							<!--最新政策法规和最新相关文件开始-->
							<DIV style="PADDING-TOP: 10px" align=left>
								<TABLE cellSpacing=0 cellPadding=0 width=774 border=0
									valign="top">
									<TBODY>
										<TR>
											<TD vAlign=top align=left width=380
												background="${pageContext.request.contextPath}/" height=233>
												<!--最新法规开始-->
												<TABLE height=224 cellSpacing=0 cellPadding=0 width=365
													border=0 valign="top">
													<TBODY>
														<TR>
															<TD vAlign=bottom align=middle width=180
																background=${pageContext.request.contextPath}/images/menu-l.gif
																height=28>
																<DIV
																	style="FONT-WEIGHT: bold; FONT-SIZE: 14px; COLOR: #003333; LINE-HEIGHT: 28px; HEIGHT: 28px">
																	政策法规
																</DIV>
															</TD>
															<TD align=right width=185 height=28>
																<A href="${pageContext.request.contextPath}/jsp/policyIndex.action?mname=<%=java.net.URLEncoder.encode("政策法规", "UTF-8")%>"
																	target=_blank><IMG height=21
																		src="${pageContext.request.contextPath}/images/more_policy.gif"
																		width=67 border=0> </A>
															</TD>
														</TR>
														<TR>
															<TD
																style="BORDER-RIGHT: #ff9933 1px solid; BORDER-TOP: #ff9933 1px solid; BACKGROUND: url(images/newsb-bg.gif); BORDER-LEFT: #ff9933 1px solid; BORDER-BOTTOM: #ff9933 1px solid"
																vAlign=top colSpan=2 height=196>
																<DIV style="MARGIN-TOP: 5px">
																	<TABLE cellSpacing=0 cellPadding=0 width="100%"
																		border=0>
																		<TBODY>
																			<c:forEach var="operation" items="${XYDB_OPERATIONS}">
																				<TR>
																					<TD align=middle width="6%" height=24>
																						<IMG height=11
																							src="${pageContext.request.contextPath}/images/arrow_6.gif"
																							width=11>
																					</TD>
																					<TD style="BORDER-BOTTOM: #999999 1px dotted"
																						width="70%" height=24>
																						<A title="标题：${operation.name } "
																							href="<%=request.getContextPath() %>/jsp/showPolicy.action?id=${operation.id }&mname=<%=java.net.URLEncoder.encode("政策法规", "UTF-8")%>"
																							target=_blank>${operation.name}</A>
																					</TD>
																					<TD style="BORDER-BOTTOM: #999999 1px dotted"
																						width="20%">
																						<FONT color=#999999>[${operation.createdate}]</FONT>
																					</TD>
																				</TR>
																			</c:forEach>
																		</TBODY>
																	</TABLE>
																</DIV>
															</TD>
														</TR>
													</TBODY>
												</TABLE>
												<!--最新法规结束-->
											</TD>
											<TD vAlign=top align=middle width=385 height=233>
												<!--最新业务内容开始-->
												<TABLE height=224 cellSpacing=0 cellPadding=0 width=365
													border=0 valign="top">
													<TBODY>
														<TR>
															<TD vAlign=bottom align=middle width=180
																background=${pageContext.request.contextPath}/images/menu-l.gif
																height=28>
																<DIV
																	style="FONT-WEIGHT: bold; FONT-SIZE: 14px; COLOR: #003333; LINE-HEIGHT: 28px; HEIGHT: 28px">
																	业务内容
																</DIV>
															</TD>
															<TD align=right width=185 height=28>
																<A
																	href="${pageContext.request.contextPath}/jsp/operation/operationIndex.action?mname=<%=java.net.URLEncoder.encode("业务内容", "UTF-8")%>"
																	target=_blank>
																	<IMG height=21 src="${pageContext.request.contextPath}/images/more_policy.gif"
																		width=67 border=0> </A>
															</TD>
														</TR>
														<TR>
															<TD
																style="BORDER-RIGHT: #ff9933 1px solid; BORDER-TOP: #ff9933 1px solid; BACKGROUND: url(images/newsb-bg.gif); BORDER-LEFT: #ff9933 1px solid; BORDER-BOTTOM: #ff9933 1px solid"
																vAlign=top colSpan=2 height=196>
																<DIV style="MARGIN-TOP: 5px">
																	<TABLE cellSpacing=0 cellPadding=0 width="100%"
																		border=0>
																		<TBODY>
																			<c:forEach var="section" items="${XYDB_SECTIONS}">
																				<TR>
																					<TD align=middle width="6%" height=24>
																						<IMG height=11
																							src="${pageContext.request.contextPath}/images/arrow_6.gif"
																							width=11>
																					</TD>
																					<TD style="BORDER-BOTTOM: #999999 1px dotted"
																						width=* height=24>
																						<A title="标题：${section.name } "
																							href="<%=request.getContextPath() %>/jsp/operation/operationList.action?sectionid=${section.id }"
																							target=_blank>${section.name }</A>
																					</TD>
																				</TR>
																			</c:forEach>
																		</TBODY>
																	</TABLE>
																</DIV>
															</TD>
														</TR>
													</TBODY>
												</TABLE>
												<!--最新业务内容结束-->
											</TD>
										</TR>
									</TBODY>
								</TABLE>
							</DIV>
							<!--最新课程和最新相关文件结束-->
						</TD>
						<!--第二列-->
						<!--<td width=5></td>-->
						<!--第三列-->
						<TD vAlign=top width=214
							background=${pageContext.request.contextPath}/images/left-bg.gif>
							<!--网站公告开始-->
							<DIV style="PADDING-TOP: 10px" align=right>
								<TABLE height=200 cellSpacing=0 cellPadding=0 width=202 border=0>
									<TBODY>
										<TR>
											<TD
												background=${pageContext.request.contextPath}/images/gonggao.gif
												height=34></TD>
										</TR>
										<TR>
											<TD
												style="BORDER-RIGHT: #ff9933 1px solid; BORDER-TOP: #ff9933 1px solid; BORDER-LEFT: #ff9933 1px solid; BORDER-BOTTOM: #ff9933 1px solid"
												vAlign=top align=middle height=170>
												<DIV style="PADDING-TOP: 10px">
													<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
														<TBODY>
															<TR>
																<TD align=middle>
																	<MARQUEE onmouseover=javascript:this.stop();
																		style="PADDING-RIGHT: 1px; PADDING-LEFT: 1px; PADDING-BOTTOM: 1px; PADDING-TOP: 1px"
																		onmouseout=javascript:this.start(); scrollAmount=1
																		scrollDelay=5 direction=up width="95%" height=150>
																		<TABLE cellSpacing=0 cellPadding=1 align=left border=0>
																		<%int i=1; %>
																			<TBODY>
																				<c:forEach var="affiche" items="${XYDB_NEWAFFICHES}">
																				<TR>
																					<TD style="BORDER-BOTTOM: #cccccc 1px dashed"
																						align=left width=200 height=23>
																						<A
																							title="标  题：${affiche.name }&#13;&#10;发布人：${affiche.author }"
																							href="${pageContext.request.contextPath}/jsp/afficheall/showAff.action?id=${affiche.id }"
																							target=_blank><%=i++ %>.${affiche.name }</A>
																					</TD>
																				<!-- 	<TD style="BORDER-BOTTOM: #cccccc 1px dashed"
																						align=left>
																						<FONT color=#999999>[${affiche.createdate }]</FONT>
																					</TD> -->
																				</TR>
																				</c:forEach>
																			</TBODY>
																		</TABLE>
																	</MARQUEE>
																</TD>
															</TR>
															<TR>
																<TD vAlign=center align=middle height=30>
																	<A href="${pageContext.request.contextPath}/jsp/afficheall/afficheAll.action"
																		target=_blank>更多…</A>
																</TD>
															</TR>
														</TBODY>
													</TABLE>
												</DIV>
											</TD>
										</TR>
									</TBODY>
								</TABLE>
							</DIV>
							<!--网站公告结束-->
						<!-- 公司简讯-->
							<DIV style="PADDING-LEFT: 5px; PADDING-TOP: 10px" align=right>
								<TABLE height=150 cellSpacing=0 cellPadding=0 width=202 border=0>
									<TBODY>
										<TR>
											<TD
												background=${pageContext.request.contextPath}/images/index_gsjx.gif
												height=34></TD>
										</TR>
										<TR>
											<TD style="BORDER-RIGHT: #ff9933 1px solid; BORDER-TOP: #ff9933 1px solid; BORDER-LEFT: #ff9933 1px solid; BORDER-BOTTOM: #ff9933 1px solid"
												vAlign=top align=middle height=240>
												<DIV style="PADDING-TOP: 10px">
													<TABLE cellSpacing=0 cellPadding=0 border=0>
														<TBODY>
															<c:forEach var="companynews" items="${XYDB_COMPANYNEWS}">
																<TR>
																	<TD style="BORDER-BOTTOM: #cccccc 1px dashed" width=124
																		height=23>
																		<IMG
																			src="${pageContext.request.contextPath}/images/ico1.gif">
																		&nbsp;
																		<A class=middle title=${companynews.name }
																			href="${pageContext.request.contextPath}/jsp/news/showNews.action?id=${companynews.id }"
																			target=_blank>${companynews.name }</A>
																	</TD>
																	<TD style="BORDER-BOTTOM: #cccccc 1px dashed" width=72>
																		<FONT color=#999999>[${companynews.createdate }] </FONT>
																	</TD>
																</TR>
															</c:forEach>
														</TBODY>
													</TABLE>
												</DIV>
											</TD>
										</TR>
									</TBODY>
								</TABLE>
							</DIV>
							<!--公司简讯结束-->
							<!--相关链接开始-->
							<DIV style="PADDING-BOTTOM: 5px; PADDING-TOP: 10px" align=right>
								<TABLE height=150 cellSpacing=0 cellPadding=0 width=202 border=0>
									<TBODY>
										<TR>
											<TD
												background=${pageContext.request.contextPath}/images/link.gif
												height=34></TD>
										</TR>
										<TR>
											<TD
												style="BORDER-RIGHT: #ff9933 1px solid; BORDER-TOP: #ff9933 1px solid; BORDER-LEFT: #ff9933 1px solid; BORDER-BOTTOM: #ff9933 1px solid"
												vAlign=top align=middle height=120>
												<DIV style="PADDING-TOP: 10px">
													<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
														<TBODY>
															<TR>
																<TD align=middle>
																	<TABLE cellSpacing=0 cellPadding=2 align=left border=0>
																		<TBODY>
																			<c:forEach var="friendshipConn"
																				items="${XYDB_FRIENDCONN}">
																				<TR>
																					<TD align=left width="100%" height=20>
																						<A title="" href="${friendshipConn.url }"
																							target=_blank>&nbsp;&nbsp;<IMG height=8
																								src="${pageContext.request.contextPath}/images/w_links.gif"
																								width=8 border=0>&nbsp;${friendshipConn.name
																							}</A>
																					</TD>
																				</TR>
																			</c:forEach>
																		</TBODY>
																	</TABLE>
																</TD>
															</TR>
														</TBODY>
													</TABLE>
												</DIV>
											</TD>
										</TR>
									</TBODY>
								</TABLE>
							</DIV>
							<!--相关链接结束-->
						</TD>
					</TR>
				</TBODY>
			</TABLE>
			<!--结束-->
			<!--******************-->
		</DIV>
		<!--首页第二个表格结束-->
		<DIV align=center>
			<TABLE cellSpacing=0 cellPadding=0 width=992 border=0>
				<TBODY>
					<TR>
						<TD class=w-f align=middle
							background="${pageContext.request.contextPath}/images/foot-bg1(1).gif"
							height=33></TD>
					</TR>
					<TR>
						<TD align=middle background="${pageContext.request.contextPath}/" height=87>
							延安市中小企业信用担保有限责任公司 版权所有
							<BR>电话:0911-8231231 传真:0911-8231231 电子邮件:
							<A href="mailto:ma_xiaobin612@126.com">ma_xiaobin612@126.com</A>
							<BR>公司地址:延安市王家坪办公大楼8号楼<BR>
							<FONT color=#999999>页面执行时间：</FONT>
							<FONT color=#ff0000>140.625</FONT>
							<FONT color=#999999>毫秒</FONT>
						</TD>
					</TR>
				</TBODY>
			</TABLE>
		</DIV>
		<SCRIPT>top.document.title="延安信用担保网"; </SCRIPT>
	</BODY>
</HTML>
