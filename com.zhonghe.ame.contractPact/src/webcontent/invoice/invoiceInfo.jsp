
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
	<title>开票信息 </title>
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
				<legend></legend>
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
							<td align="right" style="width: 160px">申请单位：</td>
									<td >
										<input name="implementOrg" id="implementOrg" class="nui-hidden" style="width: 300px;" />
										<input id="implementOrgname" class="nui-combobox" enabled="false" style="width: 300px" required="true"/>
									</td>
<!-- 								<td><input id="implementOrg" name="implementOrg"  class="nui-textbox" style="width: 300px"/></td> -->
							</tr>
							<tr>
								<td align="right" style="width: 160px">合同名称：</td>
									<td><input id="contractName" name="contractName" enabled="false" class="nui-textbox" style="width: 300px"/></td>
								<td align="right" style="width: 160px">合同编号：</td>
									<td><input id="contractNo" name="contractNo" enabled="false" class="nui-textbox" style="width: 300px"/></td>
								<td align="right" style="width: 160px">增值税发票类型：</td>
									<td><input id="invoiceType" name="invoiceType" enabled="false" class="nui-dictcombobox" dictTypeId="MIS_MA_INVOICETYPE" style="width: 300px"/></td>
							</tr>
							<tr>
								<td align="right" style="width: 160px">集团内外：</td>
									<td><input id="headquarterGroup" name="headquarterGroup" enabled="false" class="nui-dictcombobox" dictTypeId="ZH_GROUP" style="width: 300px" required="true"/></td>
								<td align="right" style="width: 160px">开票金额（小写）：</td>
									<td><input id="invoiceSum" name="invoiceSum" enabled="false" class="nui-textbox" style="width: 300px"/></td>
								<td align="right" style="width:160px">开票金额（大写）：</td>
									<td><input id="invoiceSumCapital" name="invoiceSumCapital" enabled="false" class="nui-textbox" style="width: 300px"/></td>
							</tr>
							<tr>
								<td align="right" style="width: 160px">付款单位：</td>
									<td><input id="payerName" name="payerName" enabled="false" class="nui-textbox" style="width: 300px" required="true"/></td>
								<td align="right" style="width: 160px">纳税人识别号：</td>
									<td><input id="taxpayerNumber" name="taxpayerNumber" enabled="false" class="nui-textbox" style="width: 300px" required="true"/></td>
								<td align="right" style="width: 160px">开户行账号：</td>
									<td><input id="account" name="account" enabled="false" class="nui-textbox" style="width: 300px" required="true"/></td>
							</tr>
							<tr>
								<td align="right" style="width:160px">单位地址：</td>
									<td><input id="unitAddress" name="unitAddress" enabled="false" class="nui-textbox" style="width: 300px" required="true"/></td>
								<td align="right" style="width:160px">单位电话：</td>
									<td><input id="unitPhone" name="unitPhone" enabled="false" class="nui-textbox" style="width: 300px" required="true"/></td>
								<td align="right" style="width: 160px">开票是否邮寄：</td>
									<td><input id="postFlag" name="postFlag" enabled="false" class="nui-dictcombobox" dictTypeId="ZH_POST" style="width: 300px" required="true"/></td>
							</tr>
							<tr>
								<td align="right" style="width: 160px">开票内容：</td>
									<td><input id="content" name="content" enabled="false" class="nui-dictcombobox" dictTypeId="ZH_INVOICE_CONTENT" style="width: 300px" required="true"/></td>
								<td align="right" style="width: 160px">工程类别：</td>
									<td><input id="projectType" name="projectType" enabled="false" class="nui-dictcombobox" dictTypeId="ZH_PROJECT_TYPE" style="width: 300px" required="true"/></td>
								<td align="right" style="width:160px">开票内容情况说明：</td>
									<td><input id="contentInfo" name="contentInfo" enabled="false" class="nui-textbox" style="width: 300px" required="true"/></td>
							</tr>
							<tr>
								<td align="right" style="width:160px">预计到账时间：</td>
									<td><input id="scheduledTime" name="scheduledTime" enabled="false" class="nui-datepicker" style="width: 300px" required="true"/></td>
								<td align="right" style="width: 160px">发票邮寄地址：</td>
									<td><input id="mailingAddress" name="mailingAddress" enabled="false" class="nui-textbox" style="width: 300px" required="true"/></td>
								<td align="right" style="width:160px">发票领取人：</td>
									<td><input id="invoiceUser" name="invoiceUser" enabled="false" class="nui-textbox" style="width: 300px" required="true"/></td>
							</tr>
							<tr>
								<td align="right" style="width:160px">发票邮寄日期：</td>
									<td><input id="invoicePostTime" name="invoicePostTime" enabled="false" class="nui-datepicker" style="width: 300px" required="true"/></td>
								<td align="right" style="width: 160px">发票不含税金额：</td>
									<td><input id="invoicePriceExcludingTax" name="invoicePriceExcludingTax" enabled="false" class="nui-textbox"  style="width: 300px" required="true"/></td>
								<td align="right" style="width: 160px">发票税额：</td>
									<td><input id="invoiceTax" name="invoiceTax" enabled="false" class="nui-textbox" style="width: 300px" required="true"/></td>
							</tr>
							<tr>
								<td align="right" style="width: 100px">专业类别：</td>
									<td><input id="major" name="major" enabled="false" class="nui-dictcombobox" dictTypeId="ZH_MAJOR_TYPE" style="width: 300px" required="true"/></td>
								<td align="right" style="width: 160px">发票抬头类别：</td>
									<td><input id="invoiceNameType" name="invoiceNameType" enabled="false" class="nui-dictcombobox" dictTypeId="ZH_INVOICE_NAME_TYPE" style="width: 300px" required="true"/></td>
							</tr>
							<tr>
								<td align="right" style="width:160px">备注：</td>
									<td colspan="8"><input id="invoiceRemark" name="invoiceRemark" enabled="false" class="nui-textarea" style="width:100%;height: 50px" required="true"/></td>
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
	<fieldset id="fd_list" style="height:200px; border:solid 1px #aaa;padding:3px;">
					<div class="fieldset-body"  style="width:100%; height:100%; margin: 0px auto">
