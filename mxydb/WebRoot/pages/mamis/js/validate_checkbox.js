

   function CheckboxValidator(name,label,empty,format,scope,disabled){
     this.IValidator = IValidator;
     this.IValidator(name,label,empty,format,scope,disabled);
     this.name = name;
     this.disabledStatus = false;

     for(var i=0;i<document.all[name].length;i++){
       var checkboxController = document.all[name][i];
       checkboxController.onkeydown = function(){
         var keyCode = window.event.keyCode;
           //处理代码转换
         if (isEnter(keyCode)) {
             window.event.keyCode = 9;
             return;
         }
       }
       checkboxController.validatoronclick = checkboxController.onclick;
       checkboxController.validator = this;

       checkboxController.onclick = function(){
        // alert(this.value);
        // alert(this.validator.listeners.length);
         this.validator.notify();
         if(this.validatoronclick!=null){
           this.validatoronclick();
         }
       }
     }
   }
   CheckboxValidator.prototype = new IValidator;
   CheckboxValidator.prototype.constructor = CheckboxValidator;
   CheckboxValidator.prototype.getStrValue = function(){
     var checkboxgroup = document.all[this.name];
     var numcheckboxs = checkboxgroup.length;
     var returnValue = "";
     for (var i = 0; i < numcheckboxs; i++){
        if (checkboxgroup[i].checked){
          returnValue += ((i==0)?"":"|") + checkboxgroup[i].value;
        }
     }
     return returnValue;
   }
   CheckboxValidator.prototype.focusController = function(){
      document.all[this.name][0].focus();
   }

   CheckboxValidator.prototype.validateEmpty = function(){

     if(!eval(this.empty)){
       var checkboxgroup = document.all[this.name];
       if(checkboxgroup == null){
         this.setErrorInfor("Checkbox group named by '" + this.name +"' not exist");
         return false;
       }

       var numcheckboxes = checkboxgroup.length;
       for (var i = 0; i < numcheckboxes; i++){
         if (checkboxgroup[i].checked)
           return true;
       }

       return false;
     }

     return true;
   }

    CheckboxValidator.prototype.clear = function (){

      var checkboxgroup = document.all[this.name];
      if(checkboxgroup == null){
         return false;
      }
      var numcheckboxs = checkboxgroup.length;
      for (var i = 0; i < numcheckboxs; i++){
         checkboxgroup[i].checked = false;
      }
      this.notify();
   }

   //处理状态变化
   CheckboxValidator.prototype.doNotifierChange = function(){
     var emptyFlagLabel = document.all[this.id+"_empty"];
     if(emptyFlagLabel!=null){
       if(eval(this.empty)){
        emptyFlagLabel.style.display = "none";
       }else{
        emptyFlagLabel.style.display="inline";
       }
     }

     var checkboxgroup = document.all[this.name];
     var numcheckboxs = checkboxgroup.length;

     if(eval(this.disabled)){

       this.disabledStatus = true;
       for (var i = 0; i < numcheckboxs; i++)
         checkboxgroup[i].disabled = true
     }else{
       this.disabledStatus = false;
       for (var i = 0; i < numcheckboxs; i++)
         checkboxgroup[i].disabled = false;
     }
   }




