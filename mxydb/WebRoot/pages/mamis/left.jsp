<%@page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<HTML>
	<HEAD>
		<TITLE></TITLE>
		<META http-equiv="content-type" content="text/html; charset=gb2312">
		<STYLE type="text/css">
		.point {
			FONT-SIZE: 12px;
			CURSOR: hand;
			COLOR: #000000;
			FONT-FAMILY: Webdings;
			POSITION: absolute;
		}
		</STYLE>
		<SCRIPT language="javascript">
			function changeWin(){
				if(parent.left.cols!="15,*"){
					parent.left.cols="15,*";
					document.all.menuSwitch.innerHTML="<img src='image/splitter_l.gif'>";
				}
				else{
					parent.left.cols="225,*";
					document.all.menuSwitch.innerHTML="<img src='image/splitter_r.gif'>";
				}
			}
		</SCRIPT>
	</HEAD>
	<BODY leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<TABLE height="100%" cellspacing="0" cellpadding="0" width="100%"
			border="0">
			<TBODY>
				<TR>
					<TD width="100%">

						<IFRAME style="VISIBILITY: inherit; WIDTH: 100%; HEIGHT: 100%"
							src="menu.jsp" frameborder="0" scrolling="auto"></IFRAME>

					</TD>
					<TD width="15" height="100%" background="image/splitter_bg.gif"
						style="background-position: top;">
						<TABLE height="100%" cellspacing="0" cellpadding="0" width="100%"
							border="0">
							<TR>
								<TD onClick="changeWin()" height="1">
									<IMG height="1" src="images/dot.gif" width="10">
								</TD>
							</TR>
							<TR>
								<TD id="menuSwitch" onClick="changeWin()" height="100%"
									width="10">
									<img src="image/splitter_r.gif">
								</TD>
							</TR>
						</TABLE>
					</TD>
				</TR>
			</TBODY>
		</TABLE>
	</BODY>
</HTML>


