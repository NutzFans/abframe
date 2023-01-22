<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp" %>
<html>
<head>
	<title>供应商评审 </title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
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
		<fieldset id="field1" style="border: solid 1px #aaa;padding: 3px;width: 99%;">
				<legend>供应商评审信息</legend>
				<form id="form1" method="post">
					<input class="nui-hidden" name="id" />
					<div style="padding: 2px;">
						<table style="table-layout: fixed; width: 90%;">
							<tr>
								<td colspan="1" align="right" width="140px">评价单位：</td>
								<td colspan="3">
									<input name="createOrgname"  class="nui-textbox" readOnly="readOnly"  style="width: 100%;" />
								</td>
								<td colspan="1" align="right">评价时间：</td>
								<td colspan="3">
									<input name="createTime" class="nui-datepicker" format="yyyy-MM-dd" readOnly="readOnly" style="width: 100%;" />
								</td>
								<td colspan="1" align="right">评价等级：</td>
								<td colspan="1">
									<input name="evaluationGrade"  class="nui-textbox"
										readOnly="readOnly" style="width: 100%;" />
								</td>
							</tr>
							<tr>
								<td colspan="1" align="right">供应商名称：</td>
								<td colspan="3">
									<input name="supplierName" class="nui-textbox" style="width: 100%"  />
								</td>
								<td colspan="1" align="right">合同名称：</td>
								<td colspan="3">
									<input name="contractId" id="contractId" 
										class="nui-textbox" style="width: 100%" readOnly="readOnly"  />
								</td>
								<td colspan="1" align="right">合同编号：</td>
								<td colspan="2">
									<input name="contractNo" id="contractNo" class="nui-textbox"
										readOnly="readOnly" style="width: 155px;" />
								</td>
							</tr>
							<tr>
								<td colspan="1" align="right" width="140px">履约评分(满分4分)：</td>
								<td colspan="1">
									<input style="width:100px;" name="performanceScore" id="performanceScore"
										minValue="0" maxValue="4" 
										class="nui-spinner" readOnly="readOnly"  />
								</td>
								<td colspan="2" align="right">技术评价评分(满分4分)：</td>
								<td colspan="1">
									<input style="width:100px;" name="technologyScore" 	class="nui-spinner" readOnly="readOnly"  />
								</td>
								<td colspan="2" align="right">质保能力评分(满分2分)：</td>
								<td colspan="1">
									<input style="width:100px;" name="warrantyScore" id="warrantyScore"
										class="nui-spinner"  minValue="0"
										maxValue="2" readOnly="readOnly"  />
								</td>
								<td colspan="1" align="right">主观评分：</td>
								<td colspan="1">
									<input name="scoring"  class="nui-textbox" readOnly="readOnly" style="width: 100%;" />
								</td>
							</tr>
							<tr>
								<td colspan="1" align="right">履约情况：</td>
								<td colspan="9">
									<input style="width:100%;height: 60px;" name="performance" id="performance"
										class="nui-textarea" readOnly="readOnly" 
										emptyText="（简要评价供应商供货速度、服务态度、配合程度、仓贮能力等；满分4分）" />
								</td>
								
							</tr>
							<tr>
								<td colspan="1" align="right">技术评价：</td>
								<td colspan="9">
									<input style="width:100%;height: 60px;" name="technology" id="technology"
										class="nui-textarea" readOnly="readOnly" 
										emptyText="（简要评价供应商提供产品/服务专业水平、供货/服务质量；满分4分）" />
								</td>
							</tr>
							<tr>
								<td colspan="1" align="right">质保能力：</td>
								<td colspan="9">
									<input style="width:100%;hereadOnly="readOnly" me="warranty" id="warranty"
										class="nui-textarea" readOnly="readOnly" 
										emptyText="（简要评价供应商是否有较完善的质保/售后体系，是否满足中核咨询需求；满分2分）" />
								</td>
							</tr>
						</table>
					</div>
				</form>
			</fieldset>
	     <jsp:include page="/ame_common/misOpinion.jsp"/>
	</div>
	<div style="text-align: center;padding: 10px;" class="nui-toolbar">

		<a class="nui-button" onclick="onCancel" id="saveReimbProcess"
			style="width: 80px;margin-right: 140px;">关闭</a>
	</div>
	<script type="text/javascript">
		nui.parse();
	var id = <%=request.getParameter("id") %>;
		init();
		var form = new nui.Form("#form1");
		function init(){
   			var json = nui.encode({ "id": id });
	   		nui.ajax({	
					url: "com.zhonghe.ame.purchase.supplierEvaluate.querySupEvaluate.biz.ext",
				    type: 'POST',
			        data: json,
			        success: function (o) {
			        		var result = o.supEvaluate[0];
									form.setData(result)
									nui.get("contractId").setValue(result.contractName);
// 			       		 	nui.get("backTo").setData(o.purPlan.backList);
			       		 var grid1 = nui.get("datagrid1");
								 grid1.load({processInstID:result.processid});
								 grid1.sortBy("time", "desc");
						 //初始化处理意见
						 document.getElementById("opinionHide").style.display="none";
						 initMisOpinion({auditstatus:"1"});
			        },
				    error: function (jqXHR, textStatus, errorThrown) {
				        alert(jqXHR.responseText);
				    }
			    }); 
	   	}

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


		function selectOmEmployee() {
			var btnEdit = this;
			nui.open({
				url: "<%=request.getContextPath() %>/machine/SelectEmployee.jsp",
				title: "选择报销人",
				width: 430,
				height: 400,
				ondestroy: function (action) {
					if (action == "ok") {
						var iframe = this.getIFrameEl();
						var data = iframe.contentWindow.GetData();
						data = nui.clone(data);    //必须
						if (data) {
							btnEdit.setValue(data.userid);
							btnEdit.setText(data.empname);
						}
					}

				}
			});
		}


		function selectOmEmployee1() {
			var btnEdit = this;
			nui.open({
				url: "<%=request.getContextPath() %>/machine/SelectEmployee.jsp",
				title: "选择报销人",
				width: 430,
				height: 400,
				ondestroy: function (action) {
					if (action == "ok") {
						var iframe = this.getIFrameEl();
						var data = iframe.contentWindow.GetData();
						data = nui.clone(data);    //必须
						if (data) {

							btnEdit.setValue(data.userid);

							btnEdit.setText(data.empname);

						}
					}

				}
			});
		}

		function onOk() {


			//定义变量接受form表单数据
			var form = new nui.Form("#form1");
			var data = form.getData();


			document.getElementById("fileCatalog").value = "purReviewReport";
			/* document.getElementById("fileCatalog1").value="purFile"; */

			<!--form4.submit();-->
			form2.submit();
		}
		function SaveData() {

			var form = new nui.Form("#form1");
			var data = form.getData();

			var json = nui.encode({ 'supEvaluate': data });
			console.log(data);
			if (!confirm("是否提交？")) {
				return;
			} else {
				nui.ajax({
					url: "com.zhonghe.ame.purchase.supplierEvaluate.addSupEvaluate.biz.ext",
					data: json,
					type: 'POST',
					cache: false,
					contentType: 'text/json',
					success: function (text) {
						console.log(text.result);
						if (text.result == "1") {
							nui.alert("提交成功", null, function () {
								window.CloseOwnerWindow("save");
							});
						} else {
							nui.alert("提交失败", null, function () {
								window.CloseOwnerWindow("save");
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
				title: "采购立项列表",
				width: '73%',
				height: '75%',
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
				title: "采购立项列表",
				width: '73%',
				height: '75%',
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
							/*  nui.get("planId").setValue(data.planId);
								nui.get("planId").setText(data.purchaseNumber); */
							btnEdit.doValueChanged();

						}
					}

				}
			});

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