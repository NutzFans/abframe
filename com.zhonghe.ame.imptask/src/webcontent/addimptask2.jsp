<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
	<head>
		<title>重点任务申报</title>
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
		<div class="nui-fit">
			<fieldset style="border:solid 1px #aaa;">
				<legend>重点任务基本信息</legend>
				<form id="form1" method="post" style="width:100%;">
					<table style="table-layout:fixed;width: 100%" id="table_file1">
						<tr>
							<td align="right" style="width:10%">
								<nobr>重点任务名称：</nobr>
							</td>
							<td colspan="5">
								<input class="nui-textbox" name="taskName" id="projectName" style="width:100%"
									required="true">
							</td>
						</tr>

						<tr>
							<td align="right" style="width:10%">
								<nobr>重点任务方向：</nobr>
							</td>
							<td colspan="5">
								<input class="nui-textbox" name="taskDirection" id="projectno" style="width:100%"
									required="true">
							</td>
						</tr>
						<tr>
							<td align="right" width="10%"><span>责任单位：</span></td>
							<td style="width: 20%;">
								<input name="orgId" id="orgId" shownullItem=ture class="nui-treeselect"
									textField="orgname" valueField="orgid" parentField="omOrganization.orgid"
									dataField="orgs" showTreeIcon="true" valueFromSelect="true" style="width:100%;"
									url="com.zhonghe.ame.imptask.keytask.getAllRunOrgsforzdrw.biz.ext" allowInput="true"
									required="true" multiSelect="false" checkRecursive="false" expandOnLoad="0"
									showFolderCheckBox="true" />
							</td>
							<td align="right">
								<nobr>年度：</nobr>
							</td>
							<td>
								<input class="mini-spinner" minValue="2021" maxValue="2100" name="declareYear"
									id="declareYear" style="width:100%" required="true">
							</td>

							<td align="right">
								<nobr>计划完成时间：</nobr>
							</td>
							<td><input name="planCompleteTime" id="openTime" class="nui-datepicker" required="true"
									style="width: 100%" allowInput="false" showTodayButton="false"
									ondrawdate="onDrawDate" /></td>
						</tr>
						<tr>
							<td align="right">
								<nobr>总体目标：</nobr>
							</td>
							<td colspan="5">
								<input class="nui-textarea" name="populationTarget" id="isconproj"
									style="width:100%;height: 40px" required="true">
							</td>
						</tr>

						<tr>
							<td align="right">
								<nobr>年度目标：</nobr>
							</td>
							<td colspan="5">
								<input name="yearTarget" id="manager" class="nui-textarea"
									style="width:100%;height: 40px" showClose="false" allowInput="true"
									required="true" />
							</td>
						</tr>
						<tr>
							<td align="right">
								<nobr>决策情况：</nobr>
							</td>
							<td colspan="5">
								<input class="nui-textarea" name="decisionSituation" id="projectStatus"
									style="width:100%;height: 40px" shownullItem="true">
							</td>
						</tr>
					</table>
				</form>
			</fieldset>
			<div style="text-align:center;padding:10px;" class="nui-toolbar">
				<a class="nui-button" onclick="save2('save')" id="saveButton" iconCls="icon-save" style="width: 80px;margin-right: 20px;">确认</a>
				<a class="nui-button" onclick="closeCancel()" id="saveReimbProcess" iconCls="icon-close" style="width: 80px;margin-right: 140px;">关闭</a>
			</div>
		</div>
		<script type="text/javascript">
			nui.parse();
			var form = new nui.Form("form1");
			function save2(e) { //提交方式：暂存保持或者直接提交
				form.validate();
				if (form.isValid() == false) {
					nui.alert("请检查必填项");
					return;
				}
				var keytask = form.getData();
				if (e == "save") {
					keytask.appStatus = 1;
					keytask.completeStatus = "2"
				} else {
					//keytask.appStatus = 1;
				}
				var json = nui.encode({
					"keytask": keytask
				});
				ajaxCommon({
					"url": "com.zhonghe.ame.imptask.newKeytaskMng.addkeytaskMng.biz.ext",
					"data": json,
					"success": function(data) {
						showTips("重点任务新增成功")
						closeOk();
					}
				});

			}

			//禁止选择日期
			function onDrawDate(e) {
				var date = e.date;
				var d = new Date();
				if (date.getTime() < d.getTime()) {
					e.allowSelect = false;
				}
			}
		</script>
	</body>
</html>
