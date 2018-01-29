<%@page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
	<head>
		<title>用户管理</title>
		<script type="text/javascript" src="js/tabs.js"></script>
		<link type="text/css" rel="stylesheet" href="css/tabs.css" />
		<link rel="stylesheet" href="css/css.css" type="text/css">
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
						<strong><a href="" onclick="return false;">基本信息维护 </a></strong>
					</div>
					<div id="tabp_userrole-tab"
						onclick="org.ditchnet.jsp.TabUtils.tabClicked(event);userTabListener(new org.ditchnet.jsp.TabEvent(this));"
						class="ditch-tab ditch-unfocused">
						<span class="ditch-tab-bg-left"> </span>
						<strong><a href="" onclick="return false;">管理员权限维护 </a></strong>
					</div>
					<br class="ditch-clear" />
				</div>
				<!-- ditch-tab-wrap -->
				<div class="ditch-tab-pane-wrap">


					<div id="tabp_userinfor" class="ditch-tab-pane"
						style="display: block;">
						<table width="98%" id="table1" cellpadding="0" cellspacing="0"
							align="center" border="0" class="line1">
							<tr>
								<td colspan="6" id="message0">


								</td>
							</tr>
						</table>
						<form action="updateAdmin.action" method="post">
							<table width="60%" id="table1" cellpadding="0" cellspacing="0"
								align="center" border="1" class="line1">
								<tr class="line2">
									<th height="20" colspan="6">
										管理员基本信息维护
									</th>
								</tr>
								<tr>
									<td width="10%" class="td1">
										&nbsp;&nbsp;管理员ID：
									</td>
									<td width="15%">
										<input type="text" name="id" readonly="readonly"
											value="${admin.id }" id="uId">
										<font color=red>*</font>
									</td>
								<tr>
								<tr>
									<td width="10%" class="td1">
										&nbsp;&nbsp;名称：
									</td>
									<td width="15%">
										<input type="text" name="name" value="${admin.name }"
											id="uName">
										<font color=red>*</font>
									</td>
								<tr>
									<td width="10%" class="td1" class="line2">
										&nbsp;&nbsp;登录名:
									</td>
									<td width="15%">
										<input type="text" name="loginname"
											value="${admin.loginname }" id="uName">
										<font color=red>*</font>
									</td>
								</tr>
								<tr>
									<td width="10%" class="td1">
										&nbsp;&nbsp;登录密码:
									</td>
									<td width="15%">
										<input type="text" name="password"
											value="${admin.loginpassword }" id="uPassword">
										<font color=red>*</font>
									</td>
								</tr>
								<tr>
									<td class="td1">
										&nbsp;&nbsp;联系电话:
									</td>
									<td>
										<input type="text" name="phone" value="${admin.phone }"
											id="uName">
										<font color=red>*</font>
									</td>
								</tr>
								<tr>
									<td class="td1">
										&nbsp;&nbsp;Email:
									</td>
									<td>
										<input type="text" name="email" value="${admin.email }"
											id="uPwd">
										<font color=red>*</font>
									</td>
								</tr>
								<tr>
									<td colspan="6" align="center">
										<input type="button" class="btn" value=" 返 回 "
											onclick="history.go(-1)" />
										&nbsp;&nbsp;&nbsp;&nbsp;
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
									<font color="red">修改管理员 ${admin.name } 的权限</font>
								</td>
							</tr>
							<tr>
								<td width="100%" align="center" valign="top">
								<form name="updateRight" method="POST"
										action="updateRight.action" onSubmit="beforeSubmit()">
									<table width="100%" border="0">
										<tr bgcolor="#efebef">
											<th align="center">
												待授权权限
											</th>
											<th></th>
											<th align="center">
												已授权权限
											</th>
										</tr>
										<tr>
											<td width="40%" align="center">
													<select name="leftRight" id="normalusers" multiple="true"
														size="20" style="width: 200">
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
													<select name="rightSet" id="rightSet" multiple="true"
														size="20" style="width: 200">
														<c:forEach var="right" items="${rightRights}">
															<option value="${right.id }">
																${right.name }
															</option>
														</c:forEach>
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
												<input type="submit" class="btn" value="提     交"
													onclick="doSave()" />
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
		<!-- ditch-tab-skin-default -->
	</body>
</html>
