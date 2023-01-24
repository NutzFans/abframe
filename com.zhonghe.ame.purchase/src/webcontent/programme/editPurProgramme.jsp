<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp" %>
<html>
	<head>
		<title>采购文件 </title>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
		<style type="text/css">
			body {margin: 0;padding: 0;border: 0;width: 100%;height: 100%;overflow: hidden;}
		</style>
		</head>
<body>
	<%long workitemid=(Long)request.getAttribute("workItemID");%>
	<div class="nui-fit">
		<div class="mini-panel" title="" style="width: 100%;" showHeader="false">
			<fieldset id="field1" style="border: solid 1px #aaa;padding: 3px;width: 99%;">
				<legend>采购文件</legend>
				<form id="form1" method="post">
					<input name="files" id="fileids" class="nui-hidden" />
					<input name="files1" id="fileids1" class="nui-hidden" />
					<input class="nui-hidden" name="id" />
					<div style="padding: 5px;">
						<table style="table-layout: fixed;width: 60%">
							<tr>
								<td width="100" align="right">采购项目名称：</td>
								<td colspan="3">
									<input name="type" id="type" class="nui-hidden" />
									<input name="planId" id="planId" class="nui-hidden" />
									<input name="programmeName" id="programmeName" class="nui-textbox" style="width: 100%" required="true" />
								</td>
								<td  align="right" style="width: 80px">编号：</td>
								<td colspan="2">
									<input name="code" class="nui-textbox" style="width: 100%" readonly="readonly"/>
								</td>
							</tr>
							<tr>
								<td align="right" style="width: 100px">立项名称：</td>
								<td colspan="3">
									<input name="proAppName" id="proAppName" class="nui-textbox" style="width: 100%;"
										readonly="readonly"/>
								</td>
								<td align="right" style="width:100px">立项编号：</td>
								<td colspan="2">
									<input name="proappId" id="proappId" onbuttonclick="onButtonEdit" allowInput="false" class="nui-buttonedit" style="width: 100%"
										required="true" />
								</td>
							</tr>
							<tr>
								
								<td  align="right" style="width: 80px">申请人：</td>
								<td colspan="1">
									<input name="createdByName" class="nui-textbox" style="width: 100%" readonly="readonly"/>
								</td>
								<td  align="right" width="80" >申请时间：</td>
								<td colspan="1">
									<input name="createdTime" class="nui-textbox" style="width: 100%" readonly="readonly"/>
								</td>
								<td  align="right" style="width: 80px">申请单位：</td>
								<td colspan="2">
									<input name="createdOrgname" class="nui-textbox" style="width: 100%" readonly="readonly"/>
								</td>
							</tr>
							
							<tr>
								<td class="form_label" align="right" style="width:100px;">归口部门：</td>
                <td colspan="3">
                    <input id="putunder" name="putunder" class="nui-dictcombobox"  dictTypeId="ZH_PUTUNDER"  readonly="readonly" style="width:100%;" />
                </td>
								<td align="right" style="width: 100px">立项金额：</td>
								<td colspan="1">
									<input name="proAppApplyPrice" id="proAppApplyPrice" class="nui-textbox" style="width: 100%;"
										readonly="readonly"/>
								</td>
							</tr>
							<tr>
								<td class="form_label" align="right" style="width:120px;">采购文件主要内容简述：</td>
								<td colspan="6">
									<input style="width:100%;height: 40px;" name="remark" id="remark"
										class="nui-textarea" required="true" />
								</td>
							</tr>
						</table>
					</div>
				</form>
			</fieldset>
			<fieldset  style="height:80%; border:solid 1px #aaa;padding:3px;width: 99%">
				<legend>采购计划明细</legend>
		     <div class="fieldset-body"  style="width:100%; height:100%; margin: 0px auto">
		    	<div id="grid_detail" class="nui-datagrid" style="width: 100%;height: auto;" allowCellSelect="true" 
			    	url="com.zhonghe.ame.purchase.dao.projectApproval.queryProAppDtl.biz.ext" dataField="datas" showPager="false" multiSelect="true"  >
			           <div property="columns">
			           		<div type="indexcolumn" align="center" headerAlign="center"  visible="false"></div>
		           			<div  field="planName" width="110" align="center" headerAlign="center" >计划名称</div>
		           			<div  field="code" width="100" align="center" headerAlign="center" >计划编号</div>
		                <div field="materialName"  width="110" align="center" headerAlign="center">采购物项名称 </div>
		                <div field="budgetAmount"  width="100" align="center" headerAlign="center" >预算金额(万元)</div>
		                <div field="amount"  width="100" align="center" headerAlign="center">立项金额(万元)</div>
		                <div field="sumamount"  width="110" align="center" headerAlign="center" vtype="required">剩余可立项金额(万元)</div>
		                <div field="needOrgName"  width="80" align="left" headerAlign="center" >采购单位</div> 
			           </div>
			        </div>
				</div>
			</fieldset>
			<fieldset id="field3" style="border:solid 1px #aaa;padding:3px;width: 99%">
				<legend>附件（请上传技术规格书、采购文件）</legend>
				<jsp:include page="/ame_common/inputFile.jsp" />
			</fieldset>
			<fieldset style="border:solid 1px #aaa;padding:3px;width: 99%">
				<legend>审批信息</legend>
				<jsp:include page="/ame_common/misOpinion.jsp" />
			</fieldset>
		</div>
	</div>
	<div style="text-align:center;padding:10px;border-width:1px 0px 0px 0px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk(0)" id="saveReimb" iconCls="icon-save" style="width: 80px;margin-right: 20px;">保存</a>
		<a class="nui-button" onclick="onOk(1)" id="creatReimbProcess" iconCls="icon-ok" style="width: 80px;margin-right: 20px;">提交</a>
		<a class="nui-button" onclick="onOk(2)" id="zzFeame" iconCls="icon-split" style="width: 80px;margin-right: 20px;">中止</a>
		<a class="nui-button" onclick="closeCancel()" id="saveReimbProcess" iconCls="icon-close" style="width: 80px;margin-right: 140px;">关闭</a>
	</div>
	<script type="text/javascript">
			nui.parse();
			var id = <%=request.getParameter("id") %>;
			var countersignUsers, titleText;
			var form = new nui.Form("#form1");
			var gridDtl = nui.get("grid_detail");
			var opioionform = new nui.Form("opioionform");
			var istype;
			init();
			function init() {
				var json = nui.encode({ "workitemid":<%=workitemid%>});
					console.log(json);
					nui.ajax({
						url: "com.zhonghe.ame.purchase.purchaseProgramme.queryPurProgrammeByPid.biz.ext",
						type: 'POST',
						data: json,
						success: function (o) {
							var result = o.purProgramme;
// 							nui.get("programmeName").setValue(result.programmeName);
							nui.get("proappId").setValue(result.proappId);
							nui.get("proappId").setText(result.proAppCode);
// 							nui.get("remark").setValue(result.remark);
// 							nui.get("code").setValue(result.code);
							form.setData(result);
							gridDtl.load({"pid":result.proappId})
							
							
							//设置审核意见基本信息
							nui.get("processinstid").setValue(o.workitem.processInstID);
	           	nui.get("processinstname").setValue(o.workitem.processInstName);
	           	nui.get("activitydefid").setValue(o.workitem.activityDefID);
	           	nui.get("workitemname").setValue(o.workitem.workItemName);
							nui.get("workitemid").setValue(<%=workitemid %>);
	           	nui.get("isshow").setValue("1");
	           	nui.get("auditstatus").setValue("4");
	           	document.getElementById("salesEdit").style.display="none";
	           	nui.get("auditopinion").setValue("");
							
							
							var grid_0 = nui.get("grid_0");
							grid_0.load({ "groupid": "purProgramme", "relationid": result.id });
							grid_0.sortBy("fileTime", "desc");

							var grid = nui.get("datagrid1");
							grid.load({ processInstID: result.processid });
							grid.sortBy("time", "desc");
							document.getElementById("salesEdit").style.display = "none";
							//初始化处理意见
							initMisOpinion({ auditstatus: "1" });
						},
						error: function (jqXHR, textStatus, errorThrown) {
							alert(jqXHR.responseText);
						}
					});
			}


		function onOk(e) {
			istype = e;
			if (istype == 1) {
				info = "是否提交？"
				if (!form.validate()) {
					nui.alert("请检查表单的完整性!");
					return;
				}
			} else if (istype == 0) {
				info = "是否暂时保存？"
			} else {
				info = "是否中止流程？"
				nui.get("auditstatus").setValue(2);
			}
			//定义变量接受form表单数据
			var data = form.getData();
			document.getElementById("fileCatalog").value = "purProgramme";
			form2.submit();
		}

		function SaveData() {
			var form = new nui.Form("#form1");
			var data = form.getData();
			var data_opioion = opioionform.getData();
			data.files = nui.get("fileids").getValue();
			data.istype = istype;
			data.judge = getJudge();
			var json = nui.encode({ 'purProgramme': data, "misOpinion": data_opioion.misOpinion });
			if (!confirm("是否提交？")) {
				return;
			} else {
				ajaxCommon({
					url: "com.zhonghe.ame.purchase.purchaseProgramme.editPurProgramme.biz.ext",
					data: json,
					success: function (text) {
						if (text.result == "1") {
							showTips("提交成功")
							closeOk();
						} else {
							nui.alert("提交失败请联系管理员")
						}
					}
				});
			}
		}

		function onButtonEdit(e) {
			var btnEdit = this;
			mini.open({
				url: "/default/purchase/project/procurementProAppList.jsp",
				title: "采购立项列表",
				width: '73%',
				height: 400,
				ondestroy: function (action) {
					if (action == "ok") {
						var iframe = this.getIFrameEl();
						var data = iframe.contentWindow.GetData();
						data = mini.clone(data);    //必须
						if (data) {
							btnEdit.setValue(data.id);
							btnEdit.setText(data.proAppCode);
							nui.get("planId").setValue(data.planId);
							nui.get("proAppName").setValue(data.proAppName);
							nui.get("proAppApplyPrice").setValue(data.proAppApplyPrice);
							nui.get("putunder").setValue(data.putunder);
							nui.get("type").setValue(data.type);
							btnEdit.doValueChanged();
							gridDtl.load({ "pid": data.id })
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