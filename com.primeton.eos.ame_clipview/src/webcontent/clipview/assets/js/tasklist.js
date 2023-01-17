(function ($) {
 $.fn.task = function (options) {
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
	    var a1 = $('<a></a>');
	    var a2 = $('<a></a>');
	    var div1 = $('<div></div>');
	    var div2 = $('<div></div>');
	    div1.addClass('div1');
	    div2.addClass('div2');
	    var text1 = $('<span></span>');
	    var text2 = $('<span></span>');
	    var text3 = $('<span></span>');
	    text1.addClass('span1').text(item.workItemName);
	    var createTime = item.createTime.substring(0,16);
	    text2.addClass('span2').text(createTime);
	    text3.addClass('span3').text(item.processInstName);
	    a1.attr('href', "javascript:doOperate1('" + item.currentState + "','" + item.isTimeOut + "','" + item.limitNumDesc + "','" + item.timeOutNumDesc+ "','" + item.workItemID + "','" + item.activityInstID + "','" + item.processInstID + "','" + item.processDefName + "','" 
	    		+ item.activityDefID + "','" + item.workItemName + "')");
	    a1.attr('id', 'a1');
	    var icon1 = $('<i></i>');
	    var icon2 = $('<i></i>');
	    icon1.addClass('fa fa-eye');
	    icon2.addClass('fa fa-check-square-o');
	    a1.append(icon1);
	    a2.attr('href', "javascript:doOperate('" + item.workItemID + "','" + item.workItemName + "')");
	    a2.attr('id', 'a2');
	    a2.append(icon2);
	    div2.append(a2);
	    div2.append(a1);
	    div1.append(text1);
	    div1.append(text2);
	    div1.append(text3);
	    div1.append(div2);
	    li.append(div1);
	    target.append(li);
	   });
	  }
 }
 
 $.fn.task.defaults = {
  url: null,
  param: null,
  data: null
 };
})(jQuery);