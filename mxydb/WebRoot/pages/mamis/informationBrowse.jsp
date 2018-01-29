<%@page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="s" uri="/struts-tags" %>

<html>
	<head>
		<title>信息列表</title>
		<link rel="stylesheet" href="css/css.css" type="text/css">
		<script type="text/javascript">	
			function doInitAdd(){
				with(document.forms[0]){
					self.location="informationLoad.action";
				}
			}		
		</script>
	</head>
	<body>
		<table width="90%" align="center" border="0" cellspacing="0"
			cellpadding="0">
			<tr>
				<td>

				</td>
			</tr>
		</table>
		<form name="selectInfor" method="post" action="selectInfor.action">
		<table border="1" width="100%" id="table1">
			<tr>
				<td width="80%">
					查询条件：&nbsp;&nbsp;
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
					&nbsp;&nbsp; 子栏目：
					<input type="text" name="sectionname"  value="${sectionname }" id="sectionname" >
					&nbsp;&nbsp;信息名：
					<input type="text" name="inforname"  value="${inforname }" id="inforname" >
					&nbsp;
				</td>
				<!-- <td id="td">

					&nbsp; 信息内容：
					<input type="text" name="inforcontext" value="" id="userName">
				</td> -->
				<td align="center">
					<input type="submit" class="btn" value="查 询">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button" class="btn" value="新 建"onclick="self.location='informationAdd.jsp'">
					
				</td>
			</tr>
		</table>
		</form>
		<br>
		<table border="1" width="100%" id="table1" cellspacing="0"
			cellpadding="0">
			<tr>
				<th align="center" width="5%">
					信息ID
				</th>
				<th align="center" width="15%">
					标题
				</th>
				<th align="center" width="5%">
					栏目
				</th>
				<th align="center" width="5%">
					子栏目
				</th>
				<th align="center" width="5%">
					作者
				</th>
				<th align="center" width="5%">
					审稿人
				</th>
				<th align="center" width="5%">
					发布时间
				</th>
				<th align="center" width="5%">
					浏览次数
				</th>
				<th align="center" width="5%">
					操作
				</th>
			</tr>
			<c:forEach var="information" items="${XYDB_INFORMATIONS}">
				<c:choose>
					<c:when test="${information.id==inforupdateid}">
					<tr bgcolor="#99CCCC">
						<td align="center">
							${information.id }
						</td>
						<td align="center">
							${information.name }
						</td>
						<td align="center">
							${information.module.name}
						</td>
						<td align="center">
							${information.section.name}
						</td>
						<td align="center">
							${information.author }
						</td>
						<td align="center">
							${information.autdit }
						</td>
						<td align="center">
							${information.createdate }
						</td>
						<td align="center">
							${information.scansum}
						</td>
	
						<td align="center">
							<a href="findInformation.action?id=${information.id }"> <img
									src="image/edit.gif" width="15" height="15" border="0"> 
							</a>&nbsp;
							<a href="deleteInformation.action?id=${information.id }"
								onclick="return confirm('是否确认删除?')"> <img
									src="image/delete.gif" width="15" height="15" border="0">
							</a>&nbsp;
						</td>
					</tr>
					</c:when>
					<c:otherwise>
					<tr >
						<td align="center">
							${information.id }
						</td>
						<td align="center">
							${information.name }
						</td>
						<td align="center">
							${information.module.name}
						</td>
						<td align="center">
							${information.section.name}
						</td>
						<td align="center">
							${information.author }
						</td>
						<td align="center">
							${information.autdit }
						</td>
						<td align="center">
							${information.createdate }
						</td>
						<td align="center">
							${information.scansum}
						</td>
	
						<td align="center">
							<a href="findInformation.action?id=${information.id }"> <img
									src="image/edit.gif" width="15" height="15" border="0"> 
							</a>&nbsp;
							<a href="deleteInformation.action?id=${information.id }"
								onclick="return confirm('是否确认删除?')"> <img
									src="image/delete.gif" width="15" height="15" border="0">
							</a>&nbsp;
						</td>
					</tr>
				</c:otherwise>
				</c:choose>
			</c:forEach>
			<tr bgcolor="#ffffff">
				<td colspan="7" align="center">
					${pagenav } 
					<!--  转到 第
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
					条-->
				</td>
			</tr>
		</table>
	</body>
</html>