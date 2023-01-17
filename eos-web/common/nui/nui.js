__CreateJSPath = function (js) {
    var scripts = document.getElementsByTagName("script");
    var path = "";
    for (var i = 0, l = scripts.length; i < l; i++) {
        var src = scripts[i].src;
        if (src.indexOf(js) != -1) {
            var ss = src.split(js);
            path = ss[0];
            break;
        }
    }
    var href = location.href;
    href = href.split("#")[0];
    href = href.split("?")[0];
    var ss = href.split("/");
    ss.length = ss.length - 1;
    href = ss.join("/");
    if (path.indexOf("https:") == -1 && path.indexOf("http:") == -1 && path.indexOf("file:") == -1 && path.indexOf("\/") != 0) {
        path = href + "/" + path;
    }
    return path;
}

//bootPath
var bootPATH = __CreateJSPath("nui.js");

//debugger,此变量用来区别ajax请求是否弹出alert来提示交互错误
mini_debugger = true;   

window['nui_model']=window['nui_model']||'min';


//miniui
//document.write('<script src="' + bootPATH + 'jquery/jquery-1.9.js" type="text/javascript"></sc' + 'ript>');
//document.write('<script src="' + bootPATH + 'jquery-1.12.4.min.js" type="text/javascript"></sc' + 'ript>');
document.write('<script src="' + bootPATH + 'jquery/jquery-3.2.1.min.js" type="text/javascript"></sc' + 'ript>');

//默认加载min
if(nui_model=='debug'){
	document.write('<script src="' + bootPATH + 'nui-debug.js" type="text/javascript" ></sc' + 'ript>');
}else if(nui_model=='source'){
	document.write('<script src="' + bootPATH + 'nui-source.js" type="text/javascript" ></sc' + 'ript>');
	document.write('<script src="' + bootPATH + 'source/ext/nui-ext.js" type="text/javascript" ></sc' + 'ript>');
}else{
	document.write('<script src="' + bootPATH + 'nui-min.js" type="text/javascript" ></sc' + 'ript>');
	//document.write('<script src="' + bootPATH + 'source/ext/nui-ext.js" type="text/javascript" ></sc' + 'ript>');
}
document.write('<script src="' + bootPATH + 'echart/dist/echarts.js" type="text/javascript" ></sc' + 'ript>');
document.write('<link href="' + bootPATH + 'themes/default/miniui.css" rel="stylesheet" type="text/css" />');
document.write('<link href="' + bootPATH + 'themes/default/nui-ext.css" rel="stylesheet" type="text/css" />');
document.write('<link href="' + bootPATH + 'themes/icons.css" rel="stylesheet" type="text/css" />');
document.write('<script src="' + bootPATH + 'echart/dist/dataTool.js" type="text/javascript" ></sc' + 'ript>');


// NUI 3.5.0 new skin
document.write('<link href="' + bootPATH + 'themes/bootstrap/skin_ex.css" rel="stylesheet" type="text/css" />');


//skin
var skin = getCookie("miniuiSkin");
if (skin) {
    document.write('<link href="' + bootPATH + '/themes/' + skin + '/skin.css" rel="stylesheet" type="text/css" />');
}



////////////////////////////////////////////////////////////////////////////////////////
function getCookie(sName) {
    var aCookie = document.cookie.split("; ");
    var lastMatch = null;
    for (var i = 0; i < aCookie.length; i++) {
        var aCrumb = aCookie[i].split("=");
        if (sName == aCrumb[0]) {
            lastMatch = aCrumb;
        }
    }
    if (lastMatch) {
        var v = lastMatch[1];
        if (v === undefined) return v;
        return unescape(v);
    }
    return null;
}

/////获取操作按钮权限
function getOpeatorButtonAuth(funccode){
	var json = {funccode:funccode};
	nui.ajax({
		url:"com.primeton.eos.ame_auth.ame_auth.getOperatorButtonAuth.biz.ext",
		data:json,
		type:'POST',
		contentType:'text/json',
		success:function(text){
			if(text.authfunc){
				for(var i=0;i<text.authfunc.length;i++){
					/*nui.get(text.authfunc[i].funccode).setEnabled(false);*/
					document.getElementById(text.authfunc[i].funccode).style.display = "none";
				}
			}
		}
	})
	
}

//阿拉伯数字转换成大写汉字
function numberParseChina(money){
//汉字的数字
  var cnNums = new Array('零', '壹', '贰', '叁', '肆', '伍', '陆', '柒', '捌', '玖');
  //基本单位
  var cnIntRadice = new Array('', '拾', '佰', '仟');
  //对应整数部分扩展单位
  var cnIntUnits = new Array('', '万', '亿', '兆');
  //对应小数部分单位
  var cnDecUnits = new Array('角', '分', '毫', '厘');
  //整数金额时后面跟的字符
  var cnInteger = '整';
  //整型完以后的单位
  var cnIntLast = '圆';
  //最大处理的数字
  var maxNum = 999999999999999.9999;
  //金额整数部分
  var integerNum;
  //金额小数部分
  var decimalNum;
  //输出的中文金额字符串
  var chineseStr = '';
  //分离金额后用的数组，预定义
  var parts;
  if (money == '') { return ''; }
  money = parseFloat(money);
  if (money >= maxNum) {
    //超出最大处理数字
    return '';
  }
  if (money == 0) {
    chineseStr = cnNums[0] + cnIntLast + cnInteger;
    return chineseStr;
  }
  //转换为字符串
  money = money.toString();
  if (money.indexOf('.') == -1) {
    integerNum = money;
    decimalNum = '';
  } else {
    parts = money.split('.');
    integerNum = parts[0];
    decimalNum = parts[1].substr(0, 4);
  }
  //获取整型部分转换
  if (parseInt(integerNum, 10) > 0) {
    var zeroCount = 0;
    var IntLen = integerNum.length;
    for (var i = 0; i < IntLen; i++) {
      var n = integerNum.substr(i, 1);
      var p = IntLen - i - 1;
      var q = p / 4;
      var m = p % 4;
      if (n == '0') {
        zeroCount++;
      } else {
        if (zeroCount > 0) {
          chineseStr += cnNums[0];
        }
        //归零
        zeroCount = 0;
        chineseStr += cnNums[parseInt(n)] + cnIntRadice[m];
      }
      if (m == 0 && zeroCount < 4) {
        chineseStr += cnIntUnits[q];
      }
    }
    chineseStr += cnIntLast;
  }
  //小数部分
  if (decimalNum != '') {
    var decLen = decimalNum.length;
    for (var i = 0; i < decLen; i++) {
      var n = decimalNum.substr(i, 1);
      if (n != '0') {
        chineseStr += cnNums[Number(n)] + cnDecUnits[i];
      }
    }
  }
  if (chineseStr == '') {
    chineseStr += cnNums[0] + cnIntLast + cnInteger;
  } else if (decimalNum == '') {
    chineseStr += cnInteger;
  }
  return chineseStr;
}

//window['nui']=window['mini'];


