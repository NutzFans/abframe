(function ($) {
 $.fn.sidebarMenu = function (options) {
  options = $.extend({}, $.fn.sidebarMenu.defaults, options || {});
  var target = $(this);

  if (options.data) {
   init(target, options.data);
  }
  else {
   if (!options.url) return;
   $.getJSON(options.url, options.param, function (data) {
    init(target, data);
   });
  }
  var url = window.location.pathname;
  //menu = target.find("[href='" + url + "']");
  //menu.parent().addClass('active');
  //menu.parent().parentsUntil('.nav-list', 'li').addClass('active').addClass('open');
  function init(target, data) {
   $.each(data, function (i, item) {
    var li = $('<li></li>');
    var a = $('<a></a>');
    var icon = $('<i></i>');
    if(item.id=='0'){
    	li.addClass("active open");
    }
    //icon.addClass('glyphicon');
    icon.addClass(item.icon);
    var text = $('<span></span>');
    var text1 = $('<span></span>');
    text.addClass('title').text(item.text);
    text1.addClass('selected');
    a.append(icon);
    a.append(text);
   
    if (item.menus&&item.menus.length>0) {
     a.attr('href', 'javascript:void(0)');
     
     var arrow = $('<i></i>');
     arrow.addClass('icon-arrow');
     a.append(arrow);
     a.append(text1);
     li.append(a);
     var menus = $('<ul></ul>');
     menus.addClass('sub-menu');
     init(menus, item.menus);
     li.append(menus);
    }else {
    	if(item.openmode=="new"){
    		var href = 'javascript:opennew(\'' + item.parentsid + '\', \'' + item.url + '\',\'' + item.text + '\');';
    	}else{
    		var href = 'javascript:addTabs({parentsid:\'' + item.parentsid + '\',id:\'' + item.id + '\',title: \'' + item.text + '\',close: true,url: \'' + item.url + '\'});';
    	}
    	//var href = 'queryDeptbudget.jsp';
     a.attr('href', href);
     //增加回到顶部的按钮
     a.attr('onclick','go()');
     //if (item.istab)
     // a.attr('href', href);
     //else {
     // a.attr('href', item.url);
     // a.attr('title', item.text);
     // a.attr('target', '_blank')
     //}
     li.append(a);
    }
    target.append(li);
   });
  }
 }
 
 $.fn.sidebarMenu.defaults = {
  url: null,
  param: null,
  data: null
 };
})(jQuery);