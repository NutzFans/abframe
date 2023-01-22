<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp" %>
<html>
<head>
	<title>供应商评审 </title>
	<style type="text/css">
		body {
			margin: 0;
			padding: 0;
			border: 0;
			width: 100%;
			height: 100%;
			overflow: hidden;
		}
		td {
			padding: 2px;
		}
	</style>
</head>
<body>
	<div class="nui-fit">
		<div class="nui-panel" title="" showHeader="false" style="width: 100%;">
			<fieldset id="field1" style="border: solid 1px #aaa;padding: 3px;width: 99%;">
				<legend>供应商评审信息</legend>
				<form id="form1" method="post">
					<input class="nui-hidden" name="id" />
					<div style="padding: 2px;">
						<table style="table-layout: fixed; width: 90%;">
							<tr>
								<td colspan="1" align="right">评价单位：</td>
								<td colspan="3">
									<input name="createOrgname" id="createOrgname" class="nui-textbox"
										readOnly="readOnly" value="<%=userOrgName %>" style="width: 100%;" />
								</td>
								<td colspan="1" align="right">评价时间：</td>
								<td colspan="3">
									<input name="createTime" id="createTime" class="nui-datepicker"
										format="yyyy-MM-dd" readOnly="readOnly" style="width: 100%;" />
								</td>
								<td colspan="1" align="right">主观评分：</td>
								<td colspan="1">
									<input name="scoring" id="scoring" class="nui-textbox" readOnly="readOnly"
										style="width: 100%;" />
								</td>
								<td colspan="1" align="right">评价等级：</td>
								<td colspan="1">
									<input name="evaluationGrade" id="evaluationGrade" class="nui-textbox"
										readOnly="readOnly" style="width: 100%;" />
								</td>
							</tr>
							<tr>
								<td colspan="1" align="right">供应商名称：</td>
								<td colspan="3">
									<input name="supId" id="supId" onbuttonclick="onButtonEdit"
										class="nui-buttonedit" style="width: 100%" required="true" />
									<input class="nui-hidden" name="supplierName" id="supplierName" />
								</td>
								<td colspan="1" align="right">合同名称：</td>
								<td colspan="3">
									<input name="contractId" id="contractId" onbuttonclick="choseContrat"
										class="nui-buttonedit" style="width: 100%" required="true" />
								</td>
								<td colspan="1" align="right">合同编号：</td>
								<td colspan="3">
									<input name="contractNo" id="contractNo" class="nui-textbox"
										readOnly="readOnly" style="width: 100%;" />
								</td>
							</tr>
							<tr>
								<td colspan="1" align="right">履约情况：</td>
								<td colspan="9">
									<input style="width:100%;height: 60px;" name="performance" id="performance"
										class="nui-textarea" required="true"
										emptyText="（简要评价供应商供货速度、服务态度、配合程度、仓贮能力等；满分4分）" />
								</td>
								<td colspan="1" align="right" width="140px">评分(满分4分)：</td>
								<td colspan="1">
									<input style="width:100px;" name="performanceScore" id="performanceScore"
										minValue="0" maxValue="4" onvaluechanged="onScoring()"
										class="nui-spinner" required="true" />
								</td>
							</tr>
							<tr>
								<td colspan="1" align="right">技术评价：</td>
								<td colspan="9">
									<input style="width:100%;height: 60px;" name="technology" id="technology"
										class="nui-textarea" required="true"
										emptyText="（简要评价供应商提供产品/服务专业水平、供货/服务质量；满分4分）" />
								</td>
								<td colspan="1" align="right">评分(满分4分)：</td>
								<td colspan="1">
									<input style="width:100px;" name="technologyScore" id="technologyScore"
										minValue="0" maxValue="4" onvaluechanged="onScoring()"
										class="nui-spinner" required="true" />
								</td>
							</tr>
							<tr>
								<td colspan="1" align="right">质保能力：</td>
								<td colspan="9">
									<input style="width:100%;height: 60px;" name="warranty" id="warranty"
										class="nui-textarea" required="true"
										emptyText="（简要评价供应商是否有较完善的质保/售后体系，是否满足中核咨询需求；满分2分）" />
								</td>
								<td colspan="1" align="right">评分(满分2分)：</td>
								<td colspan="1">
									<input style="width:100px;" name="warrantyScore" id="warrantyScore"
										class="nui-spinner" onvaluechanged="onScoring()" minValue="0"
										maxValue="2" required="true" />
								</td>
							</tr>
						</table>
					</div>
				</form>
			</fieldset>
		</div>
	</div>
	<div style="text-align: center;padding: 10px;" class="nui-toolbar">
		<a class="nui-button" onclick="saveData()" id="creatReimbProcess"
			style="width: 80px;margin-right: 20px;">提交</a>
		<a class="nui-button" onclick="onCancel" id="saveReimbProcess"
			style="width: 80px;margin-right: 140px;">关闭</a>
	</div>
	<script type="text/javascript">
		nui.parse();
		var form = new nui.Form("#form1");
		nui.get("createTime").setValue(new Date());
		function selectProjectList() {
			//var allpurProj = purProjOutper_grid.getData();

			var btnEdit = this;
			nui.open({
				url: "<%=request.getContextPath() %>/ame_common/SelectProject.jsp",
				title: "选择项目",
				width: 850,
				height: 420,
				allowResize: false,
				ondestroy: function (action) {
					if (action == "ok") {
						var iframe = this.getIFrameEl();
						var data = iframe.contentWindow.GetData();
						data = nui.clone(data);    //必须
						if (data) {
							btnEdit.setValue(data.projectId);
							btnEdit.setText(data.projectName);
						}
					}
				}
			});
		}
		function saveData() {
			mini.mask({
		            el: document.body,
		            cls: 'mini-mask-loading',
		            html: '提交中...'
		        })
			if (!form.validate()) {
				nui.alert("请检查表单的完整性!");
				return;
			}
			var data = form.getData();
			var json = nui.encode({ 'supEvaluate': data });
			console.log(data);
			if (!confirm("是否提交？")) {
				return;
			} else {
				ajaxCommon({
					url: "com.zhonghe.ame.purchase.supplierEvaluate.addSupEvaluate.biz.ext",
					data: json,
// 					type: 'POST',
// 					cache: false,
// 					contentType: 'text/json',
					success: function (text) {
// 						mini.unmask(document.body);
						if (text.result == "1") {
							nui.alert("提交成功", null, function () {
								window.CloseOwnerWindow("save");
							});
						} else {
							nui.alert("提交失败", null, function () {
								// 										window.CloseOwnerWindow("save");
							});
						}
					},
					error: function (jqXHR, textStatus, errorThrown) {
						alert(jqXHR.responseText);
					}
				});
			}
		}
		function SaveData1() {
		}
		function choseContrat(e) {
			var btnEdit = this;
			mini.open({
				url: "/default/purchase/programme/quotePayContractList.jsp",
				title: "选择合同",
				width: '73%',
				height: '77%',
				ondestroy: function (action) {
					if (action == "ok") {

						var iframe = this.getIFrameEl();
						var data = iframe.contentWindow.GetData();
						data = mini.clone(data);    //必须
						if (data) {
							btnEdit.setValue(data.id);
							btnEdit.setText(data.proAppCode);
							console.log(data);
							nui.get("contractNo").setValue(data.contractNo);
							nui.get("contractId").setValue(data.id);
							nui.get("contractId").setText(data.contractName);
							btnEdit.doValueChanged();

						}
					}

				}
			});

		}

		function onButtonEdit(e) {
			var btnEdit = this;
			mini.open({
				url: "/default/purchase/packagemethod/zhPurSup.jsp",
				width: '73%',
				height: '77%',
				ondestroy: function (action) {
					if (action == "ok") {

						var iframe = this.getIFrameEl();
						var data = iframe.contentWindow.GetData();
						data = mini.clone(data);    //必须
						if (data) {
							btnEdit.setValue(data.id);
							btnEdit.setText(data.proAppCode);
							console.log(data);
							nui.get("supId").setValue(data.custid);
							nui.get("supId").setText(data.custname);
							nui.get("supplierName").setValue(data.custname);
							/*  nui.get("planId").setValue(data.planId);
								nui.get("planId").setText(data.purchaseNumber); */
							btnEdit.doValueChanged();

						}
					}

				}
			});

		}
		function onScoring() {
			var warrantyScore = nui.get("warrantyScore").getValue()
			var performanceScore = nui.get("performanceScore").getValue()
			var technologyScore = nui.get("technologyScore").getValue()
			var scoring = addFloat(warrantyScore,performanceScore,technologyScore);
			var evaluationGrade
			if (scoring >= 9) {
				evaluationGrade = "优秀";
			} else if (scoring >= 7) {
				evaluationGrade = "良好";
			} else if (scoring >= 6) {
				evaluationGrade = "合格";
			} else {
				evaluationGrade = "不合格";
			}
			nui.get("evaluationGrade").setValue(evaluationGrade)
			nui.get("scoring").setValue(scoring)
		}
		function addInt(num1, num2,num3) {
			num1 = parseInt(num1, 10);
			num2 = parseInt(num2, 10);
			num3 = parseInt(num3, 10);
			
			return parseInt(num1 + num2+ num3);
		}
		
		function addFloat(num1, num2,num3) {
		if(!num1) num1 = 0;
		if(!num2) num2 = 0;
		if(!num3) num3 = 0;
		//num1 = parseFloat(num1);
		//num2 = parseFloat(num2);
		return math.number(math.chain(math.bignumber(num1)).add(math.bignumber(num2)).add(math.bignumber(num3)).done());;
	}

		function onCancel(e) {
			CloseWindow("cancel");
		}
		//标准方法接口定义
		function CloseWindow(action) {
			if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
			else window.close();
		}
	</script>
</body>
</html>