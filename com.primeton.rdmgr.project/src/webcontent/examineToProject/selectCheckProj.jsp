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
	<title>项目查询</title>
	<link href="../demo.css" rel="stylesheet" type="text/css" />
</head>
<body style="width:100%;height:100%;padding:0px;margin:0px;">
	<div id="form1">
		<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
			<table style="width:100%;">
				<tr>
					<td align="right" width="120px">项目名称：</td>
	            	<td align="left" width="120px">
	            		<input class="nui-hidden" name="criteria._expr[0]._property" value="projectName"/>
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
				    <td align="right" width="120px">受益部门：</td>
	            	<td align="left" width="120px">
	            		 <input name="criteria._expr[2]._value" id="finUnitId" class="nui-combobox" url="com.primeton.rdmgr.labor.labormgr.getAllOrgs.biz.ext" 
						 filterType="like" textField="orgname" valueField="orgid" dataField="allorgs" valueFromSelect="true" allowInput="true" style="width:150px;" >
						 <input class="nui-hidden" name="criteria._expr[2]._property" value="finUnitId"/>
						 <input class="nui-hidden" name="criteria._expr[2]._op" value="="/>
				    </td>
		      	</tr>
			    <tr>
				    <td align="right" width="120px">项目经理：</td>
	            	<td align="left" width="120px">
	            		<input class="nui-hidden" name="criteria._expr[3]._property" value="manager"/>
		                <input class="nui-hidden" name="criteria._expr[3]._op" value="in" id="ddd"/>
		                <input class="nui-hidden" name="criteria._expr[3]._ref" value="2" id="ccc"/>
		                <input class="nui-hidden" name="criteria._ref[0]._id" value="2"/>
		                <input class="nui-hidden" name="criteria._ref[0]._entity" value="org.gocom.abframe.dataset.organization.OmEmployee"/>
		                <input class="nui-hidden" name="criteria._ref[0]._select._field[0]" value="userid"/>
		                <input class="nui-hidden" name="criteria._ref[0]._expr[0]._property" value="empname"/>
		                <input class="nui-textbox" name="criteria._ref[0]._expr[0]._value" id="emp" onvaluechanged="changeuserid(e)" style="width:150px;"/>
		                <input class="nui-hidden" name="criteria._ref[0]._expr[0]._op" value="like"/>
		                <input class="nui-hidden" name="criteria._ref[0]._expr[0]._likeRule" value="all"/>
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
	            url="com.primeton.rdmgr.project.examineToProject.queryCheckProject.biz.ext" dataField="projects"
	            multiSelect="true"
	            >
	        <div property="columns">
	        	<div type="checkcolumn"></div>
	        	<div field="projectId" width="0" headerAlign="center">项目id</div>
	        	<div field="projectName" width="80" headerAlign="center" allowSort="true">项目名称</div>
	        	<div field="projectno" width="80" headerAlign="center" allowSort="true">项目编号</div>
	        	<div field="custname" width="80" headerAlign="center" allowSort="true">客户</div>
	        	<div field="contnum" width="80" headerAlign="center" allowSort="true">合同编号</div>
	        	<div field="managername"width="80" headerAlign="center" allowSort="true">项目经理</div>
	        	<div field="mangerdeptname"width="80" headerAlign="center" allowSort="true">实施责任部门</div>
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
	var state = false;
	grid.load();
	
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
		var rows = grid.getSelecteds();
		return rows;
	}
	
	function onOk(){
		var rows = grid.getSelecteds();
		var custid = rows[0].custid;
		var belongto = rows[0].belongto;
		var orgid = rows[0].finUnitId;
		var managerdept = rows[0].managerdept;
		var manager = rows[0].manager;
		for(var i = 0;i<rows.length;i++){
			var custid1 = rows[i].custid;
			var belongto1 = rows[i].belongto;
			var orgid1 = rows[i].finUnitId;
			var managerdept1 = rows[i].managerdept;
			var manager1 = rows[i].manager;
			if(custid != custid1){
				alert("如多个项目打包考核，项目的客户必须一致！");
				state = true;
				break;
			}
			if(belongto != belongto1){
				alert("如多个项目打包考核，项目的所属事业部必须一致！");
				state = true;
				break;
			}
			if(managerdept != managerdept1){
				alert("如多个项目打包考核，项目的实施责任部门必须一致！");
				state = true;
				break;
			}
			if(manager != manager1){
				alert("如多个项目打包考核，项目的项目经理必须一致！");
				state = true;
				break;
			}
		}
		if(state){
			return;
		}else{
			CloseWindow("ok");
		}
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