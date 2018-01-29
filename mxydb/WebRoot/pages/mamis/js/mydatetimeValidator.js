
//??????trim()??
String.prototype.trim = function(){
     // ???????????
     // ????????
     return this.replace(/(^\s*)|(\s*$)/g, "");
}         
//???????????
function checkInt( c, min, max){
    
    var patrn=/^[0-9]/; 
    for(i=0;i<c.length;i++){   
       if(!patrn.exec(c.charAt(i))){   
           return false;
       }
    }
    //??min,max???????
    if(min != null && max != null){
        if(!( parseInt(c,10) >= min && parseInt(c,10) <= max)){
            return false;
        }
    }else {
        if(min != null && !( parseInt(c,10) >= min)){
            return false;        
        }
        if(max != null && !(parseInt(c,10) <= max)){
            return false;
        }    
    }
    return true;

}
//??yyyy-mm-dd hh:mi:ss??
function datetimeValidator(str){
    var len = str.trim().length;
    //?????19
    if(len != 19){
        return false;
    }
    //?????
    if(str.charAt(4)!="-" || str.charAt(7)!="-" || str.charAt(10)!=" " || str.charAt(13) != ":" || str.charAt(16) != ":"){        
        return false;
    }
    //?
    var year = str.substring(0,4);
    if(!checkInt(year,1900)){
        return false;
    }
    //?
    var month = str.substring(5,7);
    if(!checkInt(month,1,12)){
        return false;
    }
    //?
    var day = str.substring(8,10);
    var mInt = parseInt(month,10);
    var yInt = parseInt(year,10);
    if(mInt == 1 || mInt == 3 || mInt == 5 || mInt == 7 || mInt == 8 || mInt == 10 || mInt == 12){
        if(!checkInt(day,1,31)){
            return false;
        }
    }else if(mInt == 4 || mInt == 6 || mInt == 9 || mInt == 11){
        if(!checkInt(day,1,30)){
            return false;
        }
    }else if(yInt%4 == 0){
        if(!checkInt(day,1,29)){
            return false;
        }
    }else {
        if(!checkInt(day,1,28)){
            return false;
        }
    }
    
    //??
    var hour = str.substring(11,13);
    if(!checkInt(hour,0,23)){
            return false;
        }
    //??
    var minute = str.substring(14,16);
    if(!checkInt(minute,0,59)){
            return false;
        }
    //?
    var second = str.substring(17,19);
    if(!checkInt(second,0,59)){
            return false;
    }
    
    return true;    
    
}

//????????
function datetimeCompare(str1,str2){
    //?
    var year1 = str1.substring(0,4);    
    var year2 = str2.substring(0,4);
    if(parseInt(year1,10) > parseInt(year2,10)){
    	return false;
    }
    if(parseInt(year1,10) < parseInt(year2,10)){
    	return true;
    }
    //?
    var month1 = str1.substring(5,7);
    var month2 = str2.substring(5,7);
    if(parseInt(month1,10) > parseInt(month2,10)){
    	return false;
    }
    if(parseInt(month1,10) < parseInt(month2,10)){
    	return true;
    }
    //?
    var day1 = str1.substring(8,10);
    var day2 = str2.substring(8,10);
    if(parseInt(day1,10) > parseInt(day2,10)){
    	return false;
    }
    if(parseInt(day1,10) < parseInt(day2,10)){
    	return true;
    }
    //??
    var hour1 = str1.substring(11,13);
    var hour2 = str2.substring(11,13);
    if(parseInt(hour1,10) > parseInt(hour2,10)){
    	return false;
    }
     if(parseInt(hour1,10) < parseInt(hour2,10)){
    	return true;
    }
    //??
    var minute1 = str1.substring(14,16);
    var minute2 = str2.substring(14,16);
    if(parseInt(minute1,10) > parseInt(minute2,10)){
    	return false;
    }
    if(parseInt(minute1,10) < parseInt(minute2,10)){
    	return true;
    }
    //?
    var second1 = str1.substring(17,19);
    var second2 = str2.substring(17,19);
    if(parseInt(second1,10) > parseInt(second2,10)){
    	return false;
    }
    if(parseInt(second1,10) < parseInt(second2,10)){
    	return true;
    }
    
    return true;
	
}