<%@page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
	<head>
		<title>公告列表</title>
		<link rel="stylesheet" href="css/css.css" type="text/css">
		<script type="text/javascript">
			function doInitAdd(){
				with(document.forms[0]){
					self.location="afficheAdd.jsp";
				}
			}
		</script>
	</head>
	<body>
		<form action="selectAffiche.action" method="post">
			<table width="90%" align="center" border="0" cellspacing="0"
				cellpadding="0">
				<tr>
					<td>

					</td>
				</tr>
			</table>

			<table border="1" width="100%" id="table1">
				<tr>
					<td width="80%">
						查询条件：&nbsp;&nbsp;公告名：
						<input type="text" name=affichename  id="affichename" value="${affichename }">
					</td>
				<!--  	<td id="td">
						
						&nbsp; 公告内容：
						<input type="text" name="userQO.userName" value="" id="userName">
					</td>-->
					<td align="center">
						<input type="submit" class="btn" value="查 询" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" class="btn" value="新 建" onclick="self.location='afficheAdd.jsp'">
					</td>
				</tr>
			</table>
			<br>
			<table border="1" width="100%" id="table1" cellspacing="0"
				cellpadding="0">
				<tr>
					<th align="center" width="3%">
						公告ID
					</th>
					<th align="center" width="15%">
						标题
					</th>
					<th align="center" width="5%">
						作者
					</th>
					<th align="center" width="5%">
						审稿人
					</th>
					<th align="center" width="5%">
						发布日期
					</th>
					<th align="center" width="5%">
						发布单位
					</th>
					<th align="center" width="5%">
						浏览次数
					</th>
					<th align="center" width="5%">
						操作
					</th>
				</tr>
				<c:forEach var="affiche" items="${XYDB_AFFICHES}">
				<c:choose>
				<c:when test="${affiche.id ==afficheupdateid }">
				<tr bgcolor="#99CCCC">
					<td align="center" >
						${affiche.id }
					</td>
					<td align="center">
						${affiche.name }
					</td>
					<td align="center">
						${affiche.author }
					</td>
					<td align="center">
						${affiche.autdit }
					</td>
					<td align="center"> 
						${affiche.createdate } 
					</td>
					<td align="center"> 
						${affiche.releaseunit } 
					</td>
					<td align="center">  
						${affiche.scansum }  
					</td>
					<td align="center">
						<a href="findAffiche.action?id=${affiche.id }"> 
						<img src="image/edit.gif" width="15" height="15" border="0"> </a>
						<a href="deleteAffiche.action?id=${affiche.id }" onclick="return confirm('是否确认删除?')"> 
						<img src="image/delete.gif" width="15" height="15" border="0">
						</a>
					</td>
				</tr>
				</c:when>
				<c:otherwise>
				<tr>
					<td align="center" >
						${affiche.id }
					</td>
					<td align="center">
						${affiche.name }
					</td>
					<td align="center">
						${affiche.author }
					</td>
					<td align="center">
						${affiche.autdit }
					</td>
					<td align="center"> 
						${affiche.createdate } 
					</td>
					<td align="center"> 
						${affiche.releaseunit } 
					</td>
					<td align="center">  
						${affiche.scansum }  
					</td>
					<td align="center">
						<a href="findAffiche.action?id=${affiche.id }"> 
						<img src="image/edit.gif" width="15" height="15" border="0"> </a>
						<a href="deleteAffiche.action?id=${affiche.id }" onclick="return confirm('是否确认删除?')"> 
						<img src="image/delete.gif" width="15" height="15" border="0">
						</a>
					</td>
				</tr>
				</c:otherwise>
				</c:choose>
				</c:forEach>
				<tr bgcolor="#ffffff">
					<td colspan="8" align="center">
						${pagenav }
 					<!-- 	转到 第
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