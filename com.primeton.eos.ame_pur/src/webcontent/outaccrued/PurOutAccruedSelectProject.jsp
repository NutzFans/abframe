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
	<title>选择计提项目</title>
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
	        <!-- 计提开始日期 -->
	    	<input class="nui-hidden" name="criteria._expr[2].monthstartdate"/>
	        <input class="nui-hidden" name="criteria._expr[2]._op" value="="/>
	        <!-- 计提结束日期 -->
	    	<input class="nui-hidden" name="criteria._expr[3].monthenddate"/>
	        <input class="nui-hidden" name="criteria._expr[3]._op" value="="/>
			<label >项目名称：</label>
          	<input class="nui-textbox" name="criteria._expr[0].projectname" onenter="onKeyEnter"/>
	        <input class="nui-hidden" name="criteria._expr[0]._op" value="like"/>
	        <input class="nui-hidden" name="criteria._expr[0]._likeRule" value="all"/>
	        <label >客户名称：</label>
          	<input class="nui-textbox" name="criteria._expr[1].custname" onenter="onKeyEnter"/>
	        <input class="nui-hidden" name="criteria._expr[1]._op" value="like"/>
	        <input class="nui-hidden" name="criteria._expr[1]._likeRule" value="all"/>
			<a class="nui-button" style="width:60px;" onclick="search()">查询</a>
	    </div>
        <div id="grid1" class="nui-datagrid" style="width:100%;height:auto" allowResize="true" 
            idField="projectno" allowResize="true" dataField="projects" multiSelect="false"
            url="com.primeton.eos.ame_pur.outaccrued.queryPurProjectToPre.biz.ext" 
            onrowdblclick="onRowDblClick" allowAlternating="true">
            <div property="columns">	    
        		<div type="checkcolumn"></div>
                <div field="projectid" headerAlign="center" allowSort="true" visible="false">项目ID</div>                                            
				<div field="projectno" width="70" headerAlign="center" allowSort="true">项目代码</div>
                <div field="projectname" width="150" headerAlign="center" allowSort="true">项目名称</div>
                <div field="custname" width="150" headerAlign="center" allowSort="true">客户名称</div>
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
		//var syb = getUrlParam("syb");
		var monthstartdate = getUrlParam("monthstartdate");
		var monthenddate = getUrlParam("monthenddate");
		search();
		function search() {
			var form = new nui.Form("#form1");
			var data = form.getData();
			grid.sortBy("projectid", "desc");
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