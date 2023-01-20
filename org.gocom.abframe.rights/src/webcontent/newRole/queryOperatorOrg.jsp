<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@include file="/nui/common.jsp"%>
<html>
<!-- 
  - Author(s): Administrator
  - Date: 2015-07-10 14:06:49
  - Description:
-->
<head>
	<title></title>
	<link href="../demo.css" rel="stylesheet" type="text/css" />
</head>
<body style="width:100%;height:100%;padding:0px;margin:0px;">
	<div id="form1">
		<input class="nui-hidden" name="roleid" id="roleid"/>
		<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
			<table style="width:100%;">
				<tr>
					<td align="right"><span>机构名称：</span></td>
	            	<td align="left">
	            		<input class="nui-hidden" name="criteria._expr[0]._property" value="orgname"/>
				        <input class="nui-hidden" name="criteria._expr[0]._op" value="like"/>
				        <input class="nui-hidden" name="criteria._expr[0]._likeRule" value="all"/>
	            		<input class="nui-textbox" name="criteria._expr[0]._value" id="orgname" />
				    </td>
				    <td align="right"><span>机构类别：</span></td>
	            	<td align="left">
	            		<input class="nui-hidden" name="criteria._expr[1]._property" value="orgtype"/>
				        <input class="nui-hidden" name="criteria._expr[1]._op" value="like"/>
				        <input class="nui-hidden" name="criteria._expr[1]._likeRule" value="all"/>
	            		<input class="nui-textbox" name="criteria._expr[1]._value"/ id="orgtype">
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
		<div id="datagrid1" class="nui-datagrid" style="width:100%;height:auto;" sizeList="[5,10,20,50]" pageSize="10"
	            url="org.gocom.abframe.rights.role.AssignRoleOrgan.queryOperatorRole.biz.ext" dataField="orgs" multiSelect="true">
	        <div property="columns">
	        	<div type="checkcolumn"></div>
	        	<div field="orgname" width="80" headerAlign="center">机构名称</div>
	        	<div field="orgtype" width="80" headerAlign="center" allowSort="true" renderer="getOrgType">机构类别</div>
	        	<div field="status"width="80" headerAlign="center" allowSort="true" renderer="getStatus">机构状态</div>
	        	<div field="area"width="80" headerAlign="center" allowSort="true">所属地域</div>
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
	var form = new nui.Form("#form1");
	var roleid = '<%=request.getParameter("roleid") %>';
	nui.get("roleid").setValue(roleid);
	search()
		
	
	function search() {
		var form = new nui.Form("#form1");
		var data = form.getData();
		grid.load(data);
	}
	
	function getStatus(e){
		return nui.getDictText('ABF_ORGSTATUS',e.value);
	}
	
	function getOrgType(e){
		return nui.getDictText('ABF_ORGTYPE',e.value);
	}
	
	function reset(){
		nui.get("orgname").setValue("");
		nui.get("orgtype").setValue("");
		search()
	}
		
	function GetData() {
		var rows = grid.getSelecteds();
		return rows;
	}
	
	function onOk(){
		CloseWindow("ok");
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