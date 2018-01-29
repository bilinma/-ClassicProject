<%@page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
	<head>
		<title>栏目信息管理</title>
		<link type="text/css" rel="stylesheet" href="css/tabs.css" />
		<link rel="stylesheet" href="css/css.css" type="text/css">
	</head>
	<script>
		function validateForm(f){
			var ret = validateUserName(f['name']);
			return ret;
		}
		function validateName(m){
			var s=document.getElementById('s_tip');
			s.innerHTML='';
			if(m.value.length==0){
				s.style.color="#f00";
				s.innerHTML='栏目名必须输入';
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
			<form name="updateModule" method="POST" action="updateModule.action">
				<table width="60%" id="table1" cellpadding="0" cellspacing="0"
					align="center" border="1" class="line1" height="200px">
					<tr class="line2">
						<th height="20" colspan="6"> 
							 修改模块信息
						<br></th>
					</tr>
					<tr>
						<td width="10%" class="td1" class="line2">
							&nbsp;&nbsp;模块ID：
						</td>
						<td width="15%">
							<input type="text" name="id"  value="${module.id }"
								readonly="readonly" id="uName">
							<font color=red>*</font>
						</td>
					</tr>
					<tr>
						<td width="10%" class="td1">
							&nbsp;&nbsp;模块名：
						</td>
						<td width="15%">
							<input type="text" name="name" value="${module.name }" onblur="validateName(this)">
							<span id="s_tip" class="msg"></span>
							<font color=red>*</font>
						</td>
					<tr>
						<td width="10%" class="td1">
							&nbsp;&nbsp;模块链接:
						</td>
						<td width="15%">
							<input type="text" name="url"  value="${module.url }" >
							<font color=red>*</font>
						</td>
					</tr>
					<tr>
						<td colspan="6" align="center">
							<input type="button" class="btn" value=" 返 回 " onclick="history.go(-1)" />&nbsp;
							<input type="submit" class="btn" value=" 提 交 " onclick="alert('更新成功！')"/>
						</td>
					</tr>
				</table>
			</form>
	</body>
</html>
