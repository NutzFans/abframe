<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<html>
<head>
<title>打印页面</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/ame_common/js/jquery.qrcode.min.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/ame_common/js/JsBarcode.all.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/ame_common/js/jquery-barcode.js"></script>  
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
</head>
<body style="overflow-y:scroll;">
<div title="付款列表打印" style="height: auto" >
	<div id="pipi" class="nui-panel" style="font-size: 20px;width: 240px;height: 30px;margin-left: 309px"  align="left"></div>
	<div class="mini-panel" title="基本信息" style="width: 788px;height: 700px">
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
							<td class="form_label" align = "right"> 申请人：</td>
								<td>
									<input name="createUserid" id="createUserid" borderStyle="border:0" class="nui-hidden" style="width: 24px"/>
									<input id="createUsername" class="nui-textbox" borderStyle="border:0" enabled="false" style="width: 240px" required="true"/>
								</td>
							<td align="right" style="width:160px">申请日期：</td>
								<td><input id="createTime" name="createTime" enabled="false" borderStyle="border:0" class="nui-datepicker" style="width: 240px"/></td>
							</tr>
							<tr>
							<td align="right" style="width: 160px">申请单位：</td>
									<td >
										<input name="implementOrg" borderStyle="border:0" id="implementOrg" class="nui-hidden" style="width: 240px;" />
										<input id="implementOrgname" borderStyle="border:0" class="nui-combobox" enabled="false" style="width: 240px" required="true"/>
									</td>
<!-- 								<td><input id="implementOrg" name="implementOrg"  class="nui-textbox" style="width: 240px"/></td> -->
							
								<td align="right" style="width: 160px">合同名称：</td>
									<td><input id="contractName" borderStyle="border:0" name="contractName" enabled="false" class="nui-textbox" style="width: 240px"/></td>
							</tr>
							<tr>
								<td align="right" style="width: 160px">合同编号：</td>
									<td><input id="contractNo" borderStyle="border:0" name="contractNo" enabled="false" class="nui-textbox" style="width: 240px"/></td>
								<td align="right" style="width: 160px">增值税发票类型：</td>
									<td><input id="invoiceType" borderStyle="border:0" name="invoiceType" enabled="false" class="nui-dictcombobox" dictTypeId="MIS_MA_INVOICETYPE" style="width: 240px"/></td>
							</tr>
							<tr>
								<td align="right" style="width: 160px">集团内外：</td>
									<td><input id="headquarterGroup" borderStyle="border:0" name="headquarterGroup" enabled="false" class="nui-dictcombobox" dictTypeId="ZH_GROUP" style="width: 240px" required="true"/></td>
								<td align="right" style="width: 160px">开票金额（小写）：</td>
									<td><input id="invoiceSum" borderStyle="border:0" name="invoiceSum" enabled="false" class="nui-textbox" style="width: 240px"/></td>
							</tr>
							<tr>
								<td align="right" style="width:160px">开票金额（大写）：</td>
									<td><input id="invoiceSumCapital" borderStyle="border:0" name="invoiceSumCapital" enabled="false" class="nui-textbox" style="width: 240px"/></td>
							
								<td align="right" style="width: 160px">付款单位：</td>
									<td><input id="payerName" borderStyle="border:0" name="payerName" enabled="false" class="nui-textbox" style="width: 240px" required="true"/></td>
							</tr>
							<tr>
								<td align="right" style="width: 160px">纳税人识别号：</td>
									<td><input id="taxpayerNumber" borderStyle="border:0" name="taxpayerNumber" enabled="false" class="nui-textbox" style="width: 240px" required="true"/></td>
								<td align="right" style="width: 160px">开户行账号：</td>
									<td><input id="account" borderStyle="border:0" name="account" enabled="false" class="nui-textbox" style="width: 240px" required="true"/></td>
							</tr>
							<tr>
								<td align="right" style="width:160px">单位地址：</td>
									<td><input id="unitAddress" borderStyle="border:0" name="unitAddress" enabled="false" class="nui-textbox" style="width: 240px" required="true"/></td>
								<td align="right" style="width:160px">单位电话：</td>
									<td><input id="unitPhone" borderStyle="border:0" name="unitPhone" enabled="false" class="nui-textbox" style="width: 240px" required="true"/></td>
							</tr>
							<tr>
								<td align="right" style="width: 160px">开票是否邮寄：</td>
									<td><input id="postFlag" borderStyle="border:0" name="postFlag" enabled="false" class="nui-dictcombobox" dictTypeId="ZH_POST" style="width: 240px" required="true"/></td>
							
								<td align="right" style="width: 160px">开票内容：</td>
									<td><input id="content" borderStyle="border:0" name="content" enabled="false" class="nui-dictcombobox" dictTypeId="ZH_INVOICE_CONTENT" style="width: 240px" required="true"/></td>
							</tr>
							<tr>
								<td align="right" style="width: 160px">工程类别：</td>
									<td><input id="projectType" borderStyle="border:0" name="projectType" enabled="false" class="nui-dictcombobox" dictTypeId="ZH_PROJECT_TYPE" style="width: 240px" required="true"/></td>
								<td align="right" style="width:160px">开票内容情况说明：</td>
									<td><input id="contentInfo" borderStyle="border:0" name="contentInfo" enabled="false" class="nui-textbox" style="width: 240px" required="true"/></td>
							</tr>
							<tr>
								<td align="right" style="width:160px">预计到账时间：</td>
									<td><input id="scheduledTime" borderStyle="border:0" name="scheduledTime" enabled="false" class="nui-datepicker" style="width: 240px" required="true"/></td>
								<td align="right" style="width: 160px">发票邮寄地址：</td>
									<td><input id="mailingAddress" borderStyle="border:0" name="mailingAddress" enabled="false" class="nui-textbox" style="width: 240px" required="true"/></td>
							</tr>
							<tr>
								<td align="right" style="width:160px">发票领取人：</td>
									<td><input id="invoiceUser" borderStyle="border:0" name="invoiceUser" enabled="false" class="nui-textbox" style="width: 240px" required="true"/></td>
							
								<td align="right" style="width:160px">发票邮寄日期：</td>
									<td><input id="invoicePostTime" borderStyle="border:0" name="invoicePostTime" enabled="false" class="nui-datepicker" style="width: 240px" required="true"/></td>
							</tr>
							<tr>
								<td align="right" style="width: 160px">发票不含税金额：</td>
									<td><input id="invoicePriceExcludingTax" borderStyle="border:0" name="invoicePriceExcludingTax" enabled="false" class="nui-textbox"  style="width: 240px" required="true"/></td>
								<td align="right" style="width: 160px">发票税额：</td>
									<td><input id="invoiceTax" borderStyle="border:0" name="invoiceTax" enabled="false" class="nui-textbox" style="width: 240px" required="true"/></td>
							</tr>
							<tr>
								<td align="right" style="width: 100px">专业类别：</td>
									<td><input id="major" name="major" borderStyle="border:0" enabled="false" class="nui-dictcombobox" dictTypeId="ZH_MAJOR_TYPE" style="width: 240px" required="true"/></td>
								<td align="right" style="width: 160px">发票抬头类别：</td>
									<td><input id="invoiceNameType" borderStyle="border:0" name="invoiceNameType" enabled="false" class="nui-dictcombobox" dictTypeId="ZH_INVOICE_NAME_TYPE" style="width: 240px" required="true"/></td>
							</tr>
							<tr>
								<td align="right" style="width:160px">备注：</td>
									<td colspan="8"><input id="invoiceRemark" borderStyle="border:0" name="invoiceRemark" enabled="false" class="nui-textarea" style="width:100%;height: 50px" required="true"/></td>
							</tr>
						</table>
					</div>
				</form>
			</fieldset>

	<div id="tabs1" class="nui-tabs" activeIndex="0" style="width:auto;height:auto">
	    <div title="相关附件">
			<jsp:include page="/ame_common/detailFile.jsp"/>
		</div>
	</div>
	<fieldset id="fd_list" style="height:auto; border:solid 1px #aaa;padding:3px;">
					<div class="fieldset-body"  style="width:788px; height:100%; margin: 0px auto">
