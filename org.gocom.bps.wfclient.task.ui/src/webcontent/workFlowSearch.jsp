<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page pageEncoding="UTF-8"%>
<%@page import="com.primeton.bps.web.control.I18nUtil"%>
<%@include file="/common/common.jsp"%>
<%@include file="/common/skins/skin0/component.jsp" %>
<html>
<!-- 
  - Author(s): lixq
  - Date: 2016-08-16 10:51:50
  - Description:
-->
<head>
<title>业务流程查询</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
	<div style="width:100%;height:100%;padding:0px;margin:0px;">
	    <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
	        <legend>业务流程查询</legend>
		    <div class="nui-toolbar" line-height="30px;" borderStyle="border:0;" id="queryform">
				<table id="table1" style="width: 100%;height:32px;font-size:12px;" align="center" >
					<tr>
						<td width="10%" align="right">业务目录:</td>
						<td width="10%" align="left">
							<input id="catalogName" class="nui-combobox" valueField="catalogId" textField="catalogName"  name="criteria._expr[6]._value" showNullItem="true" >
							<input class="nui-hidden" name="criteria._expr[6]._property" value="catalogName">
							<input class="nui-hidden" name="criteria._expr[6]._op" value="=">
						</td>
						<td width="10%" align="right">流程定义名称:</td>
						<td width="10%" align="left">
							<input class="nui-textbox" name="criteria._ref[0]._expr[0]._value">
							<input class="nui-hidden" name="criteria._expr[2]._property" value="processDefID">
							<input class="nui-hidden" name="criteria._expr[2]._op" value="in">
							<input class="nui-hidden" name="criteria._expr[2]._ref" value="1">
							<input class="nui-hidden" name="criteria._ref[0]._id" value="1">
							<input class="nui-hidden" name="criteria._ref[0]._entity" value="com.eos.workflow.data.WFProcessDefine">
							<input class="nui-hidden" name="criteria._ref[0]._select._field[0]" value="processDefID">
							<input class="nui-hidden" name="criteria._ref[0]._expr[0]._property" value="processChName">
							<input class="nui-hidden" name="criteria._ref[0]._expr[0]._op" value="like">
							<input class="nui-hidden" name="criteria._ref[0]._expr[0]._likeRule" value="all">
						</td>
						<td width="10%" align="right">流程状态:</td>
						<td width="10%" align="left">
							<input id="currentState" class="nui-combobox" name="criteria._expr[4]._value" value="2" showNullItem="true" nullItemText="全部" valueField="id" textField="text" data="[{id: 1,text: '未启动'},{id: 2,text: '运行'},{id: 3,text: '挂起'},{id: 7,text: '完成'},{id: 8,text: '终止'}]" >
							<input class="nui-hidden" name="criteria._expr[4]._property" value="currentState">
						</td>
						<td width="10%" align="right">流程实例名称:</td>
						<td width="20%" align="left">
							<input class="nui-textbox" name="criteria._expr[1]._value" style="width:215px">
							<input class="nui-hidden" name="criteria._expr[1]._property" value="processInstName">
							<input class="nui-hidden" name="criteria._expr[1]._op" value="like">
							<input class="nui-hidden" name="criteria._expr[1]._likeRule" value="all">
						</td>
					</tr>
					<tr>
						<td width="10%" align="right">流程发起人:</td>
						<td width="10%" align="left">
							<input class="nui-textbox" name="criteria._ref[1]._expr[0]._value">
							<input class="nui-hidden" name="criteria._expr[0]._property" value="creator">
							<input class="nui-hidden" name="criteria._expr[0]._op" value="in">
							<input class="nui-hidden" name="criteria._expr[0]._ref" value="2">
							<input class="nui-hidden" name="criteria._ref[1]._id" value="2">
							<input class="nui-hidden" name="criteria._ref[1]._entity" value="org.gocom.abframe.dataset.organization.OmEmployee">
							<input class="nui-hidden" name="criteria._ref[1]._select._field[0]" value="userid">
							<input class="nui-hidden" name="criteria._ref[1]._expr[0]._property" value="empname">
							<input class="nui-hidden" name="criteria._ref[1]._expr[0]._op" value="like">
							<input class="nui-hidden" name="criteria._ref[1]._expr[0]._likeRule" value="all">
						</td>
						<td width="10%" align="right">当前参与者类型:</td>
						<td width="10%" align="left">
							<input id="partiType" class="nui-combobox" name="criteria._ref[3]._expr[0]._value" showNullItem="true" nullItemText="全部" valueField="id" textField="text" data="[{id: 'person',text: '个人'},{id: 'role',text: '角色'},{id: 'organization',text: '机构'}]" >
							<input class="nui-hidden" name="criteria._ref[3]._expr[0]._property" value="participanttype">
						</td>
						<td width="10%" align="right">当前参与者状态:</td>
						<td width="10%" align="left">
							<input id="partiStatus" class="nui-combobox" name="criteria._ref[4]._expr[0]._value" showNullItem="true" nullItemText="全部" valueField="id" textField="text" data="[{id: 'on',text: '在岗'},{id: 'leave',text: '离职'}]" >
							<input class="nui-hidden" name="criteria._ref[4]._expr[0]._property" value="empstatus">
							<input class="nui-hidden" name="criteria._ref[4]._expr[1]._property" value="userid">
							<input class="nui-hidden" name="criteria._ref[4]._expr[1]._op" value="notnull">
						</td>
						<td width="10%" align="right">当前环节参与者:</td>
						<td width="20%" align="left">
							<input name="criteria._ref[2]._expr[0]._value" class="nui-textboxlist"  searchField="name" style="width:215px" 
		        				   url="com.primeton.eos.ame_budget.budgetOrgManager.queryAllEmpOrgRoleByName.biz.ext" value="" text="" textField="EMPNAME" valueField="USERID" />
							<input class="nui-hidden" name="criteria._expr[7]._property" value="processInstID">
							<input class="nui-hidden" name="criteria._expr[7]._op" value="in">
							<input class="nui-hidden" name="criteria._expr[7]._ref" value="3">
							<input class="nui-hidden" name="criteria._ref[2]._id" value="3">
							<input class="nui-hidden" name="criteria._ref[2]._entity" value="com.eos.workflow.data.WFWorkItem">
							<input class="nui-hidden" name="criteria._ref[2]._select._field[0]" value="processInstID">
							<input class="nui-hidden" name="criteria._ref[2]._expr[0]._property" value="participant">
							<input class="nui-hidden" name="criteria._ref[2]._expr[0]._op" value="in">
							<input class="nui-hidden" name="criteria._ref[2]._expr[1]._property" value="currentState">
							<input class="nui-hidden" name="criteria._ref[2]._expr[1]._op" value="in">
							<input class="nui-hidden" name="criteria._ref[2]._expr[1]._value" value="4,10">
							<input class="nui-hidden" name="criteria._ref[2]._expr[2]._property" value="workItemID">
							<input class="nui-hidden" name="criteria._ref[2]._expr[2]._op" value="in">
							<input class="nui-hidden" name="criteria._ref[2]._expr[2]._ref" value="4">
							<input class="nui-hidden" name="criteria._ref[2]._expr[3]._property" value="participant">
							<input class="nui-hidden" name="criteria._ref[2]._expr[3]._op" value="in">
							<input class="nui-hidden" name="criteria._ref[2]._expr[3]._ref" value="5">
							<input class="nui-hidden" name="criteria._ref[3]._id" value="4">
							<input class="nui-hidden" name="criteria._ref[3]._entity" value="org.gocom.bps.wfclient.task.business.workflow.Wfwiparticipant">
							<input class="nui-hidden" name="criteria._ref[3]._select._field[0]" value="workitemid">
							<input class="nui-hidden" name="criteria._ref[4]._id" value="5">
							<input class="nui-hidden" name="criteria._ref[4]._entity" value="org.gocom.abframe.dataset.organization.OmEmployee">
							<input class="nui-hidden" name="criteria._ref[4]._select._field[0]" value="userid">
						</td>
					</tr>
					<tr>
						<td width="10%" align="right">是否超时:</td>
						<td width="10%" align="left">
							<input id="isTimeOut" class="nui-dictcombobox" name="criteria._expr[5]._value" showNullItem="true"  dictTypeId="ABF_YESORNO" >
							<input class="nui-hidden" name="criteria._expr[5]._property" value="isTimeOut">
							<input class="nui-hidden" name="criteria._expr[5]._op" value="=">
						</td>
						<td width="10%" align="right">当前环节名称:</td>
						<td width="10%" align="left">
							<input class="nui-textbox" name="criteria._ref[2]._expr[4]._value">
							<input class="nui-hidden" name="criteria._ref[2]._expr[4]._property" value="workItemName">
							<input class="nui-hidden" name="criteria._ref[2]._expr[4]._op" value="like">
							<input class="nui-hidden" name="criteria._ref[2]._expr[4]._likeRule" value="all">
						</td>
						<td colspan="2"></td>
						<td width="10%" align="right">流程启动日期范围:</td>
						<td width="20%" align="left">
							<input class="nui-datepicker" id="startdate" onblur="checkTime()" name="criteria._expr[3]._min" style="width:100px">
							--
				    		<input class="nui-datepicker" onblur="checkTime()" name="criteria._expr[3]._max" style="width:100px" id="maxdatepicker">
					        <input class="nui-hidden" name="criteria._expr[3]._property" value="startTime">
						    <input class="nui-hidden" name="criteria._expr[3]._op" value="between">
					        <input class="nui-hidden" name="criteria._expr[3]._pattern" value="yyyy-MM-dd HH:mm:ss">
						</td>
					</tr>	
					<tr>
						<td align="center" colspan="15">
								<a class="nui-button grayBtn" iconCls="icon-search" onclick="search">查询</a>
								&nbsp;&nbsp;&nbsp;&nbsp;
								<a class="nui-button grayBtn" iconCls="icon-reload" onclick="reset">重置</a>
						</td>	
					</tr>
				</table>
			</div>
			<div style="width:100%;">
		        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
		            <table style="width:100%;">
		            	<tr>
		                    <td style="width:20%;">
		                        <a class="nui-button" id="addBtn" iconCls="icon-edit" onclick="reassign()">改派</a>
		                    </td>
		                </tr>
		             </table>           
		        </div>
		    </div>
	</div>
