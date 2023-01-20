<%@page import="com.primeton.bps.web.control.I18nUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/bps/wfclient/common/common.jsp"%>
<html>
<head>
	<title></title>
	<style type="text/css">
		body{
			background-color:#f7f7f7
		}
	</style>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />    
</head>
<body style="width: 97%;height:420px">
	<div  class="nui-tabs" style="width:100%;height:100%;" activeIndex="0">
		<div id="processGraphTab" title="<%=I18nUtil.getMessage(request, "bps.wfclient.process.ProcessGraph") %>" style="height: 95%;width: 99%">
			<div id="processgraph" class="nui-bps-processgraph"  showParticipants="true" style="height:100%"></div>
	    </div>
	</div>

	<div style="width: 100%; padding-top: 10px" align="center">
        <a class="nui-button redBtn" onclick="doCancel"><%=I18nUtil.getMessage(request, "bps.wfclient.common.Closed") %></a>
    </div>

	<script type="text/javascript">
    	nui.parse();
    	var form = new nui.Form("#form");
    	function setData(rowData){
    		var rowData = nui.clone(rowData);
    		var processGraphObj = nui.get("processgraph");
    		processGraphObj.setProcDefID(rowData);
    		processGraphObj.load();
    		if(rowData.createTime){
    			rowData.createTime = nui.formatDate(rowData.createTime, "yyyy-MM-dd HH:mm:ss");
    		}
    		if(rowData.updateTime){
    			rowData.updateTime = nui.formatDate(rowData.updateTime, "yyyy-MM-dd HH:mm:ss");
    		}
      		form.setData(rowData);
    	}
    	
    	function doStart(){
    		var _this = window;
    		var data = nui.clone(form.getData());
    		nui.open({
       			 url: contextPath+"/bps/wfclient/process/startProcess.jsp",
       			 title: "<%=I18nUtil.getMessage(request, "bps.wfclient.process.StartProcess") %>",
       			 type:'POST',
       			 width: 550,
       			 height: 350,
       			 onload: function () {
         			 var iframe = this.getIFrameEl();
                   	 iframe.contentWindow.setData(data);
                   	 if (_this.CloseOwnerWindow)
		    		 	return _this.CloseOwnerWindow();
		             else _this.close();  
         		 }
	        });
    	}
    	
    	function doCancel(e){
    		 if (window.CloseOwnerWindow)
    		 	return window.CloseOwnerWindow(e);
             else window.close();   
    	}
    </script>
</body>
</html>