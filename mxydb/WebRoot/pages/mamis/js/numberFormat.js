/*
 * 数字格式化类
 * param: num 要格式化的数字
 * param: inputDecimal，格式化数字小数分隔符，可以是逗号，可以是点号
 */
function NumberFormat(num, inputDecimal) {
    this.VERSION = "Number Format v1.5.4";
    this.COMMA = ",";
    this.PERIOD = ".";
    this.DASH = "-";
    this.LEFT_PAREN = "(";
    this.RIGHT_PAREN = ")";

	//货币符号的位置
    this.LEFT_OUTSIDE = 0;
    this.LEFT_INSIDE = 1;
    this.RIGHT_INSIDE = 2;
    this.RIGHT_OUTSIDE = 3;

	//负号的位置
    this.LEFT_DASH = 0;
    this.RIGHT_DASH = 1;
    this.PARENTHESIS = 2;

    this.NO_ROUNDING = -1;
    this.num;
    this.numOriginal;
    
    this.hasSeparators = false;
    
    this.separatorValue;
    this.inputDecimalValue;
    this.decimalValue;
    this.negativeFormat;
    this.negativeRed;
    this.hasCurrency;
    this.currencyPosition;
    this.currencyValue;
    this.places;
    this.roundToPlaces;
    this.truncate;
    this.setNumber = setNumberNF;
    this.doUnformat = doUnformatNF;
    this.setInputDecimal = setInputDecimalNF;
    this.setSeparators = setSeparatorsNF;
    this.setCommas = setCommasNF;
    this.setNegativeFormat = setNegativeFormatNF;
    this.setNegativeRed = setNegativeRedNF;
    this.setCurrency = setCurrencyNF;
    this.setCurrencyPrefix = setCurrencyPrefixNF;
    this.setCurrencyValue = setCurrencyValueNF;
    this.setCurrencyPosition = setCurrencyPositionNF;
    this.setPlaces = setPlacesNF;
    this.doFormat = doFormatNF;
    this.toPercentage = toPercentageNF;
    this.getOriginal = getOriginalNF;
    this.moveDecimalRight = moveDecimalRightNF;
    this.moveDecimalLeft = moveDecimalLeftNF;
    this.getRounded = getRoundedNF;
    this.preserveZeros = preserveZerosNF;
    this.justNumber = justNumberNF;
    this.expandExponential = expandExponentialNF;
    this.getZeros = getZerosNF;
    this.moveDecimalAsString = moveDecimalAsStringNF;
    this.moveDecimal = moveDecimalNF;
    this.addSeparators = addSeparatorsNF;
    if (inputDecimal == null) {
        this.setNumber(num, this.PERIOD);
    } else {
        this.setNumber(num, inputDecimal);
    }
    this.setCommas(true);
    this.setNegativeFormat(this.LEFT_DASH);
    this.setNegativeRed(false);
    this.setCurrency(false);
    this.setCurrencyPrefix("$");
    this.setPlaces(2);
}

/*
 * 设定小数部分和整数部分的分隔符（建议暂时不要使用）
 */
function setInputDecimalNF(val) {
    this.inputDecimalValue = val;
}


/*
 * 设定要格式化的数字
 */
function setNumberNF(num, inputDecimal) {
    if (inputDecimal != null) {
        this.setInputDecimal(inputDecimal);
    }
    this.numOriginal = num;
    this.num = this.justNumber(num);
}

function doUnformatNF() {
    return (this.num);
}

function getOriginalNF() {
    return (this.numOriginal);
}

/*
 * 设定负号的位置。LEFT_DASH：左边；RIGHT_DASH：右边；PARENTHESIS：用小括号包围数字。
 */
function setNegativeFormatNF(format) {
    this.negativeFormat = format;
}

/*
 * 设置负数是否用红字显示。最终的结果如：<font size="red">-323,333.98</font>
 */
