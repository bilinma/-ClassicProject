function regNameSpace(namespace) {
	var seg = namespace.split(".");
	var obj = window[seg[0]] = window[seg[0]] || {};
	var c = obj;
	for ( var i = 1; i < seg.length; i++) {
		c[seg[i]] = c[seg[i]] || {};
		c = c[seg[i]];
	}
	return obj;
}

regNameSpace("validateUtil");



validateUtil = {
	checkUserName:function(tab,userName) {
		var temp = false;
		if (userName != '') {
			var regx = /^[A-Za-z0-9_\u4e00-\u9fa5]+$/;
			if (!regx.test(userName)) {
				Hq.Msg.alert("用户名由数字、字母、下划线及汉字组成！");
				tab.setFormData({USERNAME:""});
				return false;
			} else {
				Hq.ajax( {
					url : 'gip/register/checkUserName.do?',
					data : {
						tableDBName	: tab.setting.tableDBName,							
						userName : userName
					},
					async : false,
					type : 'post',
					cache : false,
					dataType : 'json',
					success : function(result) {
						if (result.successFlag){
							if (result.result) {
								Hq.Msg.alert("该用户名已被注册,请重新填写！");
								temp = false;
							}else{
								temp = true;
							}
						}else{
							gip.Exception.showExcepDialog("用户验重异常！",data);
						}
					}
				});
			}
		}
		return temp;
	},
	//企业注册和个人注册校验
	validateRepeat:function(tab,paramsJson) {
		var temp = false;
		if (!paramsJson) {
			return false;
		} else {
			Hq.ajax( {
				url : 'gip/register/validateRepeat.do',
				data : {
					"paramsJson" : paramsJson
				},
				cache : false,
				async : false,
				success : function(result) {
					if(result.successFlag){
						if (result.result.flag){
							temp = true;
						}else{
							Hq.Msg.alert(result.result.msg);
							temp = false;
						}
					}else{
						Hq.Msg.alert("验重异常，请联系管理员！");
						temp = false;
					}
				}
			});
		}
		return temp;
	},
	checkPassWord:function(password) {
		if (password != '') {
			var regx = /^(?![0-9]+$)(?![a-zA-Z]+$)[a-zA-Z0-9]{8,32}$/;
			if (!regx.test(password)) {
				alert("密码应为字母数字组合且长度不能小于8位!");
				return false;
			}
		}else{
			alert("密码不能为空！");
			return false;
		}
		return true;
	},
	
	checkConfirmPwd:function (password, confirmPwd) {
		if ('' != password && '' != confirmPwd && password != confirmPwd) {
			alert("两次输入的密码不一致!");
			return false;
		}else{
			return true;
		}
	},
	
	checkEmail:function (regEmail) {
		if (regEmail != '') {
			var regx = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
			if (!regx.test(regEmail)) {
				alert("请填写正确的邮箱!");
				return false;
			}
		}
	
		return true;
	},
	checkOrgCode:function (tab,orgcode) {
		var temp = false;
		if (orgcode != '') {
			var regx = /^[a-zA-Z0-9]+$/;
			if (!regx.test(orgcode)) {
				alert("请填写正确的组织机构代码！!");
				return false;
			} else {
				Hq.ajax( {
					url : 'gip/register/checkOrgCode.do?',
					data : {
						orgcode : orgcode
					},
					async : false,
					type : 'post',
					cache : false,
					dataType : 'json',
					success : function(result) {
						if (false == result) {
							alert("该组织机构码已经注册,请重新填写！");
							tab.setFormData({ORGCODE:""});
							temp = false;
						} else {
							temp = true;
						}
					}
				});
			}
		}
		return temp;
	},
	checkZipcode:function (zipcode) {
		if (zipcode != '') {
			var regx = /^\d{6}$/;
			if (!regx.test(zipcode)) {
				alert("邮政编码应为6位数字!");
				return false;
			}
		}
		return true;
	},
	
	checkMoney:function (value) {
		if (value != '') {
			var regx = /^(-)?(([1-9]{1}\d*)|([0]{1}))(\.(\d){1,2})?$/;
			if (!regx.test(value)) {
				alert("请填写正确的金额！");
				return false;
			}
		}
		return true;
	},
	checkNum:function (stafNum) {
		if (stafNum != '') {
			var regx = /^[1-9]\d*|0$/;
			if (!regx.test(stafNum)) {
				alert("请输入正确的职工人数!");
				return false;
			}
		}
		return true;
	},
	checkYear:function (foundedTime) {
		if (foundedTime != '') {
			var regx = /^[1-9]\d{3}$/;
			if (!regx.test(foundedTime)) {
				alert("请输入正确的年份!");
				return false;
			}
		}
		return true;
	},
	checkPhone:function (phone) {
		if (phone != '') {
			var regx = /^[\d|-]+$/;
			if (!regx.test(phone)) {
				alert("请输入正确的联系电话(固话)!");
				return false;
			}
		}
		return true;
	},
	checkMobile:function (mobile) {
		if (mobile != '') {
			var regx = /^1[3|4|5|8][0-9]\d{8}$/;
			if (!regx.test(mobile)) {
				alert("请输入正确的手机号码!");
				return false;
			}
		}else{
			alert("手机号码不能为空!");
			return false;
		}
		return true;
	},
	
	/**
	 * 校验两个时间大小
	 * @param {Object} start_time
	 * @param {Object} end_time
	 * @return {TypeName} 
	 */
	compareTime : function (startDate, endDate){
		var start_year;
		var start_month;
		var start_day;
		var start_hour;
		var start_minute;
		var start_second;
		var end_year;
		var end_month;
		var end_day;
		var end_hour;
		var end_minute;
		var end_second;
		if(startDate.length == 19 && endDate.length == 19){
			start_year = startDate.substring(0,4);
			start_month = startDate.substring(5,7) - 1;
			start_day = startDate.substring(8,10);
			start_hour = startDate.substring(11,13);
			start_minute = startDate.substring(14,16);
			start_second = startDate.substring(17);
			end_year = endDate.substring(0,4);
			end_month = endDate.substring(5,7) - 1;
			end_day = endDate.substring(8,10);
			end_hour = endDate.substring(11,13);
			end_minute = endDate.substring(14,16);
			end_second = endDate.substring(17);
		} else if(startDate.length == 10 && endDate.length == 10){
			start_year = startDate.substring(0,4);
			start_month = startDate.substring(5,7) - 1;
			start_day = startDate.substring(8);
			start_hour = 0;
			start_minute = 0;
			start_second = 0;
			end_year = endDate.substring(0,4);
			end_month = endDate.substring(5,7) - 1;
			end_day = endDate.substring(8);
			end_hour = 0;
			end_minute = 0;
			end_second = 0;
		}else{
			Hq.Msg.alert("日期格式错误!");
			return false;
		}
		var start = new Date(start_year,start_month,start_day,start_hour,start_minute,start_second);
		var end = new Date(end_year,end_month,end_day,end_hour,end_minute,end_second);
		if(end.getTime() - start.getTime() <= 0){
			Hq.Msg.alert("起始日期应该早于结束日期！");
			return false;
		}
	   return true;
	}
}
