<%@page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="s" uri="/struts-tags" %>

<html>
	<head>
		<title>子栏目列表</title>
		<link rel="stylesheet" href="css/css.css" type="text/css">
		<link rel="stylesheet" href="css/css.css" type="text/css">
	</head>
	<body>
		<form action="selectSection.action" method="post">
			<table width="90%" align="center" border="0" cellspacing="0"
				cellpadding="0">
				<tr>
					<td>

					</td>
				</tr>
			</table>

			<table border="1" width="100%" id="table1">
				<tr>
					<td width="80%" id="td">
						查询条件：
						&nbsp;&nbsp; 栏目：
						<select name="moduleid" style="WIDTH:120px">
							<s:iterator value="#session.modules">					
								<c:choose>
									<c:when test="${id==moduleid }">
										<option value="${id }" selected="selected"><s:property value="%{name}"/></option>
									</c:when>
									<c:otherwise>
										<option value="${id }" ><s:property value="%{name}"/></option>
									</c:otherwise>
								</c:choose>
							</s:iterator>	
						</select>
						<!--  <input type="text" name="modulename" value="${modulename }" id="modulename">-->
						&nbsp;&nbsp;子栏目名：
						<input type="text" name="sectionname" value="${sectionname }" id="sectionname">
					</td>

					<td align="center">
						<input type="submit" class="btn" value="查 询" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" class="btn" value="新 建" onclick="self.location='sectionAdd.jsp'">
					</td>
				</tr>
			</table>
			<br>
			<table border="1" width="100%" id="table1" cellspacing="0"
				cellpadding="0">
				<tr>
					<th align="center" width="5%">
						子栏目ID
					</th>
					<th align="center" width="10%">
						子栏目名
					</th>
					<th align="center" width="10%">
						栏目
					</th>
					<th align="center" width="10%">
						子栏目创建者
					</th>
					<th align="center" width="10%">
						操作
					</th>
				</tr>
				<c:forEach var="section" items="${XYDB_SECTIONS}">
				<c:choose>
				<c:when test="${section.id==sectionupdateid }">
				<tr bgcolor="#99CCCC">
					<td align="center">
						${section.id }
					</td>
					<td align="center">
						${section.name }
					</td>
					<td align="center"> 
						${section.module.name} 
					</td>
					<td align="center">
						${section.author }
					</td>
					<td align="center">
						<a href="findSection.action?id=${section.id }"> 
						<img src="image/edit.gif" width="15" height="15" border="0"> </a>
						<a href="deleteSection.action?id=${section.id }" onclick="return confirm('是否确认删除?')"> 
						<img src="image/delete.gif" width="15" height="15" border="0">
						</a>
					</td>
				</tr>
				</c:when>
				<c:otherwise>
				<tr >
					<td align="center">
						${section.id }
					</td>
					<td align="center">
						${section.name }
					</td>
					<td align="center"> 
						${section.module.name} 
					</td>
					<td align="center">
						${section.author }
					</td>
					<td align="center">
						<a href="findSection.action?id=${section.id }"> 
						<img src="image/edit.gif" width="15" height="15" border="0"> </a>
						<a href="deleteSection.action?id=${section.id }" onclick="return confirm('是否确认删除?')"> 
						<img src="image/delete.gif" width="15" height="15" border="0">
						</a>
					</td>
				</tr>
				</c:otherwise>
				</c:choose>
				</c:forEach>
				<tr bgcolor="#ffffff">
					<td colspan="6" align="center">
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