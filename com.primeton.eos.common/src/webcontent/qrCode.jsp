<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<html>
<!-- 
  - Author(s): 朱海翔
  - Date: 2017-04-07 11:06:02
  - Description:
-->
<head>
	<title>二维码生成</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<script type="text/javascript" src="<%= request.getContextPath() %>/ame_common/js/jquery.qrcode.min.js"></script>
	<script type="text/javascript" src="<%= request.getContextPath() %>/ame_common/js/JsBarcode.all.js"></script>
	<script type="text/javascript" src="<%= request.getContextPath() %>/ame_common/js/jquery-barcode.js"></script>  
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
</head>
<body>
	<div class="nui-panel" title="二维码生成" width="1090px" >
		<form id="form1" method="post" style="width:100%;">
			<table style="width:100%;">
				<tr height="200px">
					<td align="left" valign="top" width="50%">
						<input value="说明：短地址码可以能会出现不支持某些网址的短网址生成。" style="text-align:left;font-weight:bold;color: red;border: none;width:400px" readonly="readonly"><br/>
						二维码内容:<input class = "nui-textarea"id = "content"  required = "true" style="width:400px;height: 50px" inputStyle="ime-mode:disabled" />
						<br/>
						二维码长度：<input class = "nui-textbox" id="width" width="80px">
						二维码宽度：<input class = "nui-textbox" id="higth" width="80px">
					</td>
					<td align="center">
						<a id="name"></a>
						<div id="qrcode"></div> 
					</td>
				</tr>
			</table>
	    </form>
	    <iframe   style="display:none"   name=if0   ></iframe>   
	<div style="text-align:center;padding:10px;" class="nui-toolbar">
	    <a class="nui-button" onclick="address()" style="width:100px;margin-right:20px;">URL短地址码</a>
	    <a class="nui-button" onclick="orginal()" style="width:100px;margin-right:20px;">原始码</a>
	    <a class="nui-button" onclick="processinst()" style="width:100px;margin-right:20px;">流程处理码</a>
	</div>
</div>	
	
<script type="text/javascript">
	nui.parse();
	var form = new nui.Form("#form1");
	nui.get("higth").setValue(100);
	nui.get("width").setValue(100);
	
	
	
	function address(){
		var higth = nui.get("higth").getValue();
		var width = nui.get("width").getValue();
		var content = nui.get("content").getValue();
		if(IsURL(content)==false){
			alert("内容不是正确的网址格式，请检查后再进行生成！");
			return;
		}
		var json = nui.encode({"url":content});
		nui.ajax({
	            url: "com.primeton.eos.common.qrCode.shortURL.biz.ext",
				type: 'POST',
				data: json,	
				contentType: 'text/json',
	            success: function (o) {
	            	var url = o.URL;
	            	var result = o.result;
	            	if(result == null || result == "null"){
	            		document.getElementById("name").innerHTML = "URL短地址码";
	            		createEwm(url,width,higth);
	            	}else if(result == 1 || result=='1'){
	            		alert("您输入的域名暂不支持生成短网址，请重新输入!");
	            	}else{
	            		alert("内容地址无效，短地址码生成失败!");
	            	}
				}
	     });
	}
	
	function orginal(){
		var higth = nui.get("higth").getValue();
		var width = nui.get("width").getValue();
		var content = nui.get("content").getValue();
		document.getElementById("name").innerHTML = "原始码";
		createEwm(content,width,higth);
	}
	
	function processinst(){
		var higth = nui.get("higth").getValue();
		var width = nui.get("width").getValue();
		var content = nui.get("content").getValue();
		if(IsNumber(content)==false){
			alert("请输入正确的流程ID！？");
			return;
		}
		var flag = "1";
		var json = nui.encode({"processinstid":content,"flag":flag});
		nui.ajax({
	            url: "com.primeton.eos.common.qrCode.shortURL.biz.ext",
				type: 'POST',
				data: json,	
				contentType: 'text/json',
	            success: function (o) {
	            	var url = o.URL;
	            	document.getElementById("name").innerHTML = "流程处理码";
	            	createEwm(url,width,higth);
				}
	     });
	}
	
	function createEwm(url,width,higth){
		$('#qrcode').empty();
		var para = url;
    	$('#qrcode').qrcode({width: width,height: higth,text: para});
	}
	
	function IsURL(str_url){
		/* var strRegex = "^((https|http|ftp|rtsp|mms)?://)"
		+ "?(([0-9a-z_!~*'().&=+$%-]+: )?[0-9a-z_!~*'().&=+$%-]+@)?" //ftp的user@ 
		+ "(([0-9]{1,3}\.){3}[0-9]{1,3}" // IP形式的URL- 199.194.52.184 
		+ "|" // 允许IP和DOMAIN（域名）
		+ "([0-9a-z_!~*'()-]+\.)*" // 域名- www. 
		+ "([0-9a-z][0-9a-z-]{0,61})?[0-9a-z]\." // 二级域名 
		+ "[a-z]{2,6})" // first level domain- .com or .museum 
		+ "(:[0-9]{1,4})?" // 端口- :80 
		+ "((/?)|" // a slash isn't required if there is no file name 
		+ "(/[0-9a-z_!~*'().;?:@&=+$,%#-]+)+/?)$"; 
		var re=new RegExp(strRegex); 
		//re.test()
		if (re.test(str_url)){
			return (true); 
		}else{ 
			return (false); 
		} */
		
		var str=str_url;
		//判断URL地址的正则表达式为:http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&=]*)?
		//下面的代码中应用了转义字符"\"输出一个字符"/"
		var Expression=/http(s)?:\/\/([\w-]+\.)+[\w-]+(\/[\w- .\/?%&=]*)?/;
		var objExp=new RegExp(Expression);
		if(objExp.test(str)==true){
		return true;
		}else{
		return false;
		}
	}
	
	function IsNumber(num){
		var strRegex = "^[0-9]*$";
		var re=new RegExp(strRegex); 
		//re.test()
		if (re.test(num)){
			return (true); 
		}else{ 
			return (false); 
		}
	}
	
</script>
</body>
</html>