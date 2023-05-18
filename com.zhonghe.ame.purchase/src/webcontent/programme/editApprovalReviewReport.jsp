<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>

<head>
	<title>采购方案 </title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin: 0;padding: 0;border: 0;width: 100%;height: 100%;overflow: hidden;	
	    } 
    </style>
</head>
<body>
 <%long workitemid = (Long)request.getAttribute("workItemID");%> 
	<div class="nui-fit">
		<div class="mini-panel" title="" style="width: 100%;">
			<form id="form1" method="post">
				<fieldset id="field1" style="border: solid 1px #aaa;padding: 3px;width: 99%;">
					<legend>评审结果信息</legend>
				<input name="files" id="fileids" class="nui-hidden" />
				<input name="files1" id="fileids1" class="nui-hidden" />
				<input class="nui-hidden" name="id" />
				<input class="nui-hidden" name="processid"/>
				<div style="padding: 5px;">
					<table style="table-layout: fixed;">
						<tr>
							<td width="100" align="right">评审结果名称：</td>
							<td colspan="3">
								<input name="reportName" id="reportName" class="nui-textbox"style="width: 100%" readonly="readonly"/>
							</td>
							<td align="right" style="width: 80px">申请单位：</td>
							<td colspan="3">
								<input name="createdOrgname"  class="nui-textbox" style="width: 100%" readonly="readonly" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width:100px">立项编号：</td>
							<td colspan="3">
								<input id="proappId" allowInput="false" class="nui-textbox" style="width: 100%" readonly="readonly"/>
							</td>
							<td align="right" style="width: 100px">立项名称：</td>
							<td colspan="3">
								<input name="proAppName" id="proAppName" class="nui-textbox" style="width: 100%;"  />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 80px">申请人：</td>
							<td colspan="1">
								<input name="createdByName" class="nui-textbox" style="width: 100%" readonly="readonly"/>
							</td>
							<td align="right" style="width: 100px">采购方式：</td>
							<td colspan="1">
            	<input id="purchasMode" name="purchasMode" class="nui-textbox"  readonly="readonly" style="width:100%;"/>
							</td>
							<td class="form_label" align="right" style="width:120px;">归口部门：</td>
							<td colspan="3">
								<input id="putunder" name="putunder" class="nui-dictcombobox" dictTypeId="ZH_PUTUNDER" readonly="readonly" style="width:100%;" />
							</td>
						</tr>
						<tr>
							<td align="right">集采类型：</td>
							<td >    
								<input class="nui-dictcombobox" name="type" id="type" dictTypeId="ZH_PURCHASE" style="width:100%;"  readonly="readonly" />
							</td>
							<td align="right" style="width: 100px">立项金额：</td>
							<td colspan="1">
								<input name="proAppApplyPrice" id="proAppApplyPrice" class="nui-textbox"
									style="width: 100%;" readonly="readonly" />
							</td>
						</tr>
						<tr>
							<td class="form_label" align="right" style="width:140px;">评审结果说明：</td>
							<td colspan="5">
								<input style="width:100%;height: 120px;" name="remark" id="remark" class="nui-textarea" readonly="readonly" />
							</td>
						</tr>
					</table>
				</div>
			</fieldset>
			<fieldset id="field1" style="border: solid 1px #aaa;padding: 3px;width: 99%;">
					<legend>完善定标信息</legend>
					<div style="padding: 5px;">
					<table style="table-layout: fixed;"width="60%">
						<tr>
							<td align="right">中标单位：</td>
							<td colspan="3">    
								<input class="nui-textbox" name="winner" id="winner"  style="width:100%;" required="true"/>
							</td>
							<td align="right" style="width: 120px">中标金额（万元）：</td>
							<td colspan="1">
								<input name="awardAmount" id="awardAmount" class="nui-spinner" minValue="0" maxValue="999999"style="width: 100%;" required="true"/>
							</td>
						</tr>
					</table>
				</div>
			</fieldset>
			</form>
		<fieldset style="height:80%; border:solid 1px #aaa;padding:1px;width: 99%">
			<legend>采购计划明细</legend>
			<div class="fieldset-body" style="width:100%; height:100%; margin: 0px auto">
				<div id="grid_detail" class="nui-datagrid" style="width: 100%;height: auto;"
					dataField="datas" showPager="false" multiSelect="true"
					url="com.zhonghe.ame.purchase.dao.projectApproval.queryProAppDtl.biz.ext">
					<div property="columns">
						<div type="indexcolumn" align="center" headerAlign="center" visible="false"></div>
						<div field="planName" width="110" align="center" headerAlign="center">计划名称</div>
						<div field="code" width="100" align="center" headerAlign="center">计划编号</div>
						<div field="materialName" width="110" align="center" headerAlign="center">采购物项名称
						</div>
						<div field="budgetAmount" width="100" align="center" headerAlign="center">预算金额(万元)
						</div>
						<div field="amount" width="100" align="center" headerAlign="center">立项金额(万元)</div>
						<div field="sumamount" width="110" align="center" headerAlign="center"
							vtype="required">剩余可立项金额(万元)</div>
						<div field="needOrgName" width="80" align="left" headerAlign="center">采购单位</div>
					</div>
				</div>
			</div>
		</fieldset>
		<fieldset id="field2" style="border:solid 1px #aaa;padding:3px;">
			<legend>附件(采购文件、评审报告、合同及会议纪要（若有）)</legend>
			<jsp:include page="/purchase/common/inputFilePurchase1.jsp"/>
		</fieldset>
		<fieldset id="field2" style="border:solid 1px #aaa;padding:3px;">
			<legend>审批信息</legend>
			<jsp:include page="/ame_common/misOpinion.jsp"/>
		</fieldset>
	</div>
