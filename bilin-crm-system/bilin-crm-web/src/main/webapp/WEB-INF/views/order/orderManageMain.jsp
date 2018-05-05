
  	<script type="text/javascript" src="js/json2.js"></script>     
  	<script type="text/javascript"> 
  	var roleguid = "${roleCode}";
  	
  	$(document).ready(function () {  
  		var editable = true;
  		if(roleguid=='ROLE_EXEC'){
  			editable = false;
  			document.getElementById("operateBtn").style.display = "none";
  		}
  		
  		//下拉选项
        var orderStatusAdapter = getJqxSelectList('ORDER_STATUS');
        var backStatusAdapter = getJqxSelectList('BACK_STATUS');
        var customerList = JSON.parse(
       		$.ajax({
       			url : "customer/getCustomerSelect.do", 
       			async : false,
       			datatype: "json",
       		}).responseText
       	);
       	var selectSource = {                 
       		datatype: "array",                 
       		datafields: [ { name: 'label', type: 'string' },{ name: 'value', type: 'string' } ],                 
       		localdata: customerList           
       	};           
       	var customerAdapter = new $.jqx.dataAdapter(selectSource, {autoBind: true});
        
        var source = {
        	datatype: "json",
        	type:'post', 
            datafields: [
                { name: 'id',type: 'string' },
                { name: 'check',type: 'string' },
                { name: 'orderNo',type: 'string' },
                { name: 'orderSeq', type: 'string' }, 
                { name: 'customerId',type: 'string' }, 
                { name: 'customerShow',value:'customerId',values: {source: customerAdapter.records, value: 'value', name: 'label'}},
                { name: 'deskNo',type: 'string' },
                { name: 'amount',type: 'string' },
                { name: 'orderStatus',type: 'string' },
                { name: 'orderStatusShow',value:'orderStatus',values: {source: orderStatusAdapter.records, value: 'value', name: 'label'}},
                { name: 'backStatus',type:'string'},
                { name: 'backStatusShow',value:'backStatus',values: {source: backStatusAdapter.records, value: 'value', name: 'label'}},
                { name: 'createTime',type:'date'},
                { name: 'remark',type:'string'},
                { name: 'operate', type: 'string' }
            ], 
            cache: false,
            beforeprocessing: function(data) {
                if (data != null) {
                    source.totalrecords = data.totalRecords;
                }
            },
            pager: function (pagenum, pagesize, oldpagenum) { 
            	alert(pagenum);              
            },  
            url: "order/getOrderList.do",
            data:{orderNo:$('#orderNoQuery').val()},
            root:'result' 
        }; 
        var dataAdapter = new $.jqx.dataAdapter(source, {
            downloadComplete: function (data, status, xhr) { },
            loadComplete: function (data) {
            	orignalData = data;
            },
            loadError: function (xhr, status, error) {
            	alert(error);
            }
        });
        var cellsrenderer = function (row, columnfield, value, defaultHtml, columnproperties, rowdata) {
            var dataRecord = $("#jqxgrid").jqxGrid('getrowdata', row);
			var orderStatus = dataRecord.orderStatus;
			var backStatus = dataRecord.backStatus;
			if(orderStatus=='1'){
				var element = $(defaultHtml);
				element.css('color', '#F5081A');
				return element[0].outerHTML;
			}else if(orderStatus=='2'&& backStatus=='2'){
				var element = $(defaultHtml);
				element.css('color', '#1A9709');
				return element[0].outerHTML;
			}
			return defaultHtml;
        }
        
        var getLocalization = function () {               
        	var localizationobj = {};               
        	localizationobj.pagergotopagestring = "跳转到:";
        	localizationobj.pagershowrowsstring = "每页显示:";
        	return localizationobj;            
        }
        
        var height = $(document).height();
        $("#jqxgrid").jqxGrid({
        	width:'99%',  
        	height:height-60,  
            source: dataAdapter,                 
            pageable: true,    
            sortable: true,
            editable: editable, 
            columnsresize: true,
            virtualmode: true,
            rendergridrows: function(obj) {
                return obj.data;
            },
            localization: getLocalization(),  
            pagesizeoptions:[50,100,200],  
            pagesize: 50, 
            columns: [ 
              {text: '选择', datafield:'check', editable:true, columntype:'checkbox',align: 'center', width:60},                       
              {text: 'ID',  datafield: 'id', align: 'center', cellsalign: 'center', width: 50,editable:false,hidden:true,cellsrenderer:cellsrenderer},
              {text: '订单序号',  datafield: 'orderSeq', align: 'center', cellsalign: 'left', width: 80,editable:false,cellsrenderer:cellsrenderer}, 
              {text: '订单编号',  datafield: 'orderNo', align: 'center', cellsalign: 'left', width: 200,editable:false,cellsrenderer:cellsrenderer}, 
              {text: '顾客',  datafield: 'customerId',displayfield: 'customerShow',columntype:'dropdownlist',align: 'center',cellsalign: 'center', width: 100,editable:false, cellsrenderer:cellsrenderer} ,
              {text: '桌号',  datafield: 'deskNo', align: 'center', cellsalign: 'left', width: 150,editable:false,cellsrenderer:cellsrenderer},
              {text: '消费金额',  datafield: 'amount', align: 'center', cellsalign: 'left', width: 100,editable:false,cellsrenderer:cellsrenderer},
              {text: '订单状态',  datafield: 'orderStatus',displayfield: 'orderStatusShow',columntype:'dropdownlist',align: 'center',cellsalign: 'center', width: 100,editable:false, cellsrenderer:cellsrenderer} ,
              {text: '返款状态',  datafield: 'backStatus',displayfield: 'backStatusShow',columntype:'dropdownlist',align: 'center',cellsalign: 'center', width: 100,editable:false, cellsrenderer:cellsrenderer} ,
              {text: '创建时间',  datafield: 'createTime', align: 'center', cellsalign: 'left', width: 200,editable:false,cellsformat: 'yyyy-MM-dd HH:mm:ss',cellsrenderer:cellsrenderer},
              {text: '订单备注',  datafield: 'remark', align: 'center', cellsalign: 'left', width: 200,editable:false,cellsrenderer:cellsrenderer},
              {text: '操作',  datafield: 'operate', columntype:'button',align: 'center', width: 100,  editable:false,hidden:!editable,
            	  cellsrenderer:function(row, column, value, defaultHtml, columnproperties, rowdata){
            		  console.log(defaultHtml);
            		  return "删除";  
                  },
            	  buttonclick:function(row,owner){
                		var dataRecord = $("#jqxgrid").jqxGrid('getrowdata', row);
                		console.log(dataRecord);
                		var orderNo = dataRecord.orderNo;
                		var id = dataRecord.id;
                		if (window.confirm("该订单[" + orderNo + "]将从列表中移除，请确认！")) {
                			$.ajax({
                				contentType: "application/json; charset=utf-8",   
                                url: "order/deleteOrder.do",
                                data: {id:id},    
                                dataType: "json", 
                                success: function(data){ 
                					if(data=='success'){
                						alert("删除成功");
                						$('#jqxgrid').jqxGrid({source:dataAdapter});
                					}else{
                						alert(data);
                						$('#jqxgrid').jqxGrid({source:dataAdapter});
                					}
                                }
                            });
                            window.close();
                        } else {
                            entity = data;
                        }
                  }
              } 
            ]
        });
        $("#jqxgrid").on("cellclick", function (event){
    		    // event arguments.
    		    var args = event.args;
    		    // column data field.
    		    var dataField = args.datafield;
    		    // cell value
    		    var value = args.value;
    		    if(dataField=="orderNo"){
    				$.ajax({
    	                 contentType: "application/json",   
    	                 url: "order/getOrderByOrderNo.do",
    	                 dataType: "json", 
    	                 data: {orderNo:value},
    	                 success: function(data){
    	                	 alert(data.orderNo)
    	                	 $('#addOrderWin').jqxWindow('open'); 
    	                 }
    				});    	                 
    		    }
     	});
        
        
	    $("#orderNoQuery").jqxInput({placeHolder: "订单编号", height: 20, width: 200, minLength: 1});
        
        $("#queryBtn").jqxButton({width: '100',height:'23'});
        function queryOrderList(){
	    	var orderNo = $('#orderNoQuery').val();
		    dataAdapter._source.data={ 
		    	orderNo:orderNo,  
		    } 
		    $("#jqxgrid").jqxGrid({ source: dataAdapter });
	    }
	    $('#queryBtn').on('click',queryOrderList);
      
        $("#addOrderBtn").jqxButton({width: '100',height:'23',disabled: !editable}); 
        $("#addOrderBtn").on("click",function(){
        	var orderNo = $.ajax({
       			url : "order/getOrderNo.do", 
       			async : false,
       			datatype: "json",
       		}).responseText
       		$("#orderNo").val(orderNo);
        	var orderSeq = $.ajax({
       			url : "order/getNextOrderSeq.do", 
       			async : false,
       			datatype: "json",
       		}).responseText
       		$("#orderSeq").val(orderSeq);
        	$('#customerIdSelect option:selected').val('-1')
        	$("#amount").val(0);
	    	$("#deskNo").val('');
	    	$('#remark').val('');
        	$('#addOrderWin').jqxWindow('open'); 
        });
		$("#addOrderWin").jqxWindow({ 
			title: "创建订单", 
			isModal: true,
			autoOpen:false,
			showCollapseButton: true,
			maxHeight: 600, 
			maxWidth: 700, 
			minHeight: 200, 
			minWidth: 400,
			height: 500,
			width: 1000,
		});
		$("#confirmBtn").jqxButton({width: '100',height:'23'});
		$('#confirmBtn').on('click',function(){
			var customerId = $('#customerIdSelect option:selected').val();
			if (!customerId||customerId=='-1') {
				alert("顾客不能为空！")
				return ;
			}
	        $.ajax({
                contentType: "application/json",   
                url: "order/saveOrderData.do",
                data: {
                	orderNo:$("#orderNo").val(),
                	orderSeq:$("#orderSeq").val(),
                	customerId:customerId,
                	deskNo:$("#deskNo").val(),
                	amount:$("#amount").val(),
                	remark:$("#remark").val(),
                },    
                dataType: "json", 
                success: function(data){ 
					if(data.successFlag){
						alert("保存成功");
						$('#jqxgrid').jqxGrid({source:dataAdapter});
					}else{
						alert(data.retMsg);
						$('#jqxgrid').jqxGrid({source:dataAdapter});
					}
                }
            });
			queryOrderList();
	    	$('#addOrderWin').jqxWindow('close');
	    });
		
		
		$("#cancelBtn").jqxButton({width: '100',height:'23'});
	    $('#cancelBtn').on('click',function(){
	    	$('#customerIdSelect option:selected').val('-1')
	    	$("#deskNo").val('');
	    	$("#amount").val(''),
	    	$('#remark').val('');
	    	$('#addOrderWin').jqxWindow('close');
	    });
        
        $("#modifyOrderBtn").jqxButton({width: '100',height:'23',disabled: !editable}); 
    });
	</script>
  </head>
  
