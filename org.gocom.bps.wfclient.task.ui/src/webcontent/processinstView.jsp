<%@page import="java.util.Map"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">	
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
<body style="height:96%;width: 97%;">
	<div id="workItemTabs" class="nui-tabs" style="margin:0 auto;width: 100%;height: 99%" activeIndex="0" onactivechanged="changeTabs">
	    <div id="processGraphTab" style="background-color:blue" name="processGraphTab" title="<%=I18nUtil.getMessage(request, "bps.wfclient.myTask.ProcessGraph")%>">
			<div id="processgraph" class="nui-bps-processgraph" showParticipants="true" height="350px"></div>
				<!-- 添加审批意见列表 -->

        <fieldset style="border:solid 1px #aaa;padding:1px;width: 98%" >
	        <legend>审批意见列表</legend>
        	<div id="datagrid1" class="nui-datagrid" style="width:100%;height:auto;" dataField="misOpinion"
			    url="com.primeton.eos.ame_pur.purContractProcess.queryopinion.biz.ext"  idField="id" allowResize="true"
			    allowAlternating="true" multiSelect="true" showPager="false" allowCellWrap="true">
			    <div property="columns" height=auto>
			    
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
		<a id="closeButton" class="nui-button redBtn"  onclick="closeWindow('close')" visible="true"><%=I18nUtil.getMessage(request, "bps.wfclient.common.Closed")%></a>
	</div>
	<div>
		<input id="participants" name="participants" class="nui-bps-select-participant" selectorMaxCount="1" visible="false"/>
	</div>
	
	<script type="text/javascript">
    	nui.parse();
    	var processInstID="";
		var tabsObj = nui.get("workItemTabs");
    	function initData(row) {//row 只有一个参数--processInstID
    		var processGraphObj = nui.get("processgraph");
    		processGraphObj.setProcInstID(row.processInstID);
    		processGraphObj.load();
    		//处理意见详情
    		var grid = nui.get("datagrid1");
			grid.load({processInstID:row.processInstID});
    		//初始化页面加载(点击业务信息，加载processDefName，判断processDefName进入不同的业务详细页面)
    		var ywDetail = {name: "ywDetail", id: "ywDetail", title: "业务信息"};//损益表页面
    		<% 
	    		UserObject user = (UserObject)session.getAttribute("userObject");
	    		Map attr = user.getAttributes();
	    		DataObject[] roles = (DataObject[])attr.get("roles");
	    		boolean isOutUser = false;
				for(int i=0;i < roles.length;i++){
					if(roles[i].getString("roleid").equals("primetongeneral")){
						isOutUser = true;
					}
				}
				if(isOutUser == true){}else{
			%>
				tabsObj.addTab(ywDetail,1);
			<%} %>
			//changeTab调用需要参数
			processInstID=row.processInstID;
		
    	}
    	var flag =true;
    	function changeTabs(e){
    	if(flag){
    		if(e.tab.name == "ywDetail"){
    			nui.ajax({
					url:"org.gocom.bps.wfclient.task.business.task.queryProcessinstByProcessinstID.biz.ext",
					type:"post",
					data:{processinstid:processInstID},
					contentType:"text/json",
					success:function (o){
						if(o.PROCURL != null && o.PROCURL != ""){
				    		tabsObj.loadTab("<%=request.getContextPath() %>"+o.PROCURL+"?processInstID=" + processInstID);
			    		}else{
				    		tabsObj.loadTab("<%=request.getContextPath() %>/bps/wfclient/task/noYWpage.jsp");
			    		}
			    		//只加载一遍（可以页面进来直接查询流程实例，但是浪费数据库资源。所以采用这种方式）
			    		flag = false;
					},
					error: function (jqXHR, textStatus, errorThrown) {
		                alert(jqXHR.responseText);
		            }
		        });
    		}
    	}
    	}
    	//跨域调用时监听
    	window.addEventListener('message', function(ev) {
		    // if (ev.source !== window.parent) {return;}
		    var data = ev.data;
		    initData(data);
		}, false);
		
			//处理结果业务字典显示
    	  function onCheckRenderer(e) {
			return nui.getDictText('MIS_AUDITSTATUS',e.value);
		}
    
    </script>
</body>
</html>
