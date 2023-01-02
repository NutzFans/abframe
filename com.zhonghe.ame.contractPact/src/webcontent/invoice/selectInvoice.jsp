<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>详细信息</title>
<%@include file="/common/skins/skin0/component.jsp" %>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
	    .asLabel
	    {
	        border:0;background-color:#F5F5F5;cursor:default;    
	    }
    </style>
</head>
<body>
	<div class="nui-fit">
 	<form id="form1" method="post" >
        <fieldset style="border:solid 1px #aaa;padding:3px;">
        	<legend>发票基本信息</legend>
        	<table style="table-layout:fixed;" id="table_file1">
        	
		            <tr>
						<td align="right" style="width:160px">申请人：</td>
						<td id="empname" style="width:250px" class = "asLabel"></td>
						<td align="right" style="width:160px">申请日期：</td>
						<td id="createTime" style="width:250px" class = "asLabel"></td>	
						<td align="right" style="width:160px">申请单位：</td>
						<td id="orgname" style="width:300px" class = "asLabel"></td>
						
					</tr>
					<tr>
						<td align="right" style="width:160px">合同名称：</td>
						<td id="contractName" style="width:250px" class = "asLabel"></td>
						<td align="right" style="width:160px"> 合同编号：</td>
						<td id="contractNo" style="width:250px" class = "asLabel"></td>
						<td align="right" style="width:160px">集团内外：</td>
						<td id="headquarterGroup" style="width:300px" class = "asLabel"></td>
					</tr>
					<tr>
						<td align="right" style="width:160px">工程类别：</td>
						<td id="projectType" style="width:250px" class = "asLabel"></td>
						<td align="right" style="width:160px"> 专业类别：</td>
						<td  style="width:250px" id="major" class = "asLabel"></td>
						<td align="right" style="width:160px">增值税发票类型：</td>
						<td id="invoiceType" style="width:300px" class = "asLabel"></td>
						
					</tr>
					<tr>
						<td align="right" style="width:160px">开票金额：</td>
						<td id="invoiceSum" style="width:250px" class = "asLabel"></td>
						<td align="right" style="width:160px">付款单位：</td>
						<td id="payerName" style="width:250px" class = "asLabel"></td>
						<td align="right" style="width:160px">纳税人识别号：</td>
						<td id="taxpayerNumber" style="width:300px" class = "asLabel"></td>
						
					</tr>
					<tr>
						<td align="right" style="width:160px"> 开户行账号：</td>
						<td  style="width:250px" id="account" class = "asLabel"></td>
						<td align="right" style="width:160px"> 单位地址：</td>
						<td  style="width:250px" id="unitAddress" class = "asLabel"></td>
						<td align="right" style="width:160px">单位电话：</td>
						<td id="unitPhone" style="width:300px" class = "asLabel"></td>
						
						
						
					</tr>
					<tr>
						<td align="right" style="width:160px"> 开票内容：</td>
						<td  style="width:250px" id="content" class = "asLabel"></td>
						<td align="right" style="width:160px"> 开票内容情况说明：</td>
						<td  style="width:250px" id="contentInfo" class = "asLabel"></td>
						<td align="right" style="width:160px"> 预计到账时间：</td>
						<td  style="width:300px" id="scheduledTime" class = "asLabel"></td>
						
						
						
					</tr>
					<tr>
						<td align="right" style="width:160px"> 开票是否邮寄：</td>
						<td  style="width:250px" id="postFlag" class = "asLabel"></td>
						<td align="right" style="width:160px">发票邮寄地址：</td>
						<td id="mailingAddress" style="width:250px" class = "asLabel"></td>
						<td align="right" style="width:160px"> 发票领取人：</td>
						<td  style="width:300px" id="invoiceUser" class = "asLabel"></td>
						
					</tr>
					<tr>
						<td align="right" style="width:160px"> 发票邮寄日期：</td>
						<td  style="width:250px" id="invoicePostTime" class = "asLabel"></td>
						<td align="right" style="width:160px">发票不含税金额：</td>
						<td id="invoicePriceExcludingTax" style="width:250px" class = "asLabel"></td>
						<td align="right" style="width:160px"> 发票税额：</td>
						<td  style="width:300px" id="invoiceTax" class = "asLabel"></td>
						
					</tr>
					<tr>
						<td align="right" style="width:160px">发票抬头类别：</td>
						<td id="invoiceNameType" style="width:250px" class = "asLabel"></td>
					</tr>
					<tr>
	              		<td style="width:350px;" align="right">备注：</td>
	                    <td style="width:150px;" colspan="5" class = "asLabel">    
	                        <input style="width:870px;height: 40px;" class="nui-textarea" id="invoiceRemark" dictTypeId="ZH_PURCHASE"  enabled="false"/>
	                    </td>
	              	</tr>
		            
        	</table>
        	<fieldset id="field2" style="border:solid 1px #aaa;padding:3px;">
					<legend>相关附件</legend>
					<jsp:include page="/ame_common/detailFile.jsp"/>
			</fieldset>
        </fieldset>

    </form>
