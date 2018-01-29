<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>Struts 2 File Upload</title>
		<link rel="stylesheet" href="css/css.css" type="text/css">
		<link type="text/css" rel="stylesheet" href="css/tabs.css" />
	</head>
	<script>
			function validateForm(f){
				var ret = validateName(f['myFile']);
				return ret;
			}
			function validateName(m){
				var s=document.getElementById('s_tip');
				s.innerHTML='';
				if(m.value.length==0){
					s.style.color="#f00";
					s.innerHTML='必须有正确的文件路径！！！';
					return false;
				}else{
					return true;
				}
			}
	</script>
	<body>
		<form action="addFile.action" method="POST"
			enctype="multipart/form-data" onsubmit="return validateForm(this)">
			<table width="50%" id="table1" cellpadding="0" cellspacing="0"
				align="center" border="1" class="line1" height="200px">
				<tr class="line2">
					<th height="20" colspan="6">
						添加附件
						<br>
					</th>
				</tr>
				<tr>
					<td class="td1">
						文件：
					</td>
					<td>
						<input type="file" name="myFile"  onblur="validateName(this)"/> 
					</td>
				<tr>
					<td class="td1">
						 文件描述：
					</td>
					<td>
						<input type="text" name="caption"  size="35"/>
					</td>
				</tr>
				<tr align="center" >
					<td colspan="2" align="center">
						<input type="button" class="btn" value=" 返 回 " onclick="self.location='listInformation.action?id=${inforid }'" />	
						&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" class="btn" value=" 上 传 "  />	
					</td>
				</tr>
			</table>
			<span id="s_tip" class="msg" ></span>
		</form>
		<table align="center" border="1" width="80%">
			<c:choose>
				<c:when test="${!empty  files}" >
					<tr >
						<td align="center" width="25%">文件名</td>
						<td align="center" width="25%">文件描述</td>
						<td align="center" width="25%">操作</td>
					</tr>
					<c:forEach var="file" items="${files}">
						<tr>
							<td align="center" width="25%">
								${file.name }
							</td>
							<td align="center" width="25%">
								${file.caption }
							</td>
							<td align="center" width="25%">
								<a href="${pageContext.request.contextPath}/pages/mamis/deleteFile.action?id=${file.id }">删除</a>
							</td>
						</tr>
					</c:forEach>
				</c:when>
			</c:choose>
		</table>
	</body>
</html>