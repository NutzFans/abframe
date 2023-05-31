<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>

<head>
<title>采购方案</title>
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
	<%long workitemid = (Long)request.getAttribute("workItemID");%>
	<div class="nui-fit">
		<div class="mini-panel" title="" style="width: 100%;">
			<fieldset id="field1" style="border: solid 1px #aaa; padding: 3px; width: 99%;">
				<legend>评审结果信息</legend>
				<form id="form1" method="post">
					<input name="files" id="fileids" class="nui-hidden" />
					<input name="files1" id="fileids1" class="nui-hidden" />
					<input class="nui-hidden" name="id" />
					<input class="nui-hidden" name="proappId" />
					<input class="nui-hidden" name="processid" />
					<div style="padding: 5px;">
						<table style="table-layout: fixed;">
							<tr>
								<td width="100" align="right">评审结果名称：</td>
								<td colspan="3">
									<input name="reportName" id="reportName" class="nui-textbox" style="width: 100%" />
								</td>
								<td align="right" style="width: 80px">申请单位：</td>
								<td colspan="3">
									<input name="createdOrgname" class="nui-textbox" style="width: 100%" />
								</td>
							</tr>
							<tr>
								<td align="right" style="width: 100px">立项编号：</td>
								<td colspan="3">
									<input name="proappCode" id="proappCode" class="nui-textbox" style="width: 100%" />
								</td>
								<td align="right" style="width: 100px">立项名称：</td>
								<td colspan="3">
									<input name="proAppName" id="proAppName" class="nui-textbox" style="width: 100%;" readonly="readonly" />
								</td>
							</tr>
							<tr>
								<td align="right" style="width: 80px">申请人：</td>
								<td colspan="1">
									<input name="createdByName" class="nui-textbox" style="width: 100%" />
								</td>
								<td align="right" style="width: 100px">采购方式：</td>
								<td colspan="1">
									<input id="purchasMode" name="purchasMode" class="nui-textbox" readonly="readonly" style="width: 100%;" />
								</td>
								<td class="form_label" align="right" style="width: 120px;">归口部门：</td>
								<td colspan="3">
									<input id="putunder" name="putunder" class="nui-dictcombobox" dictTypeId="ZH_PUTUNDER" readonly="readonly" style="width: 100%;" />
								</td>
							</tr>
							<tr>
								<td align="right">集采类型：</td>
								<td>
									<input class="nui-dictcombobox" name="type" id="type" dictTypeId="ZH_PURCHASE" style="width: 100%;" readonly="readonly" />
								</td>
								<td align="right" style="width: 100px">立项金额：</td>
								<td colspan="1">
									<input name="proAppApplyPrice" id="proAppApplyPrice" class="nui-textbox" style="width: 100%;" readonly="readonly" />
								</td>
							</tr>
							<tr>
								<td class="form_label" align="right" style="width: 140px;">评审结果说明：</td>
								<td colspan="5">
									<input style="width: 100%; height: 120px;" name="remark" id="remark" class="nui-textarea" />
								</td>
							</tr>
						</table>
					</div>
				</form>
			</fieldset>
			<fieldset style="height: 80%; border: solid 1px #aaa; padding: 1px; width: 99%">
				<legend>采购计划明细</legend>
				<div class="fieldset-body" style="width: 100%; height: 100%; margin: 0px auto">
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
		</div>
		<fieldset id="field2" style="border: solid 1px #aaa; padding: 3px;">
			<legend>评审结果附件</legend>
			<div style="visibility: hidden; display: none;">
				<jsp:include page="/ame_common/detailFile.jsp" />
			</div>
			<jsp:include page="/ame_common/inputFile.jsp" />
		</fieldset>

		<fieldset style="border: solid 1px #aaa; padding: 3px;">
			<legend>审批信息</legend>
			<jsp:include page="/ame_common/misOpinion_Freeflow.jsp" />
		</fieldset>

	</div>
	<div style="text-align: center; padding: 10px;" class="nui-toolbar">
		<a class="nui-button" onclick="countersign()" id="countersign" iconCls="icon-user" style="width: 80px; margin-right: 20px;">加签</a>
		<a class="nui-button" onclick="onOk()" id="creatReimbProcess" style="width: 80px; margin-right: 20px;">提交</a>
		<a class="nui-button" onclick="onCancel" id="saveReimbProcess" style="width: 80px; margin-right: 140px;">关闭</a>
	</div>
	<script type="text/javascript">
    		nui.parse();
    		var id = <%=request.getParameter("id")%>;
 		var form = new nui.Form("#form1");
    		var countersignUsers,titleText;
    		init();
    		var gridDtl = nui.get("grid_detail");
    		function init(){
       			var data = {workitemid:<%=workitemid%>};
			var json = nui.encode(data);
			nui.ajax({
				url : "com.zhonghe.ame.purchase.purchaseReviewReport.queryReviewReport.biz.ext",
				data : json,
				type : 'POST',
				cache : false,
				contentType : 'text/json',
				success : function(o) {
					var result = o.reviewReport[0];
					form.setData(result);
					nui.get("proappCode").setValue(result.proAppCode);
					gridDtl.load({
						"pid" : result.proappId
					})
					nui.get("backTo").setData(result.backList);

					var grid_0 = nui.get("grid_0");
					grid_0.load({
						"groupid" : "purReviewReport",
						"relationid" : result.id
					});
					grid_0.sortBy("fileTime", "desc");

					var grid = nui.get("datagrid1");
					grid.load({
						processInstID : result.processid
					});
					grid.sortBy("time", "desc");
					//初始化处理意见
					initMisOpinion({
						auditstatus : "1"
					});
					labelModel();

				},
				error : function(jqXHR, textStatus, errorThrown) {
					alert(jqXHR.responseText);
				}
			});
		}

		function labelModel() {
			var fields = form.getFields();
			for (var i = 0, l = fields.length; i < l; i++) {
				var c = fields[i];
				if (c.setReadOnly)
					c.setReadOnly(true); //只读
				if (c.setIsValid)
					c.setIsValid(true); //去除错误提示
			}
		}

		//添加加签
		function countersign() {
			selectOmEmployee2();
		}
		function selectOmEmployee2() {
			var btnEdit = this;
			nui.open({
				url : "<%=request.getContextPath() %>/contractPact/selectUsers.jsp",
            title: "立项单位经办人",
            width: 430,
            height: 400,
            ondestroy: function (action) {
                console.log(action)
                var user,users = "【";
                countersignUsers =[];
                if (action == "ok") {
                    var iframe = this.getIFrameEl();
                    var data = iframe.contentWindow.GetData();
                    data = nui.clone(data);    //必须
                    if (data) {
                        console.log(data)
                        for(var i = 0;i<data.length ;i++){
                            user = {};
                            user.id = data[i].userid
                            user.name = data[i].empname
                            user.typeCode = "person"
                            countersignUsers.push(user);
                            if(i==0){
                                users = users +data[i].empname;
                            }else{

                                users = users +","+data[i].empname;
                            }
                        }
                        users = users+"】";
                        titleText ="增加审批人员"+ users +"并提交";
                        form2.submit();
                    }
                }
            }
        });
    }
    
    function onOk(){
        var auditstatus = nui.get("auditstatus").getValue();
        if(auditstatus == "2"){	//终止流程
            titleText = "终止";
            submitProcess(titleText);
        }else if(auditstatus == "0"){	//退回流程
            if(!nui.get("backTo").getValue()){
                nui.alert("退回环节不能为空！");
                return;
            }
            titleText = "退回";
            submitProcess(titleText);
        }else if(auditstatus == "1"){	//提交流程
            titleText = "提交";
            submitProcess(titleText);
        }
        
    }
     function submitProcess(title){
            nui.confirm("确定" + titleText + "流程吗？", "操作提示",function (action) {
                if (action == "ok") {
                    var data = form.getData();
                    var misOpinion = opioionform.getData().misOpinion;//审核意见
                    var json = {'param':data,'misOpinion':misOpinion,'workItemID': <%=workitemid %>
		,
						"countersignUsers" : countersignUsers
					};
					mini.mask({
						el : document.body,
						cls : 'mini-mask-loading',
						html : titleText + '中...'
					});
					saveData(json);
				}
			})
		}
		function saveData(json) {
			nui.ajax({
				url : "com.zhonghe.ame.purchase.purchaseReviewReport.purReviewReportApproval.biz.ext",
				type : "post",
				data : json,
				contentType : "text/json",
				success : function(o) {
					nui.unmask(document.body);
					if (o.result == "1") {
						nui.alert(titleText + "成功", "系统提示", function() {
							CloseWindow("ok");
						});
					} else {
						nui.alert("提交失败，请联系信息技术部人员！", "系统提示", function(action) {
							CloseWindow("ok");
						});
					}
				},
				error : function(jqXHR, textStatus, errorThrown) {
					alert(jqXHR.responseText);
				}
			});
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
