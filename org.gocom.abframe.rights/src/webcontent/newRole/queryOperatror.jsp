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
					<td align="right"><span>登录名称：</span></td>
	            	<td align="left">
	            		<input class="nui-hidden" name="criteria._expr[0]._property" value="userid"/>
				        <input class="nui-hidden" name="criteria._expr[0]._op" value="like"/>
	            		<input class="nui-textbox" name="criteria._expr[0]._value" onenter="search" id="userid" />
	            		<input class="nui-hidden" name="criteria._expr[0]._likeRule" value="all"/>
				    </td>
				    <td align="right"><span>操作员名称：</span></td>
	            	<td align="left">
	            		<input class="nui-hidden" name="criteria._expr[1]._property" value="empname"/>
				        <input class="nui-hidden" name="criteria._expr[1]._op" value="like"/>
				        <input class="nui-hidden" name="criteria._expr[1]._likeRule" value="all"/>
	            		<input class="nui-textbox" name="criteria._expr[1]._value" onenter="search" id="empname"/>
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
	            url="org.gocom.abframe.rights.role.AssignRoleOperator.queryNewRole.biz.ext" dataField="operators" multiSelect="true">
	        <div property="columns">
	        	<div type="checkcolumn"></div>
	        	<div field="operatorid" width="0" headerAlign="center">操作员编号</div>
	        	<div field="empcode" width="80" headerAlign="center" allowSort="true">工号</div>
	        	<div field="userid"width="80" headerAlign="center" allowSort="true">登录名称</div>
	        	<div field="empname"width="80" headerAlign="center" allowSort="true">操作员名称</div>
	        	<div field="orgname"width="80" headerAlign="center" allowSort="true">所属机构</div>
	        	<div field="empstatus"width="80" headerAlign="center" allowSort="true" renderer="getEmpstatus">状态</div>
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
	search();
	
	function search() {
		var form = new nui.Form("#form1");
		var data = form.getData();
		grid.load(data);
	}
	
	function getEmpstatus(e){
		return nui.getDictText('ABF_EMPSTATUS',e.value);
	}
	
	function reset(){
		nui.get("userid").setValue("");
		nui.get("empname").setValue("");
		search()
	}
		
	function GetData() {
		var rows = grid.getSelecteds();
		return rows;
	}
	
	function onOk(){
						var rows=grid.getSelecteds();
						var length1=rows.length;
						rows = nui.clone(rows);    //必须
						if (rows) {
							var json = nui.encode({"operators":rows,"roleid":roleid});
			                form.loading("保存数据中...");
				    		nui.ajax({
			        			url: "org.gocom.abframe.rights.role.AssignRoleOperator.addOperatorRole.biz.ext",
			                	data: json,
			                	type: 'POST',
			                	cache: false,
			                	contentType: 'text/json',
			                	success: function (o) {
			                		if(o.retCode == "0"){
		     							nui.alert("保存失败！");
		     							form.unmask();
		     							return;
		     						}else{
		     							if(length1==0){
		     							nui.alert("请选择要增加的人员！");
		     							form.unmask();
		     							search();
		     							}else{
		     							nui.alert("成功增加"+length1+"个人员！");
		     							form.unmask();
		     							search();
		     							}
		     						
		     							
		     							
		     						}
		     					},
		 						error: function () {
		        					alert("error");
		        				}
		        			});
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