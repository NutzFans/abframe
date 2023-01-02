<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<html>
<!-- 
  - Author(s): EPCNB324
  - Date: 2017-09-12 13:53:13
  - Description:
-->
<head>
<title>工时查看</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<style type="text/css">
    html, body
    {
        font-size:12px;
        padding:0;
        margin:0;
        border:0;
        height:100%;
        overflow:hidden;
    }
    .asLabel
    {
        border:0;background-color:#F5F5F5;cursor:default;
    }
</style>
</head>
<body style="width:100%;height:100%;padding:0px;margin:0px;">
<div class="nui-fit">
	<form id="form1" method="post" >
		<input name="rdLaborDetail.laborDetailId" id="laborDetailId" class="nui-hidden" />
		<fieldset style="border:solid 1px #aaa;padding:3px;">
			<legend>工时基本信息</legend>
			<div style="padding:5px;">
				 <table style="table-layout:fixed;" id="table_file">
				 	<tr>
				 		<td style="width:120px;" align="right">填报人：</td>
				 		<td style="width:250px;" class="asLabel" id="rdLaborDetail.userName"></td>
				 		<td style="width:120px;" align="right">填报日期：</td>
				 		<td style="width:250px;" class="asLabel" id="rdLaborDetail.laborDate"></td>
				 	</tr>
				 	<tr>
				 		<td style="width:120px;" align="right">员工所属部门：</td>
				 		<td style="width:250px;" class="asLabel" id="rdLaborDetail.orgname"></td>
				 		<td style="width:120px;" align="right">员工等级：</td>
				 		<td style="width:250px;" class="asLabel" id="rdLaborDetail.grade"></td>
				 	</tr>
				 	<tr>
				 		<td style="width:120px;" align="right">项目：</td>
				 		<td style="width:250px;" class="asLabel" id="rdLaborDetail.projectName"></td>
				 		<td style="width:120px;" align="right">项目编号：</td>
				 		<td style="width:250px;" class="asLabel" id="rdLaborDetail.projectno"></td>
				 	</tr>
				 	<tr>
				 		<td style="width:120px;" align="right">项目所属事业部：</td>
				 		<td style="width:250px;" class="asLabel" id="rdLaborDetail.ejbm"></td>
				 		<td style="width:120px;" align="right">项目活动：</td>
				 		<td style="width:250px;" class="asLabel" id="rdLaborDetail.taskname"></td>
				 	</tr>
				 	<tr>
				 		<td style="width:120px;" align="right">客户：</td>
				 		<td style="width:250px;" class="asLabel" id="rdLaborDetail.custname"></td>
				 		<td style="width:120px;" align="right">工时填写时间：</td>
				 		<td style="width:250px;" class="asLabel" id="rdLaborDetail.insertdate"></td>
				 	</tr>
				 	<tr>
				 		<td style="width:120px;" align="right">工时状态：</td>
				 		<td style="width:250px;" class="asLabel" id="rdLaborDetail.status"></td>
				 		<td style="width:120px;" align="right">工时类型：</td><%--待判断--%>
				 		<td style="width:250px;" class="asLabel" id="rdLaborDetail.type"></td>
				 	</tr>
				 	<tr>
				 		<td style="width:120px;" align="right">工作时间：</td>
				 		<td style="width:250px;" class="asLabel" id="rdLaborDetail.actHours"></td>
				 		<td style="width:120px;" align="right">其中加班工时：</td>
				 		<td style="width:250px;" class="asLabel" id="rdLaborDetail.otwHours"></td>
				 	</tr>
				 	<tr>
				 		<td style="width:120px;" align="right">是否预留调休：</td>
				 		<td style="width:250px;" class="asLabel" id="rdLaborDetail.isdaysoff" colspan="3"></td>
				 	</tr>
				 	<tr>
				 		<td style="width:120px;" align="right">工作内容：</td>
				 		<td style="width:250px;" class="asLabel" id="rdLaborDetail.repContent" colspan="3"></td>
				 	</tr>
				 	<tr>
				 		<td style="width:120px;" align="right">原始定额成本：</td>
				 		<td style="width:250px;" class="asLabel" id="rdLaborDetail.standcost"></td>
				 		<td style="width:120px;" align="right">结算定额成本：</td>
				 		<td style="width:250px;" class="asLabel" id="rdLaborDetail.cost"></td>
				 	</tr>
				 	<tr>
				 		<td style="width:120px;" align="right">变更说明：</td>
				 		<td style="width:250px;" class="asLabel" id="rdLaborDetail.costremark" colspan="3"></td>
				 	</tr>
				 	<tr>
				 		<td style="width:120px;" align="right">转换系数：</td>
				 		<td style="width:250px;" class="asLabel" id="rdLaborDetail.conratio"></td>
				 		<td style="width:120px;" align="right">工时转换成本：</td>
				 		<td style="width:250px;" class="asLabel" id="rdLaborDetail.concost"></td>
				 	</tr>
				 	<tr>
				 		<td style="width:120px;" align="right">受益部门：</td>
				 		<td style="width:250px;" class="asLabel" id="rdLaborDetail.salesName"></td>
				 		<td style="width:120px;" align="right">受益一级部门：</td>
				 		<td style="width:250px;" class="asLabel" id="rdLaborDetail.yjbm" ></td>
				 	</tr>
				 	<tr>
				 		<td style="width:120px;" align="right" >受益人确认时间：</td>
				 		<td style="width:250px;" class="asLabel" id="rdLaborDetail.benefconftime" colspan="3"></td>
				 	</tr>
				 	<tr>
				 		<td style="width:120px;" align="right">受益确认疑问：</td>
				 		<td style="width:250px;" class="asLabel" id="rdLaborDetail.benefconfq" colspan="3"></td>
				 	</tr>
				 	<tr>
				 		<td style="width:120px;" align="right">受益疑问反馈：</td>
				 		<td style="width:250px;" class="asLabel" id="rdLaborDetail.benefconfr" colspan="3"></td>
				 	</tr>
				 	<tr>
				 		<td style="width:120px;" align="right">PMO确认人：</td>
				 		<td style="width:250px;" class="asLabel" id="rdLaborDetail.pmoconfer"></td>
				 		<td style="width:120px;" align="right">PMO确认时间：</td>
				 		<td style="width:250px;" class="asLabel" id="rdLaborDetail.pmoconftime"></td>
				 	</tr>
				 	<tr>
				 		<td style="width:120px;" align="right">财务确认人：</td>
				 		<td style="width:250px;" class="asLabel" id="rdLaborDetail.finconfer" colspan="3"></td>
				 	</tr>
				 	<tr>
				 		<td style="width:120px;" align="right">财务成本日期：</td>
				 		<td style="width:250px;" class="asLabel" id="rdLaborDetail.fincostdate"></td>
				 		<td style="width:120px;" align="right">财务操作时间：</td>
				 		<td style="width:250px;" class="asLabel" id="rdLaborDetail.finconftime"></td>
				 	</tr>
				 </table>
			</div>
		</fieldset>
	</form>
