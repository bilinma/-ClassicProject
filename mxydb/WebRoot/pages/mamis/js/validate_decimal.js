/**
 * 验证小数类型是否符合要求。默认格式为#####.##
 * @param controller　控件对象
 * @param label　　控件显示文字
 * @param empty　是否允许控件的值为空，true　允许；false不允许
 * @param format　16,2,+|-
 * @param scope
 */
function DecimalValidator(controller, label, empty, format, scope,disabled) {
  this.Validator = Validator;
  this.Validator(controller, label, empty, format, scope,disabled);

  this.minValue = Number.MIN_VALUE;
  this.maxValue = Number.MAX_VALUE;
  this.length = 16; //整个数值的长度（不包括小数点）
  this.precision = 2; //小数点后精确到两位
  this.sign = ""; //是否允许输入正负号

  if (this.format != null) {
    var formatArray = splitString(this.format, ",");
    if (formatArray.length == 1) {
      this.length = parseInt(formatArray[0]);
    }
    if (formatArray.length == 2) {
      this.length = parseInt(formatArray[0]);
      this.precision = parseInt(formatArray[1]);
    }
    if (formatArray.length == 3) {
      this.length = parseInt(formatArray[0]);
      this.precision = parseInt(formatArray[1]);
      this.sign = formatArray[2];
    }
  }
}

DecimalValidator.prototype = new Validator;
DecimalValidator.prototype.constructor = DecimalValidator;
 //校验是否是数字
DecimalValidator.prototype.validateDecimal = function() {
  var inputValue = trim(this.controller.value);
  if (inputValue.length ==0)
    return true;
  //在检查前首先将加号或减号去掉
  this.firstChar = inputValue.substring(0, 1);
  if (this.sign == "+" ){
    if( this.firstChar == "-") {
      this.setErrorInfor("警告：" + this.label + "的第一个字符必须为正号[+]或不输入符号");
      return false;
    }
  } else if (this.sign == "-") {
    if(this.firstChar != "-") {
      this.setErrorInfor("警告：[" + this.label + "]的第一个字符必须为负号[-]");
      return false;
    }
  }
  if(this.firstChar=="+"||this.firstChar=="-")
    inputValue = inputValue.substring(1);
    //如果已经格式化过，则去格式化
    var numFormat = new NumberFormat();
    numFormat.setNumber(inputValue); // obj.value is '-1000.247'
    numFormat.setPlaces(this.precision, false);
    numFormat.setSeparators(false, ",", ".");
    inputValue = numFormat.doFormat();
    if(this.firstChar == "+" || this.firstChar == "-") {
      if(inputValue.substring(0,1)!="+" && inputValue.substring(0,1)!="-"){
      	this.controller.value = this.firstChar + inputValue;
      }
    } else {
      this.controller.value = inputValue;
    }
    //在检查是否是数字前首先将'.'去掉
    var tempArray = inputValue.split('.');
    //去掉开头的0
    var zeroIndex = 0;
    var joinedString = tempArray.join('');
    while (joinedString.charAt(zeroIndex) == '0') {
      zeroIndex++;
    }
    var noZeroString = joinedString.substring(zeroIndex, joinedString.length);

    //alert(noZeroString+"  "+tempArray.length+"  "+isDigitStr(noZeroString));
    //如果不是全部为0，并且不是数字或者字符串中多余一个.
    if (noZeroString!="" &&(!isDigitStr(noZeroString) || tempArray.length > 2)) {
      this.setErrorInfor("警告：[" + this.label + "]不应为非数字输入");
      return false;
    }
    var iValue = parseFloat(inputValue);
    //检查数字的长度是否超过规定的值
    var valueLength = inputValue.length - 1;
    if (valueLength > this.length) {
      this.setErrorInfor("警告：[" + this.label + "]的长度不能大于[" + this.length + "]位");
      return false;
    }
    //检查小数点后的位数是否超过规定的值
    if (this.precision >= 0) {
      if ((new String(tempArray[1])).length > this.precision) {
        this.setErrorInfor("警告：[" + this.label + "]要求精确到小数点后[" + this.precision + "]位");
        return false;
       }
    }
    return true;
 }


