<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<!-- 
  - Author(s): 张一博
  - Date: 2017-11-10 13:37:04
  - Description:
-->
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
	<meta name="apple-mobile-web-app-capable" content="yes" />
	<title>登录中</title>
	<script src="wechat/js/jquery.min.js"></script>
	<script type="text/javascript">
		var actmoneyid = getQueryString("actmoneyid");
		//获取url中的参数
	    function getQueryString(name) {
		    var reg = new RegExp('(^|&)' + name + '=([^&]*)(&|$)', 'i');
		    var r = window.location.search.substr(1).match(reg);
		    if (r != null) {
		        return unescape(r[2]);
		    }
		    return null;
		}
	  	$(function(){
	  		window.location.href = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx06742b5415f5da67&redirect_uri=http://ame.primeton.com/default/common/wechatAme.jsp?actmoneyid="+actmoneyid+"&response_type=code&scope=snsapi_base&state=actMoney#wechat_redirect";
	  	})
	</script>
</head>
<body>
</body>
</html>