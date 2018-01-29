<%@page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="s" uri="/struts-tags" %>

<html>
	<head>
		<title>子栏目管理</title>
		<link type="text/css" rel="stylesheet" href="css/tabs.css" />
		<link rel="stylesheet" href="css/css.css" type="text/css">
	</head>
	<script type="text/javascript">
			function validateForm(f){
				var ret = validateName(f['name'])&&validateAuthor(f['author']);
				return ret;
			}
			function validateName(m){
				m.className='';
				var s=document.getElementById('infor_name');
				s.innerHTML='';
				if(m.value.length==0){
					m.className='err';
					s.style.color="#f00";
					s.innerHTML='子栏目名必须输入';
					return false;
				}else{
					return true;
				}
			}
			function validateAuthor(m){
				m.className='';
				var s=document.getElementById('infor_author');
				s.innerHTML='';
				if(m.value.length==0){
					m.className='err';
					s.style.color="#f00";
					s.innerHTML='请填写子栏目作者!';
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
			<form name="addSection" method="POST" action="addSection.action" onsubmit="return validateForm(this)">
				<table width="60%" id="table1" cellpadding="0" cellspacing="0"
					align="center" border="1" class="line1" height="200px">
					<tr class="line2">
						<th height="20" colspan="6"> 
							 添加子栏目信息
						<br></th>
					</tr>
					<tr>
						<td width="10%" class="td1">
							&nbsp;&nbsp;栏目名：
						</td>
						<td width="15%">
							<input type="text" name="name" value="${name }" id="name" onblur="validateName(this)">
							<span id="infor_name"class="msg"></span>
							<font color=red>*</font>
						</td>
					</tr>
					<tr>
						<td width="10%" class="td1">
							&nbsp;&nbsp;栏目作者：
						</td>
						<td width="15%">
							<input type="text" name="author" id="author" value="${ADMIN.name }" onblur="validateAuthor(this)">
							<span id="infor_author"class="msg"></span>
							<font color=red>*</font>
						</td>
					</tr>					
					<tr>
						<td width="10%" class="td1" >&nbsp;&nbsp;模块名称：</td>
						<td align="left" >
							<select name="moduleid" style="WIDTH:170px">
								<s:iterator value="#session.modules">					
									<option value="${id }"><s:property value="%{name}"/></option>
								</s:iterator>	
							</select>
							<font color=red>*</font>
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
				<s:if test="#session.addSectionflag">
					<font color="green" size="4">
						<s:property value="%{getText('addsection.success')}"/>
					</font>
				</s:if>
				<s:else>
					<font color="red" size="4">
						<s:property value="%{getText('addsection.fail')}"/>
					</font>
				</s:else>
			</div>
	</body>
</html>
