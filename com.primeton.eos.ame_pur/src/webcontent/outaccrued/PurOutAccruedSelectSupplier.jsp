<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%
	String contextPath=request.getContextPath();
 %>
<html>
<!-- 
  - Author(s): zyl
  - Date: 2016-07-18 19:29:14
  - Description:
-->
<head>
	<title>选择计提供应商</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<script src="../common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
    </style>
</head>
<body>
	<div class="nui-fit">
		<div class="nui-toolbar" style="text-align:center;line-height:30px;" borderStyle="border:0;" id="form1">
	        <label >供应商名称：</label>
          	<input class="nui-textbox" name="criteria._expr[0].custname" onenter="onKeyEnter"/>
	        <input class="nui-hidden" name="criteria._expr[0]._op" value="like"/>
	        <input class="nui-hidden" name="criteria._expr[0]._likeRule" value="all"/>
			<a class="nui-button" style="width:60px;" onclick="search()">查询</a>
	    </div>
        <div id="grid1" class="nui-datagrid" style="width:100%;height:auto" allowResize="true" 
            idField="projectno" allowResize="true" dataField="suppliers" multiSelect="false"
            url="com.primeton.eos.ame_pur.outaccrued.queryPurSupplierToPre.biz.ext" 
            onrowdblclick="onRowDblClick" allowAlternating="true">
            <div property="columns">	    
        		<div type="checkcolumn"></div>
                <div field="custid" headerAlign="center" allowSort="true" visible="false">供应商id</div>
                <div field="custnum" width="120" headerAlign="center" allowSort="true">供应商编号</div>
                <div field="suppliersname" width="150" headerAlign="center" allowSort="true">供应商简称</div>
                <div field="custname" width="150" headerAlign="center" allowSort="true">供应商名称</div>
            </div>
        </div>
	</div>
    <div class="nui-toolbar" style="text-align:center;padding-top:8px;padding-bottom:8px;" borderStyle="border:0;">
        <a class="nui-button" style="width:60px;" onclick="onOk()">确定</a>
        <span style="display:inline-block;width:25px;"></span>
        <a class="nui-button" style="width:60px;" onclick="onCancel()">关闭</a>
    </div>
	<script type="text/javascript">
		nui.parse();
		var grid = nui.get("grid1");
	        
		function getUrlParam(name) { 
			var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); 
			var r = window.location.search.substr(1).match(reg); 
			if (r != null) 
			return unescape(r[2]); 
			return null; 
		}
		search();
		function search() {
			var form = new nui.Form("#form1");
			var data = form.getData();
			grid.sortBy("custname", "asc");
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
</body>
</html>