DecimalValidator.prototype.onKeyDown = function() {
  var keyCode = window.event.keyCode;
  var inputValue = trim(this.controller.value).substring(0,1)!="-"?trim(this.controller.value):trim(this.controller.value).substring(1,trim(this.controller.value).length);
  inputValue = inputValue.replace(new RegExp(",","g"),"");
  	this.controller.caretPos = document.selection.createRange().duplicate(); 
  	if(this.controller.caretPos.text!=""&&this.controller.caretPos.text!=","&&this.controller.caretPos.text!="."){
	  	if (this.controller.createTextRange && this.controller.caretPos) {
			  var caretPos = this.controller.caretPos;
			  if(!this.controller.readOnly){
				  document.selection.clear();
				}
			  return;
			}
		}
  	//获取当前光标的位置
		var slct = document.selection; 
    var rng = slct.createRange(); 
    this.controller.select(); 
    rng.setEndPoint("StartToStart", slct.createRange()); 
    var psn = rng.text.length; 
    rng.collapse(false); 
    rng.select(); 
  if ((inputValue.indexOf(".")<0&&isDotSign(keyCode)) || isNumber(keyCode)){
  	
  	//有小数点的情况。判断是否超过了最长的长度
	  if(inputValue.indexOf(".")>0 && inputValue.length-1>=this.length){
	  	//如果有小数点，并且输入的值比文本框的值长。返回
		  window.event.returnValue = false;
	  	return false;
	  }else{
	  	//没有小数点情况。
	  	if(inputValue.indexOf(".")<0 && (inputValue.length)>(this.length-this.precision-1)&&!isDotSign(keyCode)){
		  	//没有小数点。并且整数部分长度与文本框整数部分长度长。返回
			  window.event.returnValue = false;
		  	return false;
		  }
		  //没有小数点。并且输入的值是“.”
		  if(isDotSign(keyCode)){
		  	//如果文本框中只有一个负号
		  	if(trim(this.controller.value)=="-"){
		  		window.event.returnValue = false;
		  		return false;
		  	}
		  	return;
		  }
	  }
	  //判断是否超过了精度
	  valueArray = splitString(inputValue,".");
	  if(valueArray.length>1){
		 if((valueArray[1].length)>=this.precision){
		 	//如果精度满足。而整数部分没有满足。
		 	if(valueArray[0].length<=(this.length-this.precision-1)){
		    //如果光标位置在小数点前，可以继续输入，如果在小数点后，不可输入。
		    if(psn>inputValue.indexOf(".")){
		    	window.event.returnValue = false;
			  	return false;
		    }
		 	}else{
				window.event.returnValue = false;
			  return false;
			}
		 }
	  }
    return;
  }
  //判断第一位是否为负号。或者文本框内容全部选中。
  if((trim(this.controller.value).substring(0,1)!="-"&&inputValue.length==0)||(this.controller.caretPos.text==trim(this.controller.value))||(trim(this.controller.value).substring(0,1)!="-"&&psn==0)){ //判断符号输出
  	if((this.sign=="+"||this.sign=="")&&isPlusSign(keyCode))
       return;
    if((this.sign=="-"||this.sign=="")&&isSubtractionSign(keyCode))
       return;
  }
  window.event.returnValue = false;
  return;
}

DecimalValidator.prototype.doFormat = function() {
  var inputValue = trim(this.controller.value);
  if(inputValue.length==0&&this.empty)
    return;


  this.firstChar = inputValue.substring(0, 1);
  var num = new NumberFormat();
  num.setNumber(inputValue); // obj.value is '-1000.247'
  num.setPlaces(this.precision, false);
  var formatedStr = num.doFormat();
  if (this.firstChar == "+" || this.firstChar == "-") {
     if(formatedStr.substring(0,1)!="+" && formatedStr.substring(0,1)!="-"){
  	   formatedStr = this.firstChar + formatedStr;
  	 }
  }
  this.controller.value = formatedStr;
  return true;
}

DecimalValidator.prototype.validate = function() {
  if (this.validateDecimal()) {
    if (this.format.length > 0) {
      this.doFormat();
    }
    return true;
  }

  return false;
}


 DecimalValidator.prototype.getValue = function() {
     var value = this.controller.value.replace(new RegExp(",","g"),"");
     return parseFloat(value);
  }
  DecimalValidator.prototype.getTargetValue = function(target){
      if(target==null)
         return 0;
       if(/^&/.test(target)){
         var targetObj = document.all[target.substring(1,target.length)];
         if(targetObj == null){
           alert("标识[" + target.substring(1) + "]对应的对象不存在！" )
           return 0;
         }
         var targetValueStr = this.target.value.replace(new RegExp(",","g"),"");
         var value = trim(targetValueStr);
         if(value=="")
           return 0;
         else
           return parseFloat(value);
       }else{
          return parseFloat(target);
       }
  }

  DecimalValidator.prototype.beforeSubmit = function(){
    if(trim(this.controller.value)!=""){
    this.controller.value = this.controller.value.replace(new RegExp(",","g"),"");


    }
  }
  
  
