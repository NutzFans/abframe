<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@include file="/nui/common.jsp"%>
<html>
<!-- 
  - Author(s): Administrator
  - Date: 2015-07-10 14:06:49
  - Description:
-->
<head>
	<link href="../demo.css" rel="stylesheet" type="text/css" />
</head>
<body style="width:100%;height:100%;padding:0px;margin:0px;">
<table style="width:100%;">
	<tr>
		<td align="right" width="100px">处理年月：</td>
    	<td align="left" width="60px">
    		<input class="nui-textbox" id="year" width="50"/>&nbsp;-&nbsp;<input class="nui-textbox" id="month" width="20"/>
	    </td>
    </tr>
    <tr>
		<td align="right" width="100px">存货余额超过待确认合同额：</td>
    	<td align="left" width="60px">
    		<input class="nui-textbox" id="proportion" width="50" onvaluechanged="checkthis"/>%
	    </td>
    </tr>
</table>
<div class="nui-toolbar" style="text-align:center;padding-top:8px;padding-bottom:8px;" borderStyle="border:0;">
    <a class="nui-button" style="width:40px;" onclick="onOk">确定</a>
    <span style="display:inline-block;width:5px;"></span>
    <a class="nui-button" style="width:40px;" onclick="onCancel">取消</a>
</div>
</body>
<script>
	nui.parse();
	GetDateStr();
	
	function onOk(){
		var year = nui.get("year").getValue();
		var month = nui.get("month").getValue();
		var proportion = nui.get("proportion").getValue();
		if(year==null||year==""){
			alert("请选择处理年月后再点击确定！");
			return;
		}
		if(month==null||month==""){
			alert("请选择处理年月后再点击确定！");
			return;
		}
		if(proportion==null||proportion==""){
			alert("请选择待确认合同额的比例后再点击确认！");
			return;
		}
		CloseWindow("ok");
	}
	
	//取上个月
	function GetDateStr() { 
	     var dd = new Date(); 
	     var y = dd.getFullYear(); 
	     var m = dd.getMonth();//获取当前月份的日期 
	     nui.get("year").setValue(y);
	     nui.get("month").setValue(m);
	     nui.get("proportion").setValue(80);
 	}
 	
 	function checkthis(){
 		var proportion = nui.get("proportion").getValue();
		var reg = /^[1-9]\d*$/;
		if(!reg.test(proportion)){
			alert("请输入正整数！");
			nui.get("proportion").setValue(80);
			return;
		}
 	} 
	
	function GetData(){
		var year = nui.get("year").getValue();
		var month = nui.get("month").getValue();
		var proportion = nui.get("proportion").getValue();
		proportion = parseFloat(proportion/100);
		var f = month.substring(0,1);
		if(f=='0'){
			month = month.substring(1,2);
		}
		var data = {"year":year,"month":month,"proportion":proportion};
		return data;
	}
	
	function onCancel(){
		CloseWindow("cancel");
	}
	
	function CloseWindow(action) {
		if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
		else window.close();
	}
</script>
</html>