function setNegativeRedNF(isRed) {
    this.negativeRed = isRed;
}


/*
 * 设置千分位符号、整数和小数之间分割符号。setSeparatorsNF(true, ",", ".")结果为123,444.23;setSeparatorsNF(false, ",", ".")结果为123444.23
 * param: isC 是否用千分位分隔符分割整数部分
 * param: separator 千分位分隔符
 * param: decimal 整数和小数之间分割符号
 */
function setSeparatorsNF(isC, separator, decimal) {
    this.hasSeparators = isC;
    if (separator == null) {
        separator = this.COMMA;
    }
    if (decimal == null) {
        decimal = this.PERIOD;
    }
    if (separator == decimal) {
        this.decimalValue = (decimal == this.PERIOD) ? this.COMMA : this.PERIOD;
    } else {
        this.decimalValue = decimal;
    }
    this.separatorValue = separator;
}

/*
 * 用默认的分割符设定数字的显示形式
 */
function setCommasNF(isC) {
    this.setSeparators(isC, this.COMMA, this.PERIOD);
}

/*
 * 设定是否是金额
 */
function setCurrencyNF(isC) {
    this.hasCurrency = isC;
}

/*
 * 设定金额的单位符号，例如Y
 */
function setCurrencyValueNF(val) {
    this.currencyValue = val;
}

/*
 * 设定金额的单位符号，并将货币符号放在数字正负号的左边，如果负号是用()表示，则放在()的外边，例如:Y-1,000,247.00或Y(1,000,247.00)
 ? param: cp 货币符号
 */
function setCurrencyPrefixNF(cp) {
    this.setCurrencyValue(cp);
    this.setCurrencyPosition(this.LEFT_OUTSIDE);
}

/*
 * 设定货币符号的位置
 * param: cp 位置
 *   LEFT_OUTSIDE???,?????()?????()????
 *   LEFT_INSIDE???,?????()?????()????
 *   RIGHT_INSIDE???,?????()?????()????
 *   RIGHT_OUTSIDE???,?????()?????()????
 */
function setCurrencyPositionNF(cp) {
    this.currencyPosition = cp;
}


/*
 * 是定是否用截取来替代四舍五入
 * param: p 小数点后的位数
 * param: tr 是否标志
 */
function setPlacesNF(p, tr) {
    this.roundToPlaces = !(p == this.NO_ROUNDING);
    this.truncate = (tr != null && tr);
    this.places = (p < 0) ? 0 : p;
}


function addSeparatorsNF(nStr, inD, outD, sep) {
    nStr += "";
    var dpos = nStr.indexOf(inD);
    var nStrEnd = "";
    if (dpos != -1) {
        nStrEnd = outD + nStr.substring(dpos + 1, nStr.length);
        nStr = nStr.substring(0, dpos);
    }
    var rgx = /(\d+)(\d{3})/;
    while (rgx.test(nStr)) {
        nStr = nStr.replace(rgx, "$1" + sep + "$2");
    }
    return nStr + nStrEnd;
}


/*
 * 格式化数字
 */
