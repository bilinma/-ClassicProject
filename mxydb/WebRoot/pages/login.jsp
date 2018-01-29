<%@page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>延安市信用担保公司网站后台管理</title>
		<style type="text/css">
<!--
a {
	color: #008EE3
}

a:link {
	text-decoration: none;
	color: #008EE3
}

A:visited {
	text-decoration: none;
	color: #666666
}

A:active {
	text-decoration: underline
}

A:hover {
	text-decoration: underline;
	color: #0066CC
}

A.b:link {
	text-decoration: none;
	font-size: 12px;
	font-family: "Helvetica,微软雅黑,宋体";
	color: #FFFFFF;
}

A.b:visited {
	text-decoration: none;
	font-size: 12px;
	font-family: "Helvetica,微软雅黑,宋体";
	color: #FFFFFF;
}

A.b:active {
	text-decoration: underline;
	color: #FF0000;
}

A.b:hover {
	text-decoration: underline;
	color: #ffffff
}

.table1 {
	border: 1px solid #CCCCCC;
}

.font {
	font-size: 12px;
	text-decoration: none;
	color: #999999;
	line-height: 20px;
}

.input {
	font-size: 12px;
	color: #999999;
	text-decoration: none;
	border: 0px none #999999;
}

td {
	font-size: 12px;
	color: #007AB5;
}

form {
	margin: 1px;
	padding: 1px;
}

input {
	border: 0px;
	height: 26px;
	color: #007AB5;
	.
	unnamed1
	{
	border
	:
	thin
	none
	#FFFFFF;
}

.unnamed1 {
	border: thin none #FFFFFF;
}

select {
	border: 1px solid #cccccc;
	height: 18px;
	color: #666666;
	.
	unnamed1
	{
	border
	:
	thin
	none
	#FFFFFF;
}

body {
	background-repeat: no-repeat;
	background-color: #9CDCF9;
	background-position: 0px 0px;
}

.tablelinenotop {
	border-top: 0px solid #CCCCCC;
	border-right: 1px solid #CCCCCC;
	border-bottom: 0px solid #CCCCCC;
	border-left: 1px solid #CCCCCC;
}

.tablelinenotopdown {
	border-top: 1px solid #eeeeee;
	border-right: 1px solid #eeeeee;
	border-bottom: 1px solid #eeeeee;
	border-left: 1px solid #eeeeee;
}

.style6 {
	FONT-SIZE: 9pt;
	color: #7b8ac3;
}
-->
</style>
	</head>
	<body>
		<table width="681" border="0" align="center" cellpadding="0"
			cellspacing="0" style="margin-top: 120px">
			<tr>
				<td width="353" height="259" align="center" valign="bottom"
					background="mamis/image/login_1.gif">
					<table width="90%" border="0" cellspacing="3" cellpadding="0">
						<tr>
							<td align="right" valign="bottom" style="color: #05B8E4">
								Admins page
								<a href="${pageContext.request.contextPath }/jsp/main.action" target="_blank">website</a>
								  v 1.0 2010
							</td>
						</tr>
					</table>
				</td>
				<td width="195" background="mamis/image/login_2.gif">
					<form action="adminLogin.action" method="post" onSubmit="return chk(this);" name="NETSJ_Login">
						<table width="190" height="106" border="0" align="center"
							cellpadding="2" cellspacing="0">
							<tr>
								<td height="50" colspan="2" align="left">
									&nbsp;
								</td>
							</tr>
							<tr>
								<td width="60" height="30" align="left">
									登陆名称
								</td>
								<td>
									<input name="loginname" type="TEXT"
										style="background: url(mamis/image/login_6.gif) repeat-x; border: solid 1px #27B3FE; height: 20px; background-color: #FFFFFF"
										id="UserName" size="14">
								</td>
							</tr>
							<tr>
								<td height="30" align="left">
									登陆密码
								</td>
								<td>
									<input name="password" TYPE="PASSWORD"
										style="background: url(mamis/image/login_6.gif) repeat-x; border: solid 1px #27B3FE; height: 20px; background-color: #FFFFFF"
										id="Password" size="16">
								</td>
							</tr>
							<tr>
								<td height="30">
									验 证 码
								</td>
								<td>
									<input name="imgcode" type="text" id="Code" size="4"
										style="background: url(mamis/image/login_6.gif) repeat-x; border: solid 1px #27B3FE; height: 20px; background-color: #FFFFFF"
										maxlength="4">
									<img src="checkCode.action?new Date()" width="50" height="24" onclick="this.src=this.src +'?'+new Date();"/>
								</td>
							</tr>
							<tr>
								<td height="40" colspan="2" align="center">
									<img src="mamis/image/tip.gif" width="16" height="16">
									请勿非法登陆！
								</td>
							<tr>
								<td colspan="2" align="center">
									<input type="submit" name="submit"
										style="background: url(mamis/image/login_5.gif) no-repeat"
										value=" 登  陆 ">
									<input type="reset" name="Submit"
										style="background: url(mamis/image/login_5.gif) no-repeat"
										value=" 取  消 ">
								</td>
							<tr>
								<td height="5" colspan="2">
								</td>
						</table>
					</form>
				</td>
				<td width="133" background="mamis/image/login_3.gif">
					&nbsp;
				</td>
			</tr>
			<tr>
				<td height="161" colspan="3" background="mamis/image/login_4.gif" align="center">
				</td>
			</tr>
		</table>
	</body>
</html>