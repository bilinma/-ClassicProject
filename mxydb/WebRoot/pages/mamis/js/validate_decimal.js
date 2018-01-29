/**
 * ��֤С�������Ƿ����Ҫ��Ĭ�ϸ�ʽΪ#####.##
 * @param controller���ؼ�����
 * @param label�����ؼ���ʾ����
 * @param empty���Ƿ�����ؼ���ֵΪ�գ�true������false������
 * @param format��16,2,+|-
 * @param scope
 */
function DecimalValidator(controller, label, empty, format, scope,disabled) {
  this.Validator = Validator;
  this.Validator(controller, label, empty, format, scope,disabled);

  this.minValue = Number.MIN_VALUE;
  this.maxValue = Number.MAX_VALUE;
  this.length = 16; //������ֵ�ĳ��ȣ�������С���㣩
  this.precision = 2; //С�����ȷ����λ
  this.sign = ""; //�Ƿ���������������

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
 //У���Ƿ�������
DecimalValidator.prototype.validateDecimal = function() {
  var inputValue = trim(this.controller.value);
  if (inputValue.length ==0)
    return true;
  //�ڼ��ǰ���Ƚ��ӺŻ����ȥ��
  this.firstChar = inputValue.substring(0, 1);
  if (this.sign == "+" ){
    if( this.firstChar == "-") {
      this.setErrorInfor("���棺" + this.label + "�ĵ�һ���ַ�����Ϊ����[+]���������");
      return false;
    }
  } else if (this.sign == "-") {
    if(this.firstChar != "-") {
      this.setErrorInfor("���棺[" + this.label + "]�ĵ�һ���ַ�����Ϊ����[-]");
      return false;
    }
  }
  if(this.firstChar=="+"||this.firstChar=="-")
    inputValue = inputValue.substring(1);
    //����Ѿ���ʽ��������ȥ��ʽ��
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
    //�ڼ���Ƿ�������ǰ���Ƚ�'.'ȥ��
    var tempArray = inputValue.split('.');
    //ȥ����ͷ��0
    var zeroIndex = 0;
    var joinedString = tempArray.join('');
    while (joinedString.charAt(zeroIndex) == '0') {
      zeroIndex++;
    }
    var noZeroString = joinedString.substring(zeroIndex, joinedString.length);

    //alert(noZeroString+"  "+tempArray.length+"  "+isDigitStr(noZeroString));
    //�������ȫ��Ϊ0�����Ҳ������ֻ����ַ����ж���һ��.
    if (noZeroString!="" &&(!isDigitStr(noZeroString) || tempArray.length > 2)) {
      this.setErrorInfor("���棺[" + this.label + "]��ӦΪ����������");
      return false;
    }
    var iValue = parseFloat(inputValue);
    //������ֵĳ����Ƿ񳬹��涨��ֵ
    var valueLength = inputValue.length - 1;
    if (valueLength > this.length) {
      this.setErrorInfor("���棺[" + this.label + "]�ĳ��Ȳ��ܴ���[" + this.length + "]λ");
      return false;
    }
    //���С������λ���Ƿ񳬹��涨��ֵ
    if (this.precision >= 0) {
      if ((new String(tempArray[1])).length > this.precision) {
        this.setErrorInfor("���棺[" + this.label + "]Ҫ��ȷ��С�����[" + this.precision + "]λ");
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
  	//��ȡ��ǰ����λ��
		var slct = document.selection; 
    var rng = slct.createRange(); 
    this.controller.select(); 
    rng.setEndPoint("StartToStart", slct.createRange()); 
    var psn = rng.text.length; 
    rng.collapse(false); 
    rng.select(); 
  if ((inputValue.indexOf(".")<0&&isDotSign(keyCode)) || isNumber(keyCode)){
  	
  	//��С�����������ж��Ƿ񳬹�����ĳ���
	  if(inputValue.indexOf(".")>0 && inputValue.length-1>=this.length){
	  	//�����С���㣬���������ֵ���ı����ֵ��������
		  window.event.returnValue = false;
	  	return false;
	  }else{
	  	//û��С���������
	  	if(inputValue.indexOf(".")<0 && (inputValue.length)>(this.length-this.precision-1)&&!isDotSign(keyCode)){
		  	//û��С���㡣�����������ֳ������ı����������ֳ��ȳ�������
			  window.event.returnValue = false;
		  	return false;
		  }
		  //û��С���㡣���������ֵ�ǡ�.��
		  if(isDotSign(keyCode)){
		  	//����ı�����ֻ��һ������
		  	if(trim(this.controller.value)=="-"){
		  		window.event.returnValue = false;
		  		return false;
		  	}
		  	return;
		  }
	  }
	  //�ж��Ƿ񳬹��˾���
	  valueArray = splitString(inputValue,".");
	  if(valueArray.length>1){
		 if((valueArray[1].length)>=this.precision){
		 	//����������㡣����������û�����㡣
		 	if(valueArray[0].length<=(this.length-this.precision-1)){
		    //������λ����С����ǰ�����Լ������룬�����С����󣬲������롣
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
  //�жϵ�һλ�Ƿ�Ϊ���š������ı�������ȫ��ѡ�С�
  if((trim(this.controller.value).substring(0,1)!="-"&&inputValue.length==0)||(this.controller.caretPos.text==trim(this.controller.value))||(trim(this.controller.value).substring(0,1)!="-"&&psn==0)){ //�жϷ������
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
           alert("��ʶ[" + target.substring(1) + "]��Ӧ�Ķ��󲻴��ڣ�" )
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
  
  