function doFormatNF() {
    var pos;
    var nNum = this.num;
    var nStr;
    var splitString = new Array(2);
    if (this.roundToPlaces) {
        nNum = this.getRounded(nNum);
        nStr = this.preserveZeros(Math.abs(nNum));
    } else {
        nStr = this.expandExponential(Math.abs(nNum));
    }
    if (this.hasSeparators) {
        nStr = this.addSeparators(nStr, this.PERIOD, this.decimalValue, this.separatorValue);
    } else {
        nStr = nStr.replace(new RegExp("\\" + this.PERIOD), this.decimalValue);
    }
    var c0 = "";
    var n0 = "";
    var c1 = "";
    var n1 = "";
    var n2 = "";
    var c2 = "";
    var n3 = "";
    var c3 = "";
    var negSignL = (this.negativeFormat == this.PARENTHESIS) ? this.LEFT_PAREN : this.DASH;
    var negSignR = (this.negativeFormat == this.PARENTHESIS) ? this.RIGHT_PAREN : this.DASH;
    if (this.currencyPosition == this.LEFT_OUTSIDE) {
        if (nNum < 0) {
            if (this.negativeFormat == this.LEFT_DASH || this.negativeFormat == this.PARENTHESIS) {
                n1 = negSignL;
            }
            if (this.negativeFormat == this.RIGHT_DASH || this.negativeFormat == this.PARENTHESIS) {
                n2 = negSignR;
            }
        }
        if (this.hasCurrency) {
            c0 = this.currencyValue;
        }
    } else {
        if (this.currencyPosition == this.LEFT_INSIDE) {
            if (nNum < 0) {
                if (this.negativeFormat == this.LEFT_DASH || this.negativeFormat == this.PARENTHESIS) {
                    n0 = negSignL;
                }
                if (this.negativeFormat == this.RIGHT_DASH || this.negativeFormat == this.PARENTHESIS) {
                    n3 = negSignR;
                }
            }
            if (this.hasCurrency) {
                c1 = this.currencyValue;
            }
        } else {
            if (this.currencyPosition == this.RIGHT_INSIDE) {
                if (nNum < 0) {
                    if (this.negativeFormat == this.LEFT_DASH || this.negativeFormat == this.PARENTHESIS) {
                        n0 = negSignL;
                    }
                    if (this.negativeFormat == this.RIGHT_DASH || this.negativeFormat == this.PARENTHESIS) {
                        n3 = negSignR;
                    }
                }
                if (this.hasCurrency) {
                    c2 = this.currencyValue;
                }
            } else {
                if (this.currencyPosition == this.RIGHT_OUTSIDE) {
                    if (nNum < 0) {
                        if (this.negativeFormat == this.LEFT_DASH || this.negativeFormat == this.PARENTHESIS) {
                            n1 = negSignL;
                        }
                        if (this.negativeFormat == this.RIGHT_DASH || this.negativeFormat == this.PARENTHESIS) {
                            n2 = negSignR;
                        }
                    }
                    if (this.hasCurrency) {
                        c3 = this.currencyValue;
                    }
                }
            }
        }
    }
    nStr = c0 + n0 + c1 + n1 + nStr + n2 + c2 + n3 + c3;
    if (this.negativeRed && nNum < 0) {
        nStr = "<font color=\"red\">" + nStr + "</font>";
    }
    return (nStr);
}


/*
 * ?????????????
 */
function toPercentageNF() {
    nNum = this.num * 100;
    nNum = this.getRounded(nNum);
    return nNum + "%";
}

function getZerosNF(places) {
    var extraZ = "";
    var i;
    for (i = 0; i < places; i++) {
        extraZ += "0";
    }
    return extraZ;
}

function expandExponentialNF(origVal) {
    if (isNaN(origVal)) {
        return origVal;
    }
    var newVal = parseFloat(origVal) + "";
    var eLoc = newVal.toLowerCase().indexOf("e");
    if (eLoc != -1) {
        var plusLoc = newVal.toLowerCase().indexOf("+");
        var negLoc = newVal.toLowerCase().indexOf("-", eLoc);
        var justNumber = newVal.substring(0, eLoc);
        if (negLoc != -1) {
            var places = newVal.substring(negLoc + 1, newVal.length);
            justNumber = this.moveDecimalAsString(justNumber, true, parseInt(places));
        } else {
            if (plusLoc == -1) {
                plusLoc = eLoc;
            }
            var places = newVal.substring(plusLoc + 1, newVal.length);
            justNumber = this.moveDecimalAsString(justNumber, false, parseInt(places));
        }
        newVal = justNumber;
    }
    return newVal;
}

function moveDecimalRightNF(val, places) {
    var newVal = "";
    if (places == null) {
        newVal = this.moveDecimal(val, false);
    } else {
        newVal = this.moveDecimal(val, false, places);
    }
    return newVal;
}

