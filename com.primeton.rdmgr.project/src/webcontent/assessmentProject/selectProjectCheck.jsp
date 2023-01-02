<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@include file="/nui/common.jsp"%>
<html>
<!-- 
  - Author(s): Administrator
  - Date: 2015-07-10 14:06:49
  - Description:
-->
<head>
	<title>项目查询</title>
	<link href="../demo.css" rel="stylesheet" type="text/css" />
</head>
<body style="width:100%;height:100%;padding:0px;margin:0px;">
	<div id="form1">
		<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
			<table style="width:100%;">
				<input name="criteria._expr[4]._value" class="nui-hidden" value="2"/>
			    <input class="nui-hidden" name="criteria._expr[4]._property" value="checkstatus"/>
			    <input class="nui-hidden" name="criteria._expr[4]._op" value="="/>
				<tr>
					<td align="right" width="120px">项目名称：</td>
	            	<td align="left" width="120px">
	            		<input class="nui-hidden" name="criteria._expr[0]._property" value="projectname"/>
				        <input class="nui-hidden" name="criteria._expr[0]._op" value="like"/>
				        <input class="nui-hidden" name="criteria._expr[0]._likeRule" value="all"/>
	            		<input class="nui-textbox" name="criteria._expr[0]._value" style="width:150px;"/>
				    </td>
				    <td align="right" width="120px">项目编号：</td>
	            	<td align="left" width="120px">
	            		<input class="nui-hidden" name="criteria._expr[1]._property" value="projectno"/>
				        <input class="nui-hidden" name="criteria._expr[1]._op" value="like"/>
		    			<input class="nui-hidden" name="criteria._expr[1]._likeRule" value="all"/>
		    			<input class="nui-textbox" name="criteria._expr[1]._value" style="width:150px;"/>
				    </td>
		      	</tr>
			    <tr>
				    <td align="right" width="120px">项目经理：</td>
	            	<td align="left" width="120px">
	            		<input class="nui-hidden" name="criteria._expr[2]._property" value="manager"/>
		                <input class="nui-hidden" name="criteria._expr[2]._op" value="in" id="ddd"/>
		                <input class="nui-hidden" name="criteria._expr[2]._ref" value="2" id="ccc"/>
		                <input class="nui-hidden" name="criteria._ref[0]._id" value="2"/>
		                <input class="nui-hidden" name="criteria._ref[0]._entity" value="org.gocom.abframe.dataset.organization.OmEmployee"/>
		                <input class="nui-hidden" name="criteria._ref[0]._select._field[0]" value="userid"/>
		                <input class="nui-hidden" name="criteria._ref[0]._expr[0]._property" value="empname"/>
		                <input class="nui-textbox" name="criteria._ref[0]._expr[0]._value" id="emp" onvaluechanged="changeuserid(e)" style="width:150px;"/>
		                <input class="nui-hidden" name="criteria._ref[0]._expr[0]._op" value="like"/>
		                <input class="nui-hidden" name="criteria._ref[0]._expr[0]._likeRule" value="all"/>
				    </td>
				    <td class="form_label" align="right">方案确定日期</td>
		          	<td colspan="1">
						 <input class="nui-datepicker" name="criteria._expr[3]._min" style="width:73px"/>-<input class="nui-datepicker" name="criteria._expr[3]._max" style="width:72px"/>
						 <input class="nui-hidden" name="criteria._expr[3]._property" value="projcheckdate"/>
						 <input class="nui-hidden" name="criteria._expr[3]._op" value="between"/>
						 <input class="nui-hidden" name="criteria._expr[3]._pattern" value="yyyy-MM-dd"/>
		          	</td>
	    		</tr>
	    		<tr>
	    			<td align="center" colspan="8">
						<a class="nui-button" id="search" iconCls="icon-search" onclick="search">查找</a>
						<a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset">重置</a>
					</td>
				</tr>
	    	</table>
    	</div>
	</div>
	<div class="nui-fit">
		<div id="datagrid1" class="nui-datagrid" style="width:auto;height:auto;" sizeList="[5,10,20,50]" pageSize="10"
	            url="com.primeton.rdmgr.project.examineToProject.queryProjCheck.biz.ext" dataField="projchecks" multiSelect="false">
	        <div property="columns">
	        	<div type="checkcolumn"></div>
                <div field="projectname" width="180" align="left" headerAlign="center" allowSort="true" renderer="getProjectNameDetail">项目名称</div>
                <div field="projectno" width="100" align="center" headerAlign="center" allowSort="true" >项目编号</div>
                <div field="contnum" width="100" align="center" headerAlign="center" allowSort="true" >合同编号</div>
                <div field="custname" width="180" align="center" headerAlign="center" allowSort="true" >客户</div>
                <div field="managername" width="60" align="center" headerAlign="center" allowSort="true" >项目经理</div>
                <div field="checkstatus" width="130" align="center" headerAlign="center" allowSort="true" renderer="dictGetCheckstatus">考核状态</div>
                <div field="checkincomeym" width="120" align="center" headerAlign="center" allowSort="true">考核收入确认年月</div>
                <div field="checkstartdate" width="120" align="center" headerAlign="center" allowSort="true">考核方案发起日期</div>
                <div field="projcheckdate" width="120" align="center" headerAlign="center" allowSort="true">考核方案确定日期</div>
	        </div>
	    </div>
	</div>
	
	<div class="nui-toolbar" style="text-align:center;padding-top:8px;padding-bottom:8px;" borderStyle="border:0;">
        <a class="nui-button" style="width:60px;" onclick="onOk">确定</a>
        <span style="display:inline-block;width:25px;"></span>
        <a class="nui-button" style="width:60px;" onclick="onCancel">取消</a>
    </div>
</body>
<script>
	nui.parse();
	var grid = nui.get("datagrid1");
	<%
   		UserObject user = (UserObject) session.getAttribute("userObject");
   		String username = user.getUserName();
   		String userno = user.getUserId();
    %>
    var username = '<%=username %>';
	nui.get("emp").setValue(username);
	nui.get("emp").setReadOnly(true);
	var ismanager = '<%=request.getParameter("ismanager") %>';
	if(ismanager=='0'){
		nui.get("emp").setValue(null);
		nui.get("emp").setReadOnly(false);
	}
	var state = false;
	search();
	
	function search() {
		var form = new nui.Form("#form1");
		if(nui.get("emp").getValue()==""||nui.get("emp").getValue()==null){
			nui.get("ddd").setValue("=");
			nui.get("ccc").setValue("");
		}
		var data = form.getData();
		grid.load(data);
	}
	function reset(){
		var form = new nui.Form("#form1");
		form.reset();
		grid.load();
	}
		
	
	function GetData() {
		var row = grid.getSelected();
		return row;
	}
	
	function onOk(){
		CloseWindow("ok");
	}
	
	function dictGetCheckstatus(e){
		return nui.getDictText('CHECK_STATUS',e.value);
	}
	
	function changeuserid(e){
		if(!(nui.get("emp").getValue()==""||nui.get("emp").getValue()==null)){
			nui.get("ddd").setValue("in");
			nui.get("ccc").setValue("2");
		}
	}
	
	function onCancel(){
		CloseWindow("cancel");
	}
	
	function CloseWindow(action) {
		if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
		else window.close();
	}
</script>
</html>