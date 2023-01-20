<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String contextPath=request.getContextPath();
 %>
<html>
<!-- 
  - Author(s): wyy
  - Date: 2016-07-21 13:18:37
  - Description:
-->
<head>
	<title>流程提示信息</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
    <script src="../common/nui/nui.js" type="text/javascript"></script>
	<link rel="stylesheet" href="<%=contextPath%>/common/nui/resource/kindeditor/themes/default/default.css" />
	<link rel="stylesheet" href="<%=contextPath%>/common/nui/resource/kindeditor/plugins/code/prettify.css" />
	<script charset="utf-8" src="<%=contextPath%>/common/nui/resource/kindeditor/kindeditor-all-min.js"></script>
	<script charset="utf-8" src="<%=contextPath%>/common/nui/resource/kindeditor/lang/zh-CN.js"></script>
	<script charset="utf-8" src="<%=contextPath%>/common/nui/resource/kindeditor/plugins/code/prettify.js"></script>
	<script type="text/javascript" src="<%=contextPath %>/common/components/swffileupload/swfupload/swffileupload.js"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
    </style>
</head>
<body>
	<div style="width: auto" id="tmpStr">
	</div>
    <script type="text/javascript">
    	// nui.parse();
        function promptInit(data){
			var data1 = "";
        	if(data.workItemID == 0){
        		data1 = {"processDefName": data.processDefName,"activityDefID": data.activityDefID}
        	}else{
        		data1 = {workItemID: data.workItemID};
        	}
			var json = nui.encode(data1);
			nui.ajax({
	            url: "com.primeton.eos.ame_common.processPrompt.expandAmeFlowOperTipsInfo.biz.ext",
				type: 'POST',
				data: json,	
				contentType: 'text/json',
	            success: function (o) {
	            	if(o.AmeFlowOperTips.processinfo){
	            		var height;
	            		var str = o.AmeFlowOperTips.processinfo.indexOf("<br />");
	            		if(str>0){
	            			height="124px";
	            		}else{
	            			height="auto";
	            		}
	            		var tmpStr = "<div id='panel1' class='nui-panel' title='流程操作提示' style='width:auto;height:"+ height +"'";
	            		tmpStr += "showToolbar='false' showCollapseButton='true' showFooter='flase' allowResize='true'>";
	            		tmpStr +="<table><tr><td id='processinfo'>"+ o.AmeFlowOperTips.processinfo +"</td></tr></table>";
	            		tmpStr+="</div>";
	            		document.getElementById("tmpStr").innerHTML = tmpStr;
	            		nui.parse();
	            	}
	            }
	         });
        }
</script>
</body>
</html>