<!-- 					<a  class="nui-button" id="invoicesourcing_add" onclick="addRow()" plain="true" style="float: left;" iconCls="icon-add" >新增</a> -->
<!-- 					<a  class="nui-button" id="invoicesourcing_del" onclick="removeTicket()" plain="true" style="float: left;" iconCls="icon-remove" >删除</a> -->
							<div id="invoicesourcing" class="nui-datagrid" style="width:100%; height:180px" showPager="false" allowCellEdit="false" allowCellSelect="true" 
							url="com.zhonghe.ame.invoice.invoice.queryInvoiceIdByinvoiceItem.biz.ext"
							>
					        <div property="columns">
							    <div type="indexcolumn">序号</div>
					            <div field="arrivalAmount" headerAlign="center" >到账金额（元）
					            	<input property="editor"  class="nui-textbox" />
					            </div>  
					            <div field="receivedDate" headerAlign="center"  >到账日期
					            	<input property="editor" class="nui-textbox" />
					            </div>
				           		 <div field="remark" headerAlign="center" >备注
					            	<input property="editor"  class="nui-textbox" />
					            </div>  
					        </div>
						</div>
						</div>
			</fieldset>
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
//         init();
		isViewDelete=false;
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
			if(null != data.implementOrg){
				nui.get("implementOrg").setValue(data.implementOrg);
				nui.get("implementOrgname").setText(data.orgname);
			}
			if(null != data.contractName){
				nui.get("contractName").setValue(data.contractName);
			}
			if(null != data.contractNo){
				nui.get("contractNo").setValue(data.contractNo);
			}
			if(null != data.invoiceType){
				nui.get("invoiceType").setValue(data.invoiceType);
			}
			if(null != data.headquarterGroup){
				nui.get("headquarterGroup").setValue(data.headquarterGroup);
			}
			if(null != data.invoiceSum){
				nui.get("invoiceSum").setValue(data.invoiceSum);
			}
			if(null != data.invoiceSumCapital){
				nui.get("invoiceSumCapital").setValue(data.invoiceSumCapital);
			}
			if(null != data.payerName){
				nui.get("payerName").setValue(data.payerName);
			}
			if(null != data.taxpayerNumber){
				nui.get("taxpayerNumber").setValue(data.taxpayerNumber);
			}
			if(null != data.account){
				nui.get("account").setValue(data.account);
			}
			if(null != data.unitAddress){
				nui.get("unitAddress").setValue(data.unitAddress);
			}
			if(null != data.unitPhone){
				nui.get("unitPhone").setValue(data.unitPhone);
			}
			if(null != data.postFlag){
				nui.get("postFlag").setValue(data.postFlag);
			}
			if(null != data.content){
				nui.get("content").setValue(data.content);
			}
			if(null != data.projectType){
				nui.get("projectType").setValue(data.projectType);
			}
			if(null != data.contentInfo){
				nui.get("contentInfo").setValue(data.contentInfo);
			}
			if(null != data.scheduledTime){
				nui.get("scheduledTime").setValue(data.scheduledTime);
			}
			if(null != data.mailingAddress){
				nui.get("mailingAddress").setValue(data.mailingAddress);
			}
			if(null != data.invoiceUser){
				nui.get("invoiceUser").setValue(data.invoiceUser);
			}
			if(null != data.invoicePostTime){
				nui.get("invoicePostTime").setValue(data.invoicePostTime);
			}
			if(null != data.invoicePriceExcludingTax){
				nui.get("invoicePriceExcludingTax").setValue(data.invoicePriceExcludingTax);
			}
			if(null != data.invoiceTax){
				nui.get("invoiceTax").setValue(data.invoiceTax);
			}
			if(null != data.invoiceNameType){
				nui.get("invoiceNameType").setValue(data.invoiceNameType);
			}
			if(null != data.invoiceRemark){
				nui.get("invoiceRemark").setValue(data.invoiceRemark);
			}
			var grid_0 = nui.get("grid_0");
        	grid_0.load({"groupid":"INVOICE","relationid":data.id});
			grid_0.sortBy("fileTime","desc");
			
			var jsonData = {"invoiceId":data.id}
			nui.get("invoicesourcing").load(jsonData);
			setTimeout(function(){
				//注销掉删除操作
				$(".Delete_Button").hide();
			},300);
		}
		
// 		function setViewData(data){
// 			setEditData(data);

// 				nui.get("createTime").disable();
// 				nui.get("implementOrg").disable();
// 				nui.get("contractName").disable();
// 				nui.get("signatory").disable();
// 				nui.get("projectSize").disable();
// 				nui.get("projectLocal").disable();
// 				nui.get("startTime").disable();
// 				nui.get("endTime").disable();


// 				nui.get("creatReimbProcess").hide();

// 		}
		
		
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
