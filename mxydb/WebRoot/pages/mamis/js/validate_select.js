   function SelectValidator(id,label,empty,format,scope,disabled){
     this.Validator = Validator;
     this.Validator(id,label,empty,format,scope,disabled);
   }
   SelectValidator.prototype = new Validator;
   SelectValidator.prototype.constructor = SelectValidator;
  /**
   * 实现对select数据的清理处理，
   */
  SelectValidator.prototype.clear = function (){
      var options = document.all[this.id].options;

      var optionsLength = options.length;
      for (var i = 0; i < optionsLength; i++){
         options[i].selected = false;
      }
      if(optionsLength>0){
        options[0].selected = true;
      }
      this.notify();
      var generator =  document.all[this.id].generator;
      if(generator!=null){
        generator.notify();
      }
   }