</div>
<div id="workFlowSearchId" class="nui-datagrid nui-fit" style="width:100%;height:354px;" sizeList="[10,15,20,30,50,100,200,500,1000,5000,10000]"
	dataField="workFlowSearchs" sortMode="client" allowCellWrap="true"  frozenStartColumn="0" frozenEndColumn="3"
	url="org.gocom.bps.wfclient.task.business.task.queryWorkFlow.biz.ext"
	allowAlternating="true" pageSize="15" showPager="true" multiSelect="true">
	<div property="columns">
		<div type="checkcolumn"></div>
		<div field="creatorname" headerAlign="center" align="center" allowSort="true" width="60">发起人</div>
		<div field="processChName" headerAlign="center" align="center" allowSort="true" width="150">流程定义名称</div>
		<div field="processInstName" headerAlign="center" align="left" allowSort="true" width="260" renderer="getDetail">流程实例名称</div>
		<div field="startTime" headerAlign="center" align="center" allowSort="true" dataType="date" dateFormat="yyyy-MM-dd HH:mm:ss" width="130">流程实例启动时间</div>
		<div field="currentState" headerAlign="center" align="center" allowSort="true" width="80" renderer="getDict">当前状态</div>
		<div field="currentActName" headerAlign="center" allowSort="true" align="center" width="120">当前活动环节</div>
		<div field="currentActParti" headerAlign="center" allowSort="true" align="center" width="120">当前活动环节参与者</div>
		<div field="catalogName" headerAlign="center" align="center" allowSort="true" width="80">业务目录</div>
        <div field="currentActStartTime" headerAlign="center" allowSort="true" align="center" dataType="date" dateFormat="yyyy-MM-dd HH:mm:ss" width="130">当前活动环节启动时间</div>
        <div field="workItemDesc" headerAlign="center" align="left" width="260">工作项备注</div>
        <div field="activityInstID" headerAlign="center" align="center" width="0" visible="false"></div><%--当前活动实例ID--%>
        <div field="countTemp" headerAlign="center" align="left" width="0" visible="false"></div><%--当前活动实例的工作项个数--%>
	</div>
