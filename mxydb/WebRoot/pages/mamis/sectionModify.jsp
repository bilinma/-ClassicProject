<%@page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="s" uri="/struts-tags" %>

<html>
	<head>
		<title>子栏目管理</title>
		<link rel="stylesheet" href="css/css.css" type="text/css">
		<link type="text/css" rel="stylesheet" href="css/tabs.css"/>
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
			<form name="updateSection" method="POST" action="updateSection.action">
				<table width="60%" id="table1" cellpadding="0" cellspacing="0"
					align="center" border="1" class="line1" height="200px">
					<tr class="line2">
						<th height="20" colspan="6"> 
							 修改子栏目信息
						<br></th>
					</tr>
					<tr>
						<td width="10%" class="td1">
							&nbsp;&nbsp;子栏目ID：
						</td>
						<td width="15%">
							<input type="text" name="id"  id="uId" readonly="readonly" value="${section.id }">
							<font color=red>*</font>
						</td>
					<tr>
					<tr>
						<td width="10%" class="td1">
							&nbsp;&nbsp;栏目名：
						</td>
						<td width="15%">
							<input type="text" name="name"  id="uId" value="${section.name }">
							<font color=red>*</font>
						</td>
					</tr>
					<tr>
						<td width="10%" class="td1">
							&nbsp;&nbsp;栏目作者：
						</td>
						<td width="15%">
							<input type="text" name="author"  id="uId" value="${section.author }">
						</td>
					</tr>
					
					<tr>
						<td width="10%" class="td1" >&nbsp;&nbsp;模块名称：</td>
						<td align="left" >
							<select name="moduleid" style="WIDTH:170px">
								<s:iterator value="#session.modules" status="module">
									<c:choose>
										<c:when test="${id==section.module.id }">
											<option value="${id }" selected="selected"><s:property value="%{name}"/></option>
										</c:when>
										<c:otherwise>
											<option value="${id }" ><s:property value="%{name}"/></option>
										</c:otherwise>
									</c:choose>
								</s:iterator>	
							</select>
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
