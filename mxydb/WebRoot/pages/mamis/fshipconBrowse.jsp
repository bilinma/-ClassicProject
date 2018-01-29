<%@page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
	<head>
		<title>友情链接管理</title>
		<link rel="stylesheet" href="css/css.css" type="text/css">
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
						友情链接浏览
					</td>
					<td colspan="3" align="right">
						<input type="button" class="btn" value=" 新 建 "
							onclick="self.location='fshipconAdd.jsp'">
					</td>
				</tr>
				<tr>
					<th width="5%" height="20" align="center">
						链接ID
					</th>
					<th width="10%" height="20" align="center">
						链接名称
					</th>
					<th width="10%" height="20" align="center">
						链接地址
					</th>
					<th width="5%" height="20" align="center">
						操作
					</th>
				</tr>
				<c:forEach var="friendshipConn" items="${XYDB_FSHIPCONNS}">
				<c:choose>
				<c:when test="${friendshipConn.id ==friendshipConnupdateid }">
				<tr bgcolor="#99CCCC">
					<td height="20" align="center">
						${friendshipConn.id }
					</td>
					<td height="20" align="center">
						${friendshipConn.name }
					</td>
					<td height="20" align="center">
						${friendshipConn.url }
					</td>

					<td height="20" align="center">
						<a href="findFriendshipConn.action?id=${friendshipConn.id }" > 
							<img src="image/edit.gif" width="15" height="15" border="0"/> </a>
						<a href="deleteFriendshipConn.action?id=${friendshipConn.id }" onclick="return confirm('是否确认删除?')"> 
							<img src="image/delete.gif" width="15" height="15" border="0"/>
						</a>
					</td>
				</tr>
				</c:when>
				<c:otherwise>
				<tr>
					<td height="20" align="center">
						${friendshipConn.id }
					</td>
					<td height="20" align="center">
						${friendshipConn.name }
					</td>
					<td height="20" align="center">
						${friendshipConn.url }
					</td>

					<td height="20" align="center">
						<a href="findFriendshipConn.action?id=${friendshipConn.id }" > 
							<img src="image/edit.gif" width="15" height="15" border="0"/> </a>
						<a href="deleteFriendshipConn.action?id=${friendshipConn.id }" onclick="return confirm('是否确认删除?')"> 
							<img src="image/delete.gif" width="15" height="15" border="0"/>
						</a>
					</td>
				</tr>
				</c:otherwise>
				</c:choose>
				</c:forEach>
				<tr bgcolor="#ffffff">
					<td colspan="6" align="center">
						${pagenav }
 					<!--  	转到 第
						<select class='sel' onchange="topagesubmit(this.value)">
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
						条 -->
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
