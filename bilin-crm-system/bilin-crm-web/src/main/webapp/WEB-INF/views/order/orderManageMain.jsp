
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
            data:{
            	orderNo:$('#orderNoQuery').val(),
            	custSearchValue:$('#custSearchValue').val()
            },
            root:'result' 
        }; 
        var dataAdapter = new $.jqx.dataAdapter(source, {
        	downloadComplete: function (data, status, xhr) {
                if (!source.totalRecords) {
                    source.totalRecords = data.length;
                }
				for(var i=0;i<data.result.length;i++){
					data.result[i].check=0; 
				}
				return data;
			},
			loadComplete: function (data) {
				
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
            showtoolbar: true,
            rendertoolbar: function (statusbar) {
                // appends buttons to the status bar.
                var container = $("<div style='overflow: hidden; position: relative; margin: 5px;'></div>");
                var addButton = $('<input type="button" id="addOrderBtn" value="新增">');
                var backMoneyButton = $('<input type="button" id="backConfirmBtn" value="确认返款">');
                var excelExportButton = $('<input type="button" id="excelExportBtn" value="导出">');
                container.append(addButton);
                container.append(backMoneyButton);
                container.append(excelExportButton);
                statusbar.append(container);
                addButton.jqxButton({  width: 80, height: 20 });
                backMoneyButton.jqxButton({  width: 120, height: 20 });
                excelExportButton.jqxButton({  width: 80, height: 20 });
                addButton.click(function (event) {
                	$("#id").val('');
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
                	$("#amount").val(0);
        	    	$("#deskNo").val('');
        	    	$('#remark').val('');
        	    	$("#customerSelect").jqxDropDownList('clearSelection');
        	    	$("#orderStatusSelect").jqxDropDownList('selectIndex', 0);
                	$('#saveOrderWin').jqxWindow('open'); 
                });
                backMoneyButton.click(function (event) {
                	var rows = $('#jqxgrid').jqxGrid('getrows');
            		var selectKeyColums = new Array();
            		for(var i=0;i<rows.length;i++){
            			if(rows[i].check==1){ 
            				selectKeyColums.push(rows[i].id); 
            			}
            		}
            		if(selectKeyColums.length==1){
            	     	$.ajax({
            	               url: "order/confirmBackMoney.do", 
            	               data: {id:selectKeyColums[0]},     
            	               dataType: "json", 
            	               success: function(data){ 
            					if(data.successFlag){
            						alert(data.retMsg);
            						queryOrderList(); 
            					}else{
            						alert(data.retMsg);
            					}
            	              }
            	         });
            		}else if(selectKeyColums.length>1){
            			alert('请勾选一条需要确认的记录！');
            		}else{
            			alert('请勾选需要确认的记录！');
            		}
                });
                excelExportButton.click(function(event){
                	$("#jqxgrid").jqxGrid('exportdata', 'xls', '订单列表');     
                }); 
            },            
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
              {text: '选择', datafield: 'check',columntype:'checkbox',align: 'center',width: 60 },                     
              {text: 'ID',  datafield: 'id', align: 'center', cellsalign: 'center', width: 50,editable:false,hidden:true,cellsrenderer:cellsrenderer},
              {text: '订单序号',  datafield: 'orderSeq', align: 'center', cellsalign: 'right', width: 80,editable:false,cellsrenderer:cellsrenderer}, 
              {text: '订单编号',  datafield: 'orderNo', align: 'center', cellsalign: 'center', width: 200,editable:false,
            	  cellsrenderer:function(row, column, value, defaultHtml, columnproperties, rowdata){
						var element = $(defaultHtml);
						element.attr("href","javascript:void(0)");
						return element[0].outerHTML;
            	  }
              }, 
              {text: '顾客',  datafield: 'customerId',displayfield: 'customerShow',columntype:'dropdownlist',align: 'center',cellsalign: 'center', width: 100,editable:false, cellsrenderer:cellsrenderer} ,
              {text: '桌号',  datafield: 'deskNo', align: 'center', cellsalign: 'left', width: 80,editable:false,cellsrenderer:cellsrenderer},
              {text: '消费金额',  datafield: 'amount', align: 'center', cellsalign: 'right', width: 100,editable:false,cellsrenderer:cellsrenderer},
              {text: '订单状态',  datafield: 'orderStatus',displayfield: 'orderStatusShow',columntype:'dropdownlist',align: 'center',cellsalign: 'center', width: 100,editable:false, cellsrenderer:cellsrenderer} ,
              {text: '返款状态',  datafield: 'backStatus',displayfield: 'backStatusShow',columntype:'dropdownlist',align: 'center',cellsalign: 'center', width: 100,editable:false, cellsrenderer:cellsrenderer} ,
              {text: '创建时间',  datafield: 'createTime', align: 'center', cellsalign: 'center', width: 160,editable:false,cellsformat: 'yyyy-MM-dd HH:mm:ss',cellsrenderer:cellsrenderer},
              {text: '订单备注',  datafield: 'remark', align: 'center', cellsalign: 'left', width: 200,editable:false,cellsrenderer:cellsrenderer},
              {text: '操作',  datafield: 'operate', columntype:'button',align: 'center', width: 100,  editable:false,hidden:!editable,
            	  cellsrenderer:function(row, column, value, defaultHtml, columnproperties, rowdata){
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
    		    var args = event.args;
    		    var dataField = args.datafield;
    		    var value = args.value;
    		    if(dataField=="orderNo"){
    				$.ajax({
    	                 contentType: "application/json",   
    	                 url: "order/getOrderByOrderNo.do",
    	                 dataType: "json", 
    	                 data: {orderNo:value},
    	                 success: function(data){
    	                	$("#id").val(data.id);
    	                	$("#orderNo").val(data.orderNo);
    	                	$("#orderSeq").val(data.orderSeq);
    	                 	$("#amount").val(data.amount);
    	         	    	$("#deskNo").val(data.deskNo);
   	         	    		$("#customerSelect").jqxDropDownList('val', data.customerId);
    	         	    	$("#orderStatusSelect").jqxDropDownList('val', data.orderStatus);
    	         	    	$('#remark').val(data.remark);
    	                	$('#saveOrderWin').jqxWindow('open');
    	                 }
    				});    	                 
    		    }
     	});
        
	    $("#custSearchValue").jqxInput({placeHolder: "顾客姓名/手机", height: 20, width: 200, minLength: 1});
	    $("#orderNoQuery").jqxInput({placeHolder: "订单编号", height: 20, width: 200, minLength: 1});
	    
        $("#queryBtn").jqxButton({width: '100',height:'23'});
        function queryOrderList(){
	    	var orderNo = $('#orderNoQuery').val();
	    	var custSearchValue=$('#custSearchValue').val();
		    dataAdapter._source.data={ 
		    	orderNo:orderNo,
		    	custSearchValue:custSearchValue
		    } 
		    $("#jqxgrid").jqxGrid({ source: dataAdapter });
	    }
	    $('#queryBtn').on('click',queryOrderList);
      
		$("#saveOrderWin").jqxWindow({ 
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
		
		$("#customerSelect").jqxDropDownList({source: customerAdapter, width: '200', height: '23'});
		$("#orderStatusSelect").jqxDropDownList({source: orderStatusAdapter, selectedIndex: 0, width: '200', height: '23'});
		$("#saveConfirmBtn").jqxButton({width: '100',height:'23'});
		$('#saveConfirmBtn').on('click',function(){
			//var customerId = $('#customerIdSelect option:selected').val();
			var customerSelectItem = $("#customerSelect").jqxDropDownList('getSelectedItem');
			var customerId = customerSelectItem.value;
			if (!customerId||customerId=='-1') {
				alert("顾客不能为空！")
				return ;
			}
			var orderStatusItem = $("#orderStatusSelect").jqxDropDownList('getSelectedItem'); 
	        $.ajax({
                contentType: "application/json",   
                url: "order/saveOrderData.do",
                data: {
                	id:$("#id").val(),
                	orderNo:$("#orderNo").val(),
                	orderSeq:$("#orderSeq").val(),
                	customerId:customerId,
                	deskNo:$("#deskNo").val(),
                	amount:$("#amount").val(),
                	orderStatus:orderStatusItem.value,
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
	    	$('#saveOrderWin').jqxWindow('close');
	    });
		
		
		$("#cancelBtn").jqxButton({width: '100',height:'23'});
	    $('#cancelBtn').on('click',function(){
	    	$("#id").val('');
	    	//$('#customerIdSelect option:selected').val('-1');
	    	$("#customerSelect").jqxDropDownList('clearSelection');
	    	$("#deskNo").val('');
	    	$("#amount").val(''),
	    	$('#remark').val('');
	    	$("#orderStatusSelect").jqxDropDownList('selectIndex', 0);
	    	$('#saveOrderWin').jqxWindow('close');
	    });
    });
	</script>
  </head>
  
<body id="orderMainBody">
	<div align="left">
		<div style="width: 600px; padding-left: 100px; float: left;">
			<input type="text" id="custSearchValue" /> 
			<input type="text" id="orderNoQuery" />
			<input type="button" id="queryBtn" value="查询">
		</div>
	</div>

	<div id='jqxWidget' align="center" style="margin-top: 20px; font-size: 13px; font-family: Verdana; float: center; width: 100%;">
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
