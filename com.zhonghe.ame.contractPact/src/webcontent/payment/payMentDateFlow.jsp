
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.List"%>
<%@page import="commonj.sdo.DataObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@ page import="java.util.Map" %>
<%
	String contextPath=request.getContextPath();
 %>
<html>
<!-- 
  - Author(s): wanglinqiong
  - Date: 2016-05-12 16:17:56
  - Description:
-->
<head>
	<title>付款流程审批 </title>
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
			<fieldset id="field1" style="border: solid 1px #aaa;padding: 3px;width: 100%;">
				<legend>付款流程审批信息</legend>
				<form id="form1" method="post">
<!-- 						<input name="files" id="fileids" class="nui-hidden"/> -->
<!-- 						<input class="nui-hidden" name="id"/> -->
<!-- 					<input name="expusername" id="expusername" class="nui-hidden"/> -->
<!-- 					<input name="senderusername" id="senderusername" class="nui-hidden"/> -->
<!-- 					<input id="empid" class="nui-hidden" /> -->
					<div style="padding: 5px;">
						<table style="table-layout: fixed;">
							<tr>
							<td class="form_label" align = "right"> 申请人</td>
								<td>
									<input name="createUserid" id="createUserid" class="nui-hidden" style="width: 200px"/>
									<input id="createUsername" class="nui-textbox" enabled="false" style="width: 200px" required="true"/>
								</td>
							<td align="right" style="width:160px">申请日期：</td>
								<td><input id="createTime" name="createTime" enabled="false" class="nui-datepicker" style="width: 200px"/></td>
							<td align="right" style="width: 160px">签约方：</td>
								<td><input id="signatory" name="signatory"  class="nui-textbox" enabled="false" style="width: 200px" required="true"/></td>
							</tr>
							<tr>
								<td align="right" style="width: 160px">付款方：</td>
									<td>
									<input id="payer" name="payer" enabled="false" class="nui-dictcombobox" dictTypeId="ZH_INVOICE_NAME_TYPE" style="width: 200px"/>
									</td>
								<td align="right" style="width: 160px">合同名称：</td>
									<td><input id="contractName" name="contractName" enabled="false" class="nui-textbox" style="width: 200px"/></td>
								<td align="right" style="width: 160px">合同编号：</td>
									<td><input id="contractId" name="contractId" enabled="false" class="nui-textbox" style="width: 200px"/></td>
							</tr>
							<tr>
								<td align="right" style="width: 160px">合同金额（元）：</td>
									<td><input id="contractSum" name="contractSum"  class="nui-textbox" enabled="false"  style="width: 200px" required="true"/></td>
								<td align="right" style="width: 160px">合同金额大写：</td>
									<td><input id="contractSumCapital" name="contractSumCapital"  class="nui-textbox" enabled="false" style="width: 200px" required="true"/></td>
								<td align="right" style="width: 160px">累计已付金额（元）：</td>
									<td><input id="paidContractSum" name="paidContractSum"  class="nui-textbox" enabled="false" style="width: 200px" required="true"/></td>
							</tr>
							<tr>
								<td align="right" style="width: 160px">累计已付金额大写：</td>
									<td><input id="paidContractSumCapital" name="paidContractSumCapital"  class="nui-textbox" enabled="false" style="width: 200px" required="true"/></td>
								<td align="right" style="width: 160px">本次申请支付金额（元）：</td>
									<td><input id="applyPayContractSum" name="applyPayContractSum"  class="nui-textbox" enabled="false" style="width: 200px" required="true"/></td>
								<td align="right" style="width: 160px">本次申请支付金额大写：</td>
									<td><input id="applyPayContractSumCapital" name="applyPayContractSumCapital"  class="nui-textbox" enabled="false" style="width: 200px" required="true"/></td>
							</tr>
							<tr>
								<td align="right" style="width:160px">最晚付款日期：</td>
									<td><input id="endTime" name="endTime"  class="nui-datepicker" enabled="false" style="width: 200px" required="true"/></td>
								<td align="right" style="width: 160px">收款单位开户行名称：</td>
									<td><input id="accountName" name="accountName"  class="nui-textbox" enabled="false" style="width: 200px" required="true"/></td>
								<td align="right" style="width: 160px">开户行账号：</td>
									<td><input id="account" name="account" class="nui-textbox" enabled="false" style="width: 200px" required="true"/></td>
							</tr>
							<tr>
								<td align="right" style="width: 160px">采购计划编号：</td>
									<td><input id="purchasePlan" name="purchasePlan" enabled="false" class="nui-textbox" style="width: 200px"/></td>
								<td align="right" style="width: 160px">是否为劳务派遣：</td>
									<td><input id="laborDispatchingFlag" name="laborDispatchingFlag" enabled="false" class="nui-dictcombobox" dictTypeId="ZH_LABOR_DISPATCHING_FLAG" style="width: 200px"/></td>
								<td align="right" style="width: 160px">实际付款日期：</td>
									<td><input id="payDate" name="payDate"  class="nui-datepicker" style="width: 200px"/></td>
							</tr>
						</table>
					</div>
				</form>
			</fieldset>

			<fieldset id="field2" style="border:solid 1px #aaa;padding:3px;">
				<legend>相关附件</legend>
				<jsp:include page="/ame_common/detailFile.jsp"/>
			</fieldset>

		</div>
	</div>
	<jsp:include page="/ame_common/misOpinion.jsp"/>
	<div style="text-align: center;padding: 10px;" class="nui-toolbar">
		<a class="nui-button" onclick="submit()" id="creatReimbProcess" style="width: 80px;margin-right: 20px;">提交</a>
		<a class="nui-button" onclick="onCancel" id="saveReimbProcess" style="width: 80px;margin-right: 140px;">关闭</a>
	</div>
	<script type="text/javascript">
        nui.parse();
    	var form = new nui.Form("form1");
    	var projectid = <%=request.getParameter("projectid")%>;
    	var workItemID = <%=request.getParameter("workItemID")%>;
    	var opioionform = new nui.Form("#opioionform");
    	var payMentId = "";
    	isViewDelete=false;
        init();
        function init(){
        	var data = {workitemid:<%=workitemid%>};
			var json = nui.encode(data);
			nui.ajax({
		        url: "com.zhonghe.ame.payment.payMent.queryPayMentInfo.biz.ext",
		        type: "post",
		        data: json ,
		        contentType:'text/json',
		        success: function (o) {
			            form.setData(o);
			            
			            nui.get("createUserid").setValue(o.data.createUserid);
			            nui.get("createTime").setValue(o.data.createTime);
				        nui.get("signatory").setValue(o.data.signatory);
				        nui.get("contractName").setValue(o.data.contractName);
				        nui.get("payer").setValue(o.data.payer);
				        nui.get("contractId").setValue(o.data.contractId);
				        nui.get("contractSum").setValue(o.data.contractSum);
				        nui.get("contractSumCapital").setValue(o.data.contractSumCapital);
				        nui.get("paidContractSum").setValue(o.data.paidContractSum);
				        nui.get("paidContractSumCapital").setValue(o.data.paidContractSumCapital);
				        nui.get("applyPayContractSum").setValue(o.data.applyPayContractSum);
				        nui.get("applyPayContractSumCapital").setValue(o.data.applyPayContractSumCapital);
				        nui.get("accountName").setValue(o.data.accountName);
				        nui.get("account").setValue(o.data.account);
				        nui.get("purchasePlan").setValue(o.data.purchasePlan);
				        nui.get("endTime").setValue(o.data.endTime);
				        nui.get("laborDispatchingFlag").setValue(o.data.laborDispatchingFlag);
				        nui.get("payDate").setValue(new Date());
				        payMentId = o.data.id;
				        nui.ajax({
		       				url: "com.zhonghe.ame.payment.payMent.queryPaymentById.biz.ext",
					        type: "post",
					        data: nui.encode({'id':o.data.id}) ,
					        contentType:'text/json',
					        success: function (o) {
					        nui.get("createUsername").setValue(o.data.empname);
// 					        nui.get("payername").setValue(o.data.orgname);
					        }
				        });
			            
			            nui.get("backTo").setData(o.data.backList);
			            
						//查询并加载附件
						var grid_0 = nui.get("grid_0");
        				grid_0.load({"groupid":"PAY_MENT","relationid":o.data.id});
						grid_0.sortBy("fileTime","desc");
						
						var grid = nui.get("datagrid1");
						grid.load({processInstID:o.data.processid});
						grid.sortBy("time", "desc");
						
						setTimeout(function(){
							//注销掉删除操作
							$(".Delete_Button").hide();
						},100);
						//初始化处理意见
						initMisOpinion({auditstatus:"1"});

			        }
			    });
        }
		function submit(){
	    	var auditstatus = nui.get("auditstatus").getValue();
	    	console.log(auditstatus);
	    	if(auditstatus == "2"){	//终止流程
	    		titleText = "终止";
	    		submitProcess("终止");
	    	}else if(auditstatus == "0"){	//退回流程
	    		if(!nui.get("backTo").getValue()){
	    			nui.alert("退回环节不能为空！");
	    			return;
	    		}
	    		titleText = "退回";
	    		submitProcess("退回");
	    	}else if(auditstatus == "1"){	//提交流程
	    		titleText = "提交";
	    		submitProcess("提交");
	    	}
    	}
    		 // 提交 
    function submitProcess(title){
    	nui.confirm("确定" + title + "流程吗？", "操作提示",function (action) {            
            if (action == "ok") {
            	saveRow();
				var misOpinion = opioionform.getData().misOpinion;//审核意见
            	nui.get("creatReimbProcess").setEnabled(false);
            	var json = {misOpinion:misOpinion,workItemID: <%=workitemid %>};
            	saveData(json);
            }
        });
    }
    	function saveData(json){
			console.log(json);
			 mini.mask({
		            el: document.body,
		            cls: 'mini-mask-loading',
		            html: titleText+'中...'
		        }); 
		    	  nui.ajax({
		  			url: "com.zhonghe.ame.payment.payMent.payMentReview.biz.ext",
					type: "post",
					data: json,
					contentType: "text/json",
					success: function (o){
						nui.unmask(document.body);
						if(o.result == "success"){
				        	nui.alert(titleText + "成功","系统提示",function(){
				        		//nui.get("sureButton").setEnabled(true);
				        		CloseWindow("ok");
				        	});
						}else{
							nui.alert("提交失败，请联系信息技术部人员！","系统提示", function(action){
								//nui.get("sureButton").setEnabled(true);
							    CloseWindow("ok");
								
							});
						}
					},
					error: function(jqXHR, textStatus, errorThrown){
						alert(jqXHR.responseText);
					}
		  		})  
		}
		
    	function saveRow(){
    	var payDate = nui.get("payDate").value;
    	var form1 = new nui.Form("form1");
    	var json = form1.getData();
    	var payMentObject = {'id':payMentId,'payDate':payDate}
    		nui.ajax({
		  			url: "com.zhonghe.ame.payment.payMent.updatePayMent.biz.ext",
					type: "post",
					data: nui.encode({'data':payMentObject}),
					success: function (o){
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
