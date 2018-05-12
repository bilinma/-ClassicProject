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
        	cache: false,
            datafields: [
                { name: 'id',type: 'string' },         
                { name: 'check',type: 'string' },                         
                { name: 'code',type: 'string' },
                { name: 'name', type: 'string' }, 
                { name: 'telephone',type: 'string' }, 
                { name: 'wechat',type: 'string' },
                { name: 'birthday',type: 'date' },
                { name: 'level',type: 'string' },
                { name: 'levelShow',value:'level',values: {source: custLevelAdapter.records, value: 'value', name: 'label'}},
                { name: 'amountTotal',type:'string'},
                { name: 'createTime',type:'date'},
                { name: 'editOperate', type: 'string' },
                { name: 'detelteOperate', type: 'string' }
            ], 
            beforeprocessing: function(data) {
                if (data != null) {
                    source.totalrecords = data.totalRecords;
                }
            },
            pager: function (pagenum, pagesize, oldpagenum) { 
            	alert(pagenum);              
            },
            url: "customer/getCustomerList.do", 
            data:{searchValue:searchValue},
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
                var addButton = $('<input type="button" id="addCustomerBtn" value="新增">');
                var excelExportButton = $('<input type="button" id="excelExportBtn" value="导出">');
                container.append(addButton);
                container.append(excelExportButton);
                statusbar.append(container);
                addButton.jqxButton({  width: 80, height: 25 });
                excelExportButton.jqxButton({  width: 80, height: 25 });
                addButton.click(function (event) {
                	$("#code").val('');
        	    	$("#name").val('');
        	    	$("#telephone").val('');
        	    	$("#wechat").val('');
        	    	$('#remark').val('');
        	    	$('#birthday').jqxDateTimeInput('setDate','');
                	$('#saveCustomerWin').jqxWindow('open');  
                });
                excelExportButton.click(function(event){
                	$("#jqxgrid").jqxGrid('exportdata', 'xls', encodeURIComponent('顾客信息'));     
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
              {text: '选择',  datafield: 'check',columntype:'checkbox',align: 'center',width: 60 },                       
              {text: 'ID',  datafield: 'id', align: 'center', cellsalign: 'left', width: 50,editable:false,hidden:true,cellsrenderer:cellsrenderer},
              {text: '顾客编码',  datafield: 'code', align: 'center', cellsalign: 'center', width: 100,editable:true,cellsrenderer:cellsrenderer}, 
              {text: '顾客姓名',  datafield: 'name', align: 'center', cellsalign: 'center', width: 150,editable:true,cellsrenderer:cellsrenderer}, 
              {text: '电话',  datafield: 'telephone', align: 'center', cellsalign: 'center', width: 200,editable:true,cellsrenderer:cellsrenderer},
              {text: '微信',  datafield: 'wechat', align: 'center', cellsalign: 'center', width: 150,editable:false,cellsrenderer:cellsrenderer},
              {text: '生日',  datafield: 'birthday', align: 'center', cellsalign: 'center', width: 150,editable:false,cellsformat: 'yyyy-MM-dd',cellsrenderer:cellsrenderer},
              {text: '顾客等级',  datafield: 'level' ,displayfield: 'levelShow',columntype:'dropdownlist',align: 'center',cellsalign: 'center', width: 100,editable:false, cellsrenderer:cellsrenderer} ,
              {text: '总消费额',  datafield: 'amountTotal', align: 'center', cellsalign: 'right', width: 100,editable:false,cellsrenderer:cellsrenderer},
              {text: '创建时间',  datafield: 'createTime', align: 'center', cellsalign: 'center', width: 200,editable:false,cellsformat: 'yyyy-MM-dd HH:mm:ss',cellsrenderer:cellsrenderer},
              {text: '编辑',  datafield: 'editOperate', columngroup: 'operate',columntype:'button',align: 'center', width: 100,  editable:false,hidden:!editable,
            	  cellsrenderer:function(row, column, value, defaultHtml, columnproperties, rowdata){
            		  return "编辑";  
                  },
            	  buttonclick:function(row,owner){
                		var dataRecord = $("#jqxgrid").jqxGrid('getrowdata', row);
                		var name = dataRecord.name;
                		var id = dataRecord.id;
                		$.ajax({
   	   	                 contentType: "application/json",   
   	   	                 url: "customer/getCustomerById.do",
   	   	                 dataType: "json", 
   	   	                 data: {id:id},
   	   	                 success: function(data){
   	   	                	if(data){
   	   	                		$("#id").val(data.id);
		   	   	               	$("#code").val(data.code);
			           	    	$("#name").val(data.name);
			           	    	$("#telephone").val(data.telephone);
			           	    	$("#wechat").val(data.wechat);
			           	    	$('#birthday').jqxDateTimeInput('setDate',new Date(data.birthday));
			           	    	$('#remark').val(data.remark);
	   	   	                	$('#saveCustomerWin').jqxWindow('open'); 
   	   	                	}else{
								alert("找不到该顾客信息，请联系管理员！");   	   	                		
   	   	                	}
   	   	                 }
   	   				}); 
                  }
              },
              {text: '删除',  datafield: 'deleteOperate', columngroup: 'operate',columntype:'button',align: 'center', width: 100,  editable:false,hidden:!editable,
            	  cellsrenderer:function(row, column, value, defaultHtml, columnproperties, rowdata){
            		  return "删除";  
                  },
            	  buttonclick:function(row,owner){
                		var dataRecord = $("#jqxgrid").jqxGrid('getrowdata', row);
                		var name = dataRecord.name;
                		var id = dataRecord.id;
                		if (window.confirm("该顾客[" + name + "]将从列表中移除，请确认！")) {
                			$.ajax({
                				contentType: "application/json; charset=utf-8",
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
            ],
            columngroups: [
                { text: '操作', align: 'center', name: 'operate' }
            ]
        });
    	
	    $("#searchValue").jqxInput({placeHolder: "顾客姓名/电话", height: 20, width: 200, minLength: 1});
        
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
      
		$("#saveCustomerWin").jqxWindow({ 
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
		
		$("#code").jqxInput({height: 23, width: 200, minLength: 1});
		$("#name").jqxInput({height: 23, width: 200, minLength: 1});
		$("#telephone").jqxInput({height: 23, width: 200});
		$("#wechat").jqxInput({height: 23, width: 200});
		$("#birthday").jqxDateTimeInput({ min: new Date(1900, 1, 1), max: new Date(),width: '200px', height: '23px',formatString: 'yyyy-MM-dd'});
		$("#levelSelect").jqxDropDownList({source: custLevelAdapter, selectedIndex: 1, width: '200', height: '23'});
		$("#saveConfirmBtn").jqxButton({width: '100',height:'23'});
		$('#saveConfirmBtn').on('click',function(){
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
            var levelSelectItem = $("#levelSelect").jqxDropDownList('getSelectedItem');
	        $.ajax({
                contentType: "application/json; charset=utf-8",
                url: "customer/saveCustomerData.do",
                data: {
                	id:$("#id").val(),
                	code:code,
                	name:name,
                	telephone:telephone,
                	birthday:$('#birthday').jqxDateTimeInput('getDate'),
                	wechat:$("#wechat").val(),
                	level:levelSelectItem.value,
                	remark:$("#remark").val()
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
	    	$('#saveCustomerWin').jqxWindow('close');
	    });
		$("#cancelBtn").jqxButton({width: '100',height:'23'});
	    $('#cancelBtn').on('click',function(){
	    	$("#code").val('');
	    	$("#name").val('');
	    	$("#telephone").val('');
	    	$("#wechat").val('');
	    	$('#remark').val('');
	    	$('#saveCustomerWin').jqxWindow('close');
	    });
    });