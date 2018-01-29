<%@page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<html>
	<head>
		<title>用户管理</title>
		<link type="text/css" rel="stylesheet" href="css/tabs.css" />
		<link rel="stylesheet" href="css/css.css" type="text/css">
	</head>
	<script type="text/javascript">
		function validateName(m){
			m.className='';
			var s=document.getElementById('infor_name');
			s.innerHTML='';
			if(m.value.length==0){
				m.className='err';
				s.style.color="#f00";
				s.innerHTML='链接名必须输入';
				return false;
			}else{
				return true;
			}
		}
	</script>
	<body>
		<br>
		<div id="tabp_userinfor" class="ditch-tab-pane"
			style="display: block;">
			<table width="98%" id="table1" cellpadding="0" cellspacing="0"
				align="center" border="0" class="line1">
				<tr>
					<td colspan="6" id="message0">


					</td>
				</tr>
			</table>
			<form name="addFriendshipConn.action" method="POST" action="addFriendshipConn.action">
				<table width="60%" id="table1" cellpadding="0" cellspacing="0"
					align="center" border="1" class="line1" height="200px">
					<tr class="line2">
						<th height="20" colspan="6"> 
							 添加友情链接信息
						<br></th>
					</tr>
					<tr>
						<td width="10%" class="td1">
							&nbsp;&nbsp;链接名：
						</td>
						<td width="15%">
							<input type="text" name="name"  id="name" value="${name }" onblur="validateName(this)">
							<span id="infor_name"class="msg"></span>
							<font color=red>*</font>
						</td>
					<tr>
						<td width="10%" class="td1">
							&nbsp;&nbsp;链接地址：
						</td>
						<td width="15%">
							<input type="text" name="url" id="url" value="${url }">
						</td>
					</tr>
					<tr>
						<td colspan="6" align="center">
							<input type="button" class="btn" value=" 返 回 " onclick="history.go(-1)" />&nbsp;
							<input type="submit" class="btn" value=" 提 交 " />
						</td>
					</tr>
				</table>
			</form>
			<div align="center">
				<s:if test="#session.addFshipconflag">
					<font color="green" size="4">
						<s:property value="%{getText('addfshipcon.success')}"/>
					</font>
				</s:if>
			</div>
	</body>
</html>
