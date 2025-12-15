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
<title>审批 - 发起任务进展审核流程</title>
</head>
<body>
	<div class="nui-fit" style="padding: 5px;">
		<div>
			<form id="searchForm" method="post">
				<table style="table-layout: fixed;">
					<tr>
						<td align="right" style="width: 70px">任务年份：</td>
						<td>
							<input id="taskYear" class="nui-textbox" style="width: 100px" readonly="readonly" />
						</td>
						<td align="right" style="width: 90px">任务责任单位：</td>
						<td>
							<input id="secondaryOrg" class="nui-hidden" />
							<input id="secondaryOrgname" class="nui-textbox" style="width: 200px" readonly="readonly" />
						</td>
						<td align="right" style="width: 70px">填报月份：</td>
						<td>
							<input id="fillMonth" class="nui-combobox" style="width: 100px" />
						</td>
						<td>
							<a class="nui-button" id="search" iconCls="icon-search" onclick="searchItem()">查询</a>
							<a class="nui-button" id="reset" iconCls="icon-reload" onclick="resetItem()">重置</a>
						</td>
					</tr>
				</table>
			</form>
		</div>
		<p>
		<fieldset id="field1" style="border: solid 1px #aaa; padding: 5px;">
			<legend style="color: red">只展现已填写任务进度情况，但未发起审核流程的数据，补充说明：选择时注意检查(避免多/误/少选)，一旦提交后，无法撤回！</legend>
			<div style="width: 99%; margin: 0 auto;">
				<div id="itemGrid" class="nui-datagrid" style="width: 100%; height: auto;" showPager="false" multiSelect="true" onlyCheckSelection="true"
					url="com.zhonghe.ame.keyTask.group.queryGroupTaskItemList.biz.ext" dataField="itemDatas">
					<div property="columns">
						<div type="checkcolumn"></div>
						<div field="task_name" width="250" align="center" headerAlign="center">任务名称</div>
						<div field="action_plan" width="450" headeralign="center" align="left">行动计划</div>
						<div field="fill_month" width="50" headeralign="center" align="center" renderer="renderMonth">填报月份</div>
						<div field="task_status" width="50" headeralign="center" align="center">任务状态</div>
						<div field="risk_status" width="70" headeralign="center" align="center">是否存在风险</div>
						<div width="40" headeralign="center" align="center" renderer="renderOperate">操作</div>
					</div>
				</div>
			</div>
		</fieldset>
	</div>

	<div style="text-align: center; padding-top: 5px; padding-bottom: 10px; margin-bottom: 1px" class="nui-toolbar">
		<a id="saveBtn" class="nui-button" onclick="save()" style="width: 120px; margin-right: 20px;" iconCls="icon-save">提交审核流程</a>
		<a id="closeBtn" class="nui-button" onclick="closeCancel()" style="width: 60px;" iconCls="icon-close">关闭</a>
	</div>

	<script type="text/javascript">
		nui.parse();
		var searchForm = new nui.Form("#searchForm");
		var itemGrid = nui.get("itemGrid");

		function initData(taskYear, secOrg, secOrgName) {
			nui.get("taskYear").setValue(taskYear);
			nui.get("secondaryOrg").setValue(secOrg);
			nui.get("secondaryOrgname").setValue(secOrgName);
			nui.get("fillMonth").setData(monthDict);
			searchItem();
		}

		function searchItem() {
			itemGrid.load({
				"taskYear" : nui.get("taskYear").getValue(),
				"secondaryOrg" : nui.get("secondaryOrg").getValue(),
				"fillMonth" : nui.get("fillMonth").getValue()
			});
		}

		function resetItem() {
			nui.get("fillMonth").setValue(null);
			searchItem();
		}

		function renderMonth(e) {
			if (e.value != null && e.value != "") {
				return e.value + "月";
			}
		}

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

		function renderOperate(e) {
			var row = e.record;
			return '<a href="javascript:void(0)" onclick="progressDetails(\'' + row.id + '\',\'' + row.main_id + '\')">详情</a>';
		}

		function progressDetails(id,mainId) {
			nui.open({
				url : "/default/keyTask/group/GroupTaskItemApprovalView.jsp",
				title : "任务 - 进展情况 - 详情",
				width : "1200",
				height : "800",
				allowResize : false,
				onload : function() {
					var iframe = this.getIFrameEl();
					iframe.contentWindow.initData(id,mainId);
				}
			});
		}
	
		function save() {
			var rows = itemGrid.getSelecteds();
			if (rows.length == 0) {
				showTips("请先选择要提交审核的数据(支持多选)！", "danger");
			} else {
				if (confirm("确定要对选中的记录执行【提交审核流程】操作吗？")) {
					nui.get("saveBtn").disable();
					nui.mask({
						el : document.body,
						cls : 'mini-mask-loading',
						html : '表单提交中...'
					});
					var json = nui.encode({
						"taskItems" : rows
					});
					ajaxCommon({
						"url" : "com.zhonghe.ame.keyTask.group.launchGroupTaskItemDeclare.biz.ext",
						data : json,
						success : function(data) {
							if (data.result == "1") {
								nui.unmask(document.body);
								showTips("提交审核流程成功");
								closeOk();
							} else {
								nui.get("saveBtn").enable();
								showTips("提交审核流程失败，请联系管理员！", "danger");
							}
						}
					});
				} else {
					return;
				}
			}
		}		
		
	</script>

</body>
</html>