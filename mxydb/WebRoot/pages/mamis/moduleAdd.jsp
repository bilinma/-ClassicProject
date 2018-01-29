<%@page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="s" uri="/struts-tags"%>

<html>
	<head>
		<title>栏目管理</title>
		<link rel="stylesheet" href="css/css.css" type="text/css">
		<link rel="stylesheet" type="text/css"href="css/styles.css">
		<link type="text/css" rel="stylesheet" href="css/tabs.css" />
			<script>
			function validateForm(f){
				var ret = validateName(f['name']);
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
	</head>
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
			<form name="addModule" method="POST" action="addModule.action" onsubmit="return validateForm(this)">
				<table width="60%" id="table1" cellpadding="0" cellspacing="0"
					align="center" border="1" class="line1" height="200px">
					<tr class="line2">
						<th height="20" colspan="6"> 
							 添加模块信息
						<br></th>
					</tr>
					<tr>
						<td width="10%" class="td1">
							&nbsp;&nbsp;模块名：
						</td>
						<td width="15%">
							<input type="text" name="name"  id="name" value="${name }" onblur="validateName(this)">
							<font color=red>*</font>
							<span id="s_tip" class="msg"></span>
						</td>
					<tr>
						<td width="10%" class="td1">
							&nbsp;&nbsp;模块链接：
						</td>
						<td width="15%">
							<input type="text" name="url"  id="url" value="${url }">
							<font color=red>*</font>
							<span id="s_tip" class="msg"></span>
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
				<s:if test="#session.addModuleflag">
					<font color="green" size="4">
						<s:property value="%{getText('addmodule.success')}"/>
					</font>
				</s:if>
				<s:else>
					<font color="red" size="4">
						<s:property value="%{getText('addmodule.fail')}"/>
					</font>
				</s:else>
			</div>
	</body>
</html>
