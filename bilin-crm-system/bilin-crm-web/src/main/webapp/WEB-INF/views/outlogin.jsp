
   <script type="text/javascript"> 
	   var user  = '${loginUserInfo}';
	   if(user==''){
	 	  alert("超时,请重新登录");
	 	  parent.window.location.href = '<%=basePath%>login.do';   
	   }
    </script> 
<body>         
	
</body>

