<%@page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<html>
	<head>
		<title>用户列表</title>
		<link rel="stylesheet" href="css/css.css" type="text/css">
	</head>
	<body>
		<table width="90%" align="center" border="0" cellspacing="0"
			cellpadding="0">
			<tr>
				<td>


				</td>
			</tr>
		</table>
		<form name="selectAdmin" method="post" action="selectAdmin.action">
	  	<table width="100%" align="center" border="1">
			<tr>
				<td id="td">
					查询条件：&nbsp;&nbsp; 管理员名称：
					<input type="text" name="adminname" value="${adminname }" id="adminname">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</td>
				<td width="20%"align="center">
					<input type="submit" class="btn" value="查 询" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button" class="btn" value="新 建" onclick="self.location='adminAdd.jsp'">
				</td>
			</tr>
		</table>
		</form>
		<table border="1" width="100%" id="table1" cellspacing="0"
			cellpadding="0">
			<tr>
				<th align="center" width="5%">
					管理员ID
				</th>
				<th align="center" width="10%">
					管理员名称
				</th>
				<th align="center" width="10%">
					登录名
				</th>
				<th align="center" width="10%">
					登录密码
				</th>
				<th align="center" width="10%">
					联系电话
				</th>
				<th align="center" width="10%">
					Email
				</th>
				<th align="center" width="10%">
					操作
				</th>
			</tr>
			<c:forEach var="admin" items="${XYDB_ADMINS}">
			<c:choose>
				<c:when test="${admin.id ==adminupdateid }">
				<tr bgcolor="#99CCCC">
					<td align="center">
						${admin.id }
					</td>
					<td align="center">
						${admin.name }
					</td>
					<td align="center">
						${admin.loginname }
					</td>
					<td align="center">
						${admin.loginpassword }
					</td>
					<td align="center">
						${admin.phone }
					</td>
					<td align="center">
						${admin.email }
					</td>
					<td align="center">
						<a href="findAdmin.action?id=${admin.id }"> <img
								src="image/edit.gif" width="15" height="15" border="0"> </a>
						<a href="deleteAdmin.action?id=${admin.id }"
							onclick="return confirm('是否确认删除?')"> <img
								src="image/delete.gif" width="15" height="15" border="0">
						</a>
					</td>
				</tr>
				</c:when>
				<c:otherwise>
				<tr>
					<td align="center">
						${admin.id }
					</td>
					<td align="center">
						${admin.name }
					</td>
					<td align="center">
						${admin.loginname }
					</td>
					<td align="center">
						${admin.loginpassword }
					</td>
					<td align="center">
						${admin.phone }
					</td>
					<td align="center">
						${admin.email }
					</td>
					<td align="center">
						<a href="findAdmin.action?id=${admin.id }"> <img
								src="image/edit.gif" width="15" height="15" border="0"> </a>
						<a href="deleteAdmin.action?id=${admin.id }"
							onclick="return confirm('是否确认删除?')"> <img
								src="image/delete.gif" width="15" height="15" border="0">
						</a>
					</td>
				</tr>
				</c:otherwise>
			</c:choose>
			</c:forEach>
			<tr bgcolor="#ffffff">
				<td colspan="7" align="center">
					${pagenav } 
				<!--  	转到 第<select class='sel' onchange="topagesubmit(this.value)">
						<option value="1" selected>
							1
						</option>
						<option value="2">
							2
						</option>
						<option value="3">
							3
						</option>
						<option value="4">
							4
						</option>
						<option value="5">
							5
						</option>
						<option value="6">
							6
						</option>
						<option value="7">
							7
						</option>
						<option value="8">
							8
						</option>
						<option value="9">
							9
						</option>
						<option value="10">
							10
						</option>
					</select>
					页 每页
					<select style='height: 14px; border: none;' class='sel'
						onchange="toSizeSubmit(this.value)">
						<option value="10" selected>
							10
						</option>
						<option value="20">
							20
						</option>
						<option value="30">
							30
						</option>
						<option value="40">
							40
						</option>
						<option value="50">
							50
						</option>
						<option value="60">
							60
						</option>
					</select>
					条-->
				</td>
			</tr>
		</table>
		<div align="center">
				<s:if test="#session.deleteAdminflag">
					<font color="green" size="4">
						<s:property value="%{getText('deleteadmin.success')}"/>
					</font>
				</s:if>
				<s:else>
					<font color="red" size="4">
						<s:property value="%{getText('deleteadmin.fail')}"/>
					</font>
				</s:else>
		</div>
	</body>
</html>