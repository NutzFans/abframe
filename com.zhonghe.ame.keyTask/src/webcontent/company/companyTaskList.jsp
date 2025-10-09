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
	<div style="width: auto; height: 99%; padding: 5px;">
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

	<script type="text/javascript">
		nui.parse();
		var searchForm = new nui.Form("#searchForm");
		var companyGrid = nui.get("companyGrid");

		init();

		function init() {
			var date = new Date();
			date.setMonth(date.getMonth() - 1);
			var year = date.getFullYear();
			nui.get("taskYear").setValue(year);
			// 按钮权限
			if (userId != 'sysadmin') {
				getOpeatorButtonAuth("gszdrw_rwzrdw");
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
		
	</script>

</body>
</html>