
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">	
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false" %>
<%@include file="/bps/wfclient/common/common.jsp"%>
<%@page import="com.primeton.bps.web.control.I18nUtil"%>
<html>
<head>
	<title><%=I18nUtil.getMessage(request, "bps.wfclient.myTask.WorkItem")%></title>
	<style type="text/css">
		body{
			background-color:#f7f7f7
		}
	</style>
</head>
<body style="height:93%;width: 97%;">
	<div id="Tabs" class="nui-tabs" style="margin:0 auto;width: 100%;height: 99%" activeIndex="0">
	    <div id="processGraphTab" style="background-color:blue;height: 430px" name="processGraphTab" title="流程图">
			<div id="processgraph" class="nui-bps-processgraph" showParticipants="true" style="width:100%;height:380px;"></div> 
        <fieldset style="border:solid 1px #aaa;padding:3px;" >
	        <legend>审批意见列表</legend>
        	<div id="datagrid1" class="nui-datagrid" style="width:100%;height:auto;" dataField="misOpinion"
			    url="com.primeton.eos.ame_pur.purContractProcess.queryopinion.biz.ext"  idField="id" allowResize="true"
			    allowAlternating="true" multiSelect="true" showPager="false" allowCellWrap="true">
			    <div property="columns">
			    	<div type="indexcolumn" headerAlign="center" width="30" >编号</div>
			        <div field="operatorname" width="50" headerAlign="center" align="center">处理人</div>
			        <div field="workitemname" width="80" align="center" headerAlign="center">处理环节</div>
			        <div field="starttime" width="100" headerAlign="center" align="center" dateFormat="yyyy-MM-dd HH:mm:ss">任务启动时间</div>
			        <div field="endtime" width="100" headerAlign="center" align="center" dateFormat="yyyy-MM-dd HH:mm:ss">任务处理时间</div>
			        <div field="jiequtime" width="60" headerAlign="center" align="center" dateFormat="yyyy-MM-dd HH:mm:ss">处理时长</div>
			        <div field="auditstatus" renderer="onCheckRenderer" width="60" align="center" headerAlign="center">处理结果</div>
			        <div field="auditopinion" width="150" headerAlign="center"  align="left">审批意见</div>
			    </div>
			</div>
	    </fieldset>
	    </div>
	</div>
	<div class="bottomBtnDiv">
		<a id="closeButton" class="nui-button redBtn" align="center" onclick="doSubmit()" visible="false">关闭</a>
	</div>
	<script type="text/javascript">
    	nui.parse();
    	var closeButton = nui.get("closeButton");
    	closeButton.setVisible(true);
    	closeButton.setText("关闭");
    	<%
    	  String tempProc = request.getParameter("processInstID");
    	  long processInstID = 0;
    	  if(tempProc != null){
    	  	processInstID = Long.parseLong(tempProc);
    	  	
    	  }
    	  String processDefName = request.getParameter("processDefName");
    	if(processInstID != 0){
    	%>
    	initData({processInstID: <%=processInstID %>,processDefName: <%=processDefName %>});
    	
    	<%
    	}
    	%>
    	
    	
    	function initData(row) {
    		var tabsObj = nui.get("Tabs");
    		//业务信息
    		var tab = {name: "ywDetail", id: "ywDetail", title: "业务信息"};
    		nui.ajax({
				url:"org.gocom.bps.wfclient.task.business.task.queryProcessinstByProcessinstID.biz.ext",
				type:"post",
				data:{processinstid: row.processInstID},
				contentType:"text/json",
				success:function (o){
					var url=o.PROCURL;
					if(url != null && url != ""){
			    		tab.url = "<%=request.getContextPath() %>"+url+"?processInstID=" + row.processInstID;
		    		}else{
			    		tab.url = "<%=request.getContextPath() %>/bps/wfclient/task/noYWpage.jsp";
		    		}
		    		tabsObj.addTab(tab,1);
					//流程图
					var processGraphObj = nui.get("processgraph");
					processGraphObj.setProcInstID(row.processInstID);
					processGraphObj.load();	
					//处理意见详情
					
					var grid = nui.get("datagrid1");
					grid.load({processInstID:row.processInstID});
					
					
					
				},
				error: function (jqXHR, textStatus, errorThrown) {
	                alert(jqXHR.responseText);
	            }
	   
	        });
    	}
    	
    
    		//处理结果业务字典显示
    	  function onCheckRenderer(e) {
			return nui.getDictText('MIS_AUDITSTATUS',e.value);
		}
    
    	function doSubmit() {
			closeWindow('close');
			return;
    	}
</script>
  
</body>
</html>