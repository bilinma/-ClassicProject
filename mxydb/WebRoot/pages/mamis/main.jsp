<%@page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=GBK">
		<title>延安市中小企业信用担保网站后台系统</title>
		<link rel="stylesheet" href="css/css.css" type="text/css">
		<style type="text/css">
		</style>
		<script language="javascript">
			function stop(){
				return false;
			}
			document.oncontextmenu=stop;
		</script>

	</head>
	<frameset rows="100,*,0" cols="*" framespacing="0" frameborder="yes" border="0">
		<frame src="top.jsp" name="topFrame" frameborder="0" scrolling="no" noresize>
		<frameset name="left" rows="*" cols="225,*" framespacing="0" frameborder="NO" border="0">			
			<frame src="left.jsp" name="leftFrame" frameborder="no"
				scrolling="no" noresize marginwidth="0" marginheight="0">			
			<frameset rows="*" frameborder="NO" border="0" framespacing="0">				
				<frame src="welcome.jsp" name="Main" id="Main" frameborder="0" scrolling="auto">			
			</frameset>
		</frameset>
	</frameset>
	<noframes></noframes>
</html>
