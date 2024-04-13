
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.List"%>
<%@page import="commonj.sdo.DataObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@ page import="java.util.Map"%>
<%
	String contextPath=request.getContextPath();
%>
<html>

<head>
<title>评审结果</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%=request.getContextPath()%>/common/nui/nui.js" type="text/javascript"></script>
<style type="text/css">
body {
	margin: 0;
	padding: 0;
	border: 0;
	width: 100%;
	height: 100%;
	overflow: hidden;
}

body .mini-textboxlist {
	border-collapse: collapse;
}
</style>
</head>
<body>
	<div class="nui-fit">
		<fieldset id="field1" style="border: solid 1px #aaa; padding: 3px; width: 99%;">
			<legend>评审结果信息</legend>
			<form id="form1" method="post">
				<input name="files" id="fileids" class="nui-hidden" />
				<input name="files1" id="fileids1" class="nui-hidden" />
				<input class="nui-hidden" name="id" />
				<input class="nui-hidden" name="processid" />
				<div style="padding: 1px;">
					<table style="table-layout: fixed; width: 100%;">
						<tr>
							<td align="right" style="width: 135px">立项编号：</td>
							<td>
								<input name="proappId" id="proappId" onbuttonclick="onButtonEdit" allowInput="false" class="nui-buttonedit" style="width: 100%" readonly="readonly" />
							</td>
							<td align="right" style="width: 120px">采购需求单位：</td>
							<td>
								<input name="orgUnits" id="orgUnits" class="nui-textboxlist" dataField="orgUnits" url="com.zhonghe.ame.purchase.common.queryOrgByName.biz.ext" valueField="orgcode" textField="orgname"
									inputMode="false" style="width: 705px" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 100px">立项名称：</td>
							<td>
								<input name="proAppName" id="proAppName" class="nui-textbox" style="width: 100%;" readonly="readonly" />
							</td>
							<td align="right" style="width: 100px;">评审结果名称：</td>
							<td>
								<input name="type" id="type" class="nui-hidden" />
								<span data-placement="left" data-tooltip="默认使用立项名称,可自行修改">
									<input name="reportName" id="reportName" class="nui-textbox" style="width: 100%" readonly="readonly" />
								</span>
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 100px">立项金额：</td>
							<td>
								<input name="proAppApplyPrice" id="proAppApplyPrice" class="nui-textbox" style="width: 100%;" readonly="readonly" />
							</td>
							<td class="form_label" align="right" style="width: 120px;">归口部门：</td>
							<td>
								<input id="putunder" name="putunder" class="nui-dictcombobox" dictTypeId="ZH_PUTUNDER" readonly="readonly" style="width: 100%;" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 135px;">评审结果说明：</td>
							<td colspan="3">
								<input style="width: 100%; height: 120px;" name="remark" id="remark" class="nui-textarea" readonly="readonly" />
							</td>
						</tr>
					</table>
				</div>
			</form>
		</fieldset>

		<fieldset style="border: solid 1px #aaa; padding: 1px; width: 99%">
			<legend>采购计划明细</legend>
			<div class="fieldset-body" style="width: 100%; margin: 0px auto">
				<div id="grid_detail" class="nui-datagrid" style="width: 100%; height: auto;" dataField="datas" showPager="false" multiSelect="true"
					url="com.zhonghe.ame.purchase.dao.projectApproval.queryProAppDtl.biz.ext">
					<div property="columns">
						<div type="indexcolumn" align="center" headerAlign="center" visible="false"></div>
						<div field="planName" width="110" align="center" headerAlign="center">计划名称</div>
						<div field="code" width="100" align="center" headerAlign="center">计划编号</div>
						<div field="materialName" width="110" align="center" headerAlign="center">采购物项名称</div>
						<div field="budgetAmount" width="100" align="center" headerAlign="center">预算金额(万元)</div>
						<div field="amount" width="100" align="center" headerAlign="center">立项金额(万元)</div>
						<div field="sumamount" width="110" align="center" headerAlign="center" vtype="required">剩余可立项金额(万元)</div>
						<div field="needOrgName" width="80" align="left" headerAlign="center">采购单位</div>
					</div>
				</div>
			</div>
		</fieldset>
		<fieldset id="field2" style="border: solid 1px #aaa; padding: 3px;">
			<legend>评审结果附件</legend>
			<jsp:include page="/ame_common/detailFile.jsp" />
		</fieldset>
	</div>
	<script type="text/javascript">
        nui.parse();
        <%UserObject user = (UserObject) session.getAttribute("userObject");
	   		String username = user.getUserName();
	   		String userno = user.getUserId();
	   		String userOrgName = user.getUserOrgName();
	   		String userOrgId = user.getUserOrgId();
	   		Map<String,Object> a = user.getAttributes();
	   		String empid = (String) a.get("empid");
	   		DataObject[] roles = (DataObject[])a.get("roles");%>
	    var id = <%=request.getParameter("id")%>;
	    
	    var processid = <%=request.getParameter("processid")%>;
	    
	   	if(processid==null){
	   		processid = <%=request.getParameter("processInstID")%>;
	   	}
	   	
	    var form = new nui.Form("#form1");
	    var gridDtl = nui.get("grid_detail");
	    
		init();
		
        function init(){
        	var json = nui.encode({"processid":processid});
        	form.setEnabled(false);
		  	nui.ajax({
		                url: "com.zhonghe.ame.purchase.purchaseReviewReport.getReviewReportByProcessId.biz.ext",
		                data: json,
		                type: 'POST',
		                cache: false,
		                contentType: 'text/json',
		                success: function (o) {
						 var result=o.reviewReport;
						 form.setData(result);
						nui.get('orgUnits').setValue(result.proAppOrgId);
						nui.get('orgUnits').setText(result.proAppOrgName);
						nui.get("proappId").setValue(result.proappId);
						nui.get("proappId").setText(result.proAppCode);
						 gridDtl.load({"pid":result.proappId})
						 var grid_0 = nui.get("grid_0");
        				 grid_0.load({"groupid":"purReviewReport","relationid":result.id});
						 grid_0.sortBy("fileTime","desc");
						 
						 
			        },
		                error: function (jqXHR, textStatus, errorThrown) {
		                    alert(jqXHR.responseText);
		                }
		            });
		}
		
	    function selectProjectList(){
        	var btnEdit = this;
        	nui.open({
                url:"<%=request.getContextPath()%>/ame_common/SelectProject.jsp",
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
		
		
		 function selectOmEmployee(){
    	var btnEdit = this;
        nui.open({
            url: "<%=request.getContextPath()%>/machine/SelectEmployee.jsp",
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
        
        
        function selectOmEmployee1(){
    	var btnEdit = this;
        nui.open({
            url: "<%=request.getContextPath()%>/machine/SelectEmployee.jsp",
				title : "选择报销人",
				width : 430,
				height : 400,
				ondestroy : function(action) {
					if (action == "ok") {
						var iframe = this.getIFrameEl();
						var data = iframe.contentWindow.GetData();
						data = nui.clone(data); //必须
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
			form2.submit();
		}
		function SaveData() {

			var form = new nui.Form("#form1");
			var data = form.getData();
			data.files = nui.get("fileids").getValue();
			var json = nui.encode({
				'reviewReport' : data
			});
			console.log(data);
			if (!confirm("是否提交？")) {
				return;
			} else {
				nui.ajax({
					url : "com.zhonghe.ame.purchase.purchaseReviewReport.addReviewReport.biz.ext",
					data : json,
					type : 'POST',
					cache : false,
					contentType : 'text/json',
					success : function(text) {
						console.log(text.result);
						if (text.result == "1") {
							nui.alert("提交成功", null, function() {
								window.CloseOwnerWindow("save");
							});
						} else {
							nui.alert("提交失败", null, function() {
								window.CloseOwnerWindow("save");
							});
						}
					},
					error : function(jqXHR, textStatus, errorThrown) {
						alert(jqXHR.responseText);
					}
				});
			}
		}
		function SaveData1() {
		}

		function onButtonEdit(e) {
			var btnEdit = this;
			mini.open({
				url : "/default/purchase/project/procurementProAppList.jsp",
				title : "采购立项列表",
				width : '73%',
				height : '75%',
				ondestroy : function(action) {
					if (action == "ok") {

						var iframe = this.getIFrameEl();
						var data = iframe.contentWindow.GetData();
						data = mini.clone(data); //必须
						if (data) {
							btnEdit.setValue(data.id);
							btnEdit.setText(data.proAppCode);

							nui.get("planId").setValue(data.planId);
							nui.get("planId").setText(data.purchaseNumber);
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
			if (window.CloseOwnerWindow)
				return window.CloseOwnerWindow(action);
			else
				window.close();
		}
	</script>
</body>
</html>