<!-- 					<a  class="nui-button" id="invoicesourcing_add" onclick="addRow()" plain="true" style="float: left;" iconCls="icon-add" >新增</a> -->
<!-- 					<a  class="nui-button" id="invoicesourcing_del" onclick="removeTicket()" plain="true" style="float: left;" iconCls="icon-remove" >删除</a> -->
							<div id="invoicesourcing" class="nui-datagrid" style="width:788px; height:auto" showPager="false" allowCellEdit="false" allowCellSelect="true" 
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
<script type="text/javascript">
	nui.parse();
	var form = new nui.Form("#form1");
	//var grid1 = nui.get("datagrid1");
	var grid5 = nui.get("datagrid5");
	setData();
	document.getElementById("pipi").innerHTML="【开票列表打印】";
	var id;
	function getV(e){
		var grid = e.sender;
        var record = e.record;
        var uid = record._uid;
        var rowIndex = e.rowIndex;
        var s ="<a>同意</a>";
        return s;
	}
	
		//处理结果业务字典显示
  	function onCheckRenderer(e) {
		return nui.getDictText('MIS_AUDITSTATUS',e.value);
	}
	function setData(){
		id = <%= request.getParameter("id") %> ;
		var json = nui.encode({"id": id});
		nui.ajax({
	            url: "com.zhonghe.ame.purchase.purchaseProApp.queryProApp.biz.ext",
				type: 'POST',
				data: json,	
				contentType: 'text/json',
	            success: function (o) {
	            	
					form.setEnabled(false);
					
				}
	     });
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
	
	
	function createEwm(url){
		$('#qrcode').empty();
		var para = url;
    	$('#qrcode').qrcode({width: 100,height: 100,text: para});
	}
	
    
    //----------------------审批意见-------------------------//
	function onCheckRenderer(e) {
		return nui.getDictText('MIS_AUDITSTATUS',e.value);//设置业务字典值
	}
	function initMisOpinion(data){
		//初始化处理意见
		var dataStatus=[{"dictID": 1,"dictName": "通过"},{"dictID": 0,"dictName": "退回"},{"dictID": 2,"dictName": "终止流程"}];
		nui.get("auditstatus").setData(dataStatus);
		nui.get("auditstatus").setValue(data.auditstatus);
	}
    //审核结果触发
    function show(){
		var auditopinion = nui.get("auditopinion").getValue().trim();
		var auditstatus = nui.get("auditstatus").getValue();
		if(auditstatus=='0'){
			if(auditopinion=="同意。"){
				nui.get("auditopinion").setValue("");
			}
			chooselink();
		}else if(auditstatus=='1'){
			if(auditopinion==""){
				nui.get("auditopinion").setValue("同意。");
			}
			showNone();
		}else if(auditstatus=='2'){
			if(auditopinion=="同意。"){
				nui.get("auditopinion").setValue("");
			}
			showNone();
		}
	}
	function showNone(){
		nui.get("backTo").setValue("");
		document.getElementById("choosehide").style.display="none";
	}
	function chooselink(){
		document.getElementById("choosehide").style.display="";
	}
	function dicttic(e){
		return nui.getDictText('AME_TICTYPE',e.value);//设置业务字典值
	}
</script>
</body>
</html>