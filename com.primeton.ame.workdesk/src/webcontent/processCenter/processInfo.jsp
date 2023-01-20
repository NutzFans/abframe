<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false" %>
<!DOCTYPE html>
<html lang="en" class="no-js">
<%@include file="/bps/wfclient/common/common.jsp"%>
<head>
	<title>流程图</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,user-scalable=no"/>
	<meta name="apple-mobile-web-app-capable" content="yes" />
	<style type="text/css">
		*{margin: 0;padding: 0;}
		.header{height: 42px;line-height: 42px;position: fixed;top: 0;width: 100%;font-size: 16px;text-align: center;
		background: #fff;box-shadow: 0px 1px 1px #888888;z-index: 9999;}
		#processgraph{margin: 80px auto 0}
		.nui-bps-processgraph div select{display: none}
	</style>
</head>
<body>
	<div class="header"></div>
	<div id="rot">
		<div id="processgraph" class="nui-bps-processgraph" showParticipants="true"></div> 
    </div>
</body>
<script type="text/javascript">
	$(document).ready(function(){
		var ww = $(window).width();
		var wh = $(window).height();
		var hh = $(".header").height();
		ww = ww+"px";
		wh = (wh-hh-80)+"px";
		$('#rot').css({
			"width":ww,
			"height":wh
		})
	})
	
	nui.parse();   
	
	<%
	  String tempProc = request.getParameter("processInstID");
	  String processChName = request.getParameter("processChName");
	  long processInstID = 0;
	  if(tempProc != null){
	  	processInstID = Long.parseLong(tempProc);
	  }
	if(processInstID != 0){
	%>
	initData({processInstID: <%=processInstID %>,processChName:'<%=processChName %>'});
	<%
	}
	%>
	function initData(row) {
		if(row.processChName != "" || row.processChName != null){
			$(".header").text(row.processChName);
		}else{
			$(".header").text("流程图展示");
		}
		
		//流程图
		var processGraphObj = nui.get("processgraph");
		processGraphObj.setProcInstID(row.processInstID);
		processGraphObj.load();	
	}
</script>
</html>