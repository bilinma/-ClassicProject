<%@page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.fckeditor.net" prefix="FCK" %>
<%@taglib prefix="s" uri="/struts-tags"%>

<HTML>
	<HEAD>
		<TITLE>添加信息</TITLE>
		<link rel="stylesheet" href="css/css.css" type="text/css">
		<link rel="stylesheet" href="css/css.css" type="text/css">
	</HEAD>
	<script src="js/date.js" type="text/javascript"></script>
	<script type="text/javascript">
			function validateForm(f){
				var ret =  validateSelect(f['moduleid'])&& validateName(f['inforname']) ;
				return ret;
			}
			function validateSelect(m){
			 var option=document.getElementById('moduleid').options;
			 if(option.value!=-1){
			 	return true;
			 }
			 alert('栏目必须选择!!!');
			 return false;
		}	
			function validateName(m){
				m.className='';
				var s=document.getElementById('infor_name');
				s.innerHTML='';
				if(m.value.length==0){
					m.className='err';
					s.style.color="#f00";
					s.innerHTML='信息名必须输入';
					return false;
				}else{
					return true;
				}
			}

		function changeSelect(id){	    
		    var root ;
		    xml = new ActiveXObject("Msxml.DOMDocument");
		    xml.async = false;
		    xml.load("sectionData.jsp?id="+id);
		    
		    root=xml.documentElement;
		    var opValue="";
		    var opText ="";
		    var formname = eval(document.form1).sectionid ;
		    formname.options.length = 0;
		   // formname[formname.options.length]=  new Option("--请选择--","-1");
		      for(var i=0 ;i< root.childNodes.length ;i++){
		        opValue = root.childNodes(i).attributes.getNamedItem("value").nodeValue;
		        opText = root.childNodes(i).attributes.getNamedItem("text").nodeValue;
		       formname.options[formname.options.length]=new Option(opText,opValue);
		      }             
		 }	     
	</script>
	<script language="javascript">
		init();
	</script>
	<BODY>
		<form name="updateInformation" method="post"
			action="updateInformation.action" name="form1" id="form1" onsubmit="return validateForm(this)">
			<table width="90%" align="center" border="0" cellspacing="0"
				cellpadding="0">
				<tr>
					<td align="center">
						<strong><font color="blue">信 息 修 改</font></strong>
					</td>
				</tr>
			</table>
			<table cellSpacing=1 cellPadding=3 width="100%" align=center
				border="1">
				<tr>
					<td width="10%" class="td1">
						栏目名称：
					</td>
					<td align="left">
						<select style="WIDTH: 170px"
							onchange="changeSelect(this.options.value)" name="moduleid" id="moduleid">
							  <option value="-1">--栏目--</option>  
							<s:iterator value="#session.modules">
								<c:choose>
										<c:when test="${id==information.module.id }">
											<option value="${id }" selected="selected" ><s:property value="%{name}"/></option>
										</c:when>
										<c:otherwise>
											<option value="${id }" ><s:property value="%{name}"/></option>
										</c:otherwise>
									</c:choose>
							</s:iterator>
						</select>
						<font color=red>*</font>
					</td>
					<td width="10%" class="td1">
						子栏目名称：
					</td>
					<td align="left">
						<select name="sectionid" id="sectionid" style="WIDTH: 170px">
							<s:iterator value="#session.sections">
								<c:choose>
									<c:when test="${id==information.section.id }">
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
					<td align="left" width="10%" class="td1">
						标题：
					</td>
					<td align="left" width="40%" colspan="3">
						<input type="text" name="name" id="name" value="${information.name }" onblur="validateName(this)" size="120">
						<span id="infor_name" class="msg"></span>
						<font color=red>*</font>
					</td>
				<tr>
				<tr>
					<td align="center" colspan="4" class="td1">
							信息内容：
					</td>
				</tr>
				<tr>
					<td align="left" colspan="4" >
						<FCK:editor instanceName="context" height="400">
							<jsp:attribute name="value">
								${information.context }					
							</jsp:attribute>
						</FCK:editor>
					</td>
				</tr>
				<tr>
					<td align="left" width="10%" class="td1" >
						作者：
					</td>
					<td align="left" width="40%" colspan="3">
						<input type="text" name="author" id="r_name"
							value="${information.author }">
					</td>
				<tr>
				<tr>
					<td align="left" width="10%" class="td1">
						审查人：
					</td>
					<td align="left" width="40%" colspan="3">
						<input type="text" name="autdit" id="r_name"
							value="${information.autdit }">
					</td>
				<tr>
				<tr>
					<td align="left" width="10%" class="td1">
						发布单位：
					</td>
					<td align="left" width="40%" colspan="3">
						<input type="text" name="releaseunit" id="r_name"
							value="${information.releaseunit }">
					</td>
				<tr>
				<tr>
					<td align="left" width="10%" class="td1">
						创建日期：
					</td>
					<td align="left" width="40%" colspan="3">
						<input type="text" name="createdate" size="20" maxlength="15"  readonly value="${information.createdate }">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" name="change2" value="展  开"  onclick="show_cele_date(change2,'','',createdate)">
					</td>
				</tr>
				<tr>
					<td align="left" width="10%" class="td1">
						附件更新
					</td>
					<td align="left" width="40%" colspan="3">
						<a href="${pageContext.request.contextPath}/pages/mamis/listFile.action?inforid=${information.id }">更新附件</a>
					</td>
					
				</tr>
				<tr>
					<td height=30 colspan="4" align="center">
						<input type="button" name="btnBack" class="btn" value=" 返 回 "onclick="history.go(-1)">&nbsp;
						<input type="submit" name="btnSave" class="btn" value=" 保 存 " onclick="alert('更新成功！')">
					</td>
				</tr>
			</table>
		</form>
	</BODY>
</HTML>