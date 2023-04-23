<%@page import="com.primeton.bps.web.control.I18nUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/bps/wfclient/common/common.jsp"%>
<html>
<head>
	<title><%=I18nUtil.getMessage(request, "bps.wfclient.myTask.TList")%></title>
	<style type="text/css">
	    body{
	        margin: 0;padding: 0;border: 0;width: 100%;height: 100%;overflow: hidden;	
	    } 
	</style>
</head>
<body class="body-font" > 
	<div style="width:100%;">
    <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
        <table style="width:100%;">
        	<tr>
                <td style="width:20%;">
                	<% String taskType = request.getParameter("taskType");
                	   if(taskType.equals("self")){
                	 %>
                   	我的待办任务列表
                   	<%}else if(taskType.equals("finishedSelf")){ %>
                   	我的已办任务列表
                   	<%} %>
                </td>
            </tr>
         </table>           
    </div>
	</div>
	<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
	    <table id="tableSearch" style="width: 100%;height:32px;font-size:12px;" align="center" >
	        <tr>
	            <td id="zxqx1" width="10%" align="right" style="white-space:nowrap"><%=I18nUtil.getMessage(request, "bps.wfclient.myTask.ExePer")%>：</td>
	            <td id="zxqx2" align="left" width="15%">
	                <div id="permissionList" class="nui-checkboxlist" onitemclick="onItemClick" textField="text" valueField="id">
	                </div>
	            </td>
	            <td width="10%" align="right" style="white-space:nowrap"><%=I18nUtil.getMessage(request, "bps.wfclient.myTask.Source")%>：</td>
	            <td align="left" width="40%" colspan="3">  
	                <div id="taskFromList" class="nui-checkboxlist" onitemclick="onItemClick" textField="text" valueField="id">
	                </div>
	            </td>
<!-- 				<td width="10%" align="right">业务目录:</td> -->
						<td width="15%" align="left">
							<input id="catalogName" class="nui-hidden"valueField="catalogId" textField="catalogName" multiSelect="true" showNullItem="true">
							<input class="nui-hidden" name="criteria._expr[6]._property" value="catalogName">
							<input class="nui-hidden" name="criteria._expr[6]._op" value="in">
						</td>
	        </tr>
	        <tr>
	            <td  width="10%" align="right" id="a1">工作项名称：</td>
	            <td align="left" width="10%" id="a2">
	                <input class="nui-textbox" id="workItemName">
	            </td>
	            <td  width="10%" align="right" id="b1">环节名称：</td>
	            <td align="left" width="10%" id="b2">
	                <input id="workItemName1" valueField="workItemName" textField="workItemName" class="nui-combobox" shownullItem="true" onvaluechanged="changeWorkItemName" multiSelect="true" />
	            </td>
	            <td  width="10%" align="right" >流程定义名称：</td>
	            <td align="left" width="10%">
	                <input class="nui-textbox" id="processChName">
	            </td>
	            <td  width="10%" align="right" >流程实例名称：</td>
	            <td align="left" width="10%">
	                <input class="nui-textbox" id="processInstName">
	            </td>
	            <td  width="10%" align="right" id="c1">状态：</td>
	            <td align="left" width="10%" id="c2"> 
	                <input class="nui-combobox" id="currentState" multiSelect="true" valueField="id" textField="text" showNullItem="true" data=[{"id":4,"text":"待领取"},{"id":8,"text":"挂起"},{"id":10,"text":"运行"},{"id":12,"text":"完成"},{"id":13,"text":"终止"}]>
	            </td>
	            <td align="center" valign="middle" colspan="1">  
	                <a class="nui-button grayBtn" iconCls="icon-search" onclick="doSearch()"><%=I18nUtil.getMessage(request, "bps.wfclient.common.Query")%></a>
	                <a class="nui-button" id="export" iconCls="icon-download" onclick="doExport()">导出</a>
	            </td>
	        </tr>
	    </table>
	</div>
	<div id="taskListId" class="nui-datagrid bpsDatagrid" style="width: 100%;height: 500px" showPager="true" allowResize="true"
	url="org.gocom.bps.wfclient.task.business.task.queryTaskList.biz.ext" allowAlternating="true" allowCellWrap="true"
    dataField="tasks" pageSize="10" onbeforeload="onBeforeDataGridLoad" >
	    <div property="columns">
	        <div name="action" headerAlign="center" cellCls="textof_clip" align="center" renderer="onActionRenderer" width="100"><%=I18nUtil.getMessage(request, "bps.wfclient.common.Operation")%></div>
	        <div field="workItemName" headerAlign="center" align="center" width="80" ><%=I18nUtil.getMessage(request, "bps.wfclient.myTask.WorkItemName")%></div>
	        <div field="processChName" headerAlign="center" align="center" width="100"><%=I18nUtil.getMessage(request, "bps.wfclient.myTask.ProcDefName")%></div>
	        <div field="processInstName" headerAlign="center" align="left" width="200"><%=I18nUtil.getMessage(request, "bps.wfclient.myTask.ProcessInstName")%></div>                                
	        <div name= "currentdestate"headerAlign="center" align="center" renderer="onCurrentStateRenderer" width="40" ><%=I18nUtil.getMessage(request, "bps.wfclient.myTask.Status")%></div>
	        <div field="currentActName" name="currentActName" headerAlign="center" align="left" width="90"  >当前活动环节</div>
			<div field="currentActParti" name="currentActParti" headerAlign="center"  align="center" width="90">当前活动环节参与者</div>
	        <div name="assistantName" field="assistantName" headerAlign="center" align="center" width="70"><%=I18nUtil.getMessage(request, "bps.wfclient.myTask.Assignee")%></div>
	        <div field="createTime" headerAlign="center" align="left" dateFormat="yyyy-MM-dd HH:mm:ss" width="90">任务启动时间</div> 
	        <div name="endTime" field="endTime" headerAlign="center" align="left" dateFormat="yyyy-MM-dd HH:mm:ss" width="90">任务结束时间</div> 
	        <div headerAlign="center" align="center" renderer="onTimeoutRenderer" width="30"><%=I18nUtil.getMessage(request, "bps.wfclient.myTask.IsTimeOut")%></div>    
