<%@page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
	<head>
		<title>栏目管理</title>
		<link rel="stylesheet" href="css/css.css" type="text/css">
	</head>
	<body topmargin="0" leftmargin="0">
		<form name="roleManageForm" method="post" action="roleManage.do">
			<input type="hidden" name="maRolePO.id" value="" id="roleId">
			<table width="90%" align="center" border="0" cellspacing="0"
				cellpadding="0">
				<tr>
					<td>


					</td>
				</tr>
			</table>
			<table width="100%" align="center" border="1">
				<tr>
					<td align="center" colspan="3">
						栏目浏览
					</td>
					<td colspan="3" align="center">
						<input type="button" class="btn" value=" 新 建 "
							onclick="self.location='moduleAdd.jsp'">
					</td>
				</tr>
				<tr>
					<th width="5%" height="20" align="center">
						栏目ID
					</th>
					<th width="10%" height="20" align="center">
						栏目名
					</th>
					<th width="10%" height="20" align="center">
						栏目跳转URL
					</th>
					<th width="10%" height="20" align="center">
						操作
					</th>
				</tr>
				<c:forEach var="module" items="${XYDB_MODULES}">
				<c:choose>
				<c:when test="${module.id ==moduleupdateid }">
				<tr bgcolor="#99CCCC">
					<td height="20" align="center">
						${module.id }
					</td>
					<td height="20" align="center">
						${module.name }
					</td>
					<td height="20" align="center">
						${module.url }
					</td>

					<td height="20" align="center">
						<a href="findModule.action?id=${module.id }"  > 
						<img src="image/edit.gif" width="15" height="15" border="0"> </a>
						<a href="deleteModule.action?id=${module.id }" onclick="return confirm('是否确认删除?')"> 
						<img src="image/delete.gif" width="15" height="15" border="0">
						</a>
					</td>
				</tr>
				</c:when>
				<c:otherwise>
				<tr >
					<td height="20" align="center">
						${module.id }
					</td>
					<td height="20" align="center">
						${module.name }
					</td>
					<td height="20" align="center">
						${module.url }
					</td>

					<td height="20" align="center">
						<a href="findModule.action?id=${module.id }"  > 
						<img src="image/edit.gif" width="15" height="15" border="0"> </a>
						<a href="deleteModule.action?id=${module.id }" onclick="return confirm('是否确认删除?')"> 
						<img src="image/delete.gif" width="15" height="15" border="0">
						</a>
					</td>
				</tr>
				</c:otherwise>
				</c:choose>
				</c:forEach>
			</table>
		</form>
	</body>
</html>
