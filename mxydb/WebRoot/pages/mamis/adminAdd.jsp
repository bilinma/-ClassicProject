<%@page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="s" uri="/struts-tags"%>

<html>
	<head>
		<title>管理员管理</title>
		<script type="text/javascript" src="js/tabs.js"></script>
		<link rel="stylesheet" href="css/css.css" type="text/css">
		<link type="text/css" rel="stylesheet" href="css/tabs.css" />

		<script language="JavaScript">
			function validateForm(f){
				var ret = validateUserName(f['name']) &&
					validatePwd(f['pwd1']) && validateRepwd(f['pwd2'],f['pwd1']) &&  validatePhone(f['phone']);
				return ret;
			}
			function validateUserName(m){
				m.className='';
				var s=document.getElementById('s_user');
				s.innerHTML='';
				if(m.value.length==0){
					m.className='err';
					s.style.color="#f00";
					s.innerHTML='用户名必须输入!';
					return false;
				}else{
					return true;
				}
			}
			function validateLoginName(m){
				m.className='';
				var s=document.getElementById('s_loginname');
				s.innerHTML='';
				if(m.value.length==0){
					m.className='err';
					s.style.color="#f00";
					s.innerHTML='登陆名必须输入!';
					return false;
				}else{
					return true;
				}
			}
			function validatePwd(m){
				m.className='';
				var s=document.getElementById('s_pwd');
				s.innerHTML='';
				if(m.value.length==0){
					m.className='err';
					s.style.color="#f00";
					s.innerHTML='密码必须输入!';
					return false;
				}else{
					return true;
				}
			}
			function validateRepwd(p1,p2){
				p1.className='';
				var s=document.getElementById('s_repwd');
				s.innerHTML='';
				if(p1.value!=p2.value){
					p1.className='err';
					s.style.color="#f00";
					s.innerHTML='密码必须相同!';
					return false;
				}else{
					return true;
				}
			}
			function validatePhone(m){
				m.className='';
				var s = document.getElementById('s_phone');
				s.innerHTML='';
				var reg = /^0\d{2}-\d{8}$|\d{11}/;
				if(!reg.test(m.value)){
					m.className='err';
					s.style.color="#f00";
					s.innerHTML='电话号码输入有误!';
					return false;
				}else{
					return true;
				}
			}
			function validateEmail0(m){
				var s = document.getElementById('tip');
				s.innerHTML='';
				var reg = /^[a-zA-Z0-9_-]{1,20}@[a-zA-Z0-9_-]{1,5}((\.com)|(\.net))$/;
				if(!reg.test(m.value)){
					s.style.color="#f00";
					s.innerHTML='邮箱格式有误！';
					return false;
				}else{	
					return true;
				}
			}	
		</script>
		<script type="text/javascript" src="js/prototype-1.6.0.3.js"></script>
		<script>
			function moveto(from,to){
				var fromS = $(from);
				//alert(fromS);
				var toS = $(to);
				var ret =false;
				var options = fromS.options;
				for(var i=0;i<options.length;i++){
					if(options[i].selected==true){
						ret = true;
						var text = options[i].text;
						var value = options[i].value;
						option = new Option(text,value);
						toS.options[toS.options.length] = option;
						options[i] = null;
					}
				}
				if(!ret)
					alert('必须选择某个选项');	
			}
			function beforeSubmit(){
				var toS=$('rightSet');
				var options=toS.options;
				for(var i=0;i<options.length;i++){
					options[i].selected=true;
				}
				return true;
			}
		</script>
	</head>
	<body>
		<br>
		<div class="ditch-tab-skin-default">
			<div id="tab_container" class="ditch-tab-container">
				<div class="ditch-tab-wrap">
					<div id="tabp_userinfor-tab" 
						onclick="org.ditchnet.jsp.TabUtils.tabClicked(event);userTabListener(new org.ditchnet.jsp.TabEvent(this));"
						class="ditch-tab ditch-focused">
						<span class="ditch-tab-bg-left"> </span>
						<strong><a href="" onclick="return false;">基本信息添加 </a></strong>
					</div>
					<div id="tabp_userrole-tab"
						onclick="org.ditchnet.jsp.TabUtils.tabClicked(event);userTabListener(new org.ditchnet.jsp.TabEvent(this));"
						class="ditch-tab ditch-unfocused">
						<span class="ditch-tab-bg-left"> </span>
						<strong><a href="" onclick="return false;">管理员权限添加 </a></strong>
					</div>
					<br class="ditch-clear" />
				</div>
				<!-- ditch-tab-wrap -->
				<div class="ditch-tab-pane-wrap">


					<div id="tabp_userinfor" class="ditch-tab-pane"
						style="display: block;" >
						<table width="98%" id="table1" cellpadding="0" cellspacing="0"
							align="center" border="0" class="line1">
							<tr>
								<td colspan="6" id="message0">
								
								</td>
							</tr>
						</table>
						<form name="addAdmin" method="POST" name="f1" id="f1"
							action="addAdmin.action" onsubmit="return validateForm(this)">
							<table width="60%" id="table1" cellpadding="0" cellspacing="0"
								align="center" border="1" class="line1" height="200px">
								<tr class="line2">
									<th height="20" colspan="6">
										管理员基本信息维护
									</th>
								</tr>
								<tr>
									<td width="10%" class="td1">
										&nbsp;&nbsp;姓名：
									</td>
									<td width="15%">
										<input type="text" name="name" maxlength="6" value="${name }" id="uId"
											onblur="validateUserName(this)">
										<span id="s_user" class="msg"></span>
										<font color=red>*</font>
									</td>
								<tr>
									<td width="10%" class="td1" class="line2">
										&nbsp;&nbsp;登陆名：
									</td>
									<td width="15%">
										<input type="text" name="loginname" maxlength="8"  value="${loginname }"
											id="uName" onblur="validateLoginName(this)">
										<span id="s_loginname" class="msg"></span>
										<font color=red>*</font>
									</td>
								</tr>
								<tr>
									<td width="10%" class="td1">
										&nbsp;&nbsp;密码：
									</td>
									<td width="15%">
										<input type="password" name="password" maxlength="8" size="22"
											value="${password }" id="pwd1" onblur="validatePwd(this)">
										<span id="s_pwd" class="msg"></span>
										<font color=red>*</font>
									</td>
								</tr>
								<tr>
									<td width="10%" class="td1">
										&nbsp;&nbsp;再次输入密码：
									</td>
									<td width="15%">
										<input type="password" name="repassword" maxlength="8" size="22"
											value="" id="pwd2"
											onblur="validateRepwd(this,document.forms['f1']['pwd1'])">
										<span id="s_repwd" class="msg"></span>
										<font color=red>*</font>
									</td>
								</tr>

								<tr>
									<td class="td1">
										&nbsp;&nbsp;电话：
									</td>
									<td>
										<input type="text" name="phone" value="${phone }" id="phone"
											onblur="validatePhone(this);">
										<span id="s_phone" class="msg"></span>
									</td>
								</tr>
								<tr>
									<td class="td1">
										&nbsp;&nbsp;邮箱：
									</td>
									<td>
										<input type="text" name="email" value="${email }" id="email"
											onblur="validateEmail0(this)">
										<span id="tip"></span>
									</td>
								</tr>
								<tr>
									<td colspan="6" align="center">
										<input type="button" class="btn" value=" 返 回 "
											onclick="history.go(-1)" />
										&nbsp;
										<input type="submit" class="btn" value=" 保 存 " />
									</td>
								</tr>
							</table>
						</form>
					</div>

					<div id="tabp_userrole" class="ditch-tab-pane"
						style="display: none;">
						<table width="60%" align="center">
							<tr>
								<td colspan="3" id="message1" align="center">
									<font color="red">为管理员 ${name } 添加权限</font>
								</td>
							</tr>
							<tr>
								
								<td width="100%" align="center" valign="top">
									<form name="updateRight" method="POST" action="updateRight.action" onSubmit="beforeSubmit()">
										<table width="100%" border="0">
											<tr bgcolor="#efebef">
												<th align="center">
													待拥有权限
												</th>
												<th></th>
												<th align="center">
													已拥有权限
												</th>
											</tr>
											<tr>
												<td width="40%" align="center">
													<select name="leftRight" id="normalusers" multiple="true" size="20" style="width: 200">
														<c:forEach var="right" items="${leftRights}">
															<option value="${right.id }">
																${right.name }
															</option>
														</c:forEach>
													</select>
												</td>
												<td width="20%" align="center">
													<table>
														<tr>
															<td>
																<input type="button" class="btn" value="授  权 &gt;&gt;"
																	onclick="moveto('normalusers','rightSet');" />
															</td>
														</tr>
														<tr>
															<td height="30"></td>
														</tr>
														<tr>
															<td>
																<input type="button" class="btn" value="&lt;&lt; 撤  销"
																	onclick="moveto('rightSet','normalusers');" />
															</td>
														</tr>
													</table>
												</td>
												<td width="40%" align="center">
													<select name="rightSet" id="rightSet" multiple="true" size="20" style="width: 200">
													</select>
												</td>
											</tr>
											<tr>
												<td colspan="3" height="30"></td>
											</tr>
											<tr>
												<td colspan="3" align="center">
													<input type="button" class="btn" value="返     回"
														onclick="history.go(-1)" />
													&nbsp;
													<input type="submit" class="btn" value="提     交" />
												</td>
											</tr>
										</table>
									</form>
								</td>
							</tr>
						</table>
					</div>
				</div>
				<!-- ditch-tab-pane-wrap -->
			</div>
			<!-- ditch-tab-container -->
		</div>
		<div align="center">
			<s:if test="#session.addAdminflag">
				<font color="green" size="4">
					<s:property value="%{getText('addadmin.success')}"/>
				</font>
			</s:if>
			<s:else>
				<font color="red" size="4">
					<s:property value="%{getText('addadmin.fail')}"/>
				</font>
			</s:else>
		</div>
	</body>
</html>