function moveDecimalLeftNF(val, places) {
    var newVal = "";
    if (places == null) {
        newVal = this.moveDecimal(val, true);
    } else {
        newVal = this.moveDecimal(val, true, places);
    }
    return newVal;
}

function moveDecimalAsStringNF(val, left, places) {
    var spaces = (arguments.length < 3) ? this.places : places;
    if (spaces <= 0) {
        return val;
    }
    var newVal = val + "";
    var extraZ = this.getZeros(spaces);
    var re1 = new RegExp("([0-9.]+)");
    if (left) {
        newVal = newVal.replace(re1, extraZ + "$1");
        var re2 = new RegExp("(-?)([0-9]*)([0-9]{" + spaces + "})(\\.?)");
        newVal = newVal.replace(re2, "$1$2.$3");
    } else {
        var reArray = re1.exec(newVal);
        if (reArray != null) {
            newVal = newVal.substring(0, reArray.index) + reArray[1] + extraZ + newVal.substring(reArray.index + reArray[0].length);
        }
        var re2 = new RegExp("(-?)([0-9]*)(\\.?)([0-9]{" + spaces + "})");
        newVal = newVal.replace(re2, "$1$2$4.");
    }
    newVal = newVal.replace(/\.$/, "");
    return newVal;
}

function moveDecimalNF(val, left, places) {
    var newVal = "";
    if (places == null) {
        newVal = this.moveDecimalAsString(val, left);
    } else {
        newVal = this.moveDecimalAsString(val, left, places);
    }
    return parseFloat(newVal);
}

function getRoundedNF(val) {
    val = this.moveDecimalRight(val);
    if (this.truncate) {
        val = val >= 0 ? Math.floor(val) : Math.ceil(val);
    } else {
        val = Math.round(val);
    }
    val = this.moveDecimalLeft(val);
    return val;
}

function preserveZerosNF(val) {
    var i;
    val = this.expandExponential(val);
    if (this.places <= 0) {
        return val;
    }
    var decimalPos = val.indexOf(".");
    if (decimalPos == -1) {
        val += ".";
        for (i = 0; i < this.places; i++) {
            val += "0";
        }
    } else {
        var actualDecimals = (val.length - 1) - decimalPos;
        var difference = this.places - actualDecimals;
        for (i = 0; i < difference; i++) {
            val += "0";
        }
    }
    return val;
}

/*
 * 
 */
function justNumberNF(val) {
    newVal = val + "";
    var isPercentage = false;
    if (newVal.indexOf("%") != -1) {
        newVal = newVal.replace(/\%/g, "");
        isPercentage = true;
    }
    var re = new RegExp("[^\\" + this.inputDecimalValue + "\\d\\-\\+\\(\\)eE]", "g");
    newVal = newVal.replace(re, "");
    var tempRe = new RegExp("[" + this.inputDecimalValue + "]", "g");
    var treArray = tempRe.exec(newVal);
    if (treArray != null) {
        var tempRight = newVal.substring(treArray.index + treArray[0].length);
        newVal = newVal.substring(0, treArray.index) + this.PERIOD + tempRight.replace(tempRe, "");
    }
    if (newVal.charAt(newVal.length - 1) == this.DASH) {
        newVal = newVal.substring(0, newVal.length - 1);
        newVal = "-" + newVal;
    } else {
        if (newVal.charAt(0) == this.LEFT_PAREN && newVal.charAt(newVal.length - 1) == this.RIGHT_PAREN) {
            newVal = newVal.substring(1, newVal.length - 1);
            newVal = "-" + newVal;
        }
    }
    newVal = parseFloat(newVal);
    if (!isFinite(newVal)) {
        newVal = 0;
    }
    if (isPercentage) {
        newVal = this.moveDecimalLeft(newVal, 2);
    }
    return newVal;
}

