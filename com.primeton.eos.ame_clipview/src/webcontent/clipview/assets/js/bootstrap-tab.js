var BrowserMatch = {  
	init: function() {  
		this.browser = this.getBrowser().browser || "未知浏览器";  //获取浏览器名
		this.OS = this.getOS()+" "+this.getDigits() || "未知操作系统"; //系统版本号 
	},  
	getOS: function() {  //判断所处操作系统
		 var sUserAgent = navigator.userAgent.toLowerCase();   
		 var isWin = (navigator.platform == "Win32") || (navigator.platform == "Win64")|| (navigator.platform == "wow64");   
		 var isMac = (navigator.platform == "Mac68K") || (navigator.platform == "MacPPC") || (navigator.platform == "Macintosh") || (navigator.platform == "MacIntel");   
		 if (isMac) {
			 return "Mac";   
		 }
		 var isUnix = (navigator.platform == "X11") && !isWin && !isMac;   
		 if (isUnix) {
			return "Unix";   
		 }
		 var isLinux = (String(navigator.platform).indexOf("Linux") > -1);   
		 var bIsAndroid = sUserAgent.toLowerCase().match(/android/i) == "android";  
		 if (isLinux) {  
			 if(bIsAndroid){
				 return "Android";
			 }else{
				 return "Linux"; 
			 }
		 }  
		 if (isWin) {   
			 return "Window";				
		 }  
		 return "其他";
	},  
	getDigits:function(){ //判断当前操作系统的版本号 
		var sUserAgent = navigator.userAgent.toLowerCase();   
		var is64 = sUserAgent.indexOf("win64") > -1||sUserAgent.indexOf("wow64") > -1;  
		if (is64) {  
			return "64位";  
		}else{  
			return "32位";    
		}
	},
	getBrowser: function() {  // 获取浏览器名
		var agent = navigator.userAgent.toLowerCase() ;

	    var regStr_ie = /(msie\s|trident\/7)([\w\.]+)/;  
	    var regStr_ff = /firefox\/[\d.]+/gi
	    var regStr_chrome = /chrome\/[\d.]+/gi ;
	    var regStr_saf = /safari\/[\d.]+/gi ;

	    if(agent.indexOf("chrome") > 0)
	    {
	    	return {browser:agent.match(regStr_chrome)};
	    }else if(agent.indexOf("safari") > 0 && agent.indexOf("chrome") < 0)
	    {
	    	return {browser:agent.match(regStr_saf)} ;
	    }else if(agent.indexOf("firefox") > 0)
	    {
	    	return {browser:agent.match(regStr_ff)};
	    }else{
	    	return {browser:agent.match(regStr_ie)};
	    }
	   
	}  
};  
BrowserMatch.init();
var addTabs = function (options) {
	if($('#aaa').hasClass('navbar-toggle collapsed')){
		
	}else {
		$('#aaa').click();
	}

	//var rand = Math.random().toString();
	//var id = rand.substring(rand.indexOf('.') + 1);
	var url = window.location.protocol + '//' + window.location.host;
	if(options.url.substring(0,4)=="http"){
		 
	}else{
		options.url = url + options.url;
	}
	id = "tab_" + options.id;
	$('.nav li.active').removeClass('active');
	$('.tab-pane').removeClass('active');
	//如果TAB不存在，创建一个新的TAB
	if (!$("#" + id)[0]) {
	  //固定TAB中IFRAME高度
		mainHeight = $(window).height() -100;
		//创建新TAB的title
		title = '<li role="presentation" id="tab_' + id + '"><a href="#' + id + '" aria-controls="' + id + '" role="tab" data-toggle="tab">' + options.title;
		//是否允许关闭
		if (options.close) {
			title += ' <i class="glyphicon glyphicon-remove" tabclose="' + id + '"></i>';
		}
		title += '</a></li>';
		//是否指定TAB内容
		if (options.content) {
			content = '<div role="tabpanel" class="tab-pane" id="' + id + '">' + options.content + '</div>';
		} else {//没有内容，使用IFRAME打开链接
			content = '<div role="tabpanel" class="tab-pane" id="' + id + '"><iframe id = "iframe'+id+'" src="' + options.url + '" width="100%" height="' + mainHeight +
			'" frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="yes" allowtransparency="yes"></iframe></div>';
		}
		//加入TABS
		$(".nav-tabs").append(title);
		$(".tab-content").append(content);
 	}else{
 		//tab页已打开时点击菜单刷新页面
 		var  iframeid = "iframetab_" + options.id;
 		$('#'+iframeid).attr('src',$('#'+iframeid).attr('src'));
 	}
	
	writeR(options);//写操作日志
 	//激活TAB
	$("#tab_" + id).addClass('active');
	$("#" + id).addClass("active");
};

var writeR = function (options){//写操作日志
	return;
	var rzInfo = 'ip地址：'+returnCitySN["cip"]+'（'+returnCitySN["cname"]+'） , '+BrowserMatch.browser+' ,'+BrowserMatch.OS+"点击了："+options.title;
	$.ajax({
		url:"com.primeton.eos.ame_newlook.newlook.saveClickOper.biz.ext",
		type:"post",
		data:{rzInfo:rzInfo,title:options.title,parentsid:options.parentsid},
		dataType:'json',
		success:function(result){
			
		}
	})
}

//菜单为打开方式为打开新窗口（new）时触发方法
var opennew = function (parentsid,url,text){
 	window.open(url,text); 
 	var options = {parentsid:parentsid,title:text};
 	writeR(options);//写操作日志
}
var closeTab = function (id) {
 //如果关闭的是当前激活的TAB，激活他的前一个TAB
 if ($(".nav li.active").attr('id') == "tab_" + id) {
  $("#tab_" + id).prev().addClass('active');
  $("#" + id).prev().addClass('active');
 }
 //关闭TAB
 $("#tab_" + id).remove();
 $("#" + id).remove();
};
$(function () {
 mainHeight = $(document.body).height() - 45;
 $('.main-left,.main-right').height(mainHeight);
 $("[addtabs]").click(function () {
  addTabs({ id: $(this).attr("id"), title: $(this).attr('title'), close: true });
 });
 
 $(".nav-tabs").on("click", "[tabclose]", function (e) {
  id = $(this).attr("tabclose");
  closeTab(id);
 });
});