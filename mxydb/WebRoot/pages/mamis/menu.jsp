<%@page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="s" uri="/struts-tags"%>

<HTML>
	<HEAD>
		<TITLE>Firestorm Menu</TITLE>
		<LINK href="css/Syntec.css" type=text/css rel=stylesheet>
		<link rel="stylesheet" href="css/css.css" type="text/css">
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<style type="text/css">
.STYLE1 {
	color: #FFFFFF
}

.div2 {
	font-family: 'Arial';
	color: #000000;
	font-size: 12px;
	text-align: center;
	LINE-HEIGHT: 22px;
}

.STYLE2 {
	color: #FF0000;
	font-size: 14px
}

A:hover {
	COLOR: blue;
	TEXT-DECORATION: none
}

A:link {
	COLOR: #000000;
	TEXT-DECORATION: none
}

A:visited {
	COLOR: #000000;
	TEXT-DECORATION: none
}
</style>
	</HEAD>
	<BODY class=FirestormMenuBackground MS_POSITIONING="GridLayout">
		<SCRIPT language=javascript type=text/javascript>			
			function __doPostBack(eventTarget, eventArgument) {
				var theform;
				if (window.navigator.appName.toLowerCase().indexOf("microsoft") > -1) {
					theform = document.MainForm;
				}
				else {
					theform = document.forms["MainForm"];
				}
				theform.__EVENTTARGET.value = eventTarget.split("$").join(":");
				theform.__EVENTARGUMENT.value = eventArgument;
				theform.submit();
			}	
		</SCRIPT>

		<SCRIPT src="js/ig_shared.js" type=text/javascript></SCRIPT>

		<SCRIPT src="js/ig_weblistbar2_2.js" type=text/javascript></SCRIPT>

		<STYLE type=text/css>
.MainMenuBardefItem {
	MARGIN-TOP: 4px;
	FONT-SIZE: 8pt;
	MARGIN-BOTTOM: 4px;
	MARGIN-LEFT: 2px;
	CURSOR: default;
	FONT-FAMILY: Verdana
}

.MainMenuBarselItem {
	BORDER-RIGHT: 1px inset;
	BORDER-TOP: 1px inset;
	MARGIN-TOP: 4px;
	FONT-SIZE: 8pt;
	MARGIN-BOTTOM: 4px;
	MARGIN-LEFT: 2px;
	BORDER-LEFT: 1px inset;
	CURSOR: default;
	BORDER-BOTTOM: 1px inset;
	FONT-FAMILY: Verdana
}

.MainMenuBarhovItem {
	MARGIN-TOP: 4px;
	FONT-WEIGHT: bold;
	FONT-SIZE: 8pt;
	MARGIN-BOTTOM: 4px;
	MARGIN-LEFT: 2px;
	CURSOR: default;
	COLOR: steelblue;
	FONT-FAMILY: Verdana
}

.MainMenuBarclpsGroup {
	PADDING-LEFT: 3px;
	FONT-WEIGHT: bold;
	FONT-SIZE: 9pt;
	BACKGROUND-IMAGE: url(image/roundedblueExplorer.gif);
	WIDTH: 190;
	CURSOR: default;
	FONT-FAMILY: Verdana;
	HEIGHT: 31px
}

.MainMenuBarxpndGroup {
	PADDING-LEFT: 3px;
	FONT-WEIGHT: bold;
	FONT-SIZE: 9pt;
	BACKGROUND-IMAGE: url(image/roundedblueExplorer.gif);
	WIDTH: 190;
	CURSOR: default;
	FONT-FAMILY: Verdana;
	HEIGHT: 31px
}

.MainMenuBarhovGroup {
	PADDING-LEFT: 3px;
	FONT-WEIGHT: bold;
	FONT-SIZE: 9pt;
	BACKGROUND-IMAGE: url(image/roundedblueExplorer.gif);
	WIDTH: 190;
	CURSOR: default;
	FONT-FAMILY: Verdana;
	HEIGHT: 31px
}

.MainMenuBar0hovItem {
	MARGIN-TOP: 4px;
	FONT-WEIGHT: bold;
	FONT-SIZE: 8pt;
	MARGIN-BOTTOM: 4px;
	MARGIN-LEFT: 2px;
	CURSOR: default;
	COLOR: #006dbf;
	FONT-FAMILY: Verdana;
	BACKGROUND-COLOR: gainsboro
}

.MainMenuBar0selItem {
	BORDER-RIGHT: 1px solid;
	BORDER-TOP: 1px solid;
	MARGIN-TOP: 4px;
	FONT-WEIGHT: bold;
	FONT-SIZE: 8pt;
	MARGIN-BOTTOM: 4px;
	MARGIN-LEFT: 2px;
	BORDER-LEFT: 1px solid;
	CURSOR: default;
	COLOR: #393939;
	BORDER-BOTTOM: 1px solid;
	FONT-FAMILY: Verdana;
	BACKGROUND-COLOR: palegoldenrod
}

.MainMenuBar1hovItem {
	MARGIN-TOP: 4px;
	FONT-WEIGHT: bold;
	FONT-SIZE: 8pt;
	MARGIN-BOTTOM: 4px;
	MARGIN-LEFT: 2px;
	CURSOR: default;
	COLOR: #006dbf;
	FONT-FAMILY: Verdana;
	BACKGROUND-COLOR: gainsboro
}

.MainMenuBar1selItem {
	BORDER-RIGHT: 1px solid;
	BORDER-TOP: 1px solid;
	MARGIN-TOP: 4px;
	FONT-WEIGHT: bold;
	FONT-SIZE: 8pt;
	MARGIN-BOTTOM: 4px;
	MARGIN-LEFT: 2px;
	BORDER-LEFT: 1px solid;
	CURSOR: default;
	COLOR: #393939;
	BORDER-BOTTOM: 1px solid;
	FONT-FAMILY: Verdana;
	BACKGROUND-COLOR: palegoldenrod
}

