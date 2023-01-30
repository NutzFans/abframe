<%@page import="com.eos.data.datacontext.UserObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common/common.jsp"%>
<html>
<head>
<title>采购立项列表</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%=request.getContextPath()%>/common/nui/nui.js" type="text/javascript"></script>
<style type="text/css">
	.nui-radiobuttonlist-item {
		float: left;margin-left: 200px;color: pink;
	}
</style>
</head>
<body>
	<div style="width: auto; height: 100%; padding: 5px; overflow: hidden;">
		<div id="form1">
			<div class="nui-toolbar" style="border-bottom: 0; padding: 5px;">
				<table>
					<tr>
						<td style="width: 60px; text-align: right;">立项名称:</td>
						<td style="width: 205px">
							<input name="criteria._expr[1]._value" class="nui-textbox" style="width: 200px" />
							<input class="nui-hidden" name="criteria._expr[1]._property" value="proAppName" />
							<input class="nui-hidden" name="criteria._expr[1]._op" value="like" />
						</td>
						<td style="width: 60px; text-align: right;">立项编号:</td>
						<td style="width: 155px">
							<input name="criteria._expr[2]._value" class="nui-textbox" style="width: 150px" />
							<input class="nui-hidden" name="criteria._expr[2]._property" value="proAppCode" />
							<input class="nui-hidden" name="criteria._expr[2]._op" value="like" />
						</td>
						<td style="width: 90px; text-align: right;">采购计划编号:</td>
						<td style="width: 155px">
							<input name="criteria._expr[3]._value" class="nui-textbox" style="width: 150px" />
							<input class="nui-hidden" name="criteria._expr[3]._property" value="purchaseNumber" />
							<input class="nui-hidden" name="criteria._expr[3]._op" value="like" />
							<input class="nui-hidden" id="ischange" name="criteria._expr[4].ischange" value="1" />
							<input class="nui-hidden" name="criteria._expr[4]._op" value="=" />
							<input class="nui-hidden" name="criteria._expr[7]._property" value="createdOrgid" />
							<input class="nui-hidden" name="criteria._expr[7]._op" value="in" />
							<input class="nui-hidden" name="criteria._expr[7]._value" id="orgids2" />
							<input class="nui-hidden" name="criteria._expr[6].createdBy" id="createdBy" />
							<input class="nui-hidden" name="criteria._expr[6]._op" value="=" />
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
			<div id="datagrid1" frozenStartColumn="0" sizeList="[10,20,50,100]" showPager="true" dataField="proApp" showSummaryRow="true" sortMode="client" ondrawsummarycell="onDrawSummaryCell"
				onrowdblclick="onRowDblClick" class="nui-datagrid" style="width: 100%; height: 550px" url="com.zhonghe.ame.purchase.purchaseProApp.queryProApp.biz.ext" multiSelect="false" allowSortColumn=true>
				<div property="columns">
					<div type="indexcolumn" align="center" headerAlign="center">序号</div>
					<div type="checkcolumn"></div>
					<div field="proAppName" width="100" align="center" headerAlign="center" allowSort="true">立项名称</div>
					<div field="proAppCode" width="100" align="center" headerAlign="center" allowSort="true">立项编号</div>
					<div field="purchaseNumber" width="80" align="center" headerAlign="center" allowSort="true">采购计划编号</div>
					<div field="proapporgname" width="200" align="center" headerAlign="center" allowSort="true">立项单位</div>
					<div field="projectName" width="200" align="center" headerAlign="center" allowSort="true">所属项目名称</div>
					<div field="proAppApplyPrice" width="100" align="center" headerAlign="center" allowSort="true">立项申请金额(万元)</div>
					<div field="proAppImplTime" dateFormat="yyyy-MM-dd" width="80" align="center" headerAlign="center">项目拟实施日期</div>
					<div field="status" width="80" align="center" headerAlign="center" allowSort="true" renderer="getStatus">状态</div>
				</div>
			</div>
		</div>

		<div style="text-align: center; padding: 5px; border-top: 0px;" class="nui-toolbar">
			<a class="nui-button" onclick="onOk()" id="creatReimbProcess" style="width: 80px; margin-right: 20px;" iconCls="icon-ok">确定</a>
			<a class="nui-button" onclick="onCancel" id="saveReimbProcess" style="width: 80px; margin-right: 140px;" iconCls="icon-close">关闭</a>
		</div>
	</div>
	
	<script type="text/javascript">
		nui.parse();
		var form = new nui.Form("#form1");
		var grid = nui.get("datagrid1");
		var type = <%=request.getParameter("type")%>;
		var reve_grid = nui.get("reve_grid");
		var json=nui.encode({"iden": "1","expseq": null,"feeseq": null,"parentfeetypeid": null});
		
		search();

		function search() {
			var form = new nui.Form("#form1");
			var data = form.getData(); //获取表单JS对象数据
			grid.load(data); //datagrid加载数据
		}
		
		function getStatus(e) {
			if (e.value == 1) {
				return "审核中"
			}
		}
		
		function reset() {
			var form = new nui.Form("#form1");
			form.reset();
			grid.load();
			search()
		}
		
		function onOk() {
			var row = grid.getSelected();
			if (row.status == 1) {
				alert("请选择已完成的立项");
				return;
			}
			CloseWindow("ok");
		}
		
		function GetData() {
			var row = grid.getSelected();
			return row;
		}
		
		function onKeyEnter() {
			search();
		}
		
		function onDrawSummaryCell(e) {
			var result = e.result;
			var grid = e.sender;
		}
		
		function ondealdate(e) {
			if (e.value) {
				var now = e.value;
				var year = now.getFullYear();
				var month = now.getMonth() + 1;
				var day = now.getDate();
				var hours = now.getHours();
				var minutes = now.getMinutes();
				var seconds = now.getSeconds();
				var curDateTime = year;
				if (month > 9) {
					curDateTime = curDateTime + "-" + month;
				} else {
					curDateTime = curDateTime + "-" + "0" + month;
				}
				if (day > 9) {
					curDateTime = curDateTime + "-" + day;
				} else {
					curDateTime = curDateTime + "-" + "0" + day;
				}
				if (hours > 9) {
					curDateTime = curDateTime + "   " + hours;
				} else {
					curDateTime = curDateTime + "   " + "0" + hours;
				}
				if (minutes > 9) {
					curDateTime = curDateTime + ":" + minutes;
				} else {
					curDateTime = curDateTime + ":" + "0" + minutes;
				}
				if (seconds > 9) {
					curDateTime = curDateTime + ":" + seconds;
				} else {
					curDateTime = curDateTime + ":" + "0" + seconds;
				}
				return curDateTime;
			}
		}
		
		function dictIshavebak(e) {
			return nui.getDictText('ZH_PURCHASE', e.value);//设置业务字典值
		}

		function getStatus(e) {
			return nui.getDictText('zh_purplan_status', e.value);//设置业务字典值
		}

		function zhContractType(e) {
			return nui.getDictText("ZH_CONTRACT_TYPE", e.value);
		}

		function onRowDblClick(e) {
			onOk();
		}

		function onCancel(e) {
			CloseWindow("cancel");
		}
		
		//标准方法接口定义
		function CloseWindow(action) {
			if (window.CloseOwnerWindow) {
				return window.CloseOwnerWindow(action);
			} else {
				window.close();
			}
		}
	</script>
</body>
</html>