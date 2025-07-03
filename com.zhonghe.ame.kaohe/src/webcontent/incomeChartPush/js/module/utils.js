layui.define([ 'element' ], function(exports) {
	var $ = layui.jquery;
	var element = layui.element;
	var utils = {};

	/** 滚动数字组件 */
	utils.animateNum = function(elem, isThd, delay, grain) {
		isThd = isThd === null || isThd === undefined || isThd === true || isThd === 'true'; // 是否是千分位
		delay = isNaN(delay) ? 500 : delay; // 动画延迟
		grain = isNaN(grain) ? 100 : grain; // 动画粒度
		var getPref = function(str) {
			var pref = '';
			for (var i = 0; i < str.length; i++)
				if (!isNaN(str.charAt(i)))
					return pref;
				else
					pref += str.charAt(i);
		};
		var getSuf = function(str) {
			var suf = '';
			for (var i = str.length - 1; i >= 0; i--)
				if (!isNaN(str.charAt(i)))
					return suf;
				else
					suf = str.charAt(i) + suf;
		};
		var toThd = function(num, isThd) {
			if (!isThd)
				return num;
			if (!/^[0-9]+.?[0-9]*$/.test(num))
				return num;
			num = num.toString();
			return num.replace(num.indexOf('.') > 0 ? /(\d)(?=(\d{3})+(?:\.))/g : /(\d)(?=(\d{3})+(?:$))/g, '$1,');
		};
		$(elem).each(function() {
			var $this = $(this);
			var num = $this.data('num');
			if (!num) {
				num = $this.text().replace(/,/g, ''); // 内容
				$this.data('num', num);
			}
			var flag = 'INPUT,TEXTAREA'.indexOf($this.get(0).tagName) >= 0; // 是否是输入框
			var pref = getPref(num.toString()), suf = getSuf(num.toString());
			var strNum = num.toString().replace(pref, '').replace(suf, '');
			if (isNaN(strNum * 1) || strNum === '0') {
				flag ? $this.val(num) : $this.html(num);
				return console.error('not a number');
			}
			var int_dec = strNum.split('.');
			var deciLen = int_dec[1] ? int_dec[1].length : 0;
			var startNum = 0.0, endNum = strNum;
			if (Math.abs(endNum * 1) > 10) {
				startNum = parseFloat(int_dec[0].substring(0, int_dec[0].length - 1) + (int_dec[1] ? '.0' + int_dec[1] : ''));
			}
			var oft = (endNum - startNum) / grain, temp = 0;
			var mTime = setInterval(function() {
				var str = pref + toThd(startNum.toFixed(deciLen), isThd) + suf;
				flag ? $this.val(str) : $this.html(str);
				startNum += oft;
				temp++;
				if (Math.abs(startNum) >= Math.abs(endNum * 1) || temp > 5000) {
					str = pref + toThd(endNum, isThd) + suf;
					flag ? $this.val(str) : $this.html(str);
					clearInterval(mTime);
				}
			}, delay / grain);
		});
	};

	/** 显示加载动画 */
	utils.showLoading = function(elem, type, opacity, size) {
		if (elem !== undefined && (typeof elem !== 'string') && !(elem instanceof $)) {
			type = elem.type;
			opacity = elem.opacity;
			size = elem.size;
			elem = elem.elem;
		}
		if (type === undefined)
			type = 1;
		if (size === undefined)
			size = 'sm';
		if (elem === undefined)
			elem = 'body';
		var loader = [ '<div class="ball-loader ' + size + '"><span></span><span></span><span></span><span></span></div>', '<div class="rubik-loader ' + size + '"></div>',
				'<div class="signal-loader ' + size + '"><span></span><span></span><span></span><span></span></div>',
				'<div class="layui-loader ' + size + '"><i class="layui-icon layui-icon-loading layui-anim layui-anim-rotate layui-anim-loop"></i></div>' ];
		$(elem).addClass('page-no-scroll'); // 禁用滚动条
		$(elem).scrollTop(0);
		var $loading = $(elem).children('.page-loading');
		if ($loading.length <= 0) {
			$(elem).append('<div class="page-loading">' + loader[type - 1] + '</div>');
			$loading = $(elem).children('.page-loading');
		}
		if (opacity !== undefined)
			$loading.css('background-color', 'rgba(255,255,255,' + opacity + ')');
		$loading.show();
	};

	/** 移除加载动画 */
	utils.removeLoading = function(elem, fade, del) {
		if (elem === undefined)
			elem = 'body';
		if (fade === undefined)
			fade = true;
		var $loading = $(elem).children('.page-loading');
		if (del)
			$loading.remove();
		else if (fade)
			$loading.fadeOut('fast');
		else
			$loading.hide();
		$(elem).removeClass('page-no-scroll');
	};

	exports('utils', utils);

});