<!-- 	        <div field="workItemDesc" headerAlign="center" align="left" width="100"  >工作项备注</div>  -->
	    </div>
	</div>
	
	<!-- for integration coframe
	<div class="pager" style="height:30px;width:100%">
		<div id="pager" class="nui-bpspager" datagridId="taskListId"></div>
	</div>
	 -->
<form name="viewlist" id="viewlist" action="com.primeton.eos.ame_fee.exportTicket.flow" method="post">
		<input type="hidden" name="_eosFlowAction" value="action0" filter="false"/>
		<input type="hidden" name="downloadFile" filter="false"/>
		<input type="hidden" name="fileName" filter="false"/>
</form> 
<script type="text/javascript">
	nui.parse();
	//任务类型
	var taskType = '<%=request.getParameter("taskType")%>';
	//执行权限
	var permissionListObj = nui.get("permissionList");
	
	var grid = nui.get("taskListId");
	
	if (taskType == "self") {
    	var permissionListData = [
    		{"id" : "ALL", "text" : "<%=I18nUtil.getMessage(request, "bps.wfclient.myTask.All")%>"},
    		{"id" : "PRIVATE", "text" : "<%=I18nUtil.getMessage(request, "bps.wfclient.myTask.Personal")%>"},
    		{"id" : "PUBLIC", "text" : "<%=I18nUtil.getMessage(request, "bps.wfclient.myTask.Public")%>"}
    	];
    	permissionListObj.setData(permissionListData);
    	permissionListObj.selectAll();
    	document.getElementById("a1").style.display = "none";
    	document.getElementById("a2").style.display = "none";
	} else {
		document.getElementById("zxqx1").style.display = "none";
		document.getElementById("zxqx2").style.display = "none";
		document.getElementById("b1").style.display = "none";
		document.getElementById("b2").style.display = "none";
	    document.getElementById("c1").style.display = "none";
	    document.getElementById("c2").style.display = "none";
	
	}
	
	//处理在已完成任务中状态为完成时的隐藏
	var taskList = nui.get("taskListId");
	if (taskType =="finishedSelf") {
	if (<%=I18nUtil.getMessage(request, "bps.wfclient.myTask.Status")%> = "12") {
		taskList.hideColumn("currentdestate");
	}
	}
	
	
	//任务来源
	var taskFromListObj = nui.get("taskFromList");
	var taskFromListData = [
		{"id" : "ALL", "text" : "<%=I18nUtil.getMessage(request, "bps.wfclient.myTask.All")%>"},
		{"id" : "DELEG", "text" : "<%=I18nUtil.getMessage(request, "bps.wfclient.myTask.Delegate")%>"},
		{"id" : "HELP", "text" : "<%=I18nUtil.getMessage(request, "bps.wfclient.myTask.Help")%>"}
	];
	if (taskType != "entrust") {
		taskFromListData.push({"id" : "AGENT", "text" : "<%=I18nUtil.getMessage(request, "bps.wfclient.myTask.Agent")%>"});
	}
	if (taskType == "self" || taskType == "finishedSelf") {
		taskFromListData.push({"id" : "SELF", "text" : "<%=I18nUtil.getMessage(request, "bps.wfclient.myTask.Self")%>"});
	}
	
	taskFromListObj.setData(taskFromListData);
	taskFromListObj.selectAll();
	
	//任务列表
	var taskListDataGridObj = nui.get("taskListId");
	if (taskType != "entrust") {
		taskListDataGridObj.hideColumn("assistantName");
	}
	if (taskType != "finishedSelf") {
		taskListDataGridObj.hideColumn("endTime");
		taskListDataGridObj.hideColumn("currentActName");
		taskListDataGridObj.hideColumn("currentActParti");
	}
	init();
	function init(){
		//org.gocom.bps.wfclient.task.business.task.getCatalogName
		var json = nui.encode({});
        nui.ajax({
            url: "org.gocom.bps.wfclient.task.business.task.getCatalogName.biz.ext",
            data: json,
            type: 'POST',
            cache: false,
            contentType: 'text/json',
            success: function (text) {
            	text = nui.clone(text);
            	var isntsdata = [];
				for(var i = 0;i < text.wfProcessInsts.length;i ++){
					isntsdata[i] = {"catalogId": text.wfProcessInsts[i].catalogName,"catalogName": text.wfProcessInsts[i].catalogName};
				}
				nui.get("catalogName").setData(isntsdata);
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert(jqXHR.responseText);
                CloseWindow();
            }
        });
	}
	doLoadTaskList();
	
	resizeDatagridHeight();
	$(window).bind("resize", resizeDatagridHeight);
	// 自动调整datagrid的外部高度,撑满屏幕
	function resizeDatagridHeight(){
		var realheight = window.innerHeight || (document.documentElement && document.documentElement.clientHeight) || document.body.clientHeight;
		if(taskType != "self" && (navigator.userAgent.indexOf('Firefox') >= 0 || navigator.userAgent.indexOf('Chrome') >= 0)){
			realheight  -= 25;
		}
    	realheight = realheight - (taskType == "self" ? 150 : 125) - 20  + "px";
    	var datagridObj = document.getElementById("taskListId");
    	datagridObj.style.height=realheight;
	}
	
	//checkbox点击事件
	function onItemClick(e) {
		if (e.item.id == "ALL") {
			if (e.sender.isSelected(e.item)) {
				e.sender.selectAll();
			} else {
				e.sender.deselectAll();
			}
		} else {
			var allItem = e.sender.getAt(0);
			if (e.sender.isSelected(e.item)) {
				if (e.sender.getCount() - 1 == e.sender.getSelecteds().length) {
					e.sender.select(allItem);
				}    				
			} else {
				e.sender.deselect(allItem);
			}
		}
	}
    
    //查询
    function doSearch() {
    	doLoadTaskList();
    }
   
    //导出我的待办
	function doExport(){
		if(!confirm("导出我的待办？")){
				return;
			}
			var data = getFormData();
			//alert(nui.encode(data));
			var json =  nui.encode(data);
			nui.ajax({
    			url: "org.gocom.bps.wfclient.task.business.task.myTaskExport.biz.ext",
		        type: "post",
		        data: json,
		        cache: false,
		        contentType: 'text/json',
		        success: function (o) {
		     		var filePath = o.downloadFile;
		        	var fileName = "我的待办任务列表";
		        	var myDate = new Date();
		        	var year = myDate.getFullYear();
		        	var month = myDate.getMonth()+1;
		        	var day = myDate.getDate();
		        	var hours = myDate.getHours();
		        	var minutes = myDate.getMinutes();
		        	var seconds = myDate.getSeconds();
		        	var curDateTime = year;
		        	if(month>9){
						curDateTime = curDateTime + "" + month;
					}else{
						curDateTime = curDateTime + "0" + month;
						}
		        	if(day>9){
						curDateTime = curDateTime + day;
					}else{
						curDateTime = curDateTime + "0" + day;
						}
					if(hours>9){
						curDateTime = curDateTime + hours;
					}else{
						curDateTime = curDateTime + "0" + hours;
						}
					if(minutes>9){
						curDateTime = curDateTime + minutes;
					}else{
						curDateTime = curDateTime + "0" + minutes;
						}
					if(seconds>9){
						curDateTime = curDateTime + seconds;
					}else{
						curDateTime = curDateTime + "0" + seconds;
					}
					fileName = fileName + "_" + curDateTime + ".xls";
					var frm = document.getElementById("viewlist");
		        	frm.elements["downloadFile"].value = filePath;
		        	frm.elements["fileName"].value = fileName;
				    frm.submit();
		        },
		        error: function () {
		        	alert("error");
		        }
			});
	}
	
    
    function changeWorkItemName(){
    	var WorkItemName = nui.get("workItemName1").getValue();
    	nui.get("workItemName").setValue(WorkItemName);
    }
    if(taskType == "self"){
    	getWorkItemName();
    }
    //查环节名称
    function getWorkItemName(){
    	var permisssion = permissionListObj.getValue();
    	var scope = taskFromListObj.getValue();
    	var json = nui.encode({"permisssion":permisssion,"scope":scope});
        nui.ajax({
            url: "org.gocom.bps.wfclient.task.business.task.getWorkItemNameByMe.biz.ext",
            data: json,
            type: 'POST',
            cache: false,
            contentType: 'text/json',
            success: function (text) {
            	var data = text.tasks;
            	nui.get("workItemName1").setData(data);
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert(jqXHR.responseText);
                CloseWindow();
            }
        });
    }
    
    //加载任务列表
    function doLoadTaskList() {
    	taskListDataGridObj.load(null, function(res){
    		if(res.exception) {
    			tfcToast.take("<%=I18nUtil.getMessage(request, "bps.wfclient.myTask.FailedLoad")%>");
    		}        		
    	}, function() {
    		tfcToast.take("<%=I18nUtil.getMessage(request, "bps.wfclient.myTask.FailedLoad")%>");
    	});
    }
	
	//操作
	function onActionRenderer(e) {
        var s = "";
        if (taskType == "self") {
            s = s +  '<a class="dgBtn" href="javascript:doOperate(' + e.rowIndex + ', false)"><%=I18nUtil.getMessage(request, "bps.wfclient.myTask.Execute")%></a> ';
            s = s +  '<a class="dgBtn" href="javascript:doReassign(' + e.rowIndex + ', true)"><%=I18nUtil.getMessage(request, "bps.wfclient.myTask.Reassign")%></a> ';
        } else if (taskType == "entrust") {
        	s = s +  '<a class="dgBtn" href="javascript:doOperate(' + e.rowIndex + ', false)"><%=I18nUtil.getMessage(request, "bps.wfclient.myTask.Withdraw")%></a> ';
        }
        s = s + '<a class="dgBtn"  href="javascript:doOperate(' + e.rowIndex + ', true)"><%=I18nUtil.getMessage(request, "bps.wfclient.common.View")%></a> ';
        if (taskType == "finishedSelf") {
        	var record = e.record;
        	/* if (record.id!=null){
        		s = s + '<a class="dgBtn" href="javascript:attention(' + e.rowIndex + ', true);">取消关注</a> ';
        		if(e.row.isPerson == "true"){
        			s = s + '<a class="dgBtn" href="javascript:void(0)" userIDs="' + e.row.userIDs + '" onclick = doThing(this)>催办</a> ';
        		}
        	}else{
        		s = s + '<a class="dgBtn" href="javascript:attention(' + e.rowIndex + ', true);">关注</a> ';
        		if(e.row.isPerson == "true"){
        			s = s + '<a class="dgBtn" href="javascript:void(0)" userIDs="' + e.row.userIDs + '"onclick = doThing(this)>催办</a> ';
        		}
        	} */
        } 
        return s;
    }
    
    function attention(){
       	var row = grid.getSelected();   //获取所有选中的行对象
	   	var data = {task:{processInstID:row.processInstID,id:row.id}};
	    var json = nui.encode(data);     //序列化成json字符串
        nui.ajax({ 
            url: "org.gocom.bps.wfclient.task.business.task.flowAttention.biz.ext",
            data: json,
            type: 'POST',
            cache: false,
            contentType: 'text/json',
            success: function (text) {
            	grid.reload();
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert(jqXHR.responseText);
            }
        });
    }
    
    //催办
    function doThing(data){
    	var userIDs = $(data).attr("userIDs");
    	var rowInfo = grid.getSelected();
    	var uid = nui.prompt("请输入催办信息：", "请输入",
            function (action, value) {
                if (action == "ok") {
                    var json = {currentActName:rowInfo.currentActName,workItemID:rowInfo.doThingId,processInstName:rowInfo.processInstName,
			    	doThingText:value,userIDs:userIDs};
			    /* 	alert(nui.encode(json)); */
			    	grid.loading("催办中。。。");
			    	nui.ajax({
			    		url:"org.gocom.bps.wfclient.task.business.task.doThingTask.biz.ext",
			            data: json,
			            type: 'POST',
			            cache: false,
			            contentType: 'text/json',
			            success: function (text) {
			            	grid.unmask();
			            	if(text.status == 0){
			            		nui.alert("催办成功，发送微信失败。");
			            	}else if(text.status == 2){
			            		nui.alert("催办失败。");
			            	}else{
			            		nui.alert("催办成功。");
			            	}
			            },
			            error: function (jqXHR, textStatus, errorThrown) {
			                alert(jqXHR.responseText);
			            }
			    	})
                } 
            },
            true
        );
        //根据uid给弹出框默认值
        var win = nui.getbyUID(uid);        
		$(win.el).find("textarea,input").val("请您尽快处理该环节任务。");
    }
    
    
    //工作项状态
    var workItemState={
    	"4":"<%=I18nUtil.getMessage(request, "bps.wfclient.bizdict.WaitingRecieve")%>",
    	"8":"<%=I18nUtil.getMessage(request, "bps.wfclient.bizdict.Suspend")%>",
    	"10":"<%=I18nUtil.getMessage(request, "bps.wfclient.bizdict.Running")%>",
    	"12":"<%=I18nUtil.getMessage(request, "bps.wfclient.bizdict.Finish")%>",
    	"13":"<%=I18nUtil.getMessage(request, "bps.wfclient.bizdict.Terminate")%>"
    };
    
    function onCurrentStateRenderer(e) {
    	return workItemState[e.row.currentState];
    }
    
    //超时
    var timeFlag={
    	"Y":"<%=I18nUtil.getMessage(request, "bps.wfclient.bizdict.Yes")%>",
    	"N":"<%=I18nUtil.getMessage(request, "bps.wfclient.bizdict.No")%>"
    };
    function onTimeoutRenderer(e) {
    	return timeFlag[e.row.isTimeOut];
    }
    var doload = true;
    //数据加载参数传递
    function onBeforeDataGridLoad(e) {
        var params = e.params;
        if (taskType == "self") {
	        var perssionValue = permissionListObj.getValue();
	        if(perssionValue == ""){
	        	tfcToast.take("<%=I18nUtil.getMessage(request, "bps.wfclient.myTask.ExecutiveAuthority")%>");
	        	e.cancel = true;
	        }
	        if (permissionListObj.getCount() == permissionListObj.getSelecteds().length) {
	        	perssionValue = "ALL";
	        }
	        params.permisssion = perssionValue;
        }
        var scopeValue = taskFromListObj.getValue();
        if(scopeValue == ""){
        	tfcToast.take("<%=I18nUtil.getMessage(request, "bps.wfclient.myTask.TaskSource")%>");
        	e.cancel = true;
        }
        if (taskFromListObj.getCount() == taskFromListObj.getSelecteds().length) {
        	scopeValue = "ALL";
        }
    	params.scope = scopeValue;
    	params.taskType = taskType;
    	params.workItemName = nui.get("workItemName").getValue();
    	params.processChName = nui.get("processChName").getValue();
    	params.processInstName = nui.get("processInstName").getValue();
    	params.currentState = nui.get("currentState").getValue();
    	params.catalogName = nui.get("catalogName").getValue();
    	return params;
    }
    
    //获取表单数据
    function getFormData() {
        var params={};
        if (taskType == "self") {
	        var perssionValue = permissionListObj.getValue();
	        if(perssionValue == ""){
	        	tfcToast.take("<%=I18nUtil.getMessage(request, "bps.wfclient.myTask.ExecutiveAuthority")%>");
	        }
	        if (permissionListObj.getCount() == permissionListObj.getSelecteds().length) {
	        	perssionValue = "ALL";
	        }
	        params.permisssion = perssionValue;
        }
        var scopeValue = taskFromListObj.getValue();
        if(scopeValue == ""){
        	tfcToast.take("<%=I18nUtil.getMessage(request, "bps.wfclient.myTask.TaskSource")%>");
        }
        if (taskFromListObj.getCount() == taskFromListObj.getSelecteds().length) {
        	scopeValue = "ALL";
        }
    	params.scope = scopeValue;
    	params.taskType = taskType;
    	params.workItemName = nui.get("workItemName").getValue();
    	params.processChName = nui.get("processChName").getValue();
    	params.processInstName = nui.get("processInstName").getValue();
    	params.currentState = nui.get("currentState").getValue();
    	params.catalogName = nui.get("catalogName").getValue();
    	return params;
    }
    
    //执行操作
    function doOperate(rowIndex, isShowDetail) {
    	var row = taskListDataGridObj.getRow(rowIndex);
    	var url = contextPath + "/bps/wfclient/task/dispatchTaskExecute.jsp?workItemID="+row.workItemID;
    	console.log(taskType);
    	var title = "<%=I18nUtil.getMessage(request, "bps.wfclient.myTask.WorkExecu")%>"+"-"+row.workItemName;
    	var width="100%";
    	if (isShowDetail) {
    		url = contextPath + "/bps/wfclient/task/task.jsp";
	    	title = "<%=I18nUtil.getMessage(request, "bps.wfclient.myTask.WorkDetail")%>"+"-"+row.workItemName;
	    	//width=800;
    	} else if (taskType == "entrust"){
    		url = contextPath + "/bps/wfclient/task/task.jsp";
    		title = "<%=I18nUtil.getMessage(request, "bps.wfclient.myTask.RecoverWorkItem")%>";
    		//width=800;
    	}
	    nui.open({
	    	allowResize: true,
			url: url,
			title: title,
			width: width,
			height: "100%",
			enableDragProxy: false,
			onload: function () {
				var iframe = this.getIFrameEl();
				if(iframe.contentWindow.initData) {
					iframe.contentWindow.initData(row, taskType, isShowDetail);
				}	
			},
			ondestroy: function (action){
				if (action == "ok") {
					taskListDataGridObj.reload();
				} else if (action == "execute") {  
					doOperate(rowIndex, false);					
				}
			}
		});
    }
    //改派
    function doReassign(rowIndex, isShowDetail) {
    	var row = taskListDataGridObj.getRow(rowIndex);
    	nui.open({
			url: "<%=request.getContextPath() %>/ame_common/selectEmp.jsp",
			title: "指定改派人员",
			width: 400,
			height: 150,
			onload: function () {
				//var iframe = this.getIFrameEl();
			},
			ondestroy: function (action){
				if (action == "ok") {
					var iframe = this.getIFrameEl();
					var data = iframe.contentWindow.GetData();
					data = nui.clone(data);    //必须
					if (data.userid) {			//data.userid  data.empname
						var json = {workItemID:row.workItemID ,personID:data.userid, catalogName:row.catalogName, currentActName:row.workItemName};
						nui.ajax({
				    		url: "org.gocom.bps.wfclient.task.business.task.reassign.biz.ext",
				            data: json,
				            type: 'POST',
				            cache: false,
				            showModal: false,
				            contentType: 'text/json',
				            success: function (o) {
				            	nui.alert("改派成功！");
				            	taskListDataGridObj.reload();
				            },
				            error: function (jqXHR, textStatus, errorThrown) {
				                alert(jqXHR.responseText);
				            }
				    	});
					}else{
						//alert("至少选择一条记录！");
					}
				}
			}
		});
    }
    
</script>
</body>
</html>
