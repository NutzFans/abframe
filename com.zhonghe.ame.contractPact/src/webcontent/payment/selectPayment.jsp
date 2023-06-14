<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>项目详细信息</title>
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
        	<legend>付款申请基本信息</legend>
        	<table style="table-layout: fixed;">
						<tr>
							<td class="form_label" align="right">申请人</td>
							<td>
								<input id="createUsername" name="createUsername" class="nui-textbox" enabled="false" style="width: 200px" required="true" />
							</td>
							<td align="right" style="width: 160px">申请部门：</td>
							<td>
								<input id="implementOrgname" name="implementOrgname" enabled="false" class="nui-textbox" style="width: 200px" />
							</td>
							<td align="right" style="width: 160px">申请日期：</td>
							<td>
								<input id="createTime" name="createTime" class="nui-datepicker" style="width: 200px" readonly="readonly" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px">合同编号：</td>
							<td>
								<input id="contractId" name="contractId" class="nui-textbox" onbuttonclick="onButtonEdit" style="width: 200px" required="true" enabled="false" />
							</td>
							<td align="right" style="width: 160px">合同名称：</td>
							<td colspan="6">
								<input id="contractName" name="contractName" class="nui-textbox" style="width: 100%" required="true" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px">合同性质：</td>
							<td>
								<input id="contractNature" name="contractNature" class="nui-dictcombobox" dictTypeId="CONTRACT_NATURE" style="width: 100%" required="true" enabled="false" />
							</td>

							<td align="right" style="width: 160px">合同类型：</td>
							<td>
								<input id="contractType" name="contractType" class="nui-dictcombobox" dictTypeId="ZH_CONTRACT_TYPE" style="width: 100%" required="true" enabled="false" />
							</td>

							<td align="right" style="width: 160px">付款方：</td>
							<td>
								<input id="payer" name="payer" class="nui-dictcombobox" dictTypeId="ZH_INVOICE_NAME_TYPE" style="width: 100%" required="true" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px">合同金额(元)：</td>
							<td>
								<input id="contractSum" name="contractSum" class="nui-textbox" style="width: 200px" required="true" enabled="false" />
							</td>
							<td align="right" style="width: 160px">累计已付金额(元)：</td>
							<td>
								<input id="paidContractSum" name="paidContractSum" class="nui-textbox" onvaluechanged="editPaidContractSum" style="width: 200px" required="false" enabled="false" />
							</td>
							<td align="right" style="width: 160px">本次支付金额(元)：</td>
							<td>
								<input id="applyPayContractSum" name="applyPayContractSum" onvaluechanged="editApplyPayContractSum" class="nui-textbox" style="width: 200px" required="true" enabled="false" />
							</td>

						</tr>
						<tr>
							<td align="right" style="width: 160px">发票类型：</td>
							<td>
								<input id="invoiceType" name="invoiceType" class="nui-dictcombobox" dictTypeId="MIS_MA_INVOICETYPE" style="width: 200px" required="true" enabled="false" />
							</td>
							<td align="right" style="width: 160px">本次付款进度：</td>
							<td>
								<input id="payType" name="payType" class="nui-dictcombobox" dictTypeId="payType" style="width: 200px" required="true" enabled="false" />
							</td>
							<td align="right" style="width: 160px">最晚付款日期：</td>
							<td>
								<input id="endTime" name="endTime" class="nui-datepicker" style="width: 200px" required="true" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right">收款单位：</td>
							<td colspan="8">
								<input id="signatoryName" name="signatoryName" enabled="false" class="nui-textbox" style="width: 100%" />
							</td>
						</tr>
						<tr>
							<td align="right">收款单位开户行名称：</td>
							<td colspan="8">
								<input id="accountName" name="accountName" class="nui-textbox" style="width: 100%" required="true" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right">收款单位开户行账号：</td>
							<td colspan="8">
								<input id="account" name="account" class="nui-textbox" style="width: 100%" required="true" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right">支付依据及情况说明：</td>
							<td colspan="8">
								<input id="remark" name="remark" class="nui-textarea" style="width: 100%; height: 150px" required="true" enabled="false" />
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
	            url: "com.zhonghe.ame.payment.payMent.getPaymentMessage.biz.ext",
				type: 'POST',
				data: json,	
				contentType: 'text/json',
	            success: function (o) {
					form.setData(o.payment);
					var grid_0 = nui.get("grid_0");
    				grid_0.load({"groupid":"PAY_MENT","relationid":o.payment.id});
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
