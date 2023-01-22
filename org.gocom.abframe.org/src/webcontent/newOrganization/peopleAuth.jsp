<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common/common.jsp"%>
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<html>
<!-- 
  - Author(s): 张一博
  - Date: 2018-03-30 16:37:31
  - Description:
-->
<head>
<title>人员权限</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<style type="text/css">
	body{margin: 0;padding: 0;width: 100%;height: 100%;}
</style>
</head>
<body>

<div class="nui-fit">
    <table style="width:100%;table-layout:fixed;">
        <tr>
            <td >
            	 <div id="p1" class="nui-panel" title="已授予角色" style="width:100%;height:auto;"
                    buttons="collapse" onbuttonclick="onbuttonclick">
                    <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
			            <table style="width:100%;">
			                <tr>
			                    <td style="width:100%;">
			                        <a class="nui-button" iconCls="icon-remove" onclick="remove()" plain="true" tooltip="删除">删除</a>
			                    </td>
			                </tr>
			            </table>           
			        </div>
                    <div id="datagrid"  class="nui-datagrid" style="width:100%;height:300px;" pageSize="10"  showSummaryRow="true"
    					dataField="roles" multiSelect="false" url="org.gocom.abframe.org.party.PartyManager.queryEmployeeRole.biz.ext"
						allowCellWrap="true">
		                <div property="columns">
		                	<div type="checkcolumn" width="20px"></div>
		                    <div field="roleid" width="120" align="left" headerAlign="center">角色ID</div>
		                    <div field="rolename" width="120" align="left" headerAlign="center" >角色名称</div>
		                    <div field="appname" width="120" align="center" headerAlign="center">应用名称</div>
		                </div>
		            </div>
                </div>
            </td>
            <td>
                <div title="未授予角色" class="nui-panel" style="width:100%;height:auto;"
                     buttons="collapse" onbuttonclick="onbuttonclick" > 
                     <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
			            <table style="width:100%;">
			                <tr>
			                    <td style="width:100%;">
			                        <a class="nui-button" iconCls="icon-add" onclick="add()" plain="true" tooltip="增加">增加</a>
			                    </td>
			                </tr>
			            </table>           
			        </div>
                	<div id="datagrid1"  class="nui-datagrid" style="width:100%;height:300px;" pageSize="10"  showSummaryRow="true"
    					dataField="oaPartyroleHavenot" multiSelect="true" url="org.gocom.abframe.org.party.PartyManager.queryOperroleHavenot.biz.ext"
						allowCellWrap="true">
		                <div property="columns">
		                	<div type="checkcolumn" width="20px"></div>
		                    <div field="roleid" width="120" align="left" headerAlign="center" >角色ID</div>
		                    <div field="rolename" width="120" align="left" headerAlign="center" >角色名称</div>
		                    <div field="appname" width="120" align="center" headerAlign="center">应用名称</div>
		                </div>
		            </div>
                </div>
            </td>
        </tr>
     	<tr>
            <td colspan="2">
            	 <div id="p1" class="nui-panel" title="特别权限设置" style="width:100%;height:auto;"
                    buttons="collapse" onbuttonclick="onbuttonclick">
                    <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
			            <table style="width:100%;">
			                <tr>
			                    <td style="width:100%;">
			                       <%-- <a class="nui-button" iconCls="icon-add" onclick="addSpeacil()" plain="true">增加</a>
			                        <a class="nui-button" iconCls="icon-remove" onclick="removeSpeacil()" plain="true">删除</a>--%>
			                    </td>
			                </tr>
			            </table>           
			        </div>
	            	<div id="datagrid2"  class="nui-datagrid" style="width:100%;height:300px;" pageSize="10"  showSummaryRow="true"
						dataField="oaOperfunc" multiSelect="true" url="org.gocom.abframe.org.party.PartyManager.queryOperfunc.biz.ext"
						allowCellWrap="true">
		                <div property="columns">
		                	<div type="checkcolumn" width="20px"></div>
		                	<div field="authtype" width="120" headerAlign="center" align="center"  renderer="authtype">授权标志</div>
		                    <div field="acFunction.funcname" width="120" align="center" headerAlign="center" >功能名称</div>
		                    <div field="funcgroupname" width="120" align="center" headerAlign="center">功能组名称</div>
		                    <div field="appname" width="120" align="center" headerAlign="center" >应用名称</div>
		                    <div field="startdate" width="120" align="center" headerAlign="center" >生效日期</div>
		                    <div field="enddate" width="120" align="center" headerAlign="center">失效日期</div>
		                </div>
		            </div>
                </div>
            </td>
        </tr>
        <tr>
            <td colspan="2">
            	 <div id="p1" class="nui-panel" title="继承的角色" style="width:100%;height:auto;"
                    buttons="collapse" onbuttonclick="onbuttonclick">
                    <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
			            <table style="width:100%;">
			                <tr>
			                    <td style="width:100%;">
			                        <a class="nui-button" iconCls="icon-add" onclick="addJ()" plain="true" tooltip="增加">增加</a>
			                    </td>
			                </tr>
			            </table>           
			        </div>
	            	<div id="datagrid3"  class="nui-datagrid" style="width:100%;height:300px;" pageSize="10"  showSummaryRow="true"
						dataField="roles" multiSelect="true" url="org.gocom.abframe.org.party.PartyManager.queryEmployeeRole.biz.ext"
						allowCellWrap="true">
		                <div property="columns">
		                	<div type="checkcolumn" width="20px"></div>
		                    <div field="roleid" width="120" align="left" headerAlign="center" >角色ID</div>
		                    <div field="rolename" width="120" align="left" headerAlign="center" >角色名称</div>
		                    <div field="appname" width="120" align="center" headerAlign="center">应用名称</div>
		                    <div field="roledesc" width="120" align="center" headerAlign="center">描述</div>
		                </div>
		            </div>
                </div>
            </td>
        </tr>
    </table>