</div>
	<div style="text-align: center;padding: 10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk(1)" id="creatReimbProcess" iconCls="icon-ok" style="width: 80px;margin-right: 20px;">提交</a>
<!-- 		<a class="nui-button" onclick="onOk(2)" id="zzFeame" iconCls="icon-split" style="width: 80px;margin-right: 20px;">中止</a>	 -->
		<a class="nui-button" onclick="closeCancel()" id="saveReimbProcess" iconCls="icon-close" style="width: 80px;margin-right: 140px;">关闭</a>
	</div>
	<script type="text/javascript">
    nui.parse();
    var form = new nui.Form("#form1");
    var id = <%=request.getParameter("id")%>;
		init();
		var gridDtl = nui.get("grid_detail");
    function init(){
    	var json = nui.encode({"workitemid":<%=workitemid%>});
	  		nui.ajax({
			    url: "com.zhonghe.ame.purchase.purchaseReviewReport.queryReviewReport.biz.ext",
			    data: json,
			    type: 'POST',
			    cache: false,
			    contentType: 'text/json',
			    success: function (o) {
					 var result=o.reviewReport[0];
					 form.setData(result);
					 nui.get("proappId").setValue(result.proAppCode);
					 gridDtl.load({"pid":result.proappId})
					 
					 var grid_1 = nui.get("grid_1");
				 		grid_1.load({"groupid":"purReviewReport","relationid":result.id});
					 	grid_1.sortBy("fileTime","desc");
					 
					 var grid = nui.get("datagrid1");
					 grid.load({processInstID:result.processid});
					 grid.sortBy("time", "desc");
						 //设置审核意见基本信息
						nui.get("processinstid").setValue(o.workitem.processInstID);
		       	nui.get("processinstname").setValue(o.workitem.processInstName);
		       	nui.get("activitydefid").setValue(o.workitem.activityDefID);
		       	nui.get("workitemname").setValue(o.workitem.workItemName);
						nui.get("workitemid").setValue(<%=workitemid %>);
		       	nui.get("isshow").setValue("1");
		       	nui.get("auditstatus").setValue("4");
		       	document.getElementById("salesEdit").style.display="none";
		       	nui.get("auditopinion").setValue("已完善");
		        },
            error: function (jqXHR, textStatus, errorThrown) {
                alert(jqXHR.responseText);
            }
        });
		}
		
		
		function onOk(e){
    		nui.get("auditstatus").setValue("4");
    		istype = e;
			if(istype==1){
				if(!form.validate()){
    			showTips("请检查表单完整性","danger");
    			return;
    		}
				info="是否提交？"
			}else if(istype==0){
				info="是否暂时保存？"
			}else{
				info="是否中止流程？"
				nui.get("auditstatus").setValue(2);
			}
			document.getElementById("fileCatalog1").value="purReviewReport";
	    	
	    	nui.confirm("确定"+info,"系统提示",
	        function(action){
	            if(action=="ok"){
		    		fileForm1.submit();
				}
			})
    }
	    
    function SaveData(){
			var data = form.getData();
			data.istype=istype;
			data.judge = getJudge();
			data.files = nui.get("fileids").getValue();
			var data_opioion = opioionform.getData();
			var json = nui.encode({'param':data,'reviewReport':data,workItemID: <%=workitemid %>,"misOpinion":data_opioion.misOpinion});
				var msgBoxId = nui.loading("正在处理...", "请稍后");
				nui.ajax({
					url: "com.zhonghe.ame.purchase.purchaseReviewReport.purReviewReportApproval.biz.ext",
					type: 'POST',
					data: json,
					success: function (text) {
						if (text.result == "1") {
							showTips("提交成功")
							closeOk();
						} else {
							nui.hideMessageBox(msgBoxId);
							nui.alert("提交失败")
						}
					}
				});
    	}
    	
     function onButtonEdit(e) {
			var btnEdit = this;
			mini.open({
				url: "/default/purchase/project/procurementProAppList.jsp",
				title: "采购立项列表",
				width: '73%',
				height: 450,
				ondestroy: function (action) {
					if (action == "ok") {
						var iframe = this.getIFrameEl();
						var data = iframe.contentWindow.GetData();
						data = mini.clone(data);    //必须
						if (data) {
							btnEdit.setValue(data.id);
							btnEdit.setText(data.proAppCode);
							nui.get("proAppName").setValue(data.proAppName);
							nui.get("proAppApplyPrice").setValue(data.proAppApplyPrice);
							nui.get("putunder").setValue(data.putunder);
							nui.get("purchasMode").setValue(data.purchasMode);
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
        

    </script></body>
</html>
