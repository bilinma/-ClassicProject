
<script type="text/javascript">
	$(document).ready(function() {
		$('#loginWin').jqxWindow({
			showCollapseButton : false,
			showCloseButton : false,
			title : '客户关系管理',
			height : 250,
			width : 420,
			draggable : true,
			resizable : true,
			initContent : function() {
				var theme = 'ui-redmond';
				$("#userCode, #password").addClass('jqx-input');
				$("#userCode, #password").addClass('jqx-input-' + theme);
				$("#loginButton").jqxButton({
					theme : theme
				}); // add validation rules.             
				$('#form').jqxValidator({
					rules : [ {
						input : '#userCode',
						message : '用户名不能为空!',
						action : 'keyup, blur',
						rule : 'required'
					}, {
						input : '#password',
						message : '密码不能为空',
						action : 'keyup, blur',
						rule : 'required'
					} ]
				});
				$("#loginButton").click(function() {
					$('#form').jqxValidator('validate');
				});
				$("#form").on('validationSuccess', function() {
					$("#form-iframe").fadeIn('fast');
				});
			}
		});
		var msg = "${loginInfo}"
		if (msg != null && msg != '') {
			var code = '${userCode}';
			var password = '${password}';
			$('#userCode').val(code);
			$('#password').val(password);
			alert(msg);
		}
	});
</script>
<body>
	<div align="center" id="loginWin"
		style="font-size: 13px; font-family: Verdana;">
		<div align="center">
			<form class="form" id="form" method="post" action="login.do"
				style="text-align: center;">
				<table align="center" valign="center" style="margin-top: 40px;">
					<tr>
						<td style="text-align: right;"><label for="username">登录名:</label></td>
						<td style="text-align: left;"><input id="userCode" name="userCode" tabindex="1" type="text" /></td>
					</tr>
					<tr>
						<td style="text-align: right;"><label for="password">密码:</label></td>
						<td style="text-align: left;"><input id="password" name="password" tabindex="2" type="password" /></td>
					</tr>
					<tr>
						<td></td>
						<td style="text-align: left;"></td>
					</tr>
					<tr>
						<td style="text-align: left;"><a href="/lostPassword">忘记密码</a></td>
						<td style="text-align: right;"><input type="submit" id="loginButton" value="登录 &#187;" tabindex="5" /></td>
					</tr>
				</table>

			</form>
		</div>
	</div>
</body>

