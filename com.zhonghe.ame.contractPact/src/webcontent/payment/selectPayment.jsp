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
        	<table style="table-layout:fixed;" id="table_file1">
        	
		            <tr>
						<td align="right" style="width:160px">申请人：</td>
						<td id="empname" style="width:250px" class = "asLabel"></td>
						<td align="right" style="width:160px">申请日期：</td>
						<td id="createTime" style="width:250px" class = "asLabel"></td>	
						<td align="right" style="width:160px">签约方：</td>
						<td id="signatory" style="width:250px" class = "asLabel"></td>
						
					</tr>
					<tr>
						<td align="right" style="width:160px">付款方：</td>
						<td id="payer" style="width:250px" class = "asLabel"></td>
						<td align="right" style="width:160px"> 合同名称：</td>
						<td id="contractName" style="width:250px" class = "asLabel"></td>
						<td align="right" style="width:160px">合同编号：</td>
						<td id="contractId" style="width:250px" class = "asLabel"></td>
					</tr>
					<tr>
						<td align="right" style="width:160px">合同金额（元）：</td>
						<td id="contractSum" style="width:250px" class = "asLabel"></td>
						<td align="right" style="width:160px">累计已付金额（元）：</td>
						<td id="paidContractSum" style="width:250px" class = "asLabel"></td>
						<td align="right" style="width:160px">本次申请支付金额（元）：</td>
						<td id="applyPayContractSum" style="width:250px" class = "asLabel"></td>
					</tr>
					<tr>
						
						<td align="right" style="width:160px"> 最晚付款日期：</td>
						<td  style="width:250px" id="endTime" class = "asLabel"></td>
						<td align="right" style="width:160px"> 收款单位开户行名称：</td>
						<td  style="width:250px" id="accountName" class = "asLabel"></td>
						<td align="right" style="width:160px">开户行账号：</td>
						<td id="account" style="width:250px" class = "asLabel"></td>
					</tr>
					<tr>
						
						<td align="right" style="width:160px">是否为人力劳务派遣：</td>
						<td id="laborDispatchingFlag" style="width:250px" class = "asLabel"></td>
						<td align="right" style="width:160px">分公司归口部门：</td>
						<td id="countersign0" style="width:250px" class = "asLabel"></td>
						<td align="right" style="width:160px">本部归口部门：</td>
						<td id="countersign1" style="width:250px" class = "asLabel"></td>
					</tr>
					<tr>
	              		<td style="width:350px;" align="right">说明：</td>
	                    <td style="width:150px;" colspan="7" class = "asLabel">    
	                        <input style="width:90%;height: 40px;" class="nui-textarea" id="remark" dictTypeId="ZH_PURCHASE"  enabled="false"/>
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

	            	o = nui.decode(o);
	                document.getElementById("empname").innerHTML = o.payment.empname == null ?"":o.payment.empname;
					document.getElementById("createTime").innerHTML = o.payment.createTime == null ?"":o.payment.createTime;
					document.getElementById("signatory").innerHTML = o.payment.signatoryname == null ?"":o.payment.signatoryname;
					document.getElementById("payer").innerHTML = o.payment.payer == null ?"":nui.getDictText('ZH_INVOICE_NAME_TYPE',o.payment.payer);
					document.getElementById("contractName").innerHTML = o.payment.contractName == null ?"":o.payment.contractName;
					document.getElementById("contractId").innerHTML = o.payment.contractId == null ?"":o.payment.contractId;
					document.getElementById("contractSum").innerHTML = o.payment.actContractSum == null ?"":o.payment.actContractSum;
					document.getElementById("paidContractSum").innerHTML = o.payment.paidContractSum == null ?"":o.payment.paidContractSum;
					document.getElementById("applyPayContractSum").innerHTML = o.payment.applyPayContractSum == null ?"":o.payment.applyPayContractSum;
					document.getElementById("endTime").innerHTML = o.payment.endTime == null ?"":o.payment.endTime;
					document.getElementById("accountName").innerHTML = o.payment.accountName == null ?"":o.payment.accountName;
					document.getElementById("account").innerHTML = o.payment.account == null ?"":o.payment.account;
					document.getElementById("laborDispatchingFlag").innerHTML = o.payment.laborDispatchingFlag == null ?"":nui.getDictText('ZH_LABOR_DISPATCHING_FLAG',o.payment.laborDispatchingFlag);
					document.getElementById("countersign0").innerHTML = o.payment.countersign0 == null ?"":o.payment.countersign0;
					document.getElementById("countersign1").innerHTML = o.payment.countersign1 == null ?"":o.payment.countersign1;
					document.getElementById("remark").innerHTML = o.payment.remark == null ?"":o.payment.remark;

					
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
