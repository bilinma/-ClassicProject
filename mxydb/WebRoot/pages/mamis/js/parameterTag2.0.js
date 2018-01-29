     /**
      * ����
      */
     function _EventListenerNotify(object){
       this.object = object;

       this.listeners = new Array();
       this.addListener = function(listener){
         this.listeners[this.listeners.length] = listener;
       }
       this.notify = function(event){
         if(this.listeners.length==0) return;
         for(var i=0;i<this.listeners.length;i++){
          this.listeners[i].doChange(event);
         }
       }
       this.clearListeners = function(){
         this.listeners.length = 0;
       }
       this.setNotifierObject = function(object){
         this.object = object;
       }

     }

     /**
      *
      */
     _EventListenerNotify.prototype.doChange = function(value){
      if(this.object!=null)
        this.object.value = value;
       //�ö������ֵ�Ѿ��仯��֪ͨ��������
     }

     function _Parameter(id,name,code,filter) {
        this.id = id;
        this.code = code==null?this.id:code;
        this.filter = filter == null?this.code:filter;
        this.name = name;
     };


     //����ѡ���ֵ��ȫƥ�������ˮ
     function _OptionGenerator(select,style,styleClass,defaultValue,valueType){
      this._EventListenerNotify = _EventListenerNotify;
      this._EventListenerNotify(select);
      this.select = select;
      this.style = style;
      this.valueType = (valueType==null?"id":valueType); //��ȡֵֻ��Ϊid,code,name,filter
      this.defaultValue = defaultValue;
      this.styleClass = styleClass;
      this.parameters = new Array();

      if(this.select!=null){

        if(this.select.tagName=="SELECT"&&this.select.generator==null){

         this.select.generator = this; //�ѵ�ǰ���ƶ�����Ϊcontroller�����validator����
         this.select.doChange = function(value){
           this.generator.doChange(value);
         }
         this.select.selectonchangeold = this.select.onchange;
         this.select.selectonkeydownold = this.select.onkeydown;

         this.select.onchange = function(){
           this.generator.notify(this.value);
           if(this.selectonchangeold!=null)
             this.selectonchangeold();
         }
         this.select.onkeydown = function(){
           var keyCode = window.event.keyCode;
           //�������ת��
          if (keyCode==13) {
              window.event.keyCode = 9;
              return;
          }
          if(this.selectonkeydownold != null){
            this.selectonkeydownold();
          }
         }
        }

      }
      this.clone = function(){
         return new this.constructor(select,style,styleClass,defaultValue,valueType);
       }
      this.setParameters = function(parameters,nullStr){
        if(nullStr==null){
         if(parameters[0].id==""){
           for(var i=1;i<parameters.length;i++){
             this.parameters[i-1] = parameters[i];
           }
         }else{
           this.parameters = parameters;
         }
        }else{
          if(parameters[0].id==""){
            this.parameters = parameters;
            this.parameters[0].name = nullStr;
          }else{
           this.parameters[0] = new _Parameter('',nullStr);
           for(var i=0;i<parameters.length;i++){
             this.parameters[i+1] = parameters[i];
           }
          }
        }
      }

      this.getParameters = function(){
        return this.parameters;
      }

      this.get = function(id){
        for(var i=0;i<this.parameters.length;i++){
          if(id==this.parameters[i].id){
           return this.parameters[i];
          }
        }
        return null;
      };
      /**
       * ���õ�ǰ��ѡ��Ķ���
       */
      this.setSelect = function(select){
       this.select = select;
       this.setNotifierObject(select);
      }
      /**
       * ���õ�ǰѡ������Ĭ��ֵ
       */
      this.setDefaultValue = function(defaultValue){
        this.defaultValue = defaultValue;

      };
      /**
       * ���һ��������Ŀ
       * @param parameterΪ_Parameter����ı���
       */
      this.add = function(parameter){
        this.parameters[this.parameters.length] = parameter;
      }


      this.getValue = function(parameter){
        if(this.valueType=="id"){
          return parameter.id;
        }else if(this.valueType == "code"){
          return parameter.code;
        }else if(this.valueType=="name"){
          return parameter.name;
        }else{
          return parameter.id;
        }
      }
      /**
       * ���ݹ���ֵ����HTML SELECT�е�OPTION��Ŀ
       */
      this.generatorSelectOptions = function(filter){
         if(this.select.tagName == "INPUT"){
           if(filter=="")
             this.select.value = this.defaultValue;
           else
             this.select.value = "";
           for(var i=0;i<this.parameters.length;i++) {
            var parameter = this.parameters[i];
            if(parameter.id!=""&&filter!=""&&this.isMatch(parameter,filter)){
              this.select.value = this.getValue(parameter);
              break;
            }
       	   }
        }else{
      	  this.select.options.length = 0;
      	  //this.select.disabled = true;
          var matchParameters = new Array();
          for(var i=0;i<this.parameters.length;i++) {
           var parameter = this.parameters[i];
           if(this.isMatch(parameter,filter)){
             matchParameters[matchParameters.length] = parameter;
           }
          }
          var nullStrSet = false;
          for(var i=0;i<matchParameters.length;i++) {
           var parameter = matchParameters[i];
        //   if(parameter.id == "") nullStrSet = true;
           if((this.getValue(parameter) == this.defaultValue)||
              (i==0&&matchParameters.length==1)) {
             this.generatorSelectOption(parameter,true);
           }else{
             this.generatorSelectOption(parameter,false);
           }
          }
        }
        //this.select.disabled = false;

      }
      /**
       *
       */
      this.generatorSelectOption = function(parameter,matched){
        var option = this.select.options[this.select.options.length++];
        option.value = parameter.id;
        option.text = parameter.name;
        option.selected = matched;
        if(this.style != null) {
            option.style = this.style;
       }
       if(this.styleClass != null) {
        //  option.styple.class = this.styleClass;
       }
      }
     };
     _OptionGenerator.prototype =  new _EventListenerNotify;

     _OptionGenerator.prototype.doChange = function(filter){
        this.generatorSelectOptions(filter);
        this.notify(this.select.value);
        //�ö������ֵ�Ѿ��仯��֪ͨ��������
     };

     _OptionGenerator.prototype.isMatch = function(parameter,filter){
        if(filter == null||"" == filter||"" == parameter.id)
          return true;
        if(parameter.filter == filter)
         return true;
        return false;
     };


     /**
      * ����ѡ���ֵ����ƥ�������ˮ
      */

     function _ShrinkOptionGenerator(select,style,styleClass,defaultValue){
       this._OptionGenerator = _OptionGenerator;
       this._OptionGenerator(select,style,styleClass,defaultValue);
     };
     _ShrinkOptionGenerator.prototype = new _OptionGenerator;



     _ShrinkOptionGenerator.prototype.isMatch = function(parameter,filter){

       if(filter==null||"" == filter||"" == parameter.id||parameter.filter.indexOf(filter)==0){
        return true;
       }
       return false;
     };


      /**
      * �����û������룬��λѡ����ڶ�Ӧ��ֵ
      */

     function _FocusOptionGenerator(select,style,styleClass,defaultValue){
       this._OptionGenerator = _OptionGenerator;
       this._OptionGenerator(select,style,styleClass,defaultValue);

       this.focusOption = function(filter) {
        for(var i=0;i<this.parameters.length;i++) {
         var parameter = this.parameters[i];
         select.options[i].selected = false;
          if(this.isMatch(parameter,filter)){
            select.options[i].selected = true;
            break;
          }
        }
       }
      };
     _FocusOptionGenerator.prototype = new _OptionGenerator;
     _FocusOptionGenerator.prototype.doChange = function(filter){
        this.focusOption(filter);
        this.notify(this.select.value);
     };
     _FocusOptionGenerator.prototype.isMatch = function(parameter,filter){
       if(filter==null||"" == filter||"" == parameter.id||parameter.filter.indexOf(filter)==0){
        return true;
       }
       return false;
     };
