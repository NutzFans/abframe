<%@page import="com.eos.data.datacontext.UserObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common/common.jsp"%>
<html>
<head>
<title>选择投标记录 - 市场经营信息</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%=request.getContextPath()%>/common/nui/nui.js" type="text/javascript"></script>
<style type="text/css">
	.nui-radiobuttonlist-item {
		float: left;margin-left: 200px;color: pink;
	}
	.mini-grid-cell-nowrap{
		white-space: nowrap;
	}
</style>
</head>
<body>
	<div style="width: auto; height: 100%; padding: 5px; overflow: hidden;">
		<div id="form1">
			<input class="nui-hidden" name="criteria._entity" value="com.zhonghe.ame.marketInfo.bid.ZhBidinfoEntity" />
			<input id="bidDataStatus" name="criteria._expr[0].bidDataStatus" class="nui-hidden"/>
			<div class="nui-toolbar" style="border-bottom: 0; padding: 5px;">
				<table>
					<tr>
						<td style="width: 60px; text-align: right;">牵头部门:</td>
						<td style="width: 155px">
							<input name="criteria._expr[1].bidOrg" class="nui-dictcombobox" dictTypeId="ZH_BID_ORG" showNullItem="true" nullItemText="全部" style="width: 150px" />
						</td>
						<td style="width: 60px; text-align: right;">甲方全称:</td>
						<td style="width: 320px">
							<input name="criteria._expr[2]._value" class="nui-combobox" url="com.zhonghe.ame.chargeContract.chargeContract.queryCusts.biz.ext" filterType="like" textField="custname" valueField="custname"
								dataField="custs" valueFromSelect="true" allowInput="true" style="width: 315px;" />
							<input class="nui-hidden" name="criteria._expr[2]._property" value="custName" />
							<input class="nui-hidden" name="criteria._expr[2]._op" value="like" />
						</td>
						<td style="width: 60px; text-align: right;">项目名称:</td>
						<td style="width: 320px">
							<input name="criteria._expr[3]._value" class="nui-textbox" style="width: 315px" />
							<input class="nui-hidden" name="criteria._expr[3]._property" value="projectName" />
							<input class="nui-hidden" name="criteria._expr[3]._op" value="like" />
						</td>
						<td>
							<a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查询</a>
							<a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset()">重置</a>
						</td>
					</tr>
				</table>
			</div>
		</div>

		<div class="nui-fit">
			<div id="datagrid1" sizeList="[15,30,50]" dataField="bidInfos" pageSize="15" class="nui-datagrid" style="width: 100%; height: 475px;"
				url="com.zhonghe.ame.marketInfo.marketinfo.khxx.bid.queryBidInfo.biz.ext" allowAlternating="true" idField="id" onrowdblclick="onRowDblClick">
				<div property="columns">
					<div type="checkcolumn">○</div>
					<div field="id" headerAlign="center" visible="false">id</div>
					<div field="bidDataStatus" headerAlign="center" align="center" renderer="ZH_BID_STATUS" width="75">数据完善度</div>
					<div field="bidOrg" headerAlign="center" align="center" renderer="ZH_BID_ORG">牵头部门</div>
					<div field="recordDate" headerAlign="center" align="center" dateFormat="yyyy-MM" width="70" allowSort="true">备案日期</div>
					<div field="createUserid" displayField="empname" headerAlign="center" align="center" width="55">填报人</div>
					<div field="custId" displayField="custName" headerAlign="center" align="center" width="300">甲方全称</div>
					<div field="projectName" headerAlign="center" align="center" width="300">项目名称</div>
					<div field="bidResult" headerAlign="center" align="center" renderer="ZH_BID_RESULT">中标结果</div>
				</div>
			</div>
		</div>
		
		<div style="text-align: center; padding: 5px; border-top: 0px;" class="nui-toolbar">
			<a class="nui-button" onclick="onOk()" id="creatReimbProcess" style="width: 80px;" iconCls="icon-ok">确定</a>
			<a class="nui-button" onclick="onCancel()" id="saveReimbProcess" style="width: 80px; margin-left: 56px" iconCls="icon-close">关闭</a>
		</div>		
		
	</div>
	
	<script type="text/javascript">
		nui.parse();
		var form = new nui.Form("#form1");
		var grid = nui.get("datagrid1");

		search();
		
		function search() {
			var data = form.getData();
			data.criteria._expr[0].bidDataStatus = "1";
			grid.sortBy("recordDate", "desc");
			grid.load(data);
		}
		
		function reset() {
			form.reset();
			search();
		}
		
		function onOk() {
			var row = grid.getSelected();
			CloseWindow("ok");
		}
		
		function onRowDblClick(e) {
			onOk();
		}
		
		function onCancel(e) {
			CloseWindow("cancel");
		}
		
		function GetData() {
			var row = grid.getSelected();
			return row;
		}		
		
		//标准方法接口定义
		function CloseWindow(action) {
			if (window.CloseOwnerWindow) {
				return window.CloseOwnerWindow(action);
			} else {
				window.close();
			}
		}						
		
		function ZH_BID_STATUS(e) {
			if (e.value == '2') {
				e.cellStyle = "color: red";
			}
			return nui.getDictText("ZH_BID_STATUS", e.value);
		}
		
		function ZH_BID_ORG(e) {
			return nui.getDictText("ZH_BID_ORG", e.value);
		}
		
		function ZH_BID_RESULT(e) {
			return nui.getDictText("ZH_BID_RESULT", e.value);
		}						
				
	</script>
	
</body>
</html>