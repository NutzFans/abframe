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
        	<legend>付费合同基本信息</legend>
        	<table style="table-layout:fixed;" id="table_file1">
        	
		            	<tr>
							<td class="form_label" align = "right"> 申请人</td>
								<td>
									<input id="createUsername" name="createUsername" class="nui-textbox" enabled="false" style="width: 200px" required="true"/>
								</td>
								<td align="right" style="width: 160px">合同实施部门：</td>
								<td >   
									<input name="implementOrg" id="implementOrg" class="nui-hidden" style="width: 200px;" />
									<input id="implementOrgname" name="implementOrgname" class="nui-textbox" enabled="false" style="width: 200px" required="true"/>
								</td>
								<td align="right" style="width:160px">申请日期：</td>
									<td><input id="createTime" name="createTime" enabled="false" class="nui-datepicker" style="width: 200px"/></td>
							</tr>
							<tr>
								
								<td align="right" style="width: 160px">合同名称：</td>
								<td><input id="contractName" name="contractName" enabled="false" class="nui-textbox" style="width: 200px"/></td>
								<td align="right" style="width: 160px">合同金额(元)：</td>
								<td><input id="contractSum" name="contractSum" enabled="false" class="nui-textbox" style="width: 200px" required="true"/></td>
								<td align="right" style="width: 160px">签约方：</td>
								<td><input id="signatoryname" name="signatoryname" enabled="false" class="nui-textbox" style="width: 200px"/></td>						
							</tr>
							<tr>
								<td align="right" style="width: 160px">合同类型：</td>
								<td><input id="contractType" name="contractType" enabled="false" class="nui-dictcombobox" dictTypeId="ZH_CONTRACT_TYPE" style="width: 200px" required="true"/></td>
								<td align="right" style="width: 160px">采购立项编号：</td>
								<td><input id="purchasePlan" name="purchasePlan" enabled="false" class="nui-textbox" style="width: 200px" required="true"/></td>
								<td align="right" style="width: 160px">合同签约主体：</td>
								<td><input id="contractSubject" name="contractSubject" enabled="false" class="nui-dictcombobox" dictTypeId="ZH_INVOICE_NAME_TYPE" style="width: 200px"  required="true"/></td>										
							</tr>
							<tr>
								
								<td align="right" style="width: 160px">实施地点：</td>
									<td><input id="projectLocal" name="projectLocal" enabled="false" class="nui-textbox" style="width: 200px"/></td>
								<td align="right" style="width: 160px">标的规模：</td>
									<td><input id="projectSize" name="projectSize" enabled="false" class="nui-textbox" style="width: 200px"/></td>
								<td align="right" style="width:160px">合同起始日期：</td>
									<td><input id="startTime" name="startTime" enabled="false" class="nui-datepicker" style="width: 200px"/></td>					
							</tr>
							<tr>
								
								<td align="right" style="width:160px">合同结束日期：</td>
									<td><input id="endTime" name="endTime" enabled="false" class="nui-datepicker" style="width: 200px"/></td>		
								<td align="right" style="width: 100px">分公司会签部门领导：</td>
							    <td  style="width: 20%;">
									<input name="fDeptCountersignName" id="fDeptCountersignName" class="nui-textbox" style="width: 100%" enabled="false" >
								</td>
							    <td align="right" style="width: 100px">本部会签部门领导：</td>
							    <td  style="width: 20%;">
							     	<input name="zDeptCountersignName" id="zDeptCountersignName" class="nui-textbox" style="width: 100%" enabled="false">
								</td>
							</tr>
							<tr>
								<td align="right" style="width: 160px">备注：</td>
								<td  colspan="5"><input id="remark" name="remark"  class="nui-textarea" style="width: 100%" enabled="false"/></td>
							</tr>
        	</table>
        	<p style="color:red;">补充合同信息:</p>
					<div style="padding: 5px;">
							<table style="table-layout: fixed;">
								<tr>
									<td align="right" style="width: 100px">合同编号：</td>
										<td><input id="contractNo" name="contractNo"  class="nui-textbox"  style="width: 200px" required="true"/></td>
									<td align="right" style="width: 100px">支付节点：</td>
										<td><input id="payMethod" name="payMethod"  class="nui-textbox" style="width: 200px" required="true"/></td>
									<!-- <td align="right" style="width: 100px">执行状态：</td>
										<td><input id="executeStatus" name="executeStatus"  class="nui-dictcombobox" dictTypeId="ZH_EXECUTESTATUS" style="width: 300px" required="true"/></td> -->
									<!-- <td align="right" style="width: 100px">承办单位：</td>
										<td><input id="organizer" name="organizer"  class="nui-textbox" style="width: 300px"/></td> -->
									<td align="right" style="width: 100px">付款方：</td>
										<td><input id="payer" name="payer"  class="nui-dictcombobox" dictTypeId="ZH_INVOICE_NAME_TYPE" style="width: 200px" required="true"/></td>
									
								</tr>
								<tr>
									<td align="right" style="width: 100px">签订日期：</td>
										<td><input id="signingDate" name="signingDate"  class="nui-datepicker" style="width: 200px" required="true"/></td>
									<td align="right" style="width: 100px">合同期限：</td>
										<td><input id="contractPeriod" name="contractPeriod"  class="nui-textbox" style="width: 200px" required="true"/></td>
									<!--<td align="right" style="width: 100px">完成时间：</td>
										<td><input id="finishTime" name="finishTime"  class="nui-datepicker" style="width: 200px" required="true"/></td>-->
									<td align="right" style="width: 100px">合同专用章：</td>
										<td><input id="cachet" name="cachet" class="nui-dictcombobox" dictTypeId="ZH_INVOICE_NAME_TYPE" style="width: 200px" required="true"/></td>
								</tr>
							</table>
					</div>
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
		form.setEnabled(false)
		 setData();
		 function setData(){ 
		 	 
		 	var data = {processid:processid};            
        	var json = nui.encode(data);
        	nui.ajax({
	            url: "com.zhonghe.ame.payContract.payContract.getPayContractMessage.biz.ext",
				type: 'POST',
				data: json,	
				contentType: 'text/json',
	            success: function (o) {
					form.setData(o.payContract)
					
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
