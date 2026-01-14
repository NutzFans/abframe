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

.mini-grid-cell-nowrap {
	white-space: nowrap;
}
</style>
<head>
<title>公司重点任务管理</title>
</head>
<body>
	<div id="tabs" class="nui-tabs" activeIndex="0" style="width: auto; height: 99%; padding: 5px;" onactivechanged="tabActiveChanged">
		<div title="公司重点任务 - 列表">
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
							<td style="width: 100px; text-align: right;">任务责任单位：</td>
							<td>
								<input id="secondaryOrg" name="criteria._expr[2].secondaryOrg" class="nui-combobox" textField="secOrgname" valueField="secOrg" style="width: 220px" showNullItem="true" />
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
							<a class="nui-button" id="gszdrw_rwzrdw" iconCls="icon-add" onclick="rwzrdw()">创建 - 任务责任单位</a>
							<a class="nui-button" id="gszdrw_rwjhfj" iconCls="icon-edit" onclick="rwjhfj()">设置 - 任务及计划分解</a>
							<a class="nui-button" id="gszdrw_fqrwsb" iconCls="icon-downgrade" onclick="fqrwsb()">审批 - 发起任务申报流程</a>
							<a class="nui-button" id="gszdrw_rwjz" iconCls="icon-edit" onclick="rwjz()">填报 - 任务进展</a>
							<a class="nui-button" id="gszdrw_fqjzsh" iconCls="icon-downgrade" onclick="fqjzsh()">审批 - 发起进展审核流程</a>
							<a class="nui-button" id="gszdrw_del" iconCls="icon-remove" onclick="delDatas()">删除</a>
							<a class="nui-button" id="gszdrw_rwjhfj_wh" iconCls="icon-edit" onclick="rwjhfj_wh()">维护 - 任务及计划分解</a>
							<a class="nui-button" id="gszdrw_rwjz_wh" iconCls="icon-edit" onclick="rwjz_wh()">维护 - 任务进展</a>
							<a class="nui-button" id="gszdrw_cz_sbzt" iconCls="icon-edit" onclick="cz_sbzt()">重置 - 申报状态</a>
						</td>
					</tr>
				</table>
			</div>

			<div class="nui-fit">
				<div id="companyGrid" sizeList="[50,100]" showPager="true" pageSize="50" align="center" class="nui-datagrid" style="width: 100%; height: 100%;"
					url="com.zhonghe.ame.keyTask.company.queryCompanyTaskList.biz.ext" dataField="companyList">
					<div property="columns">
						<div type="checkcolumn"></div>
						<div field="secondaryOrgname" width="200" align="center" headerAlign="center">任务责任单位</div>
						<div field="taskYear" width="80" align="center" headerAlign="center">任务年份</div>
						<div width="100" headerAlign="center" align="center" renderer="renderTask">任务明细</div>
						<div field="appStatus" width="100" align="center" headerAlign="center" renderer="onActionRenderer">申报状态</div>
					</div>
				</div>
			</div>
		</div>

		<div name="jdtjDimTab" title="公司重点任务 - 季度统计" visible="false">
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
				<div id="jdtjGrid" showPager="false" align="center" class="nui-datagrid" style="width: 100%; height: 100%;" url="com.zhonghe.ame.keyTask.company.queryJdtjDatas.biz.ext" dataField="jdtjDatas">
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

		<div name="ndtjDimTab" title="公司重点任务 - 年度统计" visible="false">
			<div id="ndtjForm">
				<div class="nui-toolbar" style="border-bottom: 0; padding: 5px;">
					<table>
						<tr>
							<td style="width: 70px; text-align: right;">任务年份：</td>
							<td>
								<input id="ndtjTaskYear" name="taskYear" class="nui-textbox" style="width: 100px" />
							</td>
							<td>
								<a class="nui-button" id="ndtjSearch" iconCls="icon-search" onclick="ndtjSearch()">查询</a>
								<a class="nui-button" id="ndtjReset" iconCls="icon-reload" onclick="ndtjReset()">重置</a>
								<a class="nui-button" id="ndtjExport" iconCls="icon-download" onclick="ndtjExport()">导出</a>
							</td>
						</tr>
					</table>
				</div>
			</div>

			<div class="nui-fit">
				<div id="ndtjGrid" showPager="false" align="center" class="nui-datagrid" style="width: 100%; height: 100%;" allowCellSelect="true" enableHotTrack="false" allowRowSelect="false">
					<div property="columns">
						<div field="secOrgName" width="200" align="center" headerAlign="center">任务责任单位</div>
						<div field="taskCount" width="150" align="center" headerAlign="center">重点任务数</div>
						<div field="taskCountCompletedOnTime" width="150" align="center" headerAlign="center">按时完成任务数</div>
						<div field="taskCountNotCompletedOnTime" width="150" align="center" headerAlign="center" renderer="renderTaskCountNotCompletedOnTime">未按时完成任务数</div>
						<div header="未完成任务情况" headerAlign="center" align="center">
							<div property="columns">
								<div field="numberOfDecompositionPlans" width="150" align="center" headerAlign="center">分解计划数</div>
								<div field="numberOfUnfinishedPlans" width="150" align="center" headerAlign="center">未完成计划数</div>
								<div field="toCompleteTheProportionOfThePlan" width="150" align="center" headerAlign="center">已完成计划比例</div>
							</div>
						</div>
						<div field="totalProportion" width="150" align="center" headerAlign="center">已完成任务总比例</div>
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
		var ndtjForm = new nui.Form("#ndtjForm");
		var companyGrid = nui.get("companyGrid");
		var jdtjGrid = nui.get("jdtjGrid");
		var ndtjGrid = nui.get("ndtjGrid");
		var tabs = nui.get("tabs");
		var mergeConfig;
		
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
		
		function tabActiveChanged(e) {
			if (e.tab.title == "公司重点任务 - 列表") {
				init();				
			}else if(e.tab.title == "公司重点任务 - 季度统计"){
				jdtjInit();
			}else if(e.tab.title == "公司重点任务 - 年度统计"){
				ndtjInit();
			}
		}					

		function init() {
			var date = new Date();
			var year = date.getFullYear();
			var month = date.getMonth() + 1;
			nui.get("taskYear").setValue(year);
			// 按钮权限
			if (userId != 'sysadmin') {
				getOpeatorButtonAuth("gszdrw_rwzrdw,gszdrw_fqrwsb,gszdrw_fqjzsh,gszdrw_del,gszdrw_rwjhfj_wh,gszdrw_rwjz_wh,gszdrw_cz_sbzt");
			}
			var json = nui.encode({
				'loginUserId' : userId,
				'loginUserOrgId' : userOrgId,
				'authCode' : 'gszdrw'
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
						var ndtjDimTab = tabs.getTab("ndtjDimTab");
						tabs.updateTab(ndtjDimTab, {
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
			companyGrid.sortBy("createTime", "desc");
			companyGrid.load(data);
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
		
		function ndtjInit(){
			var date = new Date();
			var year = date.getFullYear();
			nui.get("ndtjTaskYear").setValue(year);
			ndtjSearch();			
		}
		
		function ndtjSearch(){
			var json = nui.encode({
				'taskYear' : nui.get("ndtjTaskYear").getValue()
			});
			ajaxCommon({
				"url" : "com.zhonghe.ame.keyTask.company.queryNdtjDatas.biz.ext",
				data : json,
				success : function(data) {
					ndtjGrid.setData(data.mapData.ndtjDatas);
					ndtjGrid.mergeCells(data.mapData.mergeConfig);
				}
			});						
		}
		
		function ndtjReset(){
			ndtjForm.reset();
			ndtjInit();			
		}				
		
		function rwzrdw(){
			nui.open({
				url : "/default/keyTask/company/addRwzrdw.jsp",
				width : "450",
				height : "300",
				allowResize : false,
				title : "生成 - 任务责任单位",
				onload : function() {
					var iframe = this.getIFrameEl();
				},
				ondestroy : function(action) {
					search();
				}
			});
		}
		
		function rwjhfj(){
			var row = companyGrid.getSelected();
			if (row == undefined) {
				showTips("请选中一条数据后再操作！", "danger");
			}else{
				if(row.appStatus == null){
					nui.open({
						url : "/default/keyTask/company/configTaskItem.jsp",
						width : "100%",
						height : "100%",
						allowResize : false,
						title : "设置 - 任务及计划分解",
						onload : function() {
							var iframe = this.getIFrameEl();
							 iframe.contentWindow.initData(row); 
						}
					});					
				}else{
					showTips("只有【申报状态】为【未申报】时，才可以执行该操作！", "danger");
				}
			}			
		}
		
		function rwjhfj_wh(){
			var row = companyGrid.getSelected();
			if (row == undefined) {
				showTips("请选中一条数据后再操作！", "danger");
			}else{
				nui.open({
					url : "/default/keyTask/company/configTaskItem.jsp",
					width : "100%",
					height : "100%",
					allowResize : false,
					title : "维护 - 任务及计划分解",
					onload : function() {
						var iframe = this.getIFrameEl();
						iframe.contentWindow.initData(row); 
					}
				});
			}			
		}		
		
		function fqrwsb(){
			var row = companyGrid.getSelected();
			if (row == undefined) {
				showTips("请选中一条数据后再操作！", "danger");
			}else{
				if(row.appStatus == null){
					var json = nui.encode({
						'mainId' : row.id
					});
					ajaxCommon({
						"url" : "com.zhonghe.ame.keyTask.company.queryItemListByMainId.biz.ext",
						data : json,
						success : function(data) {
							var itemDatas = data.itemDatas;
							if(itemDatas.length == 0){
								showTips("未设置任务及计划分解，请先通过【设置 - 任务及计划分解】进行设置！", "danger");
								return;
							}else{
								if (confirm("确定要对选中的记录执行【审批 - 发起任务申报流程】操作吗？")) {
									var json = nui.encode({
										'id' : row.id
									});
									ajaxCommon({
										"url" : "com.zhonghe.ame.keyTask.company.launchTaskDeclare.biz.ext",
										data : json,
										success : function(data) {
											if(data.result == "1"){
												showTips("发起任务申报流程成功");
												search();
											}else{
												showTips("发起任务申报流程失败，请联系管理员！", "danger");
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
		}
		
		function onActionRenderer(e){
			if(e.value == null){
				return '未申报';
			}else{
				return "<a  href='javascript:void(0)' onclick='flowView();' >" + nui.getDictText('ZH_FLOW_TYPE', e.value) + "</a>";
			}			
		}				
		
		function flowView(){
			var selectRow = companyGrid.getSelected();
			var processId = selectRow.processId;
			var url = "/default/bps/wfclient/task/processinstView.jsp";
			var title = "流程图查看";
			var width = 1000;
			nui.open({
				url : url,
				title : title,
				width : "100%",
				height : "100%",
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
		
		function rwjz(){
			var row = companyGrid.getSelected();
			if (row == undefined) {
				showTips("请选中一条数据后再操作！", "danger");
			}else{
				if(row.appStatus == 2){
					nui.open({
						url : "/default/keyTask/company/configTaskItemProgress.jsp",
						width : "100%",
						height : "100%",
						allowResize : false,
						title : "填报 - 任务进展",
						onload : function() {
							var iframe = this.getIFrameEl();
							 iframe.contentWindow.initData(row); 
						}
					});	
				}else{
					showTips("只有【申报状态】为【审批通过】时，才可以执行该操作！", "danger");
				}
			}			
		}
		
		function rwjz_wh(){
			var row = companyGrid.getSelected();
			if (row == undefined) {
				showTips("请选中一条数据后再操作！", "danger");
			}else{
				if(row.appStatus == 2){
					nui.open({
						url : "/default/keyTask/company/whTaskItemProgress.jsp",
						width : "100%",
						height : "100%",
						allowResize : false,
						title : "维护 - 任务进展",
						onload : function() {
							var iframe = this.getIFrameEl();
							 iframe.contentWindow.initData(row); 
						}
					});	
				}else{
					showTips("只有【申报状态】为【审批通过】时，才可以执行该操作！", "danger");
				}
			}			
		}
		
		function cz_sbzt(){
			var row = companyGrid.getSelected();
			if (row == undefined) {
				showTips("请选中一条数据后再操作！", "danger");
			}else{
				if(row.appStatus == 2 || row.appStatus == 4){
					var json = nui.encode({
						'mainId' : row.id
					});
					ajaxCommon({
						url : "com.zhonghe.ame.keyTask.company.countTaskItemAppStatusFinish.biz.ext",
						data : json,
						async : false,
						success : function(data) {
							if(data.count > 0){
								showTips("已经存在有任务进展执行了审核流程，因此无法执行该操作", "danger");
							}else{
								if (confirm("确定要重置选中数据的申报状态吗？")) {
									ajaxCommon({
										url : "com.zhonghe.ame.keyTask.company.resetTaskAppStatus.biz.ext",
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
		}		
		
		function fqjzsh(){
			var row = companyGrid.getSelected();
			if (row == undefined) {
				showTips("请选中一条数据后再操作！", "danger");
			}else{
				if(row.appStatus == 2){
					nui.open({
						url : "/default/keyTask/company/taskItemApproval.jsp",
						width : "1200",
						height : "600",
						allowResize : false,
						title : "审批 - 发起任务进展审核流程",
						onload : function() {
							var iframe = this.getIFrameEl();
							 iframe.contentWindow.initData(row); 
						}
					});				
				}else{
					showTips("只有【申报状态】为【审批通过】时，才可以执行该操作！", "danger");
				}
			}
		}
		
		function renderTask(e){
			var row = e.record;
			return '<a href="javascript:void(0)" onclick="taskItemDetails(\'' + row.id + '\')">详情</a>';
		}
		
		function taskItemDetails(id){
			var executeUrl = "<%=request.getContextPath()%>/keyTask/company/taskItemDetailsView.jsp?id=" + id;
			window.open(executeUrl);
		}
		
		function delDatas(){
			var row = companyGrid.getSelected();
			if (row == undefined) {
				showTips("请选中一条数据后再操作！", "danger");
			}else{
				if (confirm("确定要删除选中的数据吗，一旦删除无法找回？")) {
					var json = nui.encode({
						'id' : row.id
					});
					ajaxCommon({
						url : "com.zhonghe.ame.keyTask.company.deleteCompanyTask.biz.ext",
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
		}
		
		function zdrwExport(){
			var data = searchForm.getData();
			exportExcel({
				"data" : data,
				"url" : "com.zhonghe.ame.keyTask.company.exportCompanyTaskExcel.biz.ext",
				"fileName" : "公司重点任务"
			})
		}
		
		function renderCertainRisk(e){
			if(e.value > 0){
				e.cellStyle = "background-color: #feffe6";
				var row = e.record;
				return '<a href="javascript:void(0)" onclick="jdtjCertainRiskDetails(\'' + row.id + '\','+row.taskYear+','+row.taskMonth+')">'+e.value+'</a>';
			}
			return e.value;
		}
		
		function renderGreatRisk(e){
			if(e.value > 0){
				e.cellStyle = "background-color: #fff1f0";
				var row = e.record;
				return '<a href="javascript:void(0)" onclick="jdtjGreatRiskDetails(\'' + row.id + '\','+row.taskYear+','+row.taskMonth+')">'+e.value+'</a>';
			}
			return e.value;			
		}
		
		function renderTaskCountNotCompletedOnTime(e){
			if(e.value > 0){
				e.cellStyle = "background-color: #fff1f0";
				var row = e.record;
				return '<a href="javascript:void(0)" onclick="ndtjTaskCountNotCompletedOnTimeDetails(\'' + row.mainId + '\')">'+e.value+'</a>';
			}
			return e.value;			
		}		
		
		function jdtjCertainRiskDetails(id,taskYear,taskMonth){
			var executeUrl = "<%=request.getContextPath()%>/keyTask/company/jdtjDetailsView.jsp?id="+id+"&taskYear="+taskYear+"&taskMonth="+taskMonth+"&type=certainRisk";
			window.open(executeUrl);
		}
		
		function jdtjGreatRiskDetails(id,taskYear,taskMonth){
			var executeUrl = "<%=request.getContextPath()%>/keyTask/company/jdtjDetailsView.jsp?id="+id+"&taskYear="+taskYear+"&taskMonth="+taskMonth+"&type=greatRisk";
			window.open(executeUrl);
		}
		
		function ndtjTaskCountNotCompletedOnTimeDetails(mainId){
			var executeUrl = "<%=request.getContextPath()%>/keyTask/company/ndtjDetailsView.jsp?mainId="+mainId;
			window.open(executeUrl);
		}
		
		function jdtjExport(){
			var data = jdtjForm.getData();
			exportExcel({
				"data" : data,
				"url" : "com.zhonghe.ame.keyTask.company.exportJdtjExcel.biz.ext",
				"fileName" : "公司重点任务-季度统计"
			})
		}
		
		function ndtjExport(){
			var data = ndtjForm.getData();
			exportExcel({
				"data" : data,
				"url" : "com.zhonghe.ame.keyTask.company.exportNdtjExcel.biz.ext",
				"fileName" : "公司重点任务-年度统计"
			})
		}								
		
	</script>

</body>
</html>