(function ($) {
 $.fn.fastMenu = function (options) {
  options = $.extend({}, $.fn.fastMenu.defaults, options || {});
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
    icon.addClass(item.icon);
    icon.addClass('icons1');
    var text = $('<span></span>');
    text.addClass('span4').text(item.text);
    a.append(icon);
    a.append(text);
    var href = 'javascript:addTabs({id:\'' + item.ids + '\',title: \'' + item.text + '\',close: true,url: \'' + item.url + '\'});';
     a.attr('href', href);
     li.append(a);
    target.append(li);
   });
  }
 }
 
 $.fn.fastMenu.defaults = {
  url: null,
  param: null,
  data: null
 };
})(jQuery);