</div>

</body>
<script type="text/javascript">
	<%
		UserObject user = (UserObject) session.getAttribute("userObject");
		String username = user.getUserName();
		String userid = user.getUserId();
		Map attr = user.getAttributes();
		String empid = (String) attr.get("empid");
		String operatorid = (String) attr.get("operatorid");
	
	%>
	
	nui.parse();
	var empid = '<%=request.getParameter("empid") %>';
	var operatorid = '<%=request.getParameter("operatorid") %>';
	var userid = '<%=userid %>';
	var userEmpid = '<%=empid %>';
	var userOperatorid = '<%=operatorid %>';
	
	var grid = nui.get("datagrid");
	var grid1 = nui.get("datagrid1");
	var grid2 = nui.get("datagrid2");
	var grid3 = nui.get("datagrid3");
	
	
	search();
	function search(){
		var data = {omEmployee:{empid:empid},acOperator:{operatorid:operatorid},type:"self"};
		var data1 = {oPartyroleHavenot:{partyid:empid,partytype:"employee"},user:{empid:userEmpid,operatorid:userOperatorid,userid:userid}};
		var data2 = {oOperfunc:{acOperator:{operatorid:operatorid}}};
		var data3 = {omEmployee:{empid:empid},type:"allFrom"};
		grid.load(data);
		grid1.load(data1);
		grid2.load(data2);
		grid3.load(data3);
	}
	
	function remove(){
		var roleInfo = grid.getSelecteds();
		if(roleInfo.length<1){
			nui.alert("请选中所要删除的角色。");
			return;
		}
		nui.confirm("确定删除该角色？", "确定？",
            function (action) {
                if (action == "ok") {
                    var json = {deleteEntities:roleInfo,omEmployee:{empid:empid}};
					nui.ajax({
						url:'org.gocom.abframe.org.party.PartyManager.saveOperrole.biz.ext',
						data:json,
						type:'post',
						dataType:'json',
						success:function(res){
							if(res.iRtn == '0'){
								nui.alert("删除成功。")
								search();
							}else{
								nui.alert("删除失败,请联系信息技术部。")
								search();
							}
						}
					})
                } else {
                    return;
                }
            }
        );
	}
	
	function add(){
		var roleInfo = grid1.getSelecteds();
		if(roleInfo.length<1){
			nui.alert("请选中所要添加的角色。");
			return;
		}
	 	var json = {deleteEntities:roleInfo};
		nui.ajax({
			url:'org.gocom.abframe.org.party.PartyManager.saveOperroleHavenot.biz.ext',
			data:json,
			type:'post',
			dataType:'json',
			success:function(res){
				if(res.iRtn == '0'){
					nui.alert("添加成功。")
					search();
				}else{
					nui.alert("添加失败，请联系信息技术部。")
					search();
				}
			}
		})
	}
	
	function addSpeacil(){
		var parm='oEmp/empid=<b:write property="emp/empid" />'; 
		var sUrl="org.gocom.abframe.org.organization.FuncAssign.flow?"+parm;  
        nui.open({
            url: sUrl,
            title: "新增下级机构", 
            width:700,
            height:500,
            onload: function () {
            	<%--var json = {empid:fromNode.orgid,orgid:fromNode.parentorgid}
	            	var iframe = this.getIFrameEl();
 					iframe.contentWindow.search(json);--%>
            },
            ondestroy: function (action) {
            	if(action == "ok"){
            		var iframe = this.getIFrameEl();
					var data = iframe.contentWindow.getData();
					data = nui.clone(data);   
					orgDrag(data);
            	}
            }
        });
	}
	function removeSpeacil(){
		var url = "<%=request.getContextPath() %>/abframe/org/newOrganization/moveOrgNode.jsp";
        nui.open({
            url: url,
            title: "新增下级机构", 
            width:300,
            height:200,
            onload: function () {
            	<%--var json = {empid:fromNode.orgid,orgid:fromNode.parentorgid}
	            	var iframe = this.getIFrameEl();
 					iframe.contentWindow.search(json);--%>
            },
            ondestroy: function (action) {
            	if(action == "ok"){
            		var iframe = this.getIFrameEl();
					var data = iframe.contentWindow.getData();
					data = nui.clone(data);   
					orgDrag(data);
            	}
            }
        });
	}
	
    function onbuttonclick(e) {
        var panel = this;
        if (e.name == "max") {
            if (panel.maxed) {
                restorePanel(panel);
            } else {
                maxPanel(panel);
            }
        }
    }
    
    function authtype(e){
    	return nui.getDictText('ABF_FUNCAUTHTYPE',e.value);
    }
</script>
</html>