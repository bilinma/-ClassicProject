
  <style>
  	html{
  		height:100%;
  	}
  	body{
  		height:100%;   
  		overflow:hidden;  
  	}
  </style>
  <script>
  	  var roleguid = '${roleguid}'; 
	  $(document).ready(function () { 
		  $('#mainSplitter').jqxSplitter({ 
			  width: '100%',   
			  height: $(document.body).height()-10,      
			  orientation: 'horizontal',  
			  splitBarSize: 2,    
			  panels: [{size:30 }, { size: $(document.body).height()-30}]  
		  }); 
		  if(roleguid=='ROLE_EXEC'){
			  //$('#datasynconfig').remove();     
			  $('#clearConfiCache').remove();  
			  $('#clearExecCache').remove();  
			  $('#handlerlist').remove();  
		  }
		  
		  $("#jqxMenu").jqxMenu({ 
			  width: '100%', 
			  height: '30px',
			  //mode: "popup",  
			  animationShowDuration: 200
		  });    
		  $("#jqxMenu").css('visibility', 'visible');  
		  $("#mainContent").css({width:'100%',height:'100%'});
		  //默认页 
		  document.getElementById('mainContent').src = 'order/init.do';     
		}); 
	  function logout(){
		  window.location.href="logout.do";   
	  }
  </script>
  <body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" scroll="no"> 
  	<div id='mainSplitter'>
	    <div id='jqxWidget' style='height:100px;'>             
	    	<div id='jqxMenu' style='visibility: hidden;'>   
	    		 <ul>
		    		 <li id="orderManage"><a href="order/init.do" target="mainContent" id="orderData">订单列表</a></li>
		    		 <li id="customerManage"><a href="customer/init.do" target="mainContent" >客户管理</a></li>
		    		 <li id="out"><a onClick="logout(1)" href="javascript:void(0)">退出</a></li>    
	    		 </ul>   
	    	</div>
	    </div>
	    <div id='main'> 
	    	<iframe id='mainContent' name='mainContent' frameborder=0 style="overflow:hidden;"/> 
	    </div>	 
    </div> 
  </body> 

