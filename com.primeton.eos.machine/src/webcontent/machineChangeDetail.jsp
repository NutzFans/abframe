<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@include file="/common/common.jsp"%>
<%@include file="/nui/common.jsp"%>
<link id="css_skin" rel="stylesheet" type="text/css" href="<%=contextPath%>/coframe/tools/skins/skin1/style.css" />
<html>
<!-- 
  - Author(s): Administrator
  - Date: 2014-09-23 17:01:53
  - Description:
-->
<head>
	<title>资产变更详细信息</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<link href="../demo.css" rel="stylesheet" type="text/css" />
	<script>
		$(function(){
			nui.context='/default'
		})
	</script>
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
    </style>
	<!--<script src="../common/nui/nui.js" type="text/javascript"></script>
	<link href="../demo.css" rel="stylesheet" type="text/css" />
	<style type="text/css">
    	fieldset
    	{
        	border:solid 1px #aaa;
    	}        
    	.hideFieldset
    	{
        	border-left:0;
        	border-right:0;
        	border-bottom:0;
    	}
    	.hideFieldset .fieldset-body
    	{
        	display:none;
    	}
    	html, body
		    {
		        font-size:12px;
		        padding:0;
		        margin:0;
		        border:0;
		        height:100%;
		        overflow:hidden;
		    }
    </style>-->
	<%--<%@include file="/common/skins/skin0/component.jsp" %>--%>
