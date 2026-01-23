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

.mini-grid-summaryCell {
	text-align: center;
}
</style>
<head>
<title>虚拟产值申报</title>
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
						<td style="width: 60px; text-align: right;">年份：</td>
						<td style="width: 155px">
							<input id="createYear" name="criteria._expr[1].createYear" class="nui-textbox" style="width: 150px" />
						</td>
						<td style="width: 60px; text-align: right;">申请人：</td>
						<td style="width: 155px">
							<input name="criteria._expr[2].createUsername" class="nui-textbox" style="width: 150px" />
						</td>
						<td style="width: 60px; text-align: right;">申请单位：</td>
						<td style="width: 155px">
							<input id="secondaryOrg" name="criteria._expr[3].secondaryOrg" class="nui-combobox" textField="secOrgname" valueField="secOrg" style="width: 150px" showNullItem="true" />
						</td>
						<td style="width: 60px; text-align: right;">申请事项：</td>
						<td style="width: 205px">
							<input name="criteria._expr[4]._value" class="nui-textbox" style="width: 200px" />
							<input class="nui-hidden" name="criteria._expr[4]._property" value="declareMatter" />
							<input class="nui-hidden" name="criteria._expr[4]._op" value="like" />
						</td>
						<td style="width: 60px; text-align: right;">申报金额：</td>
						<td style="width: 205px">
							<input class="nui-hidden" name="criteria._expr[5]._op" value="between" />
							<input class="nui-hidden" name="criteria._expr[5]._property" value="declareAmount" />
							<input class="nui-textbox" name="criteria._expr[5]._min" style="width: 90px" />
							<span>至</span>
							<input class="nui-textbox" name="criteria._expr[5]._max" style="width: 90px" />
						</td>
						<td style="width: 60px; text-align: right;">申请日期：</td>
						<td style="width: 245px">
							<input class="nui-hidden" name="criteria._expr[6]._op" value="between" />
							<input class="nui-hidden" name="criteria._expr[6]._pattern" value="yyyy-MM-dd" />
							<input class="nui-hidden" name="criteria._expr[6]._property" value="createTime" />
							<input class="nui-datepicker" name="criteria._expr[6]._min" style="width: 110px" />
							<span>至</span>
							<input class="nui-datepicker" name="criteria._expr[6]._max" style="width: 110px" />
						</td>
					</tr>
					<tr>
						<td style="width: 60px; text-align: right;">任务来源：</td>
						<td style="width: 155px">
							<input name="criteria._expr[7].taskSource" class="nui-dictcombobox" dictTypeId="ZH_XNCZ_TASK_SOURCE" showNullItem="true" nullItemText="全部" style="width: 150px" />
						</td>
						<td style="width: 60px; text-align: right;">集团内外：</td>
						<td style="width: 155px">
							<input name="criteria._expr[8].headquarterGroup" class="nui-dictcombobox" dictTypeId="ZH_GROUP_NEW" showNullItem="true" nullItemText="全部" style="width: 150px" />
						</td>
						<td style="width: 60px; text-align: right;">审批状态：</td>
						<td style="width: 155px">
							<input name="criteria._expr[9].appStatus" class="nui-dictcombobox" dictTypeId="ZH_FLOW_TYPE" showNullItem="true" nullItemText="全部" style="width: 150px" />
						</td>
						<td style="width: 60px; text-align: right;">委托单位：</td>
						<td style="width: 205px">
							<input name="criteria._expr[10]._value" class="nui-textbox" style="width: 200px" />
							<input class="nui-hidden" name="criteria._expr[10]._property" value="custName" />
							<input class="nui-hidden" name="criteria._expr[10]._op" value="like" />
						</td>
						<td style="width: 60px; text-align: right;">确认金额：</td>
						<td style="width: 205px">
							<input class="nui-hidden" name="criteria._expr[11]._op" value="between" />
							<input class="nui-hidden" name="criteria._expr[11]._property" value="confirmAmount" />
							<input class="nui-textbox" name="criteria._expr[11]._min" style="width: 90px" />
							<span>至</span>
							<input class="nui-textbox" name="criteria._expr[11]._max" style="width: 90px" />
						</td>
						<td style="width: 60px; text-align: right;">确认日期：</td>
						<td style="width: 245px">
							<input class="nui-hidden" name="criteria._expr[12]._op" value="between" />
							<input class="nui-hidden" name="criteria._expr[12]._pattern" value="yyyy-MM-dd" />
							<input class="nui-hidden" name="criteria._expr[12]._property" value="finishTime" />
							<input class="nui-datepicker" name="criteria._expr[12]._min" style="width: 110px" />
							<span>至</span>
							<input class="nui-datepicker" name="criteria._expr[12]._max" style="width: 110px" />
						</td>
					</tr>
				</table>
			</div>

			<div class="nui-toolbar" style="border-bottom: 0; padding: 1px;">
				<table style="width: 100%; text-align: center;">
					<tr>
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
						<a class="nui-button" id="add" iconCls="icon-add" onclick="add()">新增</a>
						<a class="nui-button" id="edit" iconCls="icon-edit" onclick="zc_edit()">编辑</a>
						<a class="nui-button" id="del" iconCls="icon-remove" onclick="deleteInfo()">删除</a>
						<a class="nui-button" id="xnczsb_wh" iconCls="icon-edit" onclick="wh_edit()">维护</a>
						<a class="nui-button" id="xnczsb_zf" iconCls="icon-edit" onclick="zf_edit()">作废</a>
						<a class="nui-button" id="export" iconCls="icon-download" onclick="exportExcel()">导出</a>
						<a class="nui-button" id="xnczsb_lr" iconCls="icon-edit" onclick="lr_add()">录入</a>
					</td>
				</tr>
			</table>
		</div>

		<div class="nui-fit">
			<div id="xnzcDataGrid" class="nui-datagrid" style="width: 100%; height: 100%;" sizeList="[500]" showPager="true" pageSize="500" multiSelect="true" allowSortColumn=true showSummaryRow="true"
				dataField="xnzcList" url="com.zhonghe.ame.kaohe.virtualProduction.queryVirtualProductionList.biz.ext">
				<div property="columns">
					<div type="checkcolumn"></div>
					<div field="createTime" dateFormat="yyyy-MM-dd" width="80" align="center" headerAlign="center" allowSort="true">申请日期</div>
					<div field="createUsername" width="70" align="center" headerAlign="center">申请人</div>
					<div field="secondaryOrgname" width="150" align="center" headerAlign="center" allowSort="true">申请单位</div>
					<div field="declareMatter" width="250" align="left" headerAlign="center" renderer="lookInfo">申报事项</div>
					<div field="declareAmount" width="100" align="center" headerAlign="center" allowSort="true" summaryType="sum" dataType="currency">申报金额（元）</div>
					<div field="confirmAmount" width="100" align="center" headerAlign="center" allowSort="true" summaryType="sum" dataType="currency">确认金额（元）</div>
					<div field="appStatus" width="80" align="center" headerAlign="center" renderer="onActionRenderer">审批状态</div>
					<div field="taskSource" width="150" align="center" headerAlign="center" renderer="ZH_XNCZ_TASK_SOURCE">任务来源</div>
					<div field="custName" width="200" align="left" headerAlign="center">委托单位</div>
					<div field="headquarterGroup" width="80" align="center" headerAlign="center" renderer="ZH_GROUP_NEW">集团内/外</div>
					<div field="finishTime" dateFormat="yyyy-MM-dd" width="80" align="center" headerAlign="center" allowSort="true">确认日期</div>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		nui.parse();
		var searchForm = new nui.Form("#searchForm");
		var xnzcDataGrid = nui.get("xnzcDataGrid");
		var now = new Date();

		init();

		function init() {
			nui.get("createYear").setValue(now.getFullYear());
			// 按钮权限
			if (userId != 'sysadmin') {
				getOpeatorButtonAuth("xnczsb_wh,xnczsb_zf,xnczsb_lr");
			}
			//code:对应功能编码，map：对于机构的查询条件
			var json = {
				"code" : "xnczsb"
			};
			nui.ajax({
				url : "com.primeton.eos.ame_auth.ame_auth.getownorg1.biz.ext",
				data : json,
				type : 'POST',
				contentType : 'text/json',
				success : function(text) {
					if (text.errcode == "没有有权的机构") {
						getSecOrg(userOrgId);
					} else {
						initSecOrgCombobox(text.orgids)
					}
					search();
				}
			});
		}
		
		function getSecOrg(userOrgId){
			var json = nui.encode({'userOrgId' : userOrgId});
			ajaxCommon({
				url : "com.primeton.eos.common.orgUtils.getSecOrg.biz.ext",
				data : json,
				async: false,
				success : function(result) {
					var data = result.data;
					nui.get("searchOrgids").setValue(data.ORGID);
				}
			});
		}		

		function initSecOrgCombobox(orgids) {
			ajaxCommon({
				"url" : "com.zhonghe.ame.kaohe.common.getBusSecOrgList.biz.ext",
				contentType : 'text/json',
				async: false,
				success : function(result) {
					var datas = result.secOrgList;
					var orgIdSet = new Set(orgids.split(','));
					var filteredDatas = datas.filter(item => orgIdSet.has(item.secOrg));
					nui.get("secondaryOrg").setData(filteredDatas);
					nui.get("searchOrgids").setValue(orgids);
				}
			});
		}
		
		function search() {
			var data = searchForm.getData();
			xnzcDataGrid.sortBy("createTime", "desc");
			xnzcDataGrid.load(data);
		}
		
		function reset() {
			searchForm.reset();
			init();
		}
		
		function add() {
			nui.open({
				url : "/default/kaohe/virtualProduction/addVirtualProduction.jsp",
				width : '100%',
				height : '100%',
				title : "虚拟产值申报",
				onload : function() {
					var iframe = this.getIFrameEl();
				},
				ondestroy : function(action) {
					search();
				}
			})
		}
		
		function zc_edit(){
			var row = xnzcDataGrid.getSelecteds();
			if (row.length > 1 || row.length == 0) {
				showTips("只能选中一条数据记录进行编辑", "danger");
				return;
			}
			var data = row[0];
			if (data.appStatus == '0') {
				var json = {
					"processID" : data.processId
				};
				ajaxCommon({
					url : "com.zhonghe.ame.purchase.purchaseProApp.getWorkItemByProcessInstID.biz.ext",
					data : json,
					success : function(result) {
						if (JSON.stringify(result) !== '{}') {
							nui.open({
								url : "/default/bps/wfclient/task/dispatchTaskExecute.jsp?workItemID=" + result.workItemID,
								width : '100%',
								height : '100%',
								ondestroy : function(action) {
									xnzcDataGrid.reload();
									search();
								}
							})
						}
					}
				});
			} else {
				showTips("只能编辑审批状态为【草稿】的数据", "danger");
			}
		}
		
		function onActionRenderer(e) {
			var record = e.record;
			var processId = record.processId;
			var s = "<a  href='javascript:void(0)' onclick='feeView();' >" + nui.getDictText('ZH_FLOW_TYPE', e.value) + "</a>";
			return s;
		}

		function feeView() {
			var selectRow = xnzcDataGrid.getSelected();
			var processId = selectRow.processId;
			var url = "/default/bps/wfclient/task/processinstView.jsp";
			var title = "流程图查看";
			var width = "100%";
			nui.open({
				url : url,
				title : title,
				width : width,
				height : "100%",
				onload : function() {
					var iframe = this.getIFrameEl();
					if (iframe.contentWindow.initData) {
						iframe.contentWindow.initData({
							"processInstID" : processId
						});
					}
				},
				ondestroy : function(action) {
				}
			});
		}
		
		function lookInfo(e){
			return "<a href='javascript:void(0)' onclick='doView();' title='点击查看'>" + e.value + "</a>";
		}
		
		function doView(){
			var selectRow = xnzcDataGrid.getSelected();
			var url = "/default/kaohe/virtualProduction/virtualProductionDetails.jsp?id=" + selectRow.id;
			window.open(url);			
		}
		
		function ZH_XNCZ_TASK_SOURCE(e){
			return nui.getDictText('ZH_XNCZ_TASK_SOURCE', e.value);
		}
		
		function ZH_GROUP_NEW(e){
			return nui.getDictText('ZH_GROUP_NEW', e.value);
		}									
		
	</script>
</body>
</html>