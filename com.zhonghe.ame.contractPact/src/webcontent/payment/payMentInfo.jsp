
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
	<title>付款信息 </title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin: 0;padding: 0;border: 0;width: 100%;height: 100%;overflow: hidden;	
	    } 
    </style>
</head>
<body>
	<div class="nui-fit">
		<div class="mini-panel" title="" style="width: 100%;">
			<fieldset id="field1" style="border: solid 1px #aaa;padding: 3px;width: 100%;">
				<legend>付款信息</legend>
				<form id="form1" method="post">
						<input name="files" id="fileids" class="nui-hidden"/>
						<input class="nui-hidden" name="id"/>
<!-- 					<input name="expusername" id="expusername" class="nui-hidden"/> -->
<!-- 					<input name="senderusername" id="senderusername" class="nui-hidden"/> -->
<!-- 					<input id="empid" class="nui-hidden" /> -->
					<div style="padding: 5px;">
						<table style="table-layout: fixed;">
							<tr>
							<td class="form_label" align = "right"> 申请人</td>
								<td>
									<input name="createUserid" id="createUserid" class="nui-hidden" style="width: 300px"/>
									<input id="createUsername" class="nui-textbox" enabled="false" style="width: 300px" required="true"/>
								</td>
							<td align="right" style="width:160px">申请日期：</td>
								<td><input id="createTime" name="createTime" enabled="false" class="nui-datepicker" style="width: 300px"/></td>
							<td align="right" style="width: 160px">签约方：</td>
									<td><input id="signatory" name="signatory" enabled="false" class="nui-textbox" style="width: 300px"/></td>
							</tr>
							<tr>
								<td align="right" style="width: 160px">付款方：</td>
									<td><input id="payer" name="payer"  class="nui-dictcombobox" dictTypeId="ZH_INVOICE_NAME_TYPE" style="width: 300px" required="true" enabled="false"/></td>
								<td align="right" style="width: 160px">合同名称：</td>
									<td><input id="contractName" name="contractName" enabled="false" class="nui-textbox" style="width: 300px"/></td>
								<td align="right" style="width: 160px">合同编号：</td>
									<td><input id="contractId" name="contractId" enabled="false" class="nui-textbox" style="width: 300px"/></td>
							</tr>
							<tr>
								<td align="right" style="width: 160px">合同金额（元）：</td>
									<td><input id="contractSum" name="contractSum" enabled="false" class="nui-textbox" style="width: 300px" required="true"/></td>
								<td align="right" style="width: 160px">合同金额大写：</td>
									<td><input id="contractSumCapital" name="contractSumCapital" enabled="false" class="nui-textbox" style="width: 300px" required="true"/></td>
								<td align="right" style="width: 160px">累计已付金额（元）：</td>
									<td><input id="paidContractSum" name="paidContractSum" enabled="false" class="nui-textbox" style="width: 300px" required="true"/></td>
							</tr>
							<tr>
								<td align="right" style="width: 160px">累计已付金额大写：</td>
									<td><input id="paidContractSumCapital" name="paidContractSumCapital" enabled="false" class="nui-textbox" style="width: 300px"/></td>
								<td align="right" style="width:160px">本次申请支付金额（元）：</td>
									<td><input id="applyPayContractSum" name="applyPayContractSum" enabled="false" class="nui-textbox" style="width: 300px"/></td>
								<td align="right" style="width:160px">本次申请支付金额大写：</td>
									<td><input id="applyPayContractSumCapital" name="applyPayContractSumCapital" enabled="false" class="nui-textbox" style="width: 300px"/></td>
							</tr>
							<tr>
								<td align="right" style="width: 160px">最晚付款日期：</td>
									<td >
										<input name="endTime" id="endTime" class="nui-datepicker" enabled="false" style="width: 300px;" />
									</td>
								<td align="right" style="width: 160px">收款单位开户行名称：</td>
									<td >
										<input name="accountName" id="accountName" class="nui-textbox" enabled="false" style="width: 300px;" />
									</td>
								<td align="right" style="width: 160px">开户行账号：</td>
									<td >
										<input name="account" id="account" class="nui-textbox" enabled="false" style="width: 300px;" />
									</td>
							</tr>
							<tr>
								<td align="right" style="width: 160px">采购计划编号：</td>
									<td><input id="purchasePlan" name="purchasePlan" enabled="false" class="nui-textbox" style="width: 300px"/></td>
								<td align="right" style="width: 160px">合同类型：</td>
									<td><input id="laborDispatchingFlag" name="laborDispatchingFlag" enabled="false" class="nui-dictcombobox" dictTypeId="ZH_LABOR_DISPATCHING_FLAG" style="width: 300px" required="true"/></td>
							</tr>
						</table>
					</div>
				</form>
			</fieldset>

	<div id="tabs1" class="nui-tabs" activeIndex="0" style="width:auto;height:100%">
	    <div title="相关附件">
			<jsp:include page="/ame_common/detailFile.jsp"/>
		</div>
	</div>

		</div>
	</div>
	<div style="text-align: center;padding: 10px;" class="nui-toolbar">
