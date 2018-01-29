<%@page contentType="text/html; charset=utf-8"%>
<html>
	<body>
		<input id="picsUrl" type="hidden" value="${picsUrl }"/> 
		<input id="linksUrl" type="hidden" value="${linksUrl }"/> 
		<input id="newsTitle" type="hidden" value="${newsTitle }"/> 
		<script type="text/javascript">
		  var interval_time=0; //图片停顿时间，单位为秒，为0则停止自动切换
		  var focus_width=320;
		  var focus_height=240;
		  var text_height=28;
		  var text_align="center" //标题文字对齐方式(left、center、right)
		  var swf_height=focus_height+text_height; //相加之和最好是偶数,否则数字会出现模糊失真的问题
		  
		  //更换为上传图片
//		  var pics="userfiles/image/00.jpg|userfiles/image/01.jpg|userfiles/image/02.jpg";
		  var pics="UploadPictures/00.jpg|UploadPictures/01.jpg|UploadPictures/02.jpg";
//		  var pics=document.getElementById('picsUrl').value;
		  //新闻地址链接
		  var links="jsp/news/showNews.action?id=22 mname=新闻资讯|jsp/news/showNews.action?id=23 mname=新闻资讯|jsp/news/showNews.action?id=24 mname=新闻资讯";
//		  var links=document.getElementById('linksUrl').value;
		  //新闻标题
		  var texts="全省中小企业和非公有制企业上半年经济运行…|省中小企业局传达贯彻全省领导干部大会和省…|中德中小企业经营管理者培训合作项目（MP）…";
//		  var texts=document.getElementById('newsTitle').value;
	
		  document.write('<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" width="'+ focus_width +'" height="'+ swf_height +'">');
		  document.write('<param name="allowScriptAccess" value="sameDomain" /><param name="movie" value="images/focus.swf" /><param name="quality" value="high" /><param name="bgcolor" value="#F0F0F0">');
		  document.write('<param name="menu" value="false"><param name=wmode value="opaque">');
		  document.write('<param name="FlashVars" value="pics='+pics+'&links='+links+'&texts='+texts+'&borderwidth='+focus_width+'&borderheight='+focus_height+'&textheight='+text_height+'">');
		  document.write('<embed src="images/focus.swf" wmode="opaque" FlashVars="pics='+pics+'&links='+links+'&texts='+texts+'&borderwidth='+focus_width+'&borderheight='+focus_height+'&textheight='+text_height+'" menu="false" bgcolor="#F0F0F0" quality="high" width="'+ focus_width +'" height="'+ focus_height +'" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />');
		  document.write('</object>');
		</script>
	</body>
</html>