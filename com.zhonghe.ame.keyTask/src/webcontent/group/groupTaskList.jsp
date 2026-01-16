<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<style type="text/css">
html,body {
	margin: 0;
	padding: 0;
	border: 0;
	width: 100%;
	height: 100%;
	overflow: hidden;
}

/* 强制长单词/字符自动断行 */
.mini-grid-cell-inner {
	word-wrap: break-word !important; /* 英文单词内断行 */
	word-break: break-all !important; /* 中文/英文强制断行 */
}
</style>
<head>
<title>集团重点任务管理</title>
</head>
<body>
	<div id="tabs" class="nui-tabs" activeIndex="0" style="width: auto; height: 99%; padding: 5px;" onactivechanged="tabActiveChanged">
		<div title="集团重点任务 - 列表">
			<div id="searchForm">
				<input name="criteria._expr[0]._property" value="secondaryOrg" class="nui-hidden" />
				<input name="criteria._expr[0]._op" value="in" class="nui-hidden" />
				<input id="searchOrgids" name="criteria._expr[0]._value" class="nui-hidden" />
				<div class="nui-toolbar" style="border-bottom: 0; padding: 5px;">
					<table>
						<tr>
							<td style="width: 70px; text-align: right;">任务年份：</td>
							<td>
								<input id="taskYear" name="criteria._expr[1].taskYear" class="nui-textbox" style="width: 100px" />
							</td>
							<td style="width: 70px; text-align: right;">任务名称：</td>
							<td>
								<input name="criteria._expr[2]._property" value="taskName" class="nui-hidden" />
								<input name="criteria._expr[2]._op" value="like" class="nui-hidden" />
								<input name="criteria._expr[2]._value" class="nui-textbox" style="width: 300px" />
							</td>
							<td style="width: 100px; text-align: right;">任务责任单位：</td>
							<td>
								<input id="secondaryOrg" name="criteria._expr[3].secondaryOrg" class="nui-combobox" textField="secOrgname" valueField="secOrg" style="width: 220px" showNullItem="true" />
							</td>
							<td>
								<a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查询</a>
								<a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset()">重置</a>
								<a class="nui-button" id="zdrwExport" iconCls="icon-download" onclick="zdrwExport()">导出</a>
							</td>
						</tr>
					</table>
				</div>
			</div>

			<div class="nui-toolbar" style="border-bottom: 0; padding: 5px;">
				<table style="width: 100%;">
					<tr>
						<td>
							<a class="nui-button" id="jtzdrw_cjrw" iconCls="icon-add" onclick="cjrw()">创建 - 任务</a>
							<a class="nui-button" id="jtzdrw_rwjhfj" iconCls="icon-edit" onclick="rwjhfj()">设置 - 任务分解计划</a>
							<a class="nui-button" id="jtzdrw_fqrwfjsb" iconCls="icon-downgrade" onclick="fqrwfjsb()">审批 - 发起任务分解申报流程</a>
							<a class="nui-button" id="jtzdrw_rwjz" iconCls="icon-edit" onclick="rwjz()">填报 - 任务进展(每月)</a>
							<a class="nui-button" id="jtzdrw_fqjzsh" iconCls="icon-downgrade" onclick="fqjzsh()">审批 - 发起进展审核流程</a>
							<a class="nui-button" id="jtzdrw_del" iconCls="icon-remove" onclick="delDatas()">删除</a>
							<a class="nui-button" id="jtzdrw_rwjhfj_wh" iconCls="icon-edit" onclick="rwjhfj_wh()">维护 - 任务及计划分解</a>
							<a class="nui-button" id="jtzdrw_rwjz_wh" iconCls="icon-edit" onclick="rwjz_wh()">维护 - 任务进展</a>
							<a class="nui-button" id="jtzdrw_cz_sbzt" iconCls="icon-edit" onclick="cz_sbzt()">重置 - 申报状态</a>
						</td>
					</tr>
				</table>
			</div>

			<div class="nui-fit">
				<div id="groupGrid" class="nui-datagrid" style="width: 100%; height: 100%;" showPager="false" allowCellSelect="true" enableHotTrack="false" allowRowSelect="false" allowCellWrap="true"
					url="com.zhonghe.ame.keyTask.group.queryTaskList.biz.ext" dataField="taskList">
					<div property="columns">
						<div field="taskYear" name="taskYear" width="60" align="center" headerAlign="center">任务年份</div>
						<div field="taskDomain" name="taskDomain" width="100" align="center" headerAlign="center">领域</div>
						<div field="taskName" name="taskName" width="200" align="left" headerAlign="center">任务名称</div>
						<div field="actionPlan" name="actionPlan" width="200" align="left" headerAlign="center">行动计划</div>
						<div field="measureStandard" name="measureStandard" width="200" align="left" headerAlign="center">衡量标准</div>
						<div field="secondaryOrgname" name="secondaryOrgname" width="150" align="center" headerAlign="center">任务责任单位</div>
						<div name="taskDetail" width="100" align="center" headerAlign="center" renderer="renderSecTask">任务明细</div>
						<div field="appStatus" name="appStatus" width="100" align="center" headerAlign="center" renderer="onActionRenderer">申报状态</div>
					</div>
				</div>
			</div>
		</div>

		<div name="jdtjDimTab" title="集团重点任务 - 按月统计" visible="false">
			<div id="jdtjForm">
				<div class="nui-toolbar" style="border-bottom: 0; padding: 5px;">
					<table>
						<tr>
							<td style="width: 70px; text-align: right;">任务年份：</td>
							<td>
								<input id="jdtjTaskYear" name="taskYear" class="nui-textbox" style="width: 100px" />
							</td>
							<td style="width: 70px; text-align: right;">任务月份：</td>
							<td>
								<input id="jdtjTaskMonth" name="taskMonth" class="nui-combobox" style="width: 100px" />
							</td>
							<td>
								<a class="nui-button" id="jdtjSearch" iconCls="icon-search" onclick="jdtjSearch()">查询</a>
								<a class="nui-button" id="jdtjReset" iconCls="icon-reload" onclick="jdtjReset()">重置</a>
								<a class="nui-button" id="jdtjExport" iconCls="icon-download" onclick="jdtjExport()">导出</a>
							</td>
						</tr>
					</table>
				</div>
			</div>

			<div class="nui-fit">
				<div id="jdtjGrid" showPager="false" align="center" class="nui-datagrid" style="width: 100%; height: 100%;" url="com.zhonghe.ame.keyTask.group.queryGroupJdtjDatas.biz.ext" dataField="jdtjDatas">
					<div property="columns">
						<div field="secOrgName" width="200" align="center" headerAlign="center">任务责任单位</div>
						<div field="taskCount" width="200" align="center" headerAlign="center">任务总数</div>
						<div field="normalProgressCount" width="200" align="center" headerAlign="center">其中：正常推进</div>
						<div field="certainRiskCount" width="200" align="center" headerAlign="center" renderer="renderCertainRisk">其中：一定风险</div>
						<div field="greatRiskCount" width="200" align="center" headerAlign="center" renderer="renderGreatRisk">其中：极大风险</div>
						<div field="normalPropulsionRate" width="200" align="center" headerAlign="center">正常推进率</div>
					</div>
				</div>
			</div>
		</div>

	</div>

	<form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
		<input type="hidden" name="_eosFlowAction" value="action0" filter="false" />
		<input type="hidden" name="downloadFile" filter="false" />
		<input type="hidden" name="fileName" filter="false" />
	</form>

	<script type="text/javascript">
		nui.parse();
		var searchForm = new nui.Form("#searchForm");
		var jdtjForm = new nui.Form("#jdtjForm");
		var groupGrid = nui.get("groupGrid");
		var jdtjGrid = nui.get("jdtjGrid");
		var tabs = nui.get("tabs");
		
		var monthDict = [ {
			id : "1",
			text : '1月'
		}, {
			id : "2",
			text : '2月'
		}, {
			id : "3",
			text : '3月'
		}, {
			id : "4",
			text : '4月'
		}, {
			id : "5",
			text : '5月'
		}, {
			id : "6",
			text : '6月'
		}, {
			id : "7",
			text : '7月'
		}, {
			id : "8",
			text : '8月'
		}, {
			id : "9",
			text : '9月'
		}, {
			id : "10",
			text : '10月'
		}, {
			id : "11",
			text : '11月'
		}, {
			id : "12",
			text : '12月'
		} ];		
		
		groupGrid.on("load", function() {
			groupGrid.mergeColumns([ "taskYear", "taskDomain", "taskName", "actionPlan","measureStandard" ]);
		});

		function tabActiveChanged(e) {
			if (e.tab.title == "集团重点任务 - 列表") {
				init();				
			}else if(e.tab.title == "集团重点任务 - 按月统计"){
				jdtjInit();
			}
		}

		function init() {
			var date = new Date();;
			var year = date.getFullYear();
			nui.get("taskYear").setValue(year);
			// 按钮权限
			if (userId != 'sysadmin') {
				getOpeatorButtonAuth("jtzdrw_cjrw,jtzdrw_fqrwfjsb,jtzdrw_fqjzsh,jtzdrw_del,jtzdrw_rwjhfj_wh,jtzdrw_rwjz_wh,jtzdrw_cz_sbzt");
			}
			var json = nui.encode({
				'loginUserId' : userId,
				'loginUserOrgId' : userOrgId,
				'authCode' : 'jtzdrw'
			});
			ajaxCommon({
				url : "com.zhonghe.ame.contractPact.statisticalReport.queryMonthlyBudgetTrackAuth.biz.ext",
				data : json,
				async : false,
				success : function(o) {
					if (o.result == "1") {
						initSecOrgCombobox(null);
						var jdtjDimTab = tabs.getTab("jdtjDimTab");
						tabs.updateTab(jdtjDimTab, {
							visible : true
						});
					} else {
						setSecOrg(userOrgId);
						initSecOrgCombobox(secOrgId);
					}
					search();
				}
			});
		}
		
		function setSecOrg(userOrgId) {
			var json = nui.encode({
				'userOrgId' : userOrgId
			});
			ajaxCommon({
				url : "com.primeton.eos.common.orgUtils.getSecOrg.biz.ext",
				data : json,
				async : false,
				success : function(result) {
					var data = result.data;
					secOrgId = data.ORGID;
				}
			});
		}
		
		function initSecOrgCombobox(secOrgId) {
			ajaxCommon({
				"url" : "com.zhonghe.ame.kaohe.common.getBusSecOrgList.biz.ext",
				contentType : 'text/json',
				async: false,
				success : function(result) {
					var datas = result.secOrgList;
					if(secOrgId != null){
						var orgIdSet = new Set(secOrgId.split(','));
						var filteredDatas = datas.filter(item => orgIdSet.has(item.secOrg));
						nui.get("secondaryOrg").setData(filteredDatas);
						nui.get("searchOrgids").setValue(secOrgId);
					}else{
						nui.get("secondaryOrg").setData(datas);
					}
				}
			});
		}
		
		function search() {
			var data = searchForm.getData();
			groupGrid.load(data);
		}
		
		function reset() {
			searchForm.reset();
			init();
		}
		
		function jdtjInit(){
			nui.get("jdtjTaskMonth").setData(monthDict);
			var date = new Date();
			var year = date.getFullYear();
			var month = date.getMonth() + 1;
			nui.get("jdtjTaskYear").setValue(year);
			nui.get("jdtjTaskMonth").setValue(month);
			jdtjSearch();				
		}
		
		function jdtjSearch(){
			jdtjGrid.load({
				'taskYear' : nui.get("jdtjTaskYear").getValue(),
				'taskMonth' : nui.get("jdtjTaskMonth").getValue()
			});
		}
		
		function jdtjReset() {
			jdtjForm.reset();
			jdtjInit();
		}				
		
		function cjrw(){
			nui.open({
				url : "/default/keyTask/group/addTask.jsp",
				width : "700",
				height : "450",
				allowResize : false,
				title : "创建 - 任务",
				onload : function() {
					var iframe = this.getIFrameEl();
				},
				ondestroy : function(action) {
					search();
				}
			});
		}
		
		function rwjhfj(){
			var cellData = groupGrid.getCurrentCell();
			if (cellData == null) {
				showTips("请选中【任务责任单位】列对应的单元格后执行操作！", "danger");
				return;
			} else if (cellData[1].field != "secondaryOrgname") {
				showTips("请选中【任务责任单位】列对应的单元格后执行操作！", "danger");
				return;
			}
			if(cellData[0].appStatus == null){
				nui.open({
					url : "/default/keyTask/group/configTaskItem.jsp",
					width : "1200px",
					height : "750px",
					allowResize : false,
					title : "设置 - 任务分解计划",
					onload : function() {
						var iframe = this.getIFrameEl();
						iframe.contentWindow.initData(cellData[0]);
					}
				});				
			}else{
				showTips("只有【申报状态】为【未申报】时，才可以执行该操作！", "danger");
			}			
		}
		
		function fqrwfjsb(){
			var cellData = groupGrid.getCurrentCell();
			if (cellData == null) {
				showTips("请选中【任务责任单位】列对应的单元格后执行操作！", "danger");
				return;
			} else if (cellData[1].field != "secondaryOrgname") {
				showTips("请选中【任务责任单位】列对应的单元格后执行操作！", "danger");
				return;
			}
			if(cellData[0].appStatus == null){
				var json = nui.encode({
					'id' : cellData[0].id
				});
				ajaxCommon({
					"url" : "com.zhonghe.ame.keyTask.group.getGroupTaskItem.biz.ext",
					data : json,
					success : function(data) {
						var itemDatas = data.itemList;
						if(itemDatas.length == 0){
							showTips("未设置任务分解计划，请先通过【设置 - 任务分解计划】进行设置！", "danger");
							return;
						}else{
							if (confirm("确定要对选中的记录执行【审批 - 发起任务分解申报流程】操作吗？")) {
								var json = nui.encode({
									'id' : cellData[0].id
								});
								ajaxCommon({
									"url" : "com.zhonghe.ame.keyTask.group.launchGroupTaskDeclare.biz.ext",
									data : json,
									success : function(data) {
										if(data.result == "1"){
											showTips("发起任务申报流程成功");
											search();
										}else{
											showTips("发起任务分解申报流程失败，请联系管理员！", "danger");
										}
									}
								});
							}else{
								return;
							}
						}
					}
				});
			}else{
				showTips("只有【申报状态】为【未申报】时，才可以执行该操作！", "danger");
			}
		}
		
		function rwjz(){
			var cellData = groupGrid.getCurrentCell();
			if (cellData == null) {
				showTips("请选中【任务责任单位】列对应的单元格后执行操作！", "danger");
				return;
			} else if (cellData[1].field != "secondaryOrgname") {
				showTips("请选中【任务责任单位】列对应的单元格后执行操作！", "danger");
				return;
			}
			if(cellData[0].appStatus == 2){
				nui.open({
					url : "/default/keyTask/group/configTaskItemProgress.jsp",
					width : "1200px",
					height : "800px",
					allowResize : false,
					title : "填报 - 任务进展(每月)",
					onload : function() {
						var iframe = this.getIFrameEl();
						iframe.contentWindow.initData(cellData[0]);
					}
				});				
			}else{
				showTips("只有【申报状态】为【审批通过】时，才可以执行该操作！", "danger");
			}			
		}
		
		
		function onActionRenderer(e){
			var row = e.record;
			if(e.value == null){
				return '未申报';
			}else{
				return '<a href="javascript:void(0)" onclick="flowView(\'' + row.processId + '\')">' + nui.getDictText('ZH_FLOW_TYPE', e.value) + '</a>';
			}			
		}
		
		function flowView(processId) {
			var url = "/default/bps/wfclient/task/processinstView.jsp";
			var title = "流程图查看";
			var width = 1000;
			nui.open({
				url : url,
				title : title,
				width : "1200",
				height : "800",
				onload : function() {
					var iframe = this.getIFrameEl();
					if (iframe.contentWindow.initData) {
						iframe.contentWindow.initData({
							"processInstID" : processId
						});
					}
				}
			});
		}
		
		function renderSecTask(e){
			var row = e.record;
			return '<a href="javascript:void(0)" onclick="taskSecItemDetails(\'' + row.id + '\')">详情</a>';
		}
		
		function taskSecItemDetails(id){
			var executeUrl = "/default/keyTask/group/taskSecItemDetailsView.jsp?id=" + id;
			window.open(executeUrl);
		}
		
		function fqjzsh(){
			var json = nui.encode({
				'userOrgId' : userOrgId
			});
			ajaxCommon({
				url : "com.primeton.eos.common.orgUtils.getSecOrg.biz.ext",
				data : json,
				async : false,
				success : function(result) {
					var secOrg = result.data.ORGID;
					var secOrgName = result.data.ORGNAME;
					var taskYear = nui.get("taskYear").getValue();
					nui.open({
						url : "/default/keyTask/group/GroupTaskItemApproval.jsp",
						width : "1200",
						height : "700",
						allowResize : false,
						title : "审批 - 发起任务进展审核流程",
						onload : function() {
							var iframe = this.getIFrameEl();
							 iframe.contentWindow.initData(taskYear,secOrg,secOrgName); 
						}
					});					
				}
			});		
		}
		
		function delDatas(){
			var cellData = groupGrid.getCurrentCell();
			if (cellData == null) {
				showTips("请选中【任务责任单位】列对应的单元格后执行操作！", "danger");
				return;
			} else if (cellData[1].field != "secondaryOrgname") {
				showTips("请选中【任务责任单位】列对应的单元格后执行操作！", "danger");
				return;
			}
			if (confirm("确定要删除选中的数据吗，一旦删除无法找回？")) {
				var json = nui.encode({
					'id' : cellData[0].id
				});
				ajaxCommon({
					url : "com.zhonghe.ame.keyTask.group.deleteGroupTask.biz.ext",
					data : json,
					async : false,
					success : function(data) {
						if(data.result == "1"){
							showTips("数据删除成功");
							search();
						}
					}
				});
			}else{
				return;
			}			
		}
		
		function rwjhfj_wh(){
			var cellData = groupGrid.getCurrentCell();
			if (cellData == null) {
				showTips("请选中【任务责任单位】列对应的单元格后执行操作！", "danger");
				return;
			} else if (cellData[1].field != "secondaryOrgname") {
				showTips("请选中【任务责任单位】列对应的单元格后执行操作！", "danger");
				return;
			}
			nui.open({
				url : "/default/keyTask/group/whConfigTaskItem.jsp",
				width : "1200px",
				height : "750px",
				allowResize : false,
				title : "维护 - 任务及计划分解",
				onload : function() {
					var iframe = this.getIFrameEl();
					iframe.contentWindow.initData(cellData[0]);
				},
				ondestroy : function(action) {
					if (action == "ok") {
						search();
					}
				}
			});							
		}
		
		function rwjz_wh(){
			var cellData = groupGrid.getCurrentCell();
			if (cellData == null) {
				showTips("请选中【任务责任单位】列对应的单元格后执行操作！", "danger");
				return;
			} else if (cellData[1].field != "secondaryOrgname") {
				showTips("请选中【任务责任单位】列对应的单元格后执行操作！", "danger");
				return;
			}
			nui.open({
				url : "/default/keyTask/group/whGroupTaskItemProgress.jsp",
				width : "1200px",
				height : "800px",
				allowResize : false,
				title : "维护 - 任务进展",
				onload : function() {
					var iframe = this.getIFrameEl();
					iframe.contentWindow.initData(cellData[0].id);
				}
			});						
		}
		
		function cz_sbzt(){
			var cellData = groupGrid.getCurrentCell();
			if (cellData == null) {
				showTips("请选中【任务责任单位】列对应的单元格后执行操作！", "danger");
				return;
			} else if (cellData[1].field != "secondaryOrgname") {
				showTips("请选中【任务责任单位】列对应的单元格后执行操作！", "danger");
				return;
			}
			if(cellData[0].appStatus == 2 || cellData[0].appStatus == 4){
				var json = nui.encode({
					'mainId' : cellData[0].id
				});
				ajaxCommon({
					url : "com.zhonghe.ame.keyTask.group.countGroupTaskItemAppStatusFinish.biz.ext",
					data : json,
					async : false,
					success : function(data) {
						if(data.count > 0){
							showTips("已经存在有任务进展执行了审核流程，因此无法执行该操作", "danger");
						}else{
							if (confirm("确定要重置选中数据的申报状态吗？")) {
								ajaxCommon({
									url : "com.zhonghe.ame.keyTask.group.resetGroupTaskAppStatus.biz.ext",
									data : json,
									async : false,
									success : function(data) {
										if(data.result){
											showTips("重置申报状态成功");
											search();
										}else{
											showTips("重置申报状态成功失败，请联系管理员！", "danger");
										}
									}
								});					
							}else{
								return;
							}								
						}
					}
				});
			}else{
				showTips("只有【申报状态】为【审批通过】或【作废】时，才可以执行该操作！", "danger");
			}
									
		}		
		
		function zdrwExport(){
			var data = searchForm.getData();
			exportExcel({
				"data" : data,
				"url" : "com.zhonghe.ame.keyTask.group.exportGroupTaskExcel.biz.ext",
				"fileName" : "集团重点任务"
			})			
		}
		
		function renderCertainRisk(e){
			if(e.value > 0){
				e.cellStyle = "background-color: #feffe6";
				var row = e.record;
				return '<a href="javascript:void(0)" onclick="jdtjCertainRiskDetails(' + row.secOrgCode + ','+row.taskYear+','+row.taskMonth+',\'' + row.secOrgName + '\')">'+e.value+'</a>';
			}
			return e.value;
		}
		
		function renderGreatRisk(e){
			if(e.value > 0){
				e.cellStyle = "background-color: #fff1f0";
				var row = e.record;
				return '<a href="javascript:void(0)" onclick="jdtjGreatRiskDetails(' + row.secOrgCode + ','+row.taskYear+','+row.taskMonth+',\'' + row.secOrgName + '\')">'+e.value+'</a>';
			}
			return e.value;			
		}
		
		function jdtjCertainRiskDetails(secOrgCode,taskYear,taskMonth,secOrgName){
			var executeUrl = "<%=request.getContextPath()%>/keyTask/group/GroupJdtjDetailsView.jsp?secOrgCode="+secOrgCode+"&secOrgName="+secOrgName+"&taskYear="+taskYear+"&taskMonth="+taskMonth+"&type=certainRisk";
			window.open(executeUrl);
		}
		
		function jdtjGreatRiskDetails(secOrgCode,taskYear,taskMonth,secOrgName){
			var executeUrl = "<%=request.getContextPath()%>/keyTask/group/GroupJdtjDetailsView.jsp?secOrgCode="+secOrgCode+"&secOrgName="+secOrgName+"&taskYear="+taskYear+"&taskMonth="+taskMonth+"&type=greatRisk";
			window.open(executeUrl);
		}
		
		function jdtjExport(){
			var data = jdtjForm.getData();
			exportExcel({
				"data" : data,
				"url" : "com.zhonghe.ame.keyTask.group.exportGroupJdtjExcel.biz.ext",
				"fileName" : "集团重点任务-按月统计"
			})
		}														
																					
	</script>

</body>
</html>