<!-- 		<a class="nui-button" onclick="onOk()" id="creatReimbProcess" style="width: 80px;margin-right: 20px;">保存</a> -->
		<a class="nui-button" onclick="onCancel" id="saveReimbProcess" style="width: 80px;margin-right: 140px;">关闭</a>
	</div>
	<script type="text/javascript">
        nui.parse();
        <%
	   		UserObject user = (UserObject) session.getAttribute("userObject");
	   		String username = user.getUserName();
	   		String userno = user.getUserId();
	   		String userOrgName = user.getUserOrgName();
	   		String userOrgId = user.getUserOrgId();
	   		Map<String,Object> a = user.getAttributes();
	   		String empid = (String) a.get("empid");
	   		DataObject[] roles = (DataObject[])a.get("roles");
	    %>
		var form = new nui.Form("form1");
		isViewDelete=false;
//         init();
        function init(){
        	
		  	nui.get("createUserid").setValue("<%=userno %>");
		  	nui.get("createUsername").setValue("<%=username %>");
<%-- 		  	nui.get("senderusername").setValue("<%=username %>"); --%>
<%-- 		  	nui.get("expusername").setValue("<%=username %>"); --%>
<%-- 		  	//nui.get("exporgid").setValue("<%=userOrgId %>"); --%>
<%-- 		  	//nui.get("exporgid").setText("<%=userOrgName %>"); --%>
<%-- 		  	nui.get("orgId").setValue("<%=userOrgId %>"); --%>
<%-- 		  	nui.get("orgId").setText("<%=userOrgName %>"); --%>
<%-- 		  	var datas = {value : "<%=userOrgId %>"};    --%>
        }
    	function onOk(){
			//定义变量接受form表单数据
			var form = new nui.Form("#form1");
			var data = form.getData(); 
		  	document.getElementById("fileCatalog").value="feameAgreementinfo";
			form2.submit();
	    }
    	
		function opinion(data){
			//合同承办部门
			$('#undertakeOrg').val();
			var undertakeOrg = nui.get("undertakeOrg").value;
			if(undertakeOrg){
				data.undertakeOrg=undertakeOrg;
			}
			//会签部门
			$('#countersignOrg').val();
			var countersignOrg = nui.get("countersignOrg").value;
			if(countersignOrg){
				data.countersignOrg=countersignOrg;
			}
			//经营计划部
			$('#manageOrg').val();
			var manageOrg = nui.get("manageOrg").value;
			if(manageOrg){
				data.manageOrg=manageOrg;
			}
			//审计法务部
			$('#auditOrg').val();
			var auditOrg = nui.get("auditOrg").value;
			if(auditOrg){
				data.auditOrg=auditOrg;
			}
			//总经理
			$('#generalManager').val();
			var generalManager = nui.get("generalManager").value;
			if(generalManager){
				data.generalManager=generalManager;
			}
			//法人
			$('#legalPerson').val();
			var legalPerson = nui.get("legalPerson").value;
			if(legalPerson){
				data.legalPerson=legalPerson;
			}
		}
		
		function setViewData(data){
			if(null != data.createUserid){
				nui.get("createUserid").setValue(data.createUserid);
			}
			if(null != data.empname){
				nui.get("createUsername").setValue(data.empname);
			}
			if(null != data.createTime){
				nui.get("createTime").setValue(data.createTime);
			}
			if(null != data.signatory){
				nui.get("signatory").setValue(data.signatory);
			}
			if(null != data.payer){
				nui.get("payer").setValue(data.payer);
			}
			if(null != data.contractName){
				nui.get("contractName").setValue(data.contractName);
			}
			if(null != data.contractId){
				nui.get("contractId").setValue(data.contractId);
			}
			if(null != data.actContractSum){
				nui.get("contractSum").setValue(data.actContractSum);
				nui.get("contractSumCapital").setValue(numberParseChina(data.actContractSum));
			}
			if(null != data.actContractSumCapital){
				nui.get("contractSumCapital").setValue(data.actContractSumCapital);
			}
			if(null != data.paidContractSum){
				nui.get("paidContractSum").setValue(data.paidContractSum);
			}
			if(null != data.paidContractSumCapital){
				nui.get("paidContractSumCapital").setValue(data.paidContractSumCapital);
			}
			if(null != data.applyPayContractSum){
				nui.get("applyPayContractSum").setValue(data.applyPayContractSum);
			}
			if(null != data.applyPayContractSumCapital){
				nui.get("applyPayContractSumCapital").setValue(data.applyPayContractSumCapital);
			}
			if(null != data.endTime){
				nui.get("endTime").setValue(data.endTime);
			}
			if(null != data.accountName){
				nui.get("accountName").setValue(data.accountName);
			}
			if(null != data.account){
				nui.get("account").setValue(data.account);
			}
			if(null != data.purchasePlan){
				nui.get("purchasePlan").setValue(data.purchasePlan);
			}
			if(null != data.laborDispatchingFlag){
				nui.get("laborDispatchingFlag").setValue(data.laborDispatchingFlag);
			}
			var grid_0 = nui.get("grid_0");
        	grid_0.load({"groupid":"PAY_MENT","relationid":data.id});
			grid_0.sortBy("fileTime","desc");
			
			setTimeout(function(){
				//注销掉删除操作
				$(".Delete_Button").hide();
			},300);
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