<body id="customerMainBody">
	<div align="left">
		<div style="width: 600px; padding-left: 100px; float: left;">
			<input type="text" id="orderNoQuery" /><input type="text" id="orderStatusQuery" /> <input type="button" id="queryBtn" value="查询">
		</div>
	</div>
	<div id="operateBtn">
		<input type="button" id="addOrderBtn" value="新增">
	</div>

	<div id='jqxWidget' align="center"
		style="margin-top: 10px; font-size: 13px; font-family: Verdana; float: center; width: 100%;">
		<div id="jqxgrid" align="center" style="width: 100%; height: 100%">
		</div>
	</div>

	<div id="addOrderWin" style="display: none;">
		<div>
			<div id="addOrderTable">
				<table class="register-table">
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
							<select id="customerIdSelect" style="WIDTH:170px">
								<option value="-1">
									--请选择--
								</option>
								<c:forEach items="${customerList}" var="customer" varStatus="status">
									<option value="${customer.id}">${customer.name}</option>
								</c:forEach>
							</select>
							<font color=red>*</font>
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
						<td width="10%">备注:</td>
						<td><textarea id="remark" cols=60 rows=15 maxlength="200" style="overflow:auto"></textarea></td>
					</tr>
					<tr>
						<td height=30 colspan="4" align="center">
							<input type="button" id="confirmBtn" value="确定" style="margin-right: 10px" /> 
							<input type="button" id="cancelBtn" value="取消" />
						</td>
					</tr>					
				</table>
			</div> 
		</div>
	</div>
	
	<div id="modifyOrderWin" style="display: none;">
		<div>
			<div id="modifyOrderTable">
				<table class="register-table">
					<tr>
						<td width="10%">订单编码:</td>
						<td><input type="text" id="m_orderNo" class="text-input" readonly="readonly"/><font color=red>*</font></td>
					</tr>
					<tr>
						<td width="10%">订单序号:</td>
						<td><input type="text" id="m_orderSeq" class="text-input" readonly="readonly"/><font color=red>*</font></td>
					</tr>
					<tr>
						<td width="10%" class="td1" >顾客：</td>
						<td align="left" >
							<select id="m_customerIdSelect" style="WIDTH:170px">
								<c:forEach items="${customerList}" var="customer" varStatus="status">
									<option value="${customer.id}">${customer.name}</option>
								</c:forEach>
							</select>
							<font color=red>*</font>
						</td>
					</tr>
					<tr>
						<td width="10%">桌号:</td>
						<td><input type="text" id="m_deskNo" class="text-input" maxlength="5"/></td>
					</tr>
					<tr>
						<td width="10%">消费金额:</td>
						<td><input type="text" id="m_amount" class="text-input" maxlength="5" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"/></td>
					</tr>
					<tr>
						<td width="10%" class="td1" >订单状态：</td>
						<td align="left" >
							<div id='orderStatusSelect'></div>
						</td>
					</tr>
					<tr>
						<td width="10%" class="td1" >返款状态：</td>
						<td align="left" >
							<div id='backStatusSelect'></div>
						</td>
					</tr>
					<tr>
						<td width="10%">备注:</td>
						<td><textarea id="m_remark" cols=60 rows=15 maxlength="200" style="overflow:auto"></textarea></td>
					</tr>
					<tr>
						<td height=30 colspan="4" align="center">
							<input type="button" id="m_confirmBtn" value="修改保存" style="margin-right: 10px" />
							<input type="button" id="m_cancelBtn" value="取消" />
						</td>
					</tr>					
				</table>
			</div> 
		</div>
	</div>	
</body>