.MainMenuBar2hovItem {
	MARGIN-TOP: 4px;
	FONT-WEIGHT: bold;
	FONT-SIZE: 8pt;
	MARGIN-BOTTOM: 4px;
	MARGIN-LEFT: 2px;
	CURSOR: default;
	COLOR: #006dbf;
	FONT-FAMILY: Verdana;
	BACKGROUND-COLOR: gainsboro
}

.MainMenuBar2selItem {
	BORDER-RIGHT: 1px solid;
	BORDER-TOP: 1px solid;
	MARGIN-TOP: 4px;
	FONT-WEIGHT: bold;
	FONT-SIZE: 8pt;
	MARGIN-BOTTOM: 4px;
	MARGIN-LEFT: 2px;
	BORDER-LEFT: 1px solid;
	CURSOR: default;
	COLOR: #393939;
	BORDER-BOTTOM: 1px solid;
	FONT-FAMILY: Verdana;
	BACKGROUND-COLOR: palegoldenrod
}

.MainMenuBar3hovItem {
	MARGIN-TOP: 4px;
	FONT-WEIGHT: bold;
	FONT-SIZE: 8pt;
	MARGIN-BOTTOM: 4px;
	MARGIN-LEFT: 2px;
	CURSOR: default;
	COLOR: #006dbf;
	FONT-FAMILY: Verdana;
	BACKGROUND-COLOR: gainsboro
}

.MainMenuBar3selItem {
	BORDER-RIGHT: 1px solid;
	BORDER-TOP: 1px solid;
	MARGIN-TOP: 4px;
	FONT-WEIGHT: bold;
	FONT-SIZE: 8pt;
	MARGIN-BOTTOM: 4px;
	MARGIN-LEFT: 2px;
	BORDER-LEFT: 1px solid;
	CURSOR: default;
	COLOR: #393939;
	BORDER-BOTTOM: 1px solid;
	FONT-FAMILY: Verdana;
	BACKGROUND-COLOR: palegoldenrod
}

.MainMenuBargrp {
	CURSOR: default;
	BACKGROUND-COLOR: #CCFFFF
}
</STYLE>
		<span
			style="position: absolute; left: 7px; top: 0px; width: 186px; height: 70px;">
			<img id=ou0 src="image/dlxx.gif" style="position: absolute;">
		</span>
		<DIV id=1
			style="position: absolute; left: 12px; top: 18px; width: 180px; height: 70px;">
			<DIV class="div2">
				<span class="STYLE2">${ADMIN.name } </span> &nbsp;您好！
				<br>
				登陆时间:
				<SCRIPT language=JavaScript>
					today=new Date();
					function initArray(){
					this.length=initArray.arguments.length
					for(var i=0;i<this.length;i++)
					this[i+1]=initArray.arguments[i]  }
					var d=new initArray(
					"星期日",
					"星期一",
					"星期二",
					"星期三",
					"星期四",
					"星期五",
					"星期六");
					document.write(
					"<font color=#FF0000 style='font-size:11px;font-family: verdana'> ",
					today.getYear(),"年",
					today.getMonth()+1,"月",
					today.getDate(),"日",
					d[today.getDay()+1],
					"</font>" ); 
				</SCRIPT>
			</DIV>
		</DIV>
		<DIV id=MainMenuBar
			style="BORDER-RIGHT: 4px; BORDER-TOP: 4px;  Z-INDEX: 102; LEFT: 5px; BORDER-LEFT: 4px; WIDTH: 144px; BORDER-BOTTOM: 4px; POSITION: absolute; TOP: 80px; HEIGHT: 200px"
			width="144px">
			<TABLE style="WIDTH: 100%; HEIGHT: 100%" height="100%" cellSpacing=0
				cellPadding=0 width="100%" border=0>
				<TBODY>
					<TR style="WIDTH: 100%; HEIGHT: 100%" width="100%">
						<TD style="WIDTH: 100%; HEIGHT: 100%" vAlign=top width="100%">
							<TABLE id=MainMenuBar_Group_5_group
								style="MARGIN-BOTTOM: 12px; WIDTH: 100%" cellSpacing=0
								cellPadding=0 border=0>
								<TBODY>
									<TR id=MainMenuBar_Group_5 style="HEIGHT: 23px" width="100%">
										<TD width="100%">
											<TABLE class=MainMenuBarclpsGroup
												id=MainMenuBar_Group_5_header cellSpacing=0 cellPadding=0
												width="100%" border=0>
												<TBODY>
													<TR style="HEIGHT: 23px" width="100%">
														<TD id=MainMenuBar_Group_5_text vAlign=center align=left
															width="87%" class="STYLE1">
															&nbsp;&nbsp;系统维护
														</TD>
			
													</TR>
												</TBODY>
											</TABLE>
										</TD>
									</TR>
									<TR id=MainMenuBar_Group_5_items >
										<TD class=MainMenuBargrp>
											<DIV style="WIDTH: 90%; HEIGHT: 100%">
												<c:forEach var="right" items="${ADMIN_RIGHTS}">
												<a href="${pageContext.request.contextPath}/pages/mamis/${right.url }" target="Main">
													<DIV class=MainMenuBardefItem width="100%" onmouseout="this.style.backgroundColor=''" onmouseover="this.style.backgroundColor='#999933'">
													 	&nbsp;&nbsp;${right.name }</DIV>
												</a>
												</c:forEach>
											</DIV>
										</TD>
									</TR>
								</TBODY>
							</TABLE>

						</TD>
					</TR>
				</TBODY>
			</TABLE>
		</DIV>
		
	</BODY>
</HTML>
