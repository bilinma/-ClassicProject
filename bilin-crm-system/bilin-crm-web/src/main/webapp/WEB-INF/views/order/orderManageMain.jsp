
<!-- <script type="text/javascript" src="js/json2.js"></script>      -->
<script type="text/javascript" src="js/crm/order/orderManageMain.js"></script>
</head>
  
<body id="orderMainBody">
	<div align="left">
<!-- 		<div style="width: 600px; padding-left: 100px; float: left;"> -->
		<table class="register-table">
			<tr>
				<td ><input type="text" id="orderNoQuery" /></td>
				<td ><input type="text" id="custSearchValue" /></td>
				<td ><input id="startCreateTime" style="float: left;"/><label style="float: left;">-</label><input id="endCreateTime" style="float: left;"/></td>
				<td width="10%"><input type="button" id="queryBtn" value="查询"></td>
			</tr>
		</table>
<!-- 		</div> -->
	</div>

	<div id='jqxWidget' align="center" style="margin-top: 10px; font-size: 13px; font-family: Verdana; float: center; width: 100%;">
		<div id="jqxgrid" align="center" style="width: 100%; height: 100%">
		</div>
	</div>

	<div id="saveOrderWin" style="display: none;">
		<div>
			<div id="saveOrderTable">
				<table class="register-table">
					<input type="text" id="id" class="text-input" style="display:none;"/>
					<tr>
						<td width="10%">订单编码:</td>
						<td><input type="text" id="orderNo" class="text-input" readonly="readonly"/><font color=red>*</font></td>
					</tr>
					<tr>
						<td width="10%">订单序号:</td>
						<td><input type="text" id="orderSeq" class="text-input" readonly="readonly"/><font color=red>*</font></td>
					</tr>
					<tr>
						<td width="10%" class="td1" >顾客：</td>
						<td align="left" >
							<%-- <select id="customerIdSelect" style="WIDTH:200px">
								<option value="-1">
									--请选择--
								</option>
								<c:forEach items="${customerList}" var="customer" varStatus="status">
									<option value="${customer.id}">${customer.name}</option>
								</c:forEach>
							</select> --%>
							<div id='customerSelect'><font color=red>*</font></div>
						</td>
					</tr>
					<tr>
						<td width="10%">桌号:</td>
						<td><input type="text" id="deskNo" class="text-input" maxlength="5"/></td>
					</tr>
					<tr>
						<td width="10%">消费金额:</td>
						<td><input type="text" id="amount" class="text-input" maxlength="5" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"/></td>
					</tr>
					<tr>
						<td width="10%">订单状态:</td>
						<td><div id='orderStatusSelect'></div></td>
					</tr>					
					<tr>
						<td width="10%">备注:</td>
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
