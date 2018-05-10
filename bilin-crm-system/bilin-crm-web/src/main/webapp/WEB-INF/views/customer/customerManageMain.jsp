
<script type="text/javascript" src="js/json2.js"></script>     
<script type="text/javascript" src="js/crm/customer/customerManageMain.js"></script>     
</head>
  
<body id="customerMainBody">
	<div align="left">
		<div style="width: 600px; padding-left: 100px; float: left;">
			<input type="text" id="searchValue" /> <input type="button" id="queryBtn" value="查询">
		</div>
		<div id="operateBtn">
		</div>
	</div>

	<div id='jqxWidget' align="center"
		style="margin-top: 10px; font-size: 13px; font-family: Verdana; float: center; width: 100%;">
		<div id="jqxgrid" align="center" style="width: 100%; height: 100%">
		</div>
	</div>

	<div id="saveCustomerWin" style="display: none;">
		<div>
			<div id="addCustomerTable">
				<table class="register-table">
					<input type="text" id="id" class="text-input" style="display:none;"/>
					<tr>
						<td>顾客编码:</td>
						<td><input type="text" id="code" class="text-input" maxlength="5"/><font color=red>*</font></td>
					</tr>
					<tr>
						<td>顾客姓名:</td>
						<td><input type="text" id="name" class="text-input" maxlength="10"/><font color=red>*</font></td>
					</tr>
					<tr>
						<td>手机号码:</td>
						<td><input type="text" id="telephone" class="text-input" /><font color=red>*</font></td>
					</tr>
					<tr>
						<td>生日:</td>
						<td><div id="birthday"/></td>
					</tr>
					<tr>
						<td>微信:</td>
						<td><input type="text" id="wechat" class="text-input" maxlength="10"/></td>
					</tr>
					<tr>
						<td>微信:</td>
						<td><div id='levelSelect'></div></td>
					</tr>
					<tr>
						<td>备注:</td>
						<td><textarea id="remark" cols=60 rows=15 maxlength="200" style="overflow:auto"></textarea></td>
					</tr>
					<tr>
						<td height=30 colspan="4" align="center">
							<input type="button" id="saveConfirmBtn" value="确定" style="margin-right: 10px" /> 
							<input type="button" id="cancelBtn" value="取消" />
						</td>
					</tr>					
				</table>
			</div> 
		</div>
	</div>
</body>
