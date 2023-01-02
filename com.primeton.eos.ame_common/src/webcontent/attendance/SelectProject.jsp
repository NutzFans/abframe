<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<html>
<!-- 
  - Author(s): liubo
  - Date: 2014-08-22 16:28:09
  - Description:
-->
<head>
	<title></title>
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
          <label >项目名称：</label>
           	<input name="map/projectName" class="nui-textbox"  style="width:100px;" onenter="onKeyEnter"/>
          <label >项目编号：</label>
          <input name="map/projectNo" class="nui-textbox"  style="width:100px;" onenter="onKeyEnter"/>
          
          <label >汇报对象：</label>
          <input name="map/manager" class="nui-textbox"  style="width:100px;" onenter="onKeyEnter"/>
          
          <label >客户名称：</label>
          <input name="map/custName" class="nui-textbox"  style="width:100px;" onenter="onKeyEnter"/>
          
          <a class="nui-button" style="width:60px;" onclick="search()">查询</a>
    </div>
    <div class="nui-fit">
    	<div id="datagrid1" class="nui-datagrid" style="width:100%;height:100%;" allowResize="true"
    	 onrowdblclick="onRowDblClick" dataField="projects" 
    	 url="com.primeton.eos.ame_common.ameAttendance.queryAllProject.biz.ext" sizeList="[10,20,50,100]"
    	 pageSize="15"  multiSelect="true">
			<div property="columns">
				<div type="checkcolumn" width="25"></div>	
				<div field="projectId" width="0" >项目ID</div>		
				<div field="projectNo" width="100" align="center" headerAlign="center"  allowSort="true" >项目代码</div>
				<div field="projectName" width="310" align="left" headerAlign="center"  allowSort="true" >项目名称</div>
				<div field="custjc" width="180" align="center" headerAlign="center"  allowSort="true" >所属客户</div>
				<div field="projectStatus" width="100" align="center" headerAlign="center" renderer="projectStatus1" allowSort="true">项目状态</div>
				<div field="orgname" width="100" align="center" headerAlign="center"  allowSort="true" >受益部门</div>
				<div field="managerdept"width="130" align="center" headerAlign="center"  allowSort="true">实施责任部门</div>						
				<div field="manager"width="65" align="center" headerAlign="center" allowSort="true">项目经理</div>
				<div field="startdate"width="80" align="center" headerAlign="center"allowSort="true" dateFormat="yyyy-MM-dd">开始日期</div>
				<div field="expenddate"width="80" align="center" headerAlign="center"allowSort="true" dateFormat="yyyy-MM-dd">预计结束日期</div>
				<div field="createdate" width="80" align="center"  headerAlign="center" allowSort="true" dateFormat="yyyy-MM-dd">项目创建日期</div>
				
				
				
			
			</div>
		</div>
	</div>  
    <div class="nui-toolbar" style="text-align:center;padding-top:8px;padding-bottom:8px;" borderStyle="border:0;">
        <a class="nui-button" style="width:60px;" onclick="onOk()">确定</a>
        <span style="display:inline-block;width:25px;"></span>
        <a class="nui-button" style="width:60px;" onclick="onCancel()">关闭</a><br/>
    </div>

<script type="text/javascript">
	nui.parse();
	var grid = nui.get("datagrid1");
	
	init();
	function init(){
		grid.load(null,function(){
		});
	}

	
	function projectStatus1(e){
		return nui.getDictText('MIS_PROJSTATUS',e.value);
	}
	function projectType1(e){
		return nui.getDictText('PROJECT_TYPE',e.value);
	}
	
	function pcosttype1(e){
		return nui.getDictText('AME_PCOSTTYPE',e.value);
	}
	
		
	function search() {
		var form = new nui.Form("#form1");
		var data = form.getData();
		grid.load(data,function(a){
			if(a.total==0){
				alert("没有找到符合条件项目组或者该项目组已设置其他考勤规则！");
			}
		});
	}
	 
	function GetData() {
		var row = grid.getSelecteds();
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