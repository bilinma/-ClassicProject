var request;

function ajax(method, url, params, fn, resultType) {
		if(window.ActiveXObject)  { 
			request = new ActiveXObject("Microsoft.XMLHttp");
		} else {
			request = new XMLHttpRequest();
		}
		request.onreadystatechange = function() {
			if(request.readyState == 4) {
				if(request.status == 200) { 
					
					var result;
					if(resultType == "xml") {
						result = request.responseXML;						
					} else {
						result = request.responseText;
					}					
					fn(result);
				}
			}
		};
		request.open(method, url); 
		if("post" == method) {
			request.setRequestHeader("Content-type", 
			                       "application/x-www-form-urlencoded");
		}
		request.send(params);
}