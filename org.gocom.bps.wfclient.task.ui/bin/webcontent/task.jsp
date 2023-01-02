<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false" %>
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
<body style="height:93%;width: 97%;">
	<div id="workItemTabs" class="nui-tabs" style="margin:0 auto;width: 100%;height: 99%" activeIndex="0">
	    <div id="processGraphTab" style="background-color:blue" name="processGraphTab" title="<%=I18nUtil.getMessage(request, "bps.wfclient.myTask.ProcessGraph")%>">
			<div id="processgraph" class="nui-bps-processgraph" showParticipants="true" height="380px"></div> 
				<!-- 添加审批意见列表 -->

        <fieldset style="border:solid 1px #aaa;padding:3px;" >
	        <legend>审批意见列表</legend>
				<div id="datagrid1" class="nui-datagrid"
					style="width: 100%; height: auto;" dataField="misOpinion"
					url="com.primeton.eos.ame_pur.purContractProcess.queryopinion.biz.ext"
					idField="id" allowResize="true" allowAlternating="true"
					multiSelect="true" showPager="false" allowCellWrap="true">
					<div property="columns" height=auto>
						<div type="indexcolumn" headerAlign="center" width="30">编号</div>
						<div field="operatorname" width="50" headerAlign="center"
							align="center">处理人</div>
						<div field="workitemname" width="80" align="center"
							headerAlign="center">处理环节</div>
						<div field="starttime" width="100" headerAlign="center"
							align="center" dateFormat="yyyy-MM-dd HH:mm:ss">任务启动时间</div>
						<div field="endtime" width="100" headerAlign="center"
							align="center" dateFormat="yyyy-MM-dd HH:mm:ss">任务处理时间</div>
						<div field="jiequtime" width="60" headerAlign="center"
							align="center" dateFormat="yyyy-MM-dd HH:mm:ss">处理时长</div>
						<div field="auditstatus" renderer="onCheckRenderer" width="60"
							align="center" headerAlign="center">处理结果</div>
						<div field="auditopinion" width="150" headerAlign="center"
							align="left">审批意见</div>
					</div>
				</div>
			</fieldset>
	    </div>
	    <div id="executeWorkItemFormTab" name="executeWorkItemFormTab" title="<%=I18nUtil.getMessage(request, "bps.wfclient.myTask.ExecuteWorkItemForm")%>">
			<table id="executeWotkItemFormTable" class="nui-form-table" style="width:100%;margin:0 auto">
				<tr>
					<td>
						<div id="form2" >
							<div id="workItemForm" class="nui-bps-showworkitemform"></div>
						</div>
					</td>
				</tr>
				
			</table>
	    </div>
	    <div id="workItemDetailTab" name="workItemDetailTab" title="<%=I18nUtil.getMessage(request, "bps.wfclient.myTask.WorkItemDetail")%>">
	        <div id="form1">
				<table id="workItemDetailTable" class="nui-form-table" width="100%">	
					<tr>
						<td class="nui-form-label"><%=I18nUtil.getMessage(request, "bps.wfclient.myTask.ProcessInstID")%>:</td>
						<td><input id="processInstID"  name="processInstID" class="nui-textbox asLabel" readOnly="true"/></td>
						<td class="nui-form-label"><%=I18nUtil.getMessage(request, "bps.wfclient.myTask.ProcessInstName")%>:</td>
						<td><input id="processInstName"  name="processInstName" class="nui-textbox asLabel" readOnly="true"/></td>
					</tr>		
					<tr>
						<td class="nui-form-label"><%=I18nUtil.getMessage(request, "bps.wfclient.myTask.ActivityInstID")%>:</td>
						<td><input id="activityInstID"  name="activityInstID" class="nui-textbox asLabel" readOnly="true"/></td>
						<td class="nui-form-label"><%=I18nUtil.getMessage(request, "bps.wfclient.myTask.ActivityInstName")%>:</td>
						<td><input id="activityInstName"  name="activityInstName" class="nui-textbox asLabel" readOnly="true"/></td>
					</tr>			
					<tr>
						<td class="nui-form-label"><%=I18nUtil.getMessage(request, "bps.wfclient.myTask.WorkItemID")%>:</td>
						<td><input id="workItemID"  name="workItemID" class="nui-textbox asLabel" readOnly="true"/></td>
						<td class="nui-form-label"><%=I18nUtil.getMessage(request, "bps.wfclient.myTask.WorkItemName")%>:</td>
						<td><input id="workItemName"  name="workItemName" class="nui-textbox asLabel" readOnly="true"/></td>
					</tr>
					<tr>
						<td class="nui-form-label"><%=I18nUtil.getMessage(request, "bps.wfclient.myTask.Priority")%>:</td>
						<td><input id="priority"  name="priority" class="nui-textbox asLabel" readOnly="true"/></td>
						<td class="nui-form-label"><%=I18nUtil.getMessage(request, "bps.wfclient.myTask.CurrentState")%>:</td>
						<td><input id="currentState"  name="currentState" class="nui-textbox asLabel"  readOnly="true"/></td>
					</tr>
					<tr>
						<td class="nui-form-label"><%=I18nUtil.getMessage(request, "bps.wfclient.myTask.TimeLimit")%>:</td>
						<td><input id="limitNumDesc"  name="limitNumDesc" class="nui-textbox asLabel" readOnly="true"/></td>
						<td class="nui-form-label"><%=I18nUtil.getMessage(request, "bps.wfclient.myTask.RemindTime")%>:</td>
						<td><input id="remindTime"  name="remindTime" class="nui-datepicker asLabel" format="yyyy-MM-dd HH:mm:ss" readOnly="true" width="160"/></td>
					</tr>
					<tr>
						<td class="nui-form-label"><%=I18nUtil.getMessage(request, "bps.wfclient.myTask.IsTimeOut")%>:</td>
						<td style="vertical-align:bottom" ><input id="isTimeOut"  name="isTimeOut" class="nui-textbox asLabel"  readOnly="true"/></td>
						<td class="nui-form-label"><%=I18nUtil.getMessage(request, "bps.wfclient.myTask.Overtime")%>:</td>
						<td><input id="timeOutNumDesc"  name="timeOutNumDesc" class="nui-textbox asLabel" readOnly="true"/></td>
					</tr>	
					<tr>
						<td class="nui-form-label"><%=I18nUtil.getMessage(request, "bps.wfclient.myTask.PartiName")%>:</td>
						<td><input id="partiName"  name="partiName" class="nui-textbox asLabel" readOnly="true"/></td>
						<td class="nui-form-label"><%=I18nUtil.getMessage(request, "bps.wfclient.myTask.CreateTime")%>:</td>
						<td><input id="createTime"  name="createTime" class="nui-datepicker asLabel" format="yyyy-MM-dd HH:mm:ss" readOnly="true" width="160"/></td>
					</tr>		
					<tr>
						<td class="nui-form-label"><%=I18nUtil.getMessage(request, "bps.wfclient.myTask.StartTime")%>:</td>
						<td><input id="startTime"  name="startTime" class="nui-datepicker asLabel" format="yyyy-MM-dd HH:mm:ss" readOnly="true" width="160"/></td>
						<td class="nui-form-label"><%=I18nUtil.getMessage(request, "bps.wfclient.myTask.EndTime")%>:</td>
						<td><input id="endTime"  name="endTime" class="nui-datepicker asLabel" format="yyyy-MM-dd HH:mm:ss" readOnly="true" width="160"/></td>
					</tr>
				</table>
			</div> 
	    </div>
	    <div id="workItemOperationsTab" name="workItemOperationsTab" title="<%=I18nUtil.getMessage(request, "bps.wfclient.myTask.WorkItemOerationTab")%>">
			<div id="optDetail" class="nui-bps-fetchmessagelist">
				<div name="optDetail" property="column">
			        <div field="time"><%=I18nUtil.getMessage(request, "bps.wfclient.myTask.Time")%></div>
			        <div field="operateType"><%=I18nUtil.getMessage(request, "bps.wfclient.myTask.OperationType")%></div>
			        <div field="content"><%=I18nUtil.getMessage(request, "bps.wfclient.myTask.Detail")%></div>
			        <div field="from"><%=I18nUtil.getMessage(request, "bps.wfclient.myTask.InfoSource")%></div>
		        </div>
			</div>
	    </div>
	    <div id="workItemPressDetailTab" name="workItemPressDetailTab" title="<%=I18nUtil.getMessage(request, "bps.wfclient.myTask.PreInfo")%>">
			<div id="pressDetail" class="nui-bps-fetchmessagelist">
				<div name="pressDetail" property="column">
			        <div field="createTime"><%=I18nUtil.getMessage(request, "bps.wfclient.myTask.PressTime")%></div>
			        <div field="producer"><%=I18nUtil.getMessage(request, "bps.wfclient.myTask.PreProducer")%></div>
			        <div field="content"><%=I18nUtil.getMessage(request, "bps.wfclient.myTask.PreDetial")%></div>
		        </div>
			</div> 	
	    </div>
	    <div id="workItemAnnotateDetailTab" name="workItemAnnotateDetailTab" title="<%=I18nUtil.getMessage(request, "bps.wfclient.myTask.AnnInfo")%>">
			<div id="annotateDetail" class="nui-bps-fetchmessagelist">
				<div name="annotateDetail" property="column">
			        <div field="createTime"><%=I18nUtil.getMessage(request, "bps.wfclient.myTask.AnnTime")%></div>
			        <div field="producer"><%=I18nUtil.getMessage(request, "bps.wfclient.myTask.AnnProducer")%></div>
			        <div field="content"><%=I18nUtil.getMessage(request, "bps.wfclient.myTask.AnnDetail")%></div>
		        </div>
			</div>	 	
	    </div>
	</div>

	<div class="bottomBtnDiv">
		<a id="appointActivity" class="nui-bps-appoint-activity redBtn" visible="false"></a>
		<a id="drawBackButton" class="nui-button redBtn" onclick="doDrawBack()" visible="false">任务撤回<a/>
		<a id="getButton" class="nui-button redBtn"  onclick="doSubmit('get')" visible="false"><%=I18nUtil.getMessage(request, "bps.wfclient.myTask.Receive")%></a>
		<a id="cancelGetButton" class="nui-button redBtn"  onclick="doSubmit('cancelGet')" visible="false"><%=I18nUtil.getMessage(request, "bps.wfclient.myTask.CancelReceive")%></a>
		<a id="delegateButton" class="nui-button redBtn"  onclick="doSubmit('delegate')" visible="false"><%=I18nUtil.getMessage(request, "bps.wfclient.myTask.Delegate")%></a>
		<a id="helpButton" class="nui-button redBtn"  onclick="doSubmit('help')" visible="false"><%=I18nUtil.getMessage(request, "bps.wfclient.myTask.Help")%></a>
		<a id="redoButton" class="nui-button redBtn"  onclick="doSubmit('redo')" visible="false"><%=I18nUtil.getMessage(request, "bps.wfclient.myTask.Repect")%></a>
		<a id="rejectButton" class="nui-button redBtn"  onclick="doSubmit('reject')" visible="false"><%=I18nUtil.getMessage(request, "bps.wfclient.myTask.Reject")%></a>
		<a id="saveButton" class="nui-button redBtn"  onclick="doSubmit('save')" visible="false"><%=I18nUtil.getMessage(request, "bps.wfclient.myTask.SaveData")%></a>
		<a id="printButton" class="nui-button redBtn" onclick="doPrint()" visible="true">打印业务信息<a/>
		<a id="executeButton" class="nui-button redBtn"  onclick="doSubmit('execute')" visible="false"><%=I18nUtil.getMessage(request, "bps.wfclient.myTask.Execute")%></a>
		<a id="withdrawButton" class="nui-button redBtn"  onclick="doSubmit('withdraw')" visible="false"><%=I18nUtil.getMessage(request, "bps.wfclient.myTask.Withdraw")%></a>
		<a id="closeButton" class="nui-button redBtn"  onclick="doSubmit('close')" visible="false"><%=I18nUtil.getMessage(request, "bps.wfclient.common.Closed")%></a>
	</div>
	<div>
		<input id="participants" name="participants" class="nui-bps-select-participant" selectorMaxCount="1" visible="false"/>
	</div>
	
	<script type="text/javascript">
    	nui.parse();   	
    	var workItem = null;   
    	
    	var isShowDetailBak = false;
    	var limitNumBox=nui.get("limitNumDesc");
    	var timeOutNumBox=nui.get("timeOutNumDesc");
    	
    	function changeTimeType(time){
    		var daylen=time.indexOf("Days");
    		var hourlen=time.indexOf("Hours");
    		var minlen=time.indexOf("Minutes");
    		var day=time.substring(0,daylen);
    		var hour=time.substring(daylen+4,hourlen);
    		var min=time.substring(hourlen+5,minlen);
    		return day+"<%=I18nUtil.getMessage(request, "bps.wfclient.common.Days")%>"+hour+
    						"<%=I18nUtil.getMessage(request, "bps.wfclient.common.Hours")%>"+min+
    						"<%=I18nUtil.getMessage(request, "bps.wfclient.common.Minutes")%>";
    	}
    	
    	//工作项状态
        var workItemState={
        	"4":"<%=I18nUtil.getMessage(request, "bps.wfclient.bizdict.WaitingRecieve")%>",
        	"8":"<%=I18nUtil.getMessage(request, "bps.wfclient.bizdict.Suspend")%>",
        	"10":"<%=I18nUtil.getMessage(request, "bps.wfclient.bizdict.Running")%>",
        	"12":"<%=I18nUtil.getMessage(request, "bps.wfclient.bizdict.Finish")%>",
        	"13":"<%=I18nUtil.getMessage(request, "bps.wfclient.bizdict.Terminate")%>"
        };
        
        //超时
        var timeFlag={
        	"Y":"<%=I18nUtil.getMessage(request, "bps.wfclient.bizdict.Yes")%>",
        	"N":"<%=I18nUtil.getMessage(request, "bps.wfclient.bizdict.No")%>"
        };
    	
    	function initData(row, taskType, isShowDetail) {
    		var tabsObj = nui.get("workItemTabs");
    		var form = new nui.Form("form1");
    		row.currentState=workItemState[row.currentState];
    		row.isTimeOut=timeFlag[row.isTimeOut];
    		form.setData(row);
    		if(row.limitNumDesc){
    			limitNumBox.setValue(changeTimeType(row.limitNumDesc));
    		}
    		if(row.timeOutNumDesc){
    			timeOutNumBox.setValue(changeTimeType(row.timeOutNumDesc));
    		}
    		
    		workItem = row;
    		
    		// 指派后继活动或者参与者
    		//var appointActivity = nui.get("appointActivity");
	    	//appointActivity.setWorkItemID(row.workItemID);
	    	//appointActivity.load();
    		
    		// 工作项操作信息
    		var optDetailObj = nui.get("optDetail");
    		var data = {
					workItemID:row.workItemID,
					activityInstID:row.activityInstID,
					processInstID:row.processInstID 
			};
			optDetailObj.setRestMethod("fetchMessageList");
    		optDetailObj.load(data);
    		//业务信息
    		var tab = {name: "ywDetail", id: "ywDetail", title: "业务信息"};
    		//tips:这里已经有流程定义名称，不需要再去查询
    		var url= nui.getDictText('AME_SYSCONF',row.processDefName);
    		if(url != null && url != ""){
			    tab.url = "<%=request.getContextPath() %>"+url+"?processInstID=" + row.processInstID;
		    }else{
    			tab.url = "<%=request.getContextPath() %>/bps/wfclient/task/noYWpage.jsp";
    			nui.get("printButton").setVisible(false);
    		}
    		if(row.processDefName == "com.primeton.eos.ame_pur.ame_purCont" || row.processDefName == "com.primeton.eos.ame_pur.ame_purOrder" || row.processDefName == "com.primeton.eos.ame_pur.ame_purSettlePay" || row.processDefName == "com.primeton.eos.ame_pur.ame_purOtherSettlePay"){
    			nui.get("printButton").setVisible(true);
    		}else{
    			nui.get("printButton").setVisible(false);
    		}
    		tabsObj.addTab(tab,1);
			//流程图
			var processGraphObj = nui.get("processgraph");
			processGraphObj.setProcInstID(row.processInstID);
			processGraphObj.load();
    		//处理意见详情
					
			var grid = nui.get("datagrid1");
			grid.load({processInstID:row.processInstID});
		
					
    		var getButton = nui.get("getButton");
    		var cancelGetButton = nui.get("cancelGetButton");
    		var delegateButton = nui.get("delegateButton");
    		var helpButton = nui.get("helpButton");
    		var redoButton = nui.get("redoButton");
    		var rejectButton = nui.get("rejectButton");
    		var saveButton = nui.get("saveButton");
    		var executeButton = nui.get("executeButton");
    		var withdrawButton = nui.get("withdrawButton");
    		var closeButton = nui.get("closeButton");
    		var drawBackButton = nui.get("drawBackButton");
    		
    		//如果是查看详细信息
    		if (isShowDetail) {
    			isShowDetailBak = true;
    			tabsObj.removeTab("executeWorkItemFormTab");
    			closeButton.setVisible(true);
    			executeButton.setVisible(true);
    			if (taskType == "self") {
	    			executeButton.setText("<%=I18nUtil.getMessage(request, "bps.wfclient.myTask.Execute")%>");
	    			if (workItem.actionMask.substring(1, 2) != "N") {
	    				getButton.setVisible(true);
	    			}
	    			if (workItem.actionMask.substring(0, 1) != "N") {
	    				cancelGetButton.setVisible(true);
	    			}
	    		} else if (taskType == "entrust") {
	    			executeButton.setText("<%=I18nUtil.getMessage(request, "bps.wfclient.myTask.Withdraw")%>");
	    		} else {
	    			executeButton.setVisible(false);
	    		}
	    		//费用的“受益部门内审批”环节不允许拽回
	    		if(taskType == "finishedSelf" && !((row.processDefName == "com.primeton.eos.ame_fee.PaymentApply" && row.activityDefID == "manualActivity12") || (row.processDefName == "com.primeton.eos.ame_fee.ReimbApply" && row.activityDefID == "manualActivity2")
	    		|| (row.processDefName == "com.primeton.eos.ame_pur.ame_purSettlePay" && row.activityDefID == "manualActivity22")
	    		|| (row.processDefName == "com.primeton.eos.ame_pur.ame_purOtherSettlePay" && row.activityDefID == "manualActivity22")
	    		    || (row.processDefName == "com.primeton.eos.ame_permanage.ame_emp_contract" && row.activityDefID == "manualActivity1"))){//已办任务的查看详细信息，那么就判断是否需要显示“任务撤回”按钮
	    			nui.ajax({
			            url: "org.gocom.bps.wfclient.task.business.task.checkIsCanDrawBack.biz.ext",
			            type: 'POST',
			            data: {"workItemID": row.workItemID},
			            cache: false,
			            success: function (res) {
			            	if(res.isCanDrawBack == true){
			            		drawBackButton.setVisible(true);
			            	}
			            }
			        });
	    		}else{
	    			drawBackButton.setVisible(false);
	    		}
    		} else {
    			closeButton.setVisible(true);
    			closeButton.setText("<%=I18nUtil.getMessage(request, "bps.wfclient.common.Cancel")%>");
    		
	    		var workItemForm = nui.get("workItemForm");
	    		workItemForm.setWorkItemID(row.workItemID);
	    		workItemForm.load();
	    		
	    		tabsObj.removeTab("processGraphTab");
	    		tabsObj.removeTab("workItemOperationsTab");
    		
	    		if (taskType == "entrust") {
	    			withdrawButton.setVisible(true);
	    		} else if (taskType == "self") {
	    			withdrawButton.setVisible(false);
	    			if (workItem.actionMask.substring(1, 2) != "N") {
	    				getButton.setVisible(true);
	    			}
	    			if (workItem.actionMask.substring(0, 1) != "N") {
	    				cancelGetButton.setVisible(true);
	    			}
	    			if (workItem.actionMask.substring(3, 4) != "N") {
	    				delegateButton.setVisible(true);
	    			}
	    			if (workItem.actionMask.substring(5, 6) != "N") {
	    				helpButton.setVisible(true);
	    			}
	    			if (workItem.actionMask.substring(7, 8) != "N") {
	    				redoButton.setVisible(true);
	    				executeButton.setText("<%=I18nUtil.getMessage(request, "bps.wfclient.common.Confirm")%>");
	    			}
	    			if (workItem.actionMask.substring(6, 7) != "N") {
	    				rejectButton.setVisible(true);
	    			}
	    			if (workItem.actionMask.substring(2, 3) != "N") {
	    				saveButton.setVisible(true);
	    				executeButton.setVisible(true);
	    			} else {    				
		    			if (workItem.bizState == 4) {
		    				executeButton.setText("<%=I18nUtil.getMessage(request, "bps.wfclient.common.Confirm")%>");
		    			}  
	    			} 			
	    		}
    		}
    		
    		var pressTabObj = tabsObj.getTab("workItemPressDetailTab");
    		pressTabObj.title="<%=I18nUtil.getMessage(request, "bps.wfclient.myTask.PreInfo")%>";
    		tabsObj.updateTab(pressTabObj,'title');
    		
    		tabsObj.on("activechanged", function (e) {
           		var title = tabsObj.getActiveTab().title;
    			if(title==("<%=I18nUtil.getMessage(request, "bps.wfclient.myTask.PreInfo")%>")){
    				var workItemID = nui.get("workItemID").value;
    				var pressDetailObj = nui.get("pressDetail");
					var data = {workItemID:workItemID};
					pressDetailObj.setRestMethod("queryPressListByTaskID");
					pressDetailObj.load(data);
    			}
    			if(title=="<%=I18nUtil.getMessage(request, "bps.wfclient.myTask.AnnInfo")%>"){
    				var workItemID = nui.get("workItemID").value;
    				var pressDetailObj = nui.get("annotateDetail");
					var data = {workItemID:workItemID};
					pressDetailObj.setRestMethod("queryAnnotateListByTaskID");
					pressDetailObj.load(data);
    			}
        	});
        	
        	//判断是否显示此按钮
	    	//disableAppointActivityBtnIfNeccessary();
    	}
    	
    	function doPrint(){
    		if(workItem.processDefName == "com.primeton.eos.ame_pur.ame_purCont"){
    			window.open("<%=request.getContextPath() %>/ame_pur/PurContractProcess/DetailPurContract.jsp?processInstID=" + workItem.processInstID);
    		}else if(workItem.processDefName == "com.primeton.eos.ame_pur.ame_purOrder"){
    			window.open("<%=request.getContextPath() %>/ame_pur/PurOrderProcess/DetailPurOrderProcess.jsp?processInstID=" + workItem.processInstID);
    		}else if(workItem.processDefName == "com.primeton.eos.ame_pur.ame_purSettlePay"){
    			window.open("<%=request.getContextPath() %>/ame_pur/settlepay/purGoSettlePrint.jsp?processInstID=" + workItem.processInstID);
    		}else if(workItem.processDefName == "com.primeton.eos.ame_pur.ame_purOtherSettlePay"){
    			window.open("<%=request.getContextPath() %>/ame_pur/PurOtherSettlePay/PurOtherSettlePrint.jsp?processInstID=" + workItem.processInstID);
    		}
    	}
    	//撤回工作项
    	function doDrawBack(){
    		if(!confirm("是否任务撤回？")){
    			return;
    		}
    		nui.ajax({
	            url: "org.gocom.bps.wfclient.task.business.task.drawBackWorkItem.biz.ext",
	            type: 'POST',
	            data: {"workItemID": workItem.workItemID},
	            cache: false,
	            success: function (res) {
	            	alert("任务撤回成功！");
	            	initData(workItem, "self", true);
	            }
	        });
    	}
    	//提交工作项
    	function doSubmit(submitType) {
    		var submitData = {
    			workItemID: workItem.workItemID,
    			submitType: submitType,
    			submitTypeDisplayName: "",
    			reason: "",
    			processInstID: 0,
    			participants: [],
    			workItemFormData: {}
    		};
    		if(submitType=="close"){
    			closeWindow('close');
    			return;
    		}
    		if (isShowDetailBak) {
    			if (submitType == "get" || submitType == "cancelGet") {
				}else{
					closeWindow('execute');
    				return;
    			}
    		}
    		
			if (submitType == "get" || submitType == "cancelGet") {
	    		doPostSubmit(submitData);		    		
			} else if (submitType == "save" || submitType == "execute") {
				var form2 = new nui.Form("form2");
				submitData.processInstID = workItem.processInstID;
	    		submitData.workItemFormData = form2.getData();
	    		doPostSubmit(submitData);
	    	} else {
	    		if (submitType == "delegate") {	
	    			submitData.submitTypeDisplayName = "<%=I18nUtil.getMessage(request, "bps.wfclient.myTask.Delegate")%>";
	    			//代办,协办要先选人
	    			selectParticipantsBeforeSubmit(submitData);
	    			return;
				} else if (submitType == "help") {
					submitData.submitTypeDisplayName = "<%=I18nUtil.getMessage(request, "bps.wfclient.myTask.Help")%>";
					selectParticipantsBeforeSubmit(submitData);
					return;
				} else if (submitType == "redo") {
					submitData.submitTypeDisplayName = "<%=I18nUtil.getMessage(request, "bps.wfclient.myTask.Repect")%>";
				} else if (submitType == "reject") {
					submitData.submitTypeDisplayName = "<%=I18nUtil.getMessage(request, "bps.wfclient.myTask.Reject")%>";
				} else {
					submitData.submitTypeDisplayName = "<%=I18nUtil.getMessage(request, "bps.wfclient.myTask.Withdraw")%>";
				}
				submitAfterSelectParticipant(submitData);
	    	}
    	}
    	
    	// 代办,协办先选择参与者
    	function selectParticipantsBeforeSubmit(submitData){
    		var selectParticipantsObj = nui.get("participants");
			var selectPageData = {
				otherParamObj:selectParticipantsObj.getOtherParamObj()
			};
			nui.open({
				url: contextPath + "/bps/web/control/html/resourceSelector.jsp",
				title: "<%=I18nUtil.getMessage(request, "bps.wfclient.myTask.Select")%>" + submitData.submitTypeDisplayName + "<%=I18nUtil.getMessage(request, "bps.wfclient.myTask.Personals")%>",
				width: 600,
				height: 450,
				onload: function (){
					var iframe = this.getIFrameEl();
					if(iframe.contentWindow.initData) {
						iframe.contentWindow.initData(selectPageData);
					}
				},
				ondestroy: function (action){
					if (action == "ok") {
						var iframe = this.getIFrameEl();
						if(iframe.contentWindow.returnData) {
							var data = iframe.contentWindow.returnData();
							submitData.participants[0] = data;
							submitAfterSelectParticipant(submitData);
						}
					}
				}
			});
    		
    	}
    	
    	function submitAfterSelectParticipant(submitData){
    		nui.open({
						url: contextPath + "/bps/wfclient/task/reason.jsp",
						title: "<%=I18nUtil.getMessage(request, "bps.wfclient.myTask.FillIn")%>" + submitData.submitTypeDisplayName + "<%=I18nUtil.getMessage(request, "bps.wfclient.myTask.Reason")%>",
						width: 400,
						height: 300,
						onload: function (){
							var iframe = this.getIFrameEl();
							if(iframe.contentWindow.initData) {
								iframe.contentWindow.initData(submitData, workItem.currentParticipant);
							}
						},
						ondestroy: function (action){
							if (action == "ok") {
								var iframe = this.getIFrameEl();
								if(iframe.contentWindow.returnData) {
									var data = iframe.contentWindow.returnData();
									data = nui.clone(data);
									submitData.reason = data.reason;
									if (data.participants) {
										submitData.participants = data.participants;
									}									
									doPostSubmit(submitData);
								}
							}
						}
			});	
    	}
    	
    	function doPostSubmit(submitData) {
    		nui.ajax({
	            url: "org.gocom.bps.wfclient.task.business.task.executeWorkItem.biz.ext",
	            type: 'POST',
	            data: submitData,
	            cache: false,
	            success: function (res) {
	            	if(res.exception) {
	            		nui.confirm("<%=I18nUtil.getMessage(request, "bps.wfclient.myTask.OpeFailed")%>", "<%=I18nUtil.getMessage(request, "bps.wfclient.myTask.ExecuteResults")%>", function(e){
			        		if (e != "cancel") {
			        			closeWindow("ok");
			        		}		            		
			        	});
	            	} else {
	            		tfcToast.take("<%=I18nUtil.getMessage(request, "bps.wfclient.myTask.OpeSuccess")%>", "<%=I18nUtil.getMessage(request, "bps.wfclient.myTask.ExecuteResults")%>");
	            		closeWindow("ok");
	            	}
	            }
	        });
    	}
    	
    		//处理结果业务字典显示
    	  function onCheckRenderer(e) {
			return nui.getDictText('MIS_AUDITSTATUS',e.value);
		}
    
    	function disableAppointActivityBtnIfNeccessary(){
    		if(workItem && workItem.workItemID){
	    		$(function(){
	    			//尽可能的延迟加载
	    			nui.ajax({
			            url: "org.gocom.bps.wfclient.task.business.task.openBizform.biz.ext",
			            type: 'POST',
			            data: {workItemID: workItem.workItemID},
			            cache: false,
			            success: function (res) {
			            	if(res.exception) {
			            		return;
			            	}
			            	if(res.ret){
				    			nui.get("appointActivity").setVisible(false);
			            	}
			            }
			        });
	    		});
    		}
    	}
    	
    </script>
</body>
</html>
