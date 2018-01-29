   function TreeNode(id,isExpand){
     this.isExpand = isExpand;
     this.id = id;
     this.selected = false ; 
     this.selectedClass = '' ; 
     this.defaultClass = '' ; 
     this.children = new Array();
     this.onMouseOut = function(className){
       if(this.selected) 
         document.all[this.id].className = this.selectedClass;  
       else  document.all[this.id].className = this.defaultClass;  
     }  
     this.onMouseOver = function(className){
       if(!this.selected) 
         this.defaultClass = document.all[this.id].className;  
       document.all[this.id].className = className;  
     }  
     this.onClick = function(className){
        this.selected = this.selected?false:true;
        for(var i=0;i<menusSelectContainer.length;i++){  
          menusSelectContainer[i].selected =false; document.all[menusSelectContainer[i].id].className =menusSelectContainer[i].defaultClass; 
        }
        menusSelectContainer.length = 0; 
        if(this.selected){ 
			menusSelectContainer[menusSelectContainer.length] = this;
           this.selectedClass = className;
           document.all[this.id].className = className;
        }else{
           document.all[this.id].className = this.defaultClass;
        }
     } 
     this.doClose = function(){
       for(var i=0;i<this.children.length;i++){
         document.all[this.children[i].id].style.display = 'none';
         if(this.children[i].isExpand){
            this.children[i].doClose();
          }
        } 
      }
     this.doExpand = function(){
       for(var i=0;i<this.children.length;i++){
         document.all[this.children[i].id].style.display='block';
         if(this.children[i].isExpand)
            this.children[i].doExpand();
        }
      }
    this.expand = function(){
        if(!this.isExpand){
          this.isExpand = true;
          this.doExpand();
        }else{
          this.isExpand = false;
          this.doClose();
        }
    }
    this.init = function(){ 
          if(this.isExpand){
            for(var i=0;i<this.children.length;i++){
             document.all[this.children[i].id].style.display='block'; 
             this.children[i].init();
            }
          }else{
            for(var i=0;i<this.children.length;i++){
             document.all[this.children[i].id].style.display='none'; 
             this.children[i].init();
            }
          }
    }
    this.add = function(node){
      this.children[this.children.length] = node;
    }
  }

var menusRootTNJS = new TreeNode('',true);

var  menusTNJS00000000B22 = new TreeNode('menusTN00000000B22',false);
menusRootTNJS.add(menusTNJS00000000B22);
var  menusTNJS00000000C21 = new TreeNode('menusTN00000000C21',false);
menusTNJS00000000B22.add(menusTNJS00000000C21);
var  menusTNJS00000000C22 = new TreeNode('menusTN00000000C22',false);
menusTNJS00000000B22.add(menusTNJS00000000C22);
var  menusTNJS00000000C23 = new TreeNode('menusTN00000000C23',false);
menusTNJS00000000B22.add(menusTNJS00000000C23);

var menusTNJS00000000D231 = new TreeNode('menusTN00000000D231',false);
menusTNJS00000000C23.add(menusTNJS00000000D231);
var menusTNJS00000000D232 = new TreeNode('menusTN00000000D232',false);
menusTNJS00000000C23.add(menusTNJS00000000D232);
var menusTNJS00000000D233 = new TreeNode('menusTN00000000D233',false);
menusTNJS00000000C23.add(menusTNJS00000000D233);
var menusTNJS00000000D234 = new TreeNode('menusTN00000000D234',false);
menusTNJS00000000C23.add(menusTNJS00000000D234);

var  menusTNJS00000000C24 = new TreeNode('menusTN00000000C24',false);
menusTNJS00000000B22.add(menusTNJS00000000C24);

var  menusTNJS00000000C25 = new TreeNode('menusTN00000000C25',false);
menusTNJS00000000B22.add(menusTNJS00000000C25);
var menusTNJS00000000D251 = new TreeNode('menusTN00000000D251',false);
menusTNJS00000000C25.add(menusTNJS00000000D251);
var menusTNJS00000000D252 = new TreeNode('menusTN00000000D252',false);
menusTNJS00000000C25.add(menusTNJS00000000D252);
var menusTNJS00000000D253 = new TreeNode('menusTN00000000D253',false);
menusTNJS00000000C25.add(menusTNJS00000000D253);
var menusTNJS00000000D254 = new TreeNode('menusTN00000000D254',false);
menusTNJS00000000C25.add(menusTNJS00000000D254);
var menusTNJS00000000D255 = new TreeNode('menusTN00000000D255',false);
menusTNJS00000000C25.add(menusTNJS00000000D255);

var  menusTNJS00000000C26 = new TreeNode('menusTN00000000C26',false);
menusTNJS00000000B22.add(menusTNJS00000000C26);

var  menusTNJS00000000B42 = new TreeNode('menusTN00000000B42',false);
menusRootTNJS.add(menusTNJS00000000B42);
var  menusTNJS00000000C41 = new TreeNode('menusTN00000000C41',false);
menusTNJS00000000B42.add(menusTNJS00000000C41);
var  menusTNJS00000000C42 = new TreeNode('menusTN00000000C42',false);
menusTNJS00000000B42.add(menusTNJS00000000C42);


var  menusTNJS00000000B52 = new TreeNode('menusTN00000000B52',false);
menusRootTNJS.add(menusTNJS00000000B52);
var  menusTNJS00000000C51 = new TreeNode('menusTN00000000C51',false);
menusTNJS00000000B52.add(menusTNJS00000000C51);
var  menusTNJS00000000C52 = new TreeNode('menusTN00000000C52',false);
menusTNJS00000000B52.add(menusTNJS00000000C52);
var  menusTNJS00000000C53 = new TreeNode('menusTN00000000C53',false);
menusTNJS00000000B52.add(menusTNJS00000000C53);
var  menusTNJS00000000C54 = new TreeNode('menusTN00000000C54',false);
menusTNJS00000000B52.add(menusTNJS00000000C54);

var  menusTNJS00000000B62 = new TreeNode('menusTN00000000B62',false);
menusRootTNJS.add(menusTNJS00000000B62);
var  menusTNJS00000000C61 = new TreeNode('menusTN00000000C61',false);
menusTNJS00000000B62.add(menusTNJS00000000C61);
var  menusTNJS00000000C62 = new TreeNode('menusTN00000000C62',false);
menusTNJS00000000B62.add(menusTNJS00000000C62);

 var menusSelectContainer = new Array();