</div>



	
	<script type="text/javascript">
        nui.parse();
    	var form = new nui.Form("#form1");
   		var processid = <%=request.getParameter("processInstID")%>;

		 setData();
		 function setData(){ 
		 	 
		 	var data = {processid:processid};            
        	var json = nui.encode(data);
        	nui.ajax({
	            url: "com.zhonghe.ame.invoice.invoice.getInvoiceMessage.biz.ext",
				type: 'POST',
				data: json,	
				contentType: 'text/json',
	            success: function (o) {
                    
                    //alert(nui.encode(o));
	            	o = nui.decode(o);
	                document.getElementById("empname").innerHTML = o.invoice.empname == null ?"":o.invoice.empname;
					document.getElementById("createTime").innerHTML = o.invoice.createTime == null ?"":o.invoice.createTime;
					document.getElementById("orgname").innerHTML = o.invoice.orgname == null ?"":o.invoice.orgname;
					document.getElementById("contractName").innerHTML = o.invoice.contractName == null ?"":o.invoice.contractName;
					document.getElementById("contractNo").innerHTML = o.invoice.contractNo == null ?"":o.invoice.contractNo;
					document.getElementById("invoiceType").innerHTML = o.invoice.invoiceType == null ?"":nui.getDictText('MIS_MA_INVOICETYPE',o.invoice.invoiceType);
					
					document.getElementById("headquarterGroup").innerHTML = o.invoice.headquarterGroup == null ?"":o.invoice.headquarterGroup;
					document.getElementById("invoiceSum").innerHTML = o.invoice.invoiceSum == null ?"":o.invoice.invoiceSum;
					document.getElementById("payerName").innerHTML = o.invoice.payerName == null ?"":o.invoice.payerName;
					document.getElementById("taxpayerNumber").innerHTML = o.invoice.taxpayerNumber == null ?"":o.invoice.taxpayerNumber;
					document.getElementById("account").innerHTML = o.invoice.account == null ?"":o.invoice.account;
					document.getElementById("unitAddress").innerHTML = o.invoice.unitAddress == null ?"":o.invoice.unitAddress;
					document.getElementById("unitPhone").innerHTML = o.invoice.unitPhone == null ?"":o.invoice.unitPhone;
					document.getElementById("postFlag").innerHTML = o.invoice.postFlag == null ?"":nui.getDictText('ZH_POST',o.invoice.postFlag);
					document.getElementById("content").innerHTML = o.invoice.content == null ?"":nui.getDictText('ZH_INVOICE_CONTENT',o.invoice.content);
					document.getElementById("projectType").innerHTML = o.invoice.projectType == null ?"":o.invoice.projectType;
					document.getElementById("contentInfo").innerHTML = o.invoice.contentInfo == null ?"":o.invoice.contentInfo;
					document.getElementById("scheduledTime").innerHTML = o.invoice.scheduledTime == null ?"":o.invoice.scheduledTime;
					document.getElementById("mailingAddress").innerHTML = o.invoice.mailingAddress == null ?"":o.invoice.mailingAddress;
					document.getElementById("invoiceUser").innerHTML = o.invoice.invoiceUser == null ?"":o.invoice.invoiceUser;
					document.getElementById("invoicePostTime").innerHTML = o.invoice.invoicePostTime == null ?"":o.invoice.invoicePostTime;
					document.getElementById("invoicePriceExcludingTax").innerHTML = o.invoice.invoicePriceExcludingTax == null ?"":o.invoice.invoicePriceExcludingTax;
					document.getElementById("invoiceTax").innerHTML = o.invoice.invoiceTax == null ?"":o.invoice.invoiceTax;
					document.getElementById("major").innerHTML = o.invoice.major == null ?"":o.invoice.major;
					document.getElementById("invoiceNameType").innerHTML = o.invoice.invoiceNameType == null ?"":nui.getDictText('ZH_INVOICE_NAME_TYPE',o.invoice.invoiceNameType);
					document.getElementById("invoiceRemark").innerHTML = o.invoice.invoiceRemark == null ?"":o.invoice.invoiceRemark;

					
					var grid_0 = nui.get("grid_0");
        				grid_0.load({"groupid":"PAY_CONTRACT","relationid":o.payContract.id});
						grid_0.sortBy("fileTime","desc");
	                
				},
				error: function (jqXHR, textStatus, errorThrown) {
				        alert(jqXHR.responseText);
			    }
	     });
	}

        
         


    </script>
  </body>
</html>



