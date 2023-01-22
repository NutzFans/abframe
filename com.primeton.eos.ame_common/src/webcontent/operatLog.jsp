<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%
	String contextPath=request.getContextPath();
 %>
<html>
<!-- 
  - Author(s): Administrator
  - Date: 2016-06-20 13:57:53
  - Description:
-->
<head>
<title>业务日志</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
    </style>
</head>
<body>
<fieldset style="border:solid 1px #aaa;padding:3px;" id="a1">
	<legend><%=request.getParameter("mes")==null?"":request.getParameter("mes")%></legend>
	<div style="width:100%;">
	        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
	            <table style="width:100%;">
	            	<tr>
	                    <td style="width:20%;" id="innerHtml">
	                    	<a class="nui-button" iconCls="icon-add" onclick="addlog()" plain="true">增加</a>
		                    </td>
		                </tr>
	                 </table>           
		        </div>
		    </div>
	<div id="grid_001" class="nui-datagrid" style="width:100%;height:auto;" showPager="false" sortMode="client" 
			url="com.primeton.eos.ame_common.operatLog.getOperatLogs.biz.ext" dataField="logs" 
			allowCellEdit="true" allowCellSelect="true" multiSelect="true" allowCellWrap="true" allowCellWrap="true">
		<div property="columns">
			<div type="indexcolumn" headerAlign="center" width="20" >编号</div>
			<div field="empname"width="40" headerAlign="center" align="left" >操作人</div>
			<div field="operatetime" width="80"  align="center" headerAlign="center" dateFormat="yyyy-MM-dd HH:mm:ss">操作时间</div>
			<div field="loginfo" width="400"headerAlign="left"align="left" >内容</div>
		</div>
	</div>
</fieldset>
	<script>
	var groupid = '<%=request.getParameter("groupid")%>';
	var relationid = <%=request.getParameter("relationid")%>;
	var mes = '<%=request.getParameter("mes")%>';
	if(mes=='null'||mes==""){
		mes="";
		document.getElementById("a1").style.border="none";
	}
	
	function addlog(){
    	nui.open({
			url:"<%=request.getContextPath() %>/ame_common/addOperatLog.jsp?groupid="+groupid+"&relationid="+relationid,
			title: "增加"+mes,
			width: 800,
			height: 400,
			ondestroy: function (action) {
				if (action == "save") {
					var iframe = this.getIFrameEl();
					var data = iframe.contentWindow.SetData();
					data = nui.clone(data);    //必须
					nui.get("grid_001").load({"groupid":groupid,"relationid":relationid});
				}
			}
		});
    }
	</script>
</body>
</html>