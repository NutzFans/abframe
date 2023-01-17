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
        	<legend>补充协议基本信息</legend>
        	<table style="table-layout:fixed;" id="table_file1">
        	
		            <tr>
						<td align="right" style="width:160px">申请人：</td>
						<td id="empname" style="width:250px" class = "asLabel"></td>
						<td align="right" style="width:160px">协议名称：</td>
						<td id="contractName" style="width:250px" class = "asLabel"></td>	
						<td align="right" style="width:160px">协议编号：</td>
						<td id="contractNo" style="width:250px" class = "asLabel"></td>
						
					</tr>
					<tr>
						<td align="right" style="width:160px">申请日期：</td>
						<td id="createTime" style="width:250px" class = "asLabel"></td>
						<td align="right" style="width:160px">合同实施部门：</td>
						<td id="orgname" style="width:250px" class = "asLabel"></td>
						<td align="right" style="width:160px">原合同名称：</td>
						<td id="originalContractName" style="width:250px" class = "asLabel"></td>
					</tr>
					<tr>
						<td align="right" style="width:160px">原合同编号：</td>
						<td id="originalContractNo" style="width:250px" class = "asLabel"></td>
						<td align="right" style="width:160px">实施地点：</td>
						<td id="projectLocal" style="width:250px" class = "asLabel"></td>
						<td align="right" style="width:160px">签约方：</td>
						<td id="signatoryname" style="width:250px" class = "asLabel"></td>
					</tr>
					<tr>
						<td align="right" style="width:160px">标的规模：</td>
						<td id="projectSize" style="width:250px" class = "asLabel"></td>
						<td align="right" style="width:160px">合同实际金额（元）：</td>
						<td  style="width:250px" id="contractSum" class = "asLabel"></td>
						<td align="right" style="width:160px">合同生效日期：</td>
						<td  style="width:250px" id="startTime" class = "asLabel"></td>
					</tr>
					<tr>
						<td align="right" style="width:160px">是否协议变更：</td>
						<td id="issupagreement" style="width:250px" class = "asLabel"></td>
					</tr>
					<tr>
	              		<td style="width:350px;" align="right">变更说明：</td>
	                    <td style="width:150px;" colspan="7" class = "asLabel">    
	                        <input style="width:90%;height: 40px;" class="nui-textarea" id="remark" enabled="false"/>
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
	            url: "com.zhonghe.ame.payContract.payContract.getPayContractMessage.biz.ext",
				type: 'POST',
				data: json,	
				contentType: 'text/json',
	            success: function (o) {

	            	o = nui.decode(o);
	                document.getElementById("empname").innerHTML = o.payContract.empname == null ?"":o.payContract.empname;
					document.getElementById("contractName").innerHTML = o.payContract.contractName == null ?"":o.payContract.contractName;
					document.getElementById("contractNo").innerHTML = o.payContract.contractNo == null ?"":o.payContract.contractNo;
					document.getElementById("createTime").innerHTML = o.payContract.createTime == null ?"":o.payContract.createTime;
					document.getElementById("orgname").innerHTML = o.payContract.orgname == null ?"":o.payContract.orgname;
					document.getElementById("originalContractName").innerHTML = o.payContract.originalContractName == null ?"":o.payContract.originalContractName;
					document.getElementById("originalContractNo").innerHTML = o.payContract.originalContractNo == null ?"":o.payContract.originalContractNo;
					document.getElementById("projectLocal").innerHTML = o.payContract.projectLocal == null ?"":o.payContract.projectLocal;
					document.getElementById("signatoryname").innerHTML = o.payContract.signatoryname == null ?"":o.payContract.signatoryname;
					document.getElementById("projectSize").innerHTML = o.payContract.projectSize == null ?"":o.payContract.projectSize;
					document.getElementById("contractSum").innerHTML = o.payContract.contractSum == null ?"":o.payContract.contractSum;
					document.getElementById("startTime").innerHTML = o.payContract.startTime == null ?"":o.payContract.startTime;
					document.getElementById("issupagreement").innerHTML = o.payContract.issupagreement == null ?"":nui.getDictText('ZH_ISSUPAGREEMENT',o.payContract.issupagreement);
					document.getElementById("remark").innerHTML = o.payContract.remark == null ?"":o.payContract.remark;

					
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
