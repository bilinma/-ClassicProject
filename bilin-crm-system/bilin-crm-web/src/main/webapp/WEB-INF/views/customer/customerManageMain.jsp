
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
        var custLevelAdapter = getJqxSelectList('CUST_LEVEL');
        var searchValue = $('#searchValue').val();
        var source = {
        	datatype: "json",
        	type:'post', 
            datafields: [
                { name: 'id',type: 'string' },         
                { name: 'code',type: 'string' },
                { name: 'name', type: 'string' }, 
                { name: 'telephone',type: 'string' }, 
                { name: 'wechat',type: 'string' },
                { name: 'level',type: 'string' },
                { name: 'levelShow',value:'level',values: {source: custLevelAdapter.records, value: 'value', name: 'label'}},
                { name: 'amountTotal',type:'string'},
                { name: 'createTime',type:'string'},
                { name: 'operate', type: 'string' }
            ], 
            root:'result', 
            pagenum: 0,                 
            pagesize: 50,
            data:{searchValue:searchValue}, 
            pager: function (pagenum, pagesize, oldpagenum) { 
            	alert(pagenum);              
            }, 
            url: "customer/getCustomerList.do"
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
            localization: getLocalization(),  
            pagesizeoptions:[50,100,200],  
            pagesize: 50,  
            columns: [ 
              {text: '选择', datafield:'check', editable:true, columntype:'checkbox',align: 'center', width:60},                       
              {text: 'ID',  datafield: 'id', align: 'center', cellsalign: 'left', width: 50,editable:false,hidden:true,cellsrenderer:cellsrenderer},
              {text: '客户编码',  datafield: 'code', align: 'center', cellsalign: 'left', width: 100,editable:false,cellsrenderer:cellsrenderer}, 
              {text: '客户名',  datafield: 'name', align: 'center', cellsalign: 'left', width: 200,editable:false,cellsrenderer:cellsrenderer}, 
              {text: '电话',  datafield: 'telephone', align: 'center', cellsalign: 'left', width: 200,editable:true,cellsrenderer:cellsrenderer},
              {text: '微信',  datafield: 'wechat', align: 'center', cellsalign: 'left', width: 150,editable:false,cellsrenderer:cellsrenderer},
              {text: '客户等级',  datafield: 'level' ,displayfield: 'levelShow',columntype:'dropdownlist',align: 'center',cellsalign: 'center', width: 100,editable:false, cellsrenderer:cellsrenderer} ,
              {text: '总消费额',  datafield: 'amountTotal', align: 'center', cellsalign: 'left', width: 100,editable:false,cellsrenderer:cellsrenderer},
              {text: '创建时间',  datafield: 'createTime', align: 'center', cellsalign: 'left', width: 200,editable:false,cellsrenderer:cellsrenderer},
              {text: '操作',  datafield: 'operate', columntype:'button',align: 'center', width: 100,  editable:false,hidden:!editable,
            	  cellsrenderer:function(row, column, value, defaultHtml, columnproperties, rowdata){
            		  console.log(defaultHtml);
            		  return "删除";  
                  },
            	  buttonclick:function(row,owner){
                		var dataRecord = $("#jqxgrid").jqxGrid('getrowdata', row);
                		console.log(dataRecord);
                		var name = dataRecord.name;
                		var id = dataRecord.id;
                		if (window.confirm("该客户[" + name + "]将从列表中移除，请确认！")) {
                			$.ajax({
                                contentType: "application/json",   
                                url: "customer/deleteCustomer.do",
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
    	
	    $("#searchValue").jqxInput({placeHolder: "客户姓名/电话", height: 20, width: 200, minLength: 1});
        
        $("#queryBtn").jqxButton({width: '100',height:'23'});
        function queryCustomerList(){
	    	var searchValue = $('#searchValue').val();
		    if($('#searchValue').jqxInput('placeHolder')==$('#searchValue').val()){
		    	searchValue='';
		    }
		    dataAdapter._source.data={ 
		    	searchValue:searchValue,  
		    } 
		    $("#jqxgrid").jqxGrid({ source: dataAdapter });
	    }
	    $('#queryBtn').on('click',queryCustomerList);
      
        $("#addCustomerBtn").jqxButton({width: '100',height:'23',disabled: !editable}); 
        $("#addCustomerBtn").on("click",function(){
        	$("#code").val('');
	    	$("#name").val('');
	    	$("#telephone").val('');
	    	$("#wechat").val('');
	    	$('#remark').val('');
        	$('#addCustomerWin').jqxWindow('open'); 
        });
		$("#addCustomerWin").jqxWindow({ 
			title: "添加顾客信息", 
			isModal: true,
			autoOpen:false,
			showCollapseButton: true,
			maxHeight: 600, 
			maxWidth: 600, 
			minHeight: 200, 
			minWidth: 400,
			height: 500,
			width: 1000,
		});
		$("#confirmBtn").jqxButton({width: '100',height:'23'});
		$('#confirmBtn').on('click',function(){
			var code = $("#code").val();
			if (!code) {
				alert("顾客编码不能为空！")
				return ;
			}
			var name = $("#name").val();
			if (!name) {
				alert("姓名不能为空！")
				return ;
			}
            var telephone = $("#telephone").val();
            if(!validateUtil.checkMobile(telephone)){
        	  return; 
            }
	        $.ajax({
                contentType: "application/json",   
                url: "customer/saveCustomerData.do",
                data: {
                	code:code,
                	name:name,
                	telephone:telephone,
                	wechat:$("#wechat").val(),
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
			queryCustomerList();
	    	$('#addCustomerWin').jqxWindow('close');
	    });
		
		
		$("#cancelBtn").jqxButton({width: '100',height:'23'});
	    $('#cancelBtn').on('click',function(){
	    	$("#code").val('');
	    	$("#name").val('');
	    	$("#telephone").val('');
	    	$("#wechat").val('');
	    	$('#remark').val('');
	    	$('#addCustomerWin').jqxWindow('close');
	    });
        
        $("#modifyCustomerBtn").jqxButton({width: '100',height:'23',disabled: !editable}); 
    });
	</script>
  </head>
  
<body id="customerMainBody">
	<div align="left">
		<div style="width: 600px; padding-left: 100px; float: left;">
			<input type="text" id="searchValue" /> <input type="button" id="queryBtn" value="查询">
		</div>
		<div id="operateBtn">
			<input type="button" id="addCustomerBtn" value="新增"> 
			<input type="button" id="modifyCustomerBtn" value="修改">
		</div>
	</div>

	<div id='jqxWidget' align="center"
		style="margin-top: 10px; font-size: 13px; font-family: Verdana; float: center; width: 100%;">
		<div id="jqxgrid" align="center" style="width: 100%; height: 100%">
		</div>
	</div>

	<div id="addCustomerWin" style="display: none;">
		<div>
			<div id="addCustomerTable">
				<table class="register-table">
					<tr>
						<td>顾客编码:</td>
						<td><input type="text" id="code" class="text-input" /><font color=red>*</font></td>
					</tr>
					<tr>
						<td>名称:</td>
						<td><input type="text" id="name" class="text-input" /><font color=red>*</font></td>
					</tr>
					<tr>
						<td>电话:</td>
						<td><input type="text" id="telephone" class="text-input" /><font color=red>*</font></td>
					</tr>
					<tr>
						<td>微信:</td>
						<td><input type="text" id="wechat" class="text-input" /></td>
					</tr>
					<tr>
						<td>备注:</td>
						<td><textarea id="remark" cols=60 rows=15 style="overflow:auto"></textarea></td>
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
</body>