</head>
<body style="width:auto;height:100%;padding:0px;margin:0px;">
	<div class="nui-fit">
    <form id="form1" method="post" >
        <input name="machine.id" id="machineId" class="nui-hidden" />
        <input class="nui-hidden" id="id" value="1">
        <fieldset style="border:solid 1px #aaa;padding:3px;">
            <legend>资产基本信息</legend>
            <div style="padding:5px;">
            <table style="table-layout:fixed;" id="table_file">
            	<span>
                	<tr>
                    	<td style="width:150px;" align="right">资产编号：</td>
                    	<td style="width:400px;" align="left" id="machinechange.assetnum"></td>
                    	<td style="width:150px;" align="right">资产ID：</td>
	                    <td style="width:250px;" id="machinechange.mid"></td>
                	</tr>
            	</span>
            	<span>
	                <tr>
		                <td style="width:150px;" align="right">原负责人：</td>
		                <td style="width:250px;" id="machinechange.userOld"></td>
	                    <td style="width:150px;" align="right">新负责人：</td>
	                    <td style="width:250px;" id="machinechange.usingemp"></td>
	                </tr>
                </span>
                <span>
	                <tr>
	                    <td style="width:150px;" align="right">原部门：</td>
	                	<td style="width:250px;" id="machinechange.deptOld"></td>
	                	<td style="width:150px;" align="right">新部门：</td>
	                    <td style="width:250px;" id="machinechange.dept"></td>
                </span>
                <span>
	                <tr>
	                    <td style="width:150px;" align="right">原区域：</td>
	                    <td style="width:250px;" id="machinechange.areaOld"></td>
						<td style="width:150px;" align="right">新区域：</td>
	                    <td style="width:250px;" id="machinechange.area"></td>	                    
	                </tr>
                </span>
                <span>
                	<tr>
	                	<td style="width:150px;" align="right">原状态：</td>
	                    <td style="width:250px;" id="machinechange.statusOld"></td>
	                    <td style="width:150px;" align="right">新状态：</td>
	                    <td style="width:250px;" id="machinechange.status"></td>
	                <tr>
                </span>
                <span>
	                <tr>
	                    <td style="width:150px;" align="right">原存放物理地址：</td>
	                    <td style="width:250px;" id="machinechange.addressOld"></td>
	                    <td style="width:150px;" align="right">新存放物理地址：</td>
	                    <td style="width:250px;" id="machinechange.address"></td>
	                </tr>
                </span>
                <span>
	                <tr>
	                	<td style="width:150px;" align="right">变更说明：</td>
	                    <td style="width:400px;" id="machinechange.comment" colspan="4"></td>	
	                </tr>
                </span>
                <span>
	                <tr>
	                	<td style="width:150px;" align="right">备注：</td>
	                    <td style="width:400px;" id="machinechange.remarks" colspan="4"></td>
	                </tr>
                </span>
            </table>
        </div>
        </fieldset>
       
       <fieldset style="border:solid 1px #aaa;padding:3px;">
            <legend>变更操作信息</legend>
            <div style="padding:5px;">
            <table style="table-layout:fixed;" id="table_file">
                <tr>
                    <td style="width:150px;" align="right">操作人：</td>
	                    <td style="width:250px;" id="machinechange.operator"></td>
	                <td style="width:150px;" align="right">操作时间：</td>
	                    <td style="width:250px;" id="machinechange.changetime"></td>
	                <td style="width:150px;" align="right">操作方式：</td>
	                    <td style="width:250px;" id="machinechange.opType"></td>
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
    	var form = new nui.Form("form1");
    	var changeid = getUrlParam("changeid");
		nui.parse();
		setData(changeid);
		
		function getUrlParam(name) { 
			var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); 
			var r = window.location.search.substr(1).match(reg); 
			if (r != null) 
			return unescape(r[2]); 
			return null; 
		} 
		
		function init(){
		}
		
        function toggleFieldSet(ck, changeid) {
            var dom = document.getElementById(changeid);
            dom.className = !ck.checked ? "hideFieldset" : "";
        }
        
        function setData(changid){
			var json = nui.encode({machinechange:{changeid: changeid}});
        	nui.ajax({
	            url: "com.primeton.eos.machine.machine.getChange.biz.ext",
				type: 'POST',
				data: json,	
				contentType: 'text/json',
	            success: function (o) {
	                form.setData(o);
	                form.setChanged(false);
	                document.getElementById("machinechange.assetnum").innerHTML = o.machinechange.assetnum;
	                document.getElementById("machinechange.mid").innerHTML = o.machinechange.mid == null?"":o.machinechange.mid;
	                document.getElementById("machinechange.userOld").innerHTML = o.machinechange.userOld == null?"":o.machinechange.oldemp;
	                document.getElementById("machinechange.usingemp").innerHTML = o.machinechange.usingemp == null?"":o.machinechange.emp;
	                document.getElementById("machinechange.deptOld").innerHTML = o.machinechange.deptOld == null ?"":o.machinechange.oldorg;
	                document.getElementById("machinechange.dept").innerHTML = o.machinechange.dept == null ?"":o.machinechange.org;
	                document.getElementById("machinechange.areaOld").innerHTML = nui.getDictText('EXP_REGION',o.machinechange.areaOld);
	                document.getElementById("machinechange.area").innerHTML = nui.getDictText('EXP_REGION',o.machinechange.area);
	                document.getElementById("machinechange.statusOld").innerHTML = nui.getDictText('MIS_MA_STATUS',o.machinechange.statusOld);
	                document.getElementById("machinechange.status").innerHTML = nui.getDictText('MIS_MA_STATUS',o.machinechange.status);
	                document.getElementById("machinechange.addressOld").innerHTML = o.machinechange.addressOld == null ?"":o.machinechange.addressOld;
	                document.getElementById("machinechange.address").innerHTML = o.machinechange.address == null ?"":o.machinechange.address;
	                document.getElementById("machinechange.comment").innerHTML = nui.getDictText('MIS_EDITCOMMENT',o.machinechange.comment);
	                document.getElementById("machinechange.remarks").innerHTML = o.machinechange.remarks == null ?"":o.machinechange.remarks;
	                document.getElementById("machinechange.operator").innerHTML = o.machinechange.operatorname;
	                document.getElementById("machinechange.changetime").innerHTML = o.machinechange.changetime;
	                document.getElementById("machinechange.opType").innerHTML = o.machinechange.processinstid == -2?"通过报废操作":o.machinechange.processinstid == -1?"通过单一修改":"通过变更流程";
	              }
	     });
	}
	
	function onCancel(e) {
		if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
        else window.close();  
    }
    </script>
</body>
</html>