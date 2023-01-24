<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<%@include file="/purchase/common/common.jsp" %>
		<html>

		<head>
			<title></title>
			<style type="text/css">
				body {
					margin: 0;
					padding: 0;
					border: 0;
					width: 100%;
					height: 100%;
					overflow: hidden;
				}
			</style>
		</head>

		<body>
			<div class="nui-panel" title="付费合同管理" showHeader="false" style="width:100%;">
				<div id="form1">
					<input class="nui-hidden" name="critria._entity"
						value="com.zhonghe.ame.purchase.common.ZhPayContractEntity" />
					<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
						<table align="center" border="0" width="100%" class="form_table">
							<tr>
								<td class="form_label" align="right">申请人:</td>
								<td colspan="1">
									<input name="critria._expr[2]._value" class="nui-textbox" style="width:100%;" />
									<input class="nui-hidden" name="critria._expr[2]._property" value="empname" />
									<input class="nui-hidden" name="critria._expr[2]._op" value="like" />
									<input class="nui-hidden" name="critria._expr[1].appStatus" value="2" />
									<input class="nui-hidden" name="critria._expr[1]._op" value="=" />
								</td>
								<td class="form_label" align="right">实施地点:</td>
								<td colspan="1">
									<input name="critria._expr[3]._value" class="nui-textbox" style="width:100%;" />
									<input class="nui-hidden" name="critria._expr[3]._property" value="projectLocal" />
									<input class="nui-hidden" name="critria._expr[3]._op" value="like" />
								</td>
								<td class="form_label" align="right">合同实施部门:</td>
								<td colspan="1">
									<input name="critria._expr[4]._value" class="nui-textbox" style="width:100%;" />
									<input class="nui-hidden" name="critria._expr[4]._property" value="orgname" />
									<input class="nui-hidden" name="critria._expr[4]._op" value="like" />
								</td>
								<td class="form_label" align="right">合同类型:</td>
								<td colspan="1">
									<input name="critria._expr[12]._value" class="nui-dictcombobox"
										dictTypeId="ZH_CONTRACT_TYPE" style="width:100%;" />
									<input class="nui-hidden" name="critria._expr[12]._property" value="contractType" />
									<input class="nui-hidden" name="critria._expr[12]._op" value="like" />
								</td>
							</tr>
							<tr>
								<td class="form_label" align="right">合同名称:</td>
								<td colspan="1">
									<input name="critria._expr[5]._value" class="nui-textbox" style="width:100%;" />
									<input class="nui-hidden" name="critria._expr[5]._property" value="contractName" />
									<input class="nui-hidden" name="critria._expr[5]._op" value="like" />
								</td>
								<td class="form_label" align="right">签约方:</td>
								<td colspan="1">
									<input name="critria._expr[6]._value" class="nui-textbox" style="width:100%;" />
									<input class="nui-hidden" name="critria._expr[6]._property" value="signatory" />
									<input class="nui-hidden" name="critria._expr[6]._op" value="like" />
								</td>
								<td colspan="2" align="right">
									<a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查询</a>
									<a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset()">重置</a>
								</td>
							</tr>
						</table>
					</div>
				</div>
				<div>
					<div id="datagrid1" frozenStartColumn="0" sizeList="[10,20,50,100]" showPager="true"
						dataField="data" sortMode="client" class="nui-datagrid" style="width:100%;height:350px;"
						url="com.zhonghe.ame.purchase.common.payContractAll.biz.ext" multiSelect="true"
						allowSortColumn=true>
						<div property="columns">
							<!--         <div type="indexcolumn" align="center" headerAlign="center">序号</div> -->
							<div name="temp123" type="checkcolumn"></div>
							<!-- <div type="expandcolumn" width="20"></div> -->
							<div field="empname" width="60" align="center" headerAlign="center" allowSort="true">申请人
							</div>
							<div field="contractName" width="200" align="left" headerAlign="center" allowSort="true">
								合同名称</div>
							<!--             <div field="signatory" width="100" align="center" headerAlign="center" allowSort="true" >签约方</div> -->
							<div field="contractSum" width="100" align="center" headerAlign="center" allowSort="true">
								合同金额（元）</div>
							<div field="orgname" width="220" align="left" headerAlign="center" allowSort="true">合同实施部门
							</div>
							<!--             <div field="projectLocal"  align="left" headerAlign="center" allowSort="true"  >实施地点</div> -->
							<div field="contractType" width="120" align="center" headerAlign="center" allowSort="true"
								renderer="zhContractType">合同类型</div>
							<div field="appStatus" align="center" headerAlign="center" width="80" allowSort="true"
								renderer="zhFlowType">审批状态</div>
							<div field="startTime" dateFormat="yyyy-MM-dd" width="80" align="center"
								headerAlign="center">合同起始日期</div>
							<div field="endTime" dateFormat="yyyy-MM-dd" width="80" align="center" headerAlign="center">
								合同结束日期</div>
						</div>
					</div>
				</div>
				<div style="text-align: center;padding: 10px;" class="nui-toolbar">
					<a class="nui-button" onclick="onOk()" id="creatReimbProcess"
						style="width: 80px;margin-right: 20px;">确定</a>
					<a class="nui-button" onclick="onCancel" id="saveReimbProcess"
						style="width: 80px;margin-right: 140px;">关闭</a>
				</div>
			</div>
			<script type="text/javascript">
				nui.parse();
				var form = new nui.Form("#form1");
				var grid = nui.get("datagrid1");
				//search();
				var type = <%=request.getParameter("type") %>;
				var reve_grid = nui.get("reve_grid");
				var json = nui.encode({ "iden": "1", "expseq": null, "feeseq": null, "parentfeetypeid": null });

				init();
				function init() {
					var data = form.getData(); //获取表单JS对象数据
					grid.load(data); //datagrid加载数据

				}
				function check(e) {
					if (e.value == 1) {
						return "是";
					} else {
						return "否";
					}
				}
				function search() {
					var form = new nui.Form("#form1");
					var data = form.getData(); //获取表单JS对象数据
					grid.load(data); //datagrid加载数据
				}
				function reset() {
					var form = new nui.Form("#form1");
					form.reset();
					grid.load();
					search()
				}

				function onOk() {
					var row = grid.getSelected();
					CloseWindow("ok");
				}

				function CloseWindow(action) {

					if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
					else window.close();
				}
				function GetData() {
					var row = grid.getSelected();
					return row;
				}

				//回车触发
				function onKeyEnter() {
					search();
				}

				function onCancel(e) {
					CloseWindow("cancel");
				}
				//标准方法接口定义
				function CloseWindow(action) {
					if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
					else window.close();
				}

				function zhContractType(e) {
					return nui.getDictText("ZH_CONTRACT_TYPE", e.value);
				}
				function zhFlowType(e) {
					return nui.getDictText("ZH_FLOW_TYPE", e.value);
				}
			</script>
		</body>

		</html>