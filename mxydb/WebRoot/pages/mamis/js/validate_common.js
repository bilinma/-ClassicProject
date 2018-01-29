   /**
    * ɾ���ַ�������Ŀո�,���ص���ɾ������ո���ַ���
    * @param str ��������ַ���
    */
   function trim(str){
     if(str==null||str=="") return "";
     return str.replace(/^\s+/g, '').replace(/\s+$/g, '');
   };

   /**
    * ��ָ����Ԫ��e1��eventNameָ�����¼��������¼�������
    */
   function addEventListener(el,eventName,func){
    // DOM2
     if ( typeof el.addEventListener != "undefined" )
       el.addEventListener( eventName, func, false );
       // IE
     else if ( typeof el.attachEvent != "undefined" )
         el.attachEvent( "on"+eventName , func );
         //other
     else {
       if ( el["on"+eventName] != null ) {
         var old = el["on"+eventName];
         el["on"+eventName] = function ( e ) {
           old( e );
           func();
         };
       }  else
          el["on"+eventName] = func;
       }
  };

   /**
    * ��Ŀ���ַ���������ָ���ķָ���ֽ�Ϊ�ַ�������
    * @param targetString Ŀ���ַ���
    * @param seperator �ָ��
    * @parem return  Array ���ָ���ַ�������
    */
   function splitString(targetString,seperator) {
    if(targetString == null || trim(targetString)=="") {
      return new Array();
    }

    var resultStrs = new Array();
    var singleStatement = "";
    var fromIndex = 0;
    var endIndex = 0;
    var breakFor = false;
    while(fromIndex < targetString.length) {
      endIndex = targetString.indexOf(seperator,fromIndex);
      if(endIndex == -1) {
        endIndex = targetString.length;
        breakFor = true;
      }
      singleStatement = targetString.substring(fromIndex,endIndex);
      if(singleStatement != null && !trim(singleStatement)=="") {
        resultStrs[resultStrs.length] = singleStatement;
      }
      fromIndex = endIndex + 1;
      if(breakFor) {
        break;
      }
    }
    return resultStrs;
  };

  /**
   * �õ��ַ�����byte����
   */
  function stringCharLength(str){
     var len=str.length;
     var num=0;
     for(i=0;i<len;i++){
	var tmp=str.charCodeAt(i);
        if(tmp<=255) num++;
	else num=num+2;
    }
    return num;
  }


  ////////////////////////////////////////////////////////////////////
  ////START �������ж�
  ////////////////////////////////////////////////////////////////////
   /**
    * �жϼ��������Ƿ����ּ�
    * @param keyCode ����ļ�ֵ
    */
   function isNumber(keyCode){
     if (((keyCode >= 48 && keyCode <= 57 )&& (window.event.shiftKey == false))
      ||(keyCode >= 96 && keyCode <= 105 ))
      return true;
     return false;
   }

   /**
    * �жϼ��������Ƿ�Ϊ����ƶ�����
    * @param keyCode ����ļ�ֵ
    */
   function isCursorCtrl(keyCode){
     if(keyCode >= 33 && keyCode <= 40 )
      return true;
     return false;
   }

   /**
    * �жϼ��������Ƿ�Ϊ+��
    * @param keyCode ����ļ�ֵ
    */
   function isPlusSign(keyCode){
     if((keyCode==187||keyCode==107)&&window.event.shiftKey==true)
      return true;
     return false;
   }
   /**
    * �жϼ��������Ƿ�Ϊ-��
    * @param keyCode ����ļ�ֵ
    */
   function isSubtractionSign(keyCode){
     if((keyCode == 109||keyCode == 189)&&window.event.shiftKey==false)
      return true;
     return false;
   }

   /**
    * �жϼ��������Ƿ�Ϊ.��
    * @param keyCode ����ļ�ֵ
    */
   function isDotSign(keyCode){
     if(keyCode==110 ||keyCode==190)
       return true;
     return false;
   }
   /**
    * �жϼ��������Ƿ�ΪTab��
    * @param keyCode ����ļ�ֵ
    */
   function isTab(keyCode){
     if(keyCode==9)
      return true;
     return false;
   }
   /**
    * �жϼ��������Ƿ�Ϊ�س���
    * @param keyCode ����ļ�ֵ
    */
   function isEnter(keyCode){
     if(keyCode==13)
      return true;
     return false;
   }
   /**
    * �жϼ��������Ƿ�Ϊ�˸��
    * @param keyCode ����ļ�ֵ
    */
   function isBackspace(keyCode){
     if(keyCode==8)
      return true;
     return false;
   }
  /**
   * �жϼ��������Ƿ�Ϊɾ����
   */
  function isDelete(keyCode){
     if(keyCode==46){
	     return true;
	   }
     return false;
  }
  //////////////�������������ж�


  /**
   * �ѻس���ת��ΪTab��
   */
   function enterToTab() {
     if(window.event.keyCode==13)
         window.event.keyCode=9;
   }

  /**
   * �Ƿ�Ϊȫ�����ַ���
   */
  function isDigitStr(s){
      var patrn=/^(\d+)$/;
      if (!patrn.exec(s)) return false;
      return true;
   };



   function IValidator(id,label,empty,format,scope,disabled){
     this.errorInfor = "";
     this.id = id;
     this.label = label;
     this.format = format;
     this.empty = empty;
     this.disabled = disabled;
     this.scope = scope;
     this.listeners = new Array();
   }
   IValidator.prototype.addListener = function(listener){
     this.listeners[this.listeners.length] = listener;
   }
   IValidator.prototype.notify = function(){
     if(this.listeners.length==0) return;
     for(var i=0;i<this.listeners.length;i++){
       this.listeners[i].doNotifierChange();
     }
   }
   /**
    * ���ô�����Ϣ
    */
   IValidator.prototype.setErrorInfor = function(errorInfor){
     this.errorInfor = errorInfor;
   }
   IValidator.prototype.parseAndAttachNotifiers = function(expression){
     if(expression==null||expression=="")
       return expression;
     var returnValue = expression;
     var pattern = /[&\$]([a-zA-Z_0-9]+)/g;
     var pattern2 = /[&\$]([a-zA-Z_0-9]+)/;
     var token = pattern.exec(expression);   // get the first match
     while (token != null){
       var notifier = document.all[token[1]].validator;
       if(notifier!=null){ //���ڶ�Ӧ��Validator
         notifier.addListener(this);
         returnValue = returnValue.replace(pattern2,"document.all['$1'].value");
        }else{  //����radio��checkbox������
          var groupObj = document.all[token[1]];
          if(groupObj.length!=null){
            groupObj[0].validator.addListener(this);
            returnValue = returnValue.replace(pattern2,"document.all['$1'][0].validator.getStrValue()");
          }else{
            alert("���ʽ[" + expression + "]�����["+ token[1] +"]��ʾ��HtmlԪ�ز�����");
          }
        }
        token = pattern.exec(expression);    // get the next match
      }
      return returnValue;
    }
    IValidator.prototype.processStrIndex = function(str,index){
      if(str==null) return str;
      if(index == null) return str;
      var replaceRegx = /(_\d+_)/g;
      str = str.replace(replaceRegx,"_" + index + "_");
      replaceRegx = /(\[\d+\])/g;
      str = str.replace(replaceRegx,"[" + index + "]");
      return str;
    }
   /**
    * ����empty��disable���ʽ�е�Listen/notify���ƣ����б��ʽԤ����
    */
   IValidator.prototype.doInitNotifier = function(){
     this.empty = this.parseAndAttachNotifiers(this.empty);
     this.disabled = this.parseAndAttachNotifiers(this.disabled);
   }
   /**
    *�¼������������ֵ�����˱仯
    */
   IValidator.prototype.doNotifierChange = function(){
   }
   IValidator.prototype.beforeSubmit = function() {
     return true;
   }
   IValidator.prototype.focusController = function(){
   }
   IValidator.prototype.getStrValue = function(){
     return "";
   }
   IValidator.prototype.validateEmpty = function(){
     return true;
   }
   IValidator.prototype.validate = function(){
     return true;
   }
   IValidator.prototype.doFormat = function() {
     return;
   }
   IValidator.prototype.getErrorInfor = function(){
    return this.errorInfor;
   }
   IValidator.prototype.validateScope = function(){
    return true;
   }
   IValidator.prototype.clear = function(){
   }
   IValidator.prototype.clone = function(id,index){
      var label = this.label;
      var empty = this.processStrIndex(this.empty,index);
      var format = this.format;
      var scope = this.processStrIndex(this.scope,index);
      var disabled = this.processStrIndex(this.disabled,index);
      //  alert((new validator.constructor(oOldChildId,label,empty,format,scope,disabled)).id);
      return new this.constructor(id,label,empty,format,scope,disabled);
   }



 //һ���������ж��form, ÿ��form�ж����ύ��ʽ, ��ͬ���ύ��ʽ��ҪУ������ݲ�ͬ,�籣��\��ѯɾ��
 //����Validator���͵ĸ���,����empty��disabled���﷨��ʽΪ &style=value&&&styleId2=value
   function Validator(id,label,empty,format,scope,disabled) {
     this.IValidator = IValidator;
     this.IValidator(id,label,empty,format,scope,disabled);
     if(id==null||id=="")
       return;
     this.controller = document.all(id);
     if(this.controller!=null&&this.controller.validator==null){ //��д��ص���������¼�����
       this.controller.validator = this; //�ѵ�ǰ���ƶ�����Ϊcontroller�����validator����
       this.controller.validatoronkeydownold = this.controller.onkeydown;
       this.controller.validatoronblurold = this.controller.onblur;
       this.controller.validatoronfocusold = this.controller.onfocus;
       this.controller.validatoronchangeold = this.controller.onchange;

       this.controller.onkeydown = function(){
          var keyCode = window.event.keyCode;
           //�������ת��
          if (isEnter(keyCode)) {
            window.event.keyCode = 9;
            return;
          }
          if(isBackspace(keyCode)||isTab(keyCode)||isCursorCtrl(keyCode)) {
          	if(isBackspace(keyCode)){
          		//���ѡ�е�Ϊ","������"."
          		if(document.selection.createRange().duplicate().text==""){
								if(event.srcElement.value.indexOf(".")>0){
									//�����С���㣬���������ֵ���ı����ֵ��������
									//��ȡ��ǰ����λ��
									var slct = document.selection; 
							    var rng = slct.createRange(); 
							    event.srcElement.select(); 
							    rng.setEndPoint("StartToStart", slct.createRange()); 
							    var psn = rng.text.length; 
							    rng.collapse(false); 
							    rng.select(); 
							    //������λ����С����ǰ�����Լ������룬�����С����󣬲������롣
							    var inputValue=event.srcElement.value;
							    if(psn!=(inputValue.indexOf(".")+1)
							    ||(inputValue.substring(inputValue.indexOf(".")+1,inputValue.length)=="")){
					  				return;
							    }else{
							    	return false;
							    }
								}
							}
          	}
            return;
          }
          if (isDelete(keyCode)){ //tab
          	if(document.selection.createRange().duplicate().text==""){
							if(event.srcElement.value.indexOf(".")>0){
								//�����С���㣬���������ֵ���ı����ֵ��������
								//��ȡ��ǰ����λ��
								var slct = document.selection; 
						    var rng = slct.createRange(); 
						    event.srcElement.select(); 
						    rng.setEndPoint("StartToStart", slct.createRange()); 
						    var psn = rng.text.length; 
						    rng.collapse(false); 
						    rng.select(); 
						    //������λ����С����ǰ�����Լ������룬�����С����󣬲������롣
						    if(psn!=event.srcElement.value.indexOf(".")){
				  				return;
						    }else{
						    	return false;
						    }
							}
						}
            return;
          }
          this.validator.onKeyDown();  //��this��Validator�е�this��ͬ���� this��ʶValidator�е�this.controller
          if(this.validatoronkeydownold != null){
            this.validatoronkeydownold();
          }
       }
       this.controller.onchange = function(){
          this.validator.notify();
          if(this.validatoronchangeold!=null)
           this.validatoronchangeold();
       }
       this.controller.onblur = function(){
         this.validator.doFormat();
         if(this.validatoronblurold!=null){
           this.validatoronblurold();
         }
       }
       this.controller.onfocus = function(){
         if(this.tagName == "INPUT")
           this.select();
         if(this.validatoronfocusold!=null){
           this.validatoronfocusold();
         }
       }
     }
   }

   Validator.prototype = new IValidator;
   Validator.prototype.constructor = Validator;
   /**
    * �õ���ǰvalidator�����controller����
    */
   Validator.prototype.getController = function() {
     return this.controller;
   }
   /**
    * ����target��ʶ��������ʶHtml�����Label����
    * @param target ����ֵ��&��ʼʱ���ò�����ʾhtmlԪ�ص�styleid��ʶ
    */
   Validator.prototype.getTargetLabel = function(target){
     if(target==null)
       return "";
     if(/^[&\$]/.test(target)){
       var validator = document.all[target.substring(1,target.length)].validator;
       if(validator!=null)
         return validator.label;
       return target;
      }else{
        return target;
      }
    }

    Validator.prototype.equal = function(target) {
      if(this.getTargetValue(target) == this.getValue())
         return true;
       this.setErrorInfor("���棺[" + this.label + "]�����ֵӦ����[" + this.getTargetLabel(target) + "]��ֵ��");
       return false;
     }
     Validator.prototype.notEqual = function(target){
       if(this.getValue() != this.getTargetValue(target))
         return true;
       this.setErrorInfor("���棺[" + this.label + "]�����ֵӦ������[" + this.getTargetLabel(target) + "]��ֵ��");
       return false;
     }
     Validator.prototype.lessThan = function(target){
      // alert(" a value:" + this.getValue() + "lessThan:" + this.getTargetValue(target));
        if(this.getValue() < this.getTargetValue(target)){
         return true;
       }
       this.setErrorInfor("���棺[" + this.label + "]�����ֵӦС��[" + this.getTargetLabel(target) + "]��ֵ��");
       return false;
     }
     Validator.prototype.lessEqual = function(target){
      if(this.getValue() <= this.getTargetValue(target))
         return true;
       this.setErrorInfor("���棺[" + this.label + "]�����ֵӦС�ڵ���[" + this.getTargetLabel(target) + "]��ֵ��");
       return false;
     }

     Validator.prototype.greaterThan = function(target){
       if(this.getValue() > this.getTargetValue(target))
         return true;
        this.setErrorInfor("���棺[" + this.label + "]�����ֵӦ����[" + this.getTargetLabel(target) + "]��ֵ��");
        return false;
     }

     Validator.prototype.greaterEqual = function(target){
      if(this.getValue()>=this.getTargetValue(target))
         return true;
       this.setErrorInfor("����:[" + this.label + "]�����ֵӦ���ڵ���[" + this.getTargetLabel(target) + "]��ֵ��");
       return false;
     }
   /**
    * У�����ݵ�ȡֵ��Χ
    */
   Validator.prototype.validateScope = function(){
      var validatorScopeArray = splitString(this.scope,",");
      for(var i=0;i<validatorScopeArray.length;i++){
        if(/^=/.test(validatorScopeArray[i])){
           if(!this.equal(validatorScopeArray[i].substring(2)))
             return false;
        }if(/^!=/.test(validatorScopeArray[i])){
           if(!this.notEqual(validatorScopeArray[i].substring(2)))
             return false;
        }else if(/^>=/.test(validatorScopeArray[i])){
          //alert('greaterEqual in ');
          if(!this.greaterEqual(validatorScopeArray[i].substring(2)))
             return false;
        }else if(/^>/.test(validatorScopeArray[i])){
          //alert('greaterThan in ');
           if(!this.greaterThan(validatorScopeArray[i].substring(1)))
               return false;
        }else if(/^<=/.test(validatorScopeArray[i])){
          //alert('lessEqual in ');
          if(!this.lessEqual(validatorScopeArray[i].substring(2)))
              return false;
        }else if(/^</.test(validatorScopeArray[i])){
         // alert('lessThan in ');
          if(!this.lessThan(validatorScopeArray[i].substring(1)))
            return false;
        }else {
          var pattern = /[&\$]([a-zA-Z_0-9]+)/g;
          var expression = validatorScopeArray[i].replace(pattern,"document.all['$1'].value")
          return eval(expression);
        }
      }
      return true;
   }
   /**
    * �õ�ָ��������ʶ��ֵ����ָ������Ϊnullʱ������''
    * @param target �����ı�ʶ���ñ�ʶ�����&��ʼ���ñ�ʶΪhtmlԪ�ص�styleId
    * @return ������ʶ����ֵ
    */
   Validator.prototype.getTargetValue = function(target){
      if(target==null)
         return "";
       if(/^[&\$]/.test(target)){
         return document.all[target.substring(1,target.length)].value;
       }else{
         return target;
       }
   }

   Validator.prototype.getValue = function(){
       return trim(this.controller.value);
   }
   Validator.prototype.getStrValue = function(){
       return trim(this.controller.value);
   }
   Validator.prototype.validate = function(){
     return true;
   }
   Validator.prototype.onKeyDown = function(){
     return true;
   }
   Validator.prototype.doFormat = function(){
     return true;
   }
   Validator.prototype.beforeSubmit = function() {
     return true;
   }
   Validator.prototype.focusController = function(){
     this.controller.focus();
   }
   Validator.prototype.validateEmpty = function(){
     var inputValue = trim(this.controller.value);
     if(inputValue.length==0){
       if(!eval(this.empty)){//�������ҪУ��ǿ�
         this.focusController();
         return false;
       }
      }
      return true;
   }
   //����״̬�仯
   Validator.prototype.doNotifierChange = function(){

     var emptyFlagLabel = document.all[this.id+"_empty"];
     if(emptyFlagLabel!=null){
       if(emptyFlagLabel.style==null){
         alert("ָ��[" + this.id +"]�ķǿձ�ʶ������,���ܶ����˶����ͬ��ʶ��HtmlԪ�ض���");
         return;
       }
       if(eval(this.empty)){
         emptyFlagLabel.style.display = "none";
       }else{
          emptyFlagLabel.style.display="inline";
       }
     }

    //  alert("doNotifierChange  " + this.disabled);
     if(eval(this.disabled)){
       this.controller.disabled  = true;
     }else{
       this.controller.disabled  = false;
     }
   }

   Validator.prototype.clear = function(){
      this.controller.value = "";
      this.notify();
   }



   /**
    * ����Validator�ĵ��ö�����ͨ�������validate()��������ӵ��ã�ͬʱ����Ҳִ��ͨ�õķǿ���ʾ����empty������Ϊfalseʱ��
    */
   function ValidatorGroup(name){
     this.name = name;
     this.validators = new Array();
     this.needInitValidators = new Array();
     document.forms[name].validatorGroup = this;
     this.needEmptyValidate  = true;  //�ύʱ�Ƿ���ҪУ��ǿ�
     this.needValidate = true;

     this.add = function(validator){
      // alert(validator.id);
       this.validators[this.validators.length] = validator;
       this.needInitValidators[this.needInitValidators.length] = validator;

     };

     this.clearAll = function(){
       for(var i=0;i<this.validators.length;i++){
         this.validators[i].clear();
       }
     }

     this.clear = function(){
       var validators =  new Array();
       for(var i=0;i<this.validators.length;i++){
         var validator = this.validators[i];
         if(document.all(validator.id) != null){
            validators[validators.length] = validator;
         }
       }
       this.validators = validators;
     }

     this.init = function(){
       for(var i=0;i<this.needInitValidators.length;i++){
         this.needInitValidators[i].doInitNotifier();
         this.needInitValidators[i].doNotifierChange();
         this.needInitValidators[i].doFormat();
       }
       this.needInitValidators = new Array();
     }
     this.beforeSubmit = function() {
       for(var i=0;i<this.validators.length;i++){
          this.validators[i].beforeSubmit();
       }
     }
     this.oldFormOnSubmit = null;
     this.oldFormSubmit = null;
     if(document.forms[name]!=null){
       document.forms[name].validatorGroup = this;
       document.forms[name].oldFormOnsubmit = document.forms[name].onsubmit;
       document.forms[name].oldFormSubmit = document.forms[name].submit;

       document.forms[name].submit = function(){
         var valid = this.validatorGroup.validate();
         if(valid){
            this.validatorGroup.beforeSubmit();
         }else{//���У�鲻�ɹ������ύ
            return false;
         }
         if(this.oldFormSubmit!=null)
           this.oldFormSubmit();
         return valid;
       }
       document.forms[name].onsubmit = function(){
         var valid = this.validatorGroup.validate();
         if(valid)  this.validatorGroup.beforeSubmit();

         if(this.oldFormOnsubmit!=null)
           valid = this.oldFormOnsubmit();
         return valid;
       }
       //����reset ����

       this.reset = function() {
        document.forms[this.name].reset();
        for(var i=0;i<this.validators.length;i++){
         this.validators[i].doFormat();
         this.validators[i].doNotifierChange();
        }
      }
    }



     this.validate = function(){
       if(!this.needValidate)
         return true;
       for(var i=0;i<this.validators.length;i++){
         var validator = this.validators[i];
         if(validator.controller!=null){
           if(validator.controller.disabled)
             continue;
         }else{
           if(validator.disabledStatus)
             continue;
         }
	 if(this.needEmptyValidate&&!validator.validateEmpty()){ //��ֵУ��
           alert("���棺������[" + validator.label + "]��ֵ��");
           validator.focusController();
           return false;
         }
         if(validator.getStrValue().length>0){
           if(!validator.validate()){  //��������Ϸ���У��
              alert(validator.getErrorInfor());
              validator.focusController();
              return false;
            }
           if(!validator.validateScope()){ //ȡֵ��Χ��Ч��У��
             alert(validator.getErrorInfor());
             validator.focusController();
             return false;
            }
         }

       }
       return true;
     }
   }
