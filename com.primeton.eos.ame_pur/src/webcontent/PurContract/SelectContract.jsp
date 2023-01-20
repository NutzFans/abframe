<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<html>
<!-- 
  - Author(s): wanglinqiong
  - Date: 2016-05-13 15:11:04
  - Description:
-->
<head>
<title>采购合同列表查询</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<style type="text/css">
    body{
        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
    }
    </style>
</head>
<body>
	<div class="nui-toolbar" style="text-align:center;line-height:30px;" borderStyle="border:0;" id="form1">
          <label >供应商简称：</label>
           	<input name="criteria._expr[0]._value" class="nui-textbox"  style="width:100px;" onenter="onKeyEnter"/>
          	<input class="nui-hidden" name="criteria._expr[0]._property" value="purSupplier.suppliersname" />
	        <input class="nui-hidden" name="criteria._expr[0]._op" value="like"/>
	        <input class="nui-hidden" name="criteria._expr[0]._likeRule" value="all"/>
          <label >采购合同编号：</label>
           	<input name="criteria._expr[1]._value" class="nui-textbox"  style="width:100px;" onenter="onKeyEnter"/>
          	<input class="nui-hidden" name="criteria._expr[1]._property" value="purcontnum" />
	        <input class="nui-hidden" name="criteria._expr[1]._op" value="like"/>
	        <input class="nui-hidden" name="criteria._expr[1]._likeRule" value="all"/>
          <a class="nui-button" style="width:60px;" onclick="search()">查询</a>
    </div>
     <div class="nui-fit">
    <div id="datagrid1" class="nui-datagrid" style="width:100%;height:100%;" allowResize="true" onrowdblclick="onRowDblClick" dataField="purContracts" url="com.primeton.eos.ame_pur.PurContract.queryPurContract.biz.ext" sizeList="[10,20,50,100]" pageSize="15" idField="appid" multiSelect="false">
		<div property="columns">
			<div type="checkcolumn" width="25"></div>	
			<div field="purcontid" width="0" align="center" headerAlign="center" allowSort="true">采购合同编号</div>		
			<div field="purSupplier.custid" width="0" align="center" headerAlign="center" allowSort="true">供应商编号</div> 	
			<div field="purSupplier.suppliersname" width="50" align="center" headerAlign="center" allowSort="true">供应商简称</div>							
			<div field="purSupplier.custname" width="0" align="center" headerAlign="center" allowSort="true">供应商名称</div>							
			<div field="purcontnum" width="90" align="center" headerAlign="center"  allowSort="true">合同编号</div>
			<div field="purcontname" width="200" align="center" headerAlign="center" renderer="getDetail" allowSort="true">合同名称</div>	
			<div field="signdate" width="55" align="center" headerAlign="center"allowSort="true">签订日期</div>				
			<div field="purtype" width="0" align="center" headerAlign="center"allowSort="true">合同类型</div>				
			<div field="purstatus"width="0" align="center" headerAlign="center"allowSort="true">合同状态</div>
			<div field="startdate"width="0" align="center" headerAlign="center"allowSort="true">合同开始日期</div>
			<div field="enddate" width="0" align="center"  headerAlign="center"allowSort="true">合同截止日期</div>
		</div>
	</div>
	</div>
	<div class="nui-toolbar" style="text-align:center;padding-top:8px;padding-bottom:8px;" borderStyle="border:0;">
        <a class="nui-button" style="width:60px;" onclick="onOk()">确定</a>
        <span style="display:inline-block;width:25px;"></span>
        <a class="nui-button" style="width:60px;" onclick="onCancel()">关闭</a>
    </div>
</body>
<script type="text/javascript">
	nui.parse();
	var grid = nui.get("datagrid1");
	
	init();
	function init(){
		grid.load();
		grid.sortBy("purSupplier.suppliersname", "asc");
	}
	
	
	function search() {
		var form = new nui.Form("#form1");
		var data = form.getData();
		grid.load(data);
	}
	 
	function GetData() {
		var row = grid.getSelected();
		return row;
	}
	 
	function onKeyEnter(e) {
		search();
	}
	    
	function onRowDblClick(e) {
		onOk();
	}

	function CloseWindow(action) {
		if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
		else window.close();
	}
	
	function onOk() {
		CloseWindow("ok");
	}
	
	function onCancel() {
		CloseWindow("cancel");
	} 
		    
</script>
</html>