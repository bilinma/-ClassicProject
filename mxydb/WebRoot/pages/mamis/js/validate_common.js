   /**
    * 删除字符串两侧的空格,返回的是删除两侧空格的字符串
    * @param str 待处理的字符串
    */
   function trim(str){
     if(str==null||str=="") return "";
     return str.replace(/^\s+/g, '').replace(/\s+$/g, '');
   };

   /**
    * 给指定的元素e1的eventName指定的事件，增加事件侦听器
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
    * 把目标字符串，根据指定的分割符分解为字符串数组
    * @param targetString 目标字符串
    * @param seperator 分割符
    * @parem return  Array 被分割的字符串数组
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
   * 得到字符串的byte长度
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
  ////START 键盘码判断
  ////////////////////////////////////////////////////////////////////
   /**
    * 判断键盘输入是否数字键
    * @param keyCode 输入的键值
    */
   function isNumber(keyCode){
     if (((keyCode >= 48 && keyCode <= 57 )&& (window.event.shiftKey == false))
      ||(keyCode >= 96 && keyCode <= 105 ))
      return true;
     return false;
   }

   /**
    * 判断键盘输入是否为光标移动处理
    * @param keyCode 输入的键值
    */
   function isCursorCtrl(keyCode){
     if(keyCode >= 33 && keyCode <= 40 )
      return true;
     return false;
   }

   /**
    * 判断键盘输入是否为+号
    * @param keyCode 输入的键值
    */
   function isPlusSign(keyCode){
     if((keyCode==187||keyCode==107)&&window.event.shiftKey==true)
      return true;
     return false;
   }
   /**
    * 判断键盘输入是否为-号
    * @param keyCode 输入的键值
    */
   function isSubtractionSign(keyCode){
     if((keyCode == 109||keyCode == 189)&&window.event.shiftKey==false)
      return true;
     return false;
   }

   /**
    * 判断键盘输入是否为.号
    * @param keyCode 输入的键值
    */
   function isDotSign(keyCode){
     if(keyCode==110 ||keyCode==190)
       return true;
     return false;
   }
   /**
    * 判断键盘输入是否为Tab键
    * @param keyCode 输入的键值
    */
   function isTab(keyCode){
     if(keyCode==9)
      return true;
     return false;
   }
   /**
    * 判断键盘输入是否为回车键
    * @param keyCode 输入的键值
    */
   function isEnter(keyCode){
     if(keyCode==13)
      return true;
     return false;
   }
   /**
    * 判断键盘输入是否为退格键
    * @param keyCode 输入的键值
    */
   function isBackspace(keyCode){
     if(keyCode==8)
      return true;
     return false;
   }
  /**
   * 判断键盘输入是否为删除键
   */
  function isDelete(keyCode){
     if(keyCode==46){
	     return true;
	   }
     return false;
  }
  //////////////结束键盘输入判断


  /**
   * 把回车键转换为Tab键
   */
   function enterToTab() {
     if(window.event.keyCode==13)
         window.event.keyCode=9;
   }

  /**
   * 是否为全数字字符串
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
    * 设置错误信息
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
       if(notifier!=null){ //存在对应的Validator
         notifier.addListener(this);
         returnValue = returnValue.replace(pattern2,"document.all['$1'].value");
        }else{  //处理radio或checkbox的侦听
          var groupObj = document.all[token[1]];
          if(groupObj.length!=null){
            groupObj[0].validator.addListener(this);
            returnValue = returnValue.replace(pattern2,"document.all['$1'][0].validator.getStrValue()");
          }else{
            alert("表达式[" + expression + "]定义的["+ token[1] +"]标示的Html元素不存在");
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
    * 建立empty及disable表达式中的Listen/notify机制，进行表达式预处理
    */
   IValidator.prototype.doInitNotifier = function(){
     this.empty = this.parseAndAttachNotifiers(this.empty);
     this.disabled = this.parseAndAttachNotifiers(this.disabled);
   }
   /**
    *事件发生对象的数值发生了变化
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



 //一个界面中有多个form, 每个form有多种提交方式, 不同的提交方式需要校验的内容不同,如保存\查询删除
 //所有Validator类型的父类,其中empty及disabled的语法格式为 &style=value&&&styleId2=value
   function Validator(id,label,empty,format,scope,disabled) {
     this.IValidator = IValidator;
     this.IValidator(id,label,empty,format,scope,disabled);
     if(id==null||id=="")
       return;
     this.controller = document.all(id);
     if(this.controller!=null&&this.controller.validator==null){ //重写相关的鼠标或键盘事件处理
       this.controller.validator = this; //把当前控制对象作为controller对象的validator属性
       this.controller.validatoronkeydownold = this.controller.onkeydown;
       this.controller.validatoronblurold = this.controller.onblur;
       this.controller.validatoronfocusold = this.controller.onfocus;
       this.controller.validatoronchangeold = this.controller.onchange;

       this.controller.onkeydown = function(){
          var keyCode = window.event.keyCode;
           //处理代码转换
          if (isEnter(keyCode)) {
            window.event.keyCode = 9;
            return;
          }
          if(isBackspace(keyCode)||isTab(keyCode)||isCursorCtrl(keyCode)) {
          	if(isBackspace(keyCode)){
          		//如果选中的为","或者是"."
          		if(document.selection.createRange().duplicate().text==""){
								if(event.srcElement.value.indexOf(".")>0){
									//如果有小数点，并且输入的值比文本框的值长。返回
									//获取当前光标的位置
									var slct = document.selection; 
							    var rng = slct.createRange(); 
							    event.srcElement.select(); 
							    rng.setEndPoint("StartToStart", slct.createRange()); 
							    var psn = rng.text.length; 
							    rng.collapse(false); 
							    rng.select(); 
							    //如果光标位置在小数点前，可以继续输入，如果在小数点后，不可输入。
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
								//如果有小数点，并且输入的值比文本框的值长。返回
								//获取当前光标的位置
								var slct = document.selection; 
						    var rng = slct.createRange(); 
						    event.srcElement.select(); 
						    rng.setEndPoint("StartToStart", slct.createRange()); 
						    var psn = rng.text.length; 
						    rng.collapse(false); 
						    rng.select(); 
						    //如果光标位置在小数点前，可以继续输入，如果在小数点后，不可输入。
						    if(psn!=event.srcElement.value.indexOf(".")){
				  				return;
						    }else{
						    	return false;
						    }
							}
						}
            return;
          }
          this.validator.onKeyDown();  //该this与Validator中的this不同，该 this标识Validator中的this.controller
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
    * 得到当前validator对象的controller对象
    */
   Validator.prototype.getController = function() {
     return this.controller;
   }
   /**
    * 根据target标识，获得其标识Html对象的Label名称
    * @param target 该数值以&开始时，该参量表示html元素的styleid标识
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
       this.setErrorInfor("警告：[" + this.label + "]输入的值应等于[" + this.getTargetLabel(target) + "]的值！");
       return false;
     }
     Validator.prototype.notEqual = function(target){
       if(this.getValue() != this.getTargetValue(target))
         return true;
       this.setErrorInfor("警告：[" + this.label + "]输入的值应不等于[" + this.getTargetLabel(target) + "]的值！");
       return false;
     }
     Validator.prototype.lessThan = function(target){
      // alert(" a value:" + this.getValue() + "lessThan:" + this.getTargetValue(target));
        if(this.getValue() < this.getTargetValue(target)){
         return true;
       }
       this.setErrorInfor("警告：[" + this.label + "]输入的值应小于[" + this.getTargetLabel(target) + "]的值！");
       return false;
     }
     Validator.prototype.lessEqual = function(target){
      if(this.getValue() <= this.getTargetValue(target))
         return true;
       this.setErrorInfor("警告：[" + this.label + "]输入的值应小于等于[" + this.getTargetLabel(target) + "]的值！");
       return false;
     }

     Validator.prototype.greaterThan = function(target){
       if(this.getValue() > this.getTargetValue(target))
         return true;
        this.setErrorInfor("警告：[" + this.label + "]输入的值应大于[" + this.getTargetLabel(target) + "]的值！");
        return false;
     }

     Validator.prototype.greaterEqual = function(target){
      if(this.getValue()>=this.getTargetValue(target))
         return true;
       this.setErrorInfor("警告:[" + this.label + "]输入的值应大于等于[" + this.getTargetLabel(target) + "]的值！");
       return false;
     }
   /**
    * 校验数据的取值范围
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
    * 得到指定参量标识的值，当指定参量为null时，返回''
    * @param target 参量的标识，该标识如果以&开始，该标识为html元素的styleId
    * @return 参量标识的数值
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
       if(!eval(this.empty)){//如果不需要校验非空
         this.focusController();
         return false;
       }
      }
      return true;
   }
   //处理状态变化
   Validator.prototype.doNotifierChange = function(){

     var emptyFlagLabel = document.all[this.id+"_empty"];
     if(emptyFlagLabel!=null){
       if(emptyFlagLabel.style==null){
         alert("指定[" + this.id +"]的非空标识不存在,可能定义了多个相同标识的Html元素对象！");
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
    * 所有Validator的调用都必须通过此类的validate()方法来间接调用，同时此类也执行通用的非空提示（当empty参数设为false时）
    */
   function ValidatorGroup(name){
     this.name = name;
     this.validators = new Array();
     this.needInitValidators = new Array();
     document.forms[name].validatorGroup = this;
     this.needEmptyValidate  = true;  //提交时是否需要校验非空
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
         }else{//如果校验不成功，则不提交
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
       //处理reset 处理

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
	 if(this.needEmptyValidate&&!validator.validateEmpty()){ //空值校验
           alert("警告：请输入[" + validator.label + "]的值！");
           validator.focusController();
           return false;
         }
         if(validator.getStrValue().length>0){
           if(!validator.validate()){  //自身输入合法性校验
              alert(validator.getErrorInfor());
              validator.focusController();
              return false;
            }
           if(!validator.validateScope()){ //取值范围有效性校验
             alert(validator.getErrorInfor());
             validator.focusController();
             return false;
            }
         }

       }
       return true;
     }
   }
