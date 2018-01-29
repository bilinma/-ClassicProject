<%@page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.fckeditor.net" prefix="FCK" %>
<%@taglib prefix="s" uri="/struts-tags"%>

<HTML>
	<HEAD>
		<TITLE>添加公告信息</TITLE>
		<link rel="stylesheet" href="css/css.css" type="text/css">
		<link rel="stylesheet" href="css/css.css" type="text/css">	
	</HEAD>
	<script src="js/date.js" type="text/javascript"></script>
	<script type="text/javascript">
		function validateName(m){
				m.className='';
				var s=document.getElementById('infor_name');
				s.innerHTML='';
				if(m.value.length==0){
					m.className='err';
					s.style.color="#f00";
					s.innerHTML='公告名必须输入';
					return false;
				}else{
					return true;
				}
		}
   
	</script>
	<script language="javascript">
		init();
	</script>
	<BODY>
		<form name="addAffiche" method="post" action="addAffiche.action">
			<table width="90%" align="center" border="0" cellspacing="0"
				cellpadding="0">
				<tr >
					<td align="center" >
						<strong><font color="blue">公 告 添 加</font></strong>
					</td>
				</tr>
			</table>
			<table cellSpacing=1 cellPadding=3 width="100%" align=center
				border="1">
				<tr>
					<td align="left" width="12%" class="td1" >
						标题：
					</td>
					<td align="left" width="40%">
						<input type="text" name="name" id="name" onblur="validateName(this)" value="${name }" size="100">&nbsp;
						<span id="infor_name"class="msg"></span>
						<font color=red>*</font>
					</td>
				<tr>
				<tr>
					<td align="center" colspan="4" class="td1">
						内容：
					</td>
				</tr>
				<tr>
					<td align="left" colspan="4">
						<FCK:editor instanceName="context" height="400">
							<jsp:attribute name="value">
								${context }				
							</jsp:attribute>
						</FCK:editor>
					</td>
				</tr>
				<tr>
					<td align="left" width="12%" class="td1">
						作者：
					</td>
					<td align="left" width="40%">
						<input type="text" name="author" id="author" value="${ADMIN.name }">
						&nbsp;
						<font color=red>*</font>
					</td>
				<tr>
				<tr>
					<td align="left" width="12%" class="td1">
						审稿人:
					</td>
					<td align="left" width="40%">
						<input type="text" name="autdit" id="autdit" value="${autdit }">
						&nbsp;
					</td>
				<tr>
				<tr>
					<td align="left" width="12%" class="td1">
						发布单位:
					</td>
					<td align="left" width="40%">
						<input type="text" name="releaseunit" id="releaseunit" value="${releaseunit }">
						&nbsp;
					</td>
				<tr>
				<tr>
					<td align="left" width="12%" class="td1">
						发布日期:
					</td>
					<td align="left" width="40%">
						<input type="text" name="createdate" size="20" maxlength="15"  readonly value="2010-05-01">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" name="change2" value="展  开"  onclick="show_cele_date(change2,'','',createdate)">
						<font color=red>*</font>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td height=30 colspan="4" align="center">
						<input type="button" name="btnBack" class="btn" value=" 返 回 "
							onclick="history.go(-1)">
						&nbsp;
						<input type="submit" name="btnSave" class="btn" value=" 保 存 ">
					</td>
				</tr>
			</table>
		</form>
		<div align="center">
			<s:if test="#session.addAfficheflag">
				<font color="green" size="4">
					<s:property value="%{getText('addaffiche.success')}"/>
				</font>
			</s:if>
		</div>
	</BODY>
</HTML>