</div>
</body>

<script type="text/javascript">
		nui.parse();
		var grid = nui.get("#workFlowSearchId");
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
			search();
		}
		function search(){
			if(nui.getbyName("criteria._ref[1]._expr[0]._value").getValue() == ""){
				nui.getbyName("criteria._expr[0]._op").setValue("=");
				nui.getbyName("criteria._expr[0]._ref").setValue("");
			}else{
				nui.getbyName("criteria._expr[0]._op").setValue("in");
				nui.getbyName("criteria._expr[0]._ref").setValue("2");
			}
			if(nui.getbyName("criteria._ref[0]._expr[0]._value").getValue() == ""){
				nui.getbyName("criteria._expr[2]._op").setValue("=");
				nui.getbyName("criteria._expr[2]._ref").setValue("");
			}else{
				nui.getbyName("criteria._expr[2]._op").setValue("in");
				nui.getbyName("criteria._expr[2]._ref").setValue("1");
			}
			if(nui.getbyName("criteria._ref[2]._expr[0]._value").getValue() == "" && nui.getbyName("criteria._ref[2]._expr[4]._value").getValue() == "" && nui.getbyName("criteria._ref[3]._expr[0]._value").getValue() == "" && nui.getbyName("criteria._ref[4]._expr[0]._value").getValue() == ""){
				nui.getbyName("criteria._expr[7]._op").setValue("=");
				nui.getbyName("criteria._expr[7]._ref").setValue("");
				nui.getbyName("criteria._ref[2]._expr[2]._op").setValue("=");
				nui.getbyName("criteria._ref[2]._expr[2]._ref").setValue("");
				nui.getbyName("criteria._ref[2]._expr[3]._op").setValue("=");
				nui.getbyName("criteria._ref[2]._expr[3]._ref").setValue("");
			}else if((nui.getbyName("criteria._ref[2]._expr[0]._value").getValue() != "" || nui.getbyName("criteria._ref[2]._expr[4]._value").getValue() != "") && nui.getbyName("criteria._ref[3]._expr[0]._value").getValue() == "" && nui.getbyName("criteria._ref[4]._expr[0]._value").getValue() == ""){
				nui.getbyName("criteria._expr[7]._op").setValue("in");
				nui.getbyName("criteria._expr[7]._ref").setValue("3");
				nui.getbyName("criteria._ref[2]._expr[2]._op").setValue("=");
				nui.getbyName("criteria._ref[2]._expr[2]._ref").setValue("");
				nui.getbyName("criteria._ref[2]._expr[3]._op").setValue("=");
				nui.getbyName("criteria._ref[2]._expr[3]._ref").setValue("");
			}else if(nui.getbyName("criteria._ref[3]._expr[0]._value").getValue() == "" && nui.getbyName("criteria._ref[4]._expr[0]._value").getValue() != ""){
				nui.getbyName("criteria._expr[7]._op").setValue("in");
				nui.getbyName("criteria._expr[7]._ref").setValue("3");
				nui.getbyName("criteria._ref[2]._expr[2]._op").setValue("=");
				nui.getbyName("criteria._ref[2]._expr[2]._ref").setValue("");
				nui.getbyName("criteria._ref[2]._expr[3]._op").setValue("in");
				nui.getbyName("criteria._ref[2]._expr[3]._ref").setValue("5");
			}else if(nui.getbyName("criteria._ref[3]._expr[0]._value").getValue() != "" && nui.getbyName("criteria._ref[4]._expr[0]._value").getValue() == ""){
				nui.getbyName("criteria._expr[7]._op").setValue("in");
				nui.getbyName("criteria._expr[7]._ref").setValue("3");
				nui.getbyName("criteria._ref[2]._expr[2]._op").setValue("in");
				nui.getbyName("criteria._ref[2]._expr[2]._ref").setValue("4");
				nui.getbyName("criteria._ref[2]._expr[3]._op").setValue("=");
				nui.getbyName("criteria._ref[2]._expr[3]._ref").setValue("");
			}else{
				nui.getbyName("criteria._expr[7]._op").setValue("in");
				nui.getbyName("criteria._expr[7]._ref").setValue("3");
				nui.getbyName("criteria._ref[2]._expr[2]._op").setValue("in");
				nui.getbyName("criteria._ref[2]._expr[2]._ref").setValue("4");
				nui.getbyName("criteria._ref[2]._expr[3]._op").setValue("in");
				nui.getbyName("criteria._ref[2]._expr[3]._ref").setValue("5");
			}
			var form = new nui.Form("#queryform");
			//alert(nui.get("maxdatepicker").getValue());
			if(nui.get("maxdatepicker").getValue() != ""){
				nui.get("maxdatepicker").setValue(nui.get("maxdatepicker").getValue().substring(0,10) + " 23:59:59");
			}
			var data = form.getData(); //获取表单JS对象数据
			//alert(nui.encode(data));
		  	grid.load(data); //datagrid加载数据
			grid.sortBy("startTime","desc");
		}
		// 查询时进行合理的时间检测 
		function checkTime(){
			var a=nui.get("startdate").getValue();
        	var b=nui.get("maxdatepicker").getValue();
        	if(b<a && b != ''){
        		alert("截止日期必须大于开始日期");
        		nui.get("maxdatepicker").setValue('');
        		return false;
        	}
		}
		
		function reset(){
			var form = new nui.Form("#queryform");
			form.reset();
			grid.load();
		}
		
		var data = [{id: 1,text: '未启动'},{id: 2,text: '运行'},{id: 3,text: '挂起'},{id: 7,text: '完成'},{id: 8,text: '终止'}];
		function getDict(e){
			for (var i = 0, l = data.length; i < l; i++) {
                var g = data[i];
                if (g.id == e.value) return g.text;
            }
            return "";
		}

		<%--var catalogdata=[{id:'采购管理',text: '采购管理'},{id: '合同管理',text: '合同管理'},{id: '项目管理',text: '项目管理'},{id: '费用管理',text: '费用管理'},{id: '客服售后',text: '客服售后'},{id: '资产管理',text: '资产管理'},{id: '收入核算',text: '收入核算'}];
	function getcatalogDict(e){
		
		for (var i = 0, l = catalogdata.length; i < l; i++) {
            var g = catalogdata[i];
            if (g.id == e.value) return g.text;
        }
        return "";
	}--%>
	
	function getDetail(e){
		var s = "";
        s = s + '<a class="dgBtn"  href="javascript: doOperate(' + e.rowIndex + ')">'+ e.value +'</a> ';      
        // s = s + '<a class="dgBtn"  href="javascript: doViewProc(' + e.rowIndex + ')">'+ e.value +'</a> ';      
        
        return s;
	}
	//任务类型
	var taskType = '<%=request.getParameter("taskType")%>'; 
    	//任务列表
    	var taskListDataGridObj = nui.get("workFlowSearchId"); 
		//执行操作
	    function doOperate(rowIndex) {
	    	var row = taskListDataGridObj.getRow(rowIndex);
	    	var url = contextPath + "/bps/wfclient/task/taskView.jsp";
	    	var title = "流程信息 ";
	    	var width=1000;
	    	
		    nui.open({
				url: url,
				title: title,
				width: width,
				height: 600,
				onload: function () {
					var iframe = this.getIFrameEl();
					if(iframe.contentWindow.initData) {
						iframe.contentWindow.initData(row);
					}	
				},
				ondestroy: function (action){
					if (action == "ok") {
						taskListDataGridObj.load();
					} 
				}
			});
	    }
	    //执行改派
	    function reassign(){
	    	var rows = grid.getSelecteds();
	    	if(rows.length==0){
	    		alert("请至少选中一条记录！");
	    		return;
	    	}
	    	if(rows.length>1){
	    		alert("只能选中一条记录！");
	    		return;
	    	}
	    	var row = grid.getSelected();
// 	    	var activityInstID = row.activityInstID;
// 	    	var countTemp = row.countTemp;//当前活动实例对应的工作项个数，对于多工作项的进行处理 4待领取  12完成 10运行
			if(row.countTemp>1){
		    	nui.open({
					url: "<%=request.getContextPath() %>/bps/wfclient/task/activityInstWorkItem.jsp",
				title: "指定工作项",
				width: 600,
				height: 300,
				onload: function () {
					var iframe = this.getIFrameEl();
					iframe.contentWindow.search(row.activityInstID);
				},
				ondestroy: function (action){
					if (action == "ok") {
						var iframe = this.getIFrameEl();
						var dataworkitem = iframe.contentWindow.GetData();
						dataworkitem = nui.clone(dataworkitem);
						nui.open({
							url: "<%=request.getContextPath() %>/ame_common/selectEmp.jsp",
							title: "指定改派人员",
							width: 400,
							height: 150,
							ondestroy: function (action){
								if (action == "ok") {
									var iframe1 = this.getIFrameEl();
									var data = iframe1.contentWindow.GetData();
									data = nui.clone(data);    //必须
									if (data.userid) {			//data.userid  data.empname catalogName currentActName
										var json = {workItemID:dataworkitem.workItemID ,personID:data.userid,catalogName:dataworkitem.catalogName, currentActName:dataworkitem.workItemName};
										nui.ajax({
								    		url: "org.gocom.bps.wfclient.task.business.task.reassign.biz.ext",
								            data: json,
								            type: 'POST',
								            cache: false,
								            showModal: false,
								            contentType: 'text/json',
								            success: function (o) {
								            	alert("改派成功！");
								            	taskListDataGridObj.reload();
								            },
								            error: function (jqXHR, textStatus, errorThrown) {
								                alert(jqXHR.responseText);
								            }
								    	});
									}else{
									}
								}
							}
						});
					}else{
						//不选工作项或者取消关闭页面
					}
				}
			});
		}else if (row.countTemp == 1){
	    	nui.open({
				url: "<%=request.getContextPath() %>/ame_common/selectEmp.jsp",
				title: "指定改派人员",
				width: 400,
				height: 150,
				ondestroy: function (action){
					if (action == "ok") {
						var iframe = this.getIFrameEl();
						var data = iframe.contentWindow.GetData();
						data = nui.clone(data);    //必须
						if (data.userid) {			//data.userid  data.empname
							var json = {workItemID:row.workItemID ,personID:data.userid,catalogName:row.catalogName, currentActName: row.currentActName};
							nui.ajax({
					    		url: "org.gocom.bps.wfclient.task.business.task.reassign.biz.ext",
					            data: json,
					            type: 'POST',
					            cache: false,
					            showModal: false,
					            contentType: 'text/json',
					            success: function (o) {
					            	alert("改派成功！");
					            	taskListDataGridObj.reload();
					            },
					            error: function (jqXHR, textStatus, errorThrown) {
					                alert(jqXHR.responseText);
					            }
					    	});
						}else{
						}
					}
				}
			});
		}
    }
   
</script>
</html>