</div>
<div style="text-align:center;padding:10px;border-width:1px 0px 0px 0px;" class="nui-toolbar">
    <a class="nui-button" onclick="onCancel" style="width:60px;">关闭</a>
</div> 
<script type="text/javascript">
	var laborDetailId = '<%=request.getParameter("laborDetailId") %>';
	setData();
	function setData(){
		//nui.get("laborDetailId").setValue(laborDetailId);
		var json = nui.encode({"rdlabordetail":{"laborDetailId": laborDetailId}});
		nui.ajax({
            url: "com.primeton.rdmgr.labor.queryRdLaborDetail.queryRdLaborDetail.biz.ext",
			type: 'POST',
			data: json,	
			contentType: 'text/json',
            success: function (o) {
				document.getElementById("rdLaborDetail.userName").innerHTML = o.rdlabordetail.userName == null ?"":o.rdlabordetail.userName;
				document.getElementById("rdLaborDetail.laborDate").innerHTML = o.rdlabordetail.laborDate == null ?"":o.rdlabordetail.laborDate;
				document.getElementById("rdLaborDetail.orgname").innerHTML = o.rdlabordetail.orgname == null ?"":o.rdlabordetail.orgname;
				document.getElementById("rdLaborDetail.grade").innerHTML = o.rdlabordetail.gradename == null ?"":o.rdlabordetail.gradename;
				document.getElementById("rdLaborDetail.projectName").innerHTML = o.rdlabordetail.projectName == null ?"":o.rdlabordetail.projectName;
				document.getElementById("rdLaborDetail.projectno").innerHTML = o.rdlabordetail.projectno == null ?"":o.rdlabordetail.projectno;
				document.getElementById("rdLaborDetail.ejbm").innerHTML = o.rdlabordetail.ejbm == null ?"":o.rdlabordetail.ejbm;
				document.getElementById("rdLaborDetail.taskname").innerHTML = o.rdlabordetail.taskname == null ?"":o.rdlabordetail.taskname;
				document.getElementById("rdLaborDetail.custname").innerHTML = o.rdlabordetail.custname == null ?"":o.rdlabordetail.custname;
				document.getElementById("rdLaborDetail.salesName").innerHTML = o.rdlabordetail.salesName == null ?"":o.rdlabordetail.salesName;
				document.getElementById("rdLaborDetail.yjbm").innerHTML = o.rdlabordetail.yjbm == null ?"":o.rdlabordetail.yjbm;
				//根据项目判断工时类型
				var type='';
				if(o.rdlabordetail.projectId == '1') {
					type="组织级工时";
				}else if (o.rdlabordetail.projectId == '2'){
					type="非立项技术支持";
				}else{
					type="项目工时";
				}
				document.getElementById("rdLaborDetail.type").innerHTML = type == null ?"":type;
				document.getElementById("rdLaborDetail.status").innerHTML = o.rdlabordetail.status == null ?"":nui.getDictText('AME_LABOR_STATUS',o.rdlabordetail.status);
				document.getElementById("rdLaborDetail.isdaysoff").innerHTML = o.rdlabordetail.isdaysoff == null ?"":nui.getDictText('AME_LABOR_ISDAYSOFF',o.rdlabordetail.isdaysoff);
				document.getElementById("rdLaborDetail.insertdate").innerHTML = o.rdlabordetail.insertdate == null ?"":o.rdlabordetail.insertdate;
				document.getElementById("rdLaborDetail.actHours").innerHTML = o.rdlabordetail.actHours == null ?"":o.rdlabordetail.actHours+'小时';
				document.getElementById("rdLaborDetail.otwHours").innerHTML = o.rdlabordetail.otwHours == null ?"":o.rdlabordetail.otwHours+'小时';
				document.getElementById("rdLaborDetail.cost").innerHTML = o.rdlabordetail.cost == null ?"":o.rdlabordetail.cost;
				document.getElementById("rdLaborDetail.standcost").innerHTML = o.rdlabordetail.standcost == null ?"":o.rdlabordetail.standcost;
				document.getElementById("rdLaborDetail.conratio").innerHTML = o.rdlabordetail.conratio == null ?"":o.rdlabordetail.conratio;
				document.getElementById("rdLaborDetail.concost").innerHTML = o.rdlabordetail.concost == null ?"":o.rdlabordetail.concost;
				document.getElementById("rdLaborDetail.benefconftime").innerHTML = o.rdlabordetail.benefconftime == null ?"":o.rdlabordetail.benefconftime;
				document.getElementById("rdLaborDetail.benefconfq").innerHTML = o.rdlabordetail.benefconfq == null ?"":o.rdlabordetail.benefconfq;
				document.getElementById("rdLaborDetail.benefconfr").innerHTML = o.rdlabordetail.benefconfr == null ?"":o.rdlabordetail.benefconfr;
				document.getElementById("rdLaborDetail.pmoconftime").innerHTML = o.rdlabordetail.pmoconftime == null ?"":o.rdlabordetail.pmoconftime;
				document.getElementById("rdLaborDetail.pmoconfer").innerHTML = o.rdlabordetail.pmoconfer == null ?"":o.rdlabordetail.pmoconfer;
				document.getElementById("rdLaborDetail.fincostdate").innerHTML = o.rdlabordetail.fincostdate == null ?"":o.rdlabordetail.fincostdate;
				document.getElementById("rdLaborDetail.finconftime").innerHTML = o.rdlabordetail.finconftime == null ?"":o.rdlabordetail.finconftime;
				document.getElementById("rdLaborDetail.finconfer").innerHTML = o.rdlabordetail.finconfer == null ?"":o.rdlabordetail.finconfer;
				document.getElementById("rdLaborDetail.repContent").innerHTML = o.rdlabordetail.repContent == null ?"":o.rdlabordetail.repContent;
				document.getElementById("rdLaborDetail.costremark").innerHTML = o.rdlabordetail.costremark == null ?"":o.rdlabordetail.costremark;
            }
           });
		
	}
	function CloseWindow(action) {
        if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
        else window.close();            
    }
    function onCancel(e) {
        CloseWindow("cancel");
    }
</script>
</body>
</html>