
<title id='Description'></title>
<link rel="stylesheet" href="js/jqxGrid-4.3.0/styles/jqx.classic.css" type="text/css" />
<link rel="stylesheet" href="js/layui/css/layui.css" type="text/css" />
<script src="js/layui/layui.js"></script>

<script type="text/javascript">
	layui.use('element', function(){
	  var element = layui.element;
	});
	
	$(document).ready(function() {
		$('#splitContainer').jqxSplitter({
			height : '100%',
			width : '100%',
			orientation : 'horizontal',
			showSplitBar: false,
			panels : [ {
				size : 50
			}, {
				size : '100%'
			} ]
		});
		$('#nestedSplitter').jqxSplitter({
			height : $(document.body).height() - 50,
			width : '100%',
			panels : [ {
				size : 200
			}, {
				size : $(document.body).width() - 200
			} ]
		});
		$("#jqxMenu").jqxMenu({
			width : '100%',
			height : '100%',
			//mode: "popup",
			mode: 'vertical',
			theme : '',
			animationShowDuration : 200
		});
		$("#jqxMenu").css('visibility', 'visible');
		$("#mainContent").css({
			width : '100%',
			height : '100%'
		});
		//默认页 
		$('#mainContent').attr('src', 'order/init.do');
	});

	function logout() {
		window.location.href = "logout.do";
	}
</script>

<style>
html, body {
	height: 100%;
	width: 100%;
	margin: 0px;
	padding: 0px;
	overflow: hidden;
}
</style>
<body class='default'>
	<div id="splitContainer">
		<div class="layui-layout layui-layout-admin">
		<div class="layui-header">
			<div class="layui-logo">客户关系管理</div>
			<!-- 头部区域（可配合layui已有的水平导航） -->
			<ul class="layui-nav layui-layout-left">
			</ul>
			<ul class="layui-nav layui-layout-right">
				<li class="layui-nav-item"><a href="javascript:;"> <img
						src="http://t.cn/RCzsdCq" class="layui-nav-img"> ${loginUserInfo.userName}
				</a>
					<dl class="layui-nav-child">
						<dd>
							<a href="">基本资料</a>
						</dd>
					</dl>
				</li>
				<li class="layui-nav-item"><a onClick="logout(1)" href="javascript:void(0)">退出</a></li>
			</ul>
		</div>
		</div>

		<div>
			<div id="nestedSplitter">
				<div id='jqxWidget' style='height: 100px;'>
					<div id='jqxMenu' style='visibility: hidden;'>
						<ul>
							<li id="orderManage"><a href="order/init.do"
								target="mainContent" id="orderData">订单列表</a></li>
							<li id="customerManage"><a href="customer/init.do"
								target="mainContent">客户管理</a></li>
						</ul>
					</div>
				</div>
				<div id='main'>
					<iframe id='mainContent' name='mainContent' frameborder=0
						style="overflow: hidden;" />
				</div>
			</div>
		</div>
	</div>
</body>
