<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): wanglinqiong
  - Date: 2016-05-12 16:17:56
  - Description:
-->
<head>
<title>财务结算工时详情</title>
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
<div id="tabs1" class="nui-tabs" activeIndex="0" style="width:auto;height:100%">
	<div title="财务结算工时详情">
		 	<form id="form1" method="post" >
		        <fieldset style="border:solid 1px #aaa;padding:3px;">
		        	<legend>基本信息</legend>
		        	<table style="table-layout:fixed;" id="table_file1">
				            <tr>
								<td align="right" style="width:160px">员工姓名：</td>
								<td id="empName" style="width:250px" class = "asLabel"></td>
								<td align="right" style="width:160px">员工工号：</td>
								<td id="empCode" style="width:250px" class = "asLabel"></td>	
								<td align="right" style="width:160px">员工级别：</td>
								<td id="degree" style="width:250px" class = "asLabel"></td>
							</tr>
							<tr>
								<td align="right" style="width:160px">项目名称：</td>
								<td id="prjName" style="width:250px" class = "asLabel"></td>
								<td align="right" style="width:160px">项目编号：</td>
								<td id="prjNum" style="width:250px" class = "asLabel"></td>
								<td align="right" style="width:160px">合同编号：</td>
								<td id="contnum" style="width:250px" class = "asLabel"></td>
							</tr>
							<tr>
								<td align="right" style="width:160px">客户：</td>
								<td id="custname" style="width:250px" class = "asLabel"></td>
								<td align="right" style="width:160px">受益部门：</td>
								<td id="buyOrgname" style="width:250px" class = "asLabel"></td>
								<td align="right" style="width:160px">受益事业部：</td>
								<td id="buyYjname" style="width:250px" class = "asLabel"></td>
							</tr>
							<tr>
								<td align="right" style="width:160px"> 所属部门：</td>
								<td id="empOrgname" style="width:250px" class = "asLabel"></td>
								<td align="right" style="width:160px">成本类型：</td>
								<td id="pkCorp" style="width:250px" class = "asLabel"></td>
								<td align="right" style="width:160px">状态：</td>
								<td id="checkStatus" style="width:250px" class = "asLabel"></td>
							</tr>
							<tr>
								<td align="right" style="width:160px">填报日期：</td>
								<td id="serviceDate" style="width:250px" class = "asLabel"></td>
								<td align="right" style="width:160px">工作时间：</td>
								<td id="workingHours" style="width:250px" class = "asLabel"></td>
								<td align="right" style="width:160px"> 其中加班工时：</td>
								<td  style="width:250px" id="otwHours" class = "asLabel"></td>
							</tr>
							<tr>
								<td align="right" style="width:160px">工时单价：</td>
								<td id="unitPrice" style="width:250px" class = "asLabel"></td>
								<td align="right" style="width:160px">工时成本：</td>
								<td id="costs" style="width:250px" class = "asLabel"></td>
								<td align="right" style="width:160px">转换成本：</td>
								<td id="transcosts" style="width:250px" class = "asLabel"></td>
							</tr>
							<tr>
								<td align="right" style="width:160px">工作任务：</td>
								<td id="taskname" colspan="5" style="width:auto" class = "asLabel"></td>
							</tr>
							<tr>
								<td align="right" style="width:160px">变更说明：</td>
								<td id="changememo" colspan="5" style="width:auto" class = "asLabel"></td>
							</tr>
		        	</table>
		        </fieldset>
    		</form>        
    	</div>
	</div>
</div>
<div style="text-align:center;padding:10px;border-width:1px 0px 0px 0px;" id="temp1" class="nui-toolbar">
    	<a class="nui-button" onclick="onCancel" style="width:60px;">关闭</a>
	</div> 
    <script type="text/javascript">
		nui.parse();
    	var form = new nui.Form("form1");
    	var id = <%=request.getParameter("id")%>;
		setData(id);
		
		
		<!--基本信息	-->										  
        function setData(id){        
        	var json = nui.encode({"id":id});
        	nui.ajax({
	            url: "com.primeton.rdmgr.labor.input.newRdLaborHistory.getLaborHistory.biz.ext",
				type: 'POST',
				data: json,	
				contentType: 'text/json',
	            success: function (o) {
	                document.getElementById("empName").innerHTML = o.ps.empName == null ?"":o.ps.empName;
	                document.getElementById("empCode").innerHTML = o.ps.empCode == null ?"":o.ps.empCode;
	                document.getElementById("serviceDate").innerHTML = o.ps.serviceDate == null ?"":o.ps.serviceDate;
	                document.getElementById("degree").innerHTML = o.ps.degree == null ?"":o.ps.degree;
	                document.getElementById("empOrgname").innerHTML = o.ps.empOrgname == null ?"":o.ps.empOrgname;
	                document.getElementById("custname").innerHTML = o.ps.custname == null ?"":o.ps.custname;
	                document.getElementById("contnum").innerHTML = o.ps.contnum == null ?"":o.ps.contnum;
	                document.getElementById("buyOrgname").innerHTML = o.ps.buyOrgname == null ?"":o.ps.buyOrgname;
	                document.getElementById("buyYjname").innerHTML = o.ps.buyYjname == null ?"":o.ps.buyYjname;
	                document.getElementById("prjName").innerHTML = o.ps.prjName == null ?"":o.ps.prjName;
	                document.getElementById("prjNum").innerHTML = o.ps.prjNum == null ?"":o.ps.prjNum;
	                document.getElementById("checkStatus").innerHTML = o.ps.checkStatus == null ?"":nui.getDictText('AME_OUTCOSTSTATUS',o.ps.checkStatus);
	                document.getElementById("pkCorp").innerHTML = o.ps.pkCorp == null ?"":nui.getDictText('AME_LABORTYPE',o.ps.pkCorp);
	                document.getElementById("workingHours").innerHTML = o.ps.workingHours == null ?"":o.ps.workingHours;
	                document.getElementById("otwHours").innerHTML = o.ps.otwHours == null ?"":o.ps.otwHours;
	                document.getElementById("unitPrice").innerHTML = o.ps.unitPrice == null ?"":o.ps.unitPrice;
	                document.getElementById("costs").innerHTML = o.ps.costs == null ?"":o.ps.costs;
	                document.getElementById("transcosts").innerHTML = o.ps.transcosts == null ?"":o.ps.transcosts;
	                document.getElementById("taskname").innerHTML = o.ps.taskname == null ?"":o.ps.taskname;
	                document.getElementById("changememo").innerHTML = o.ps.changememo == null ?"":o.ps.changememo;
				}
	     });
	}
	
	//标准方法接口定义
    function CloseWindow(action) {           
        if (action == "close" && form.isChanged()) {
            if (confirm("数据被修改了，是否先保存？")) {
                return false;
            }
        }
        if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
        else window.close();            
    }	

	function onCancel(e) {
		if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
        else window.close();  
    }
   	</script>
</body>
</html>