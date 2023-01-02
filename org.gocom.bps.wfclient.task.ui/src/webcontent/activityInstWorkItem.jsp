<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): wanglinqiong
  - Date: 2016-05-13 15:11:04
  - Description:
-->
<head>
<title>当前活动的工作项</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<style type="text/css">
    html, body
    {
        font-size:12px;
        padding:0;
        margin:0;
        border:0;
        height:100%;
        overflow:hidden;
    }
</style>
</head>
<body> 
  	<div class="nui-fit">
    	<div id="datagrid1" class="nui-datagrid" style="width:100%;height:100%;" onrowdblclick="onRowDblClick" onselectionchanged="selectChanged"
    	url="org.gocom.bps.wfclient.task.business.task.queryWorktemsByActivityInstID.biz.ext" dataField="workItems" sizeList=[5,10,20,50,100] multiSelect="false" pageSize="10"   >
      		<div property="columns" >
        		<div type="checkcolumn" width="40">操作</div>
		        <div field="partiName" width="80" align="center" headerAlign="center" headerAlign="center" >参与者</div>
	        	<div field="workItemName" width="140" align="center" headerAlign="center" headerAlign="center" >工作项名称</div>
		        <div field="currentState" width="60" align="center" headerAlign="center" headerAlign="center" renderer="dictStatus">状态</div>
		        <div field="isTimeOut" width="60" align="center" headerAlign="center" headerAlign="center" renderer="dictIsTimeOut">是否超时</div>
	        	<div field="workItemID" width="73" align="center" headerAlign="center" headerAlign="center" >工作项ID</div>
		        <div field="processInstID" width="90" align="center" headerAlign="center" headerAlign="center" >所属流程实例ID</div>
	      	</div>
		</div>
	</div>
  <div class="nui-toolbar" style="text-align:center;padding-top:8px;padding-bottom:8px;" borderStyle="border:0;">
    <a class="nui-button" style="width:60px;" onclick="onOk()">确定</a>
    <span style="display:inline-block;width:25px;"></span>
    <a class="nui-button" style="width:60px;" onclick="onCancel()">取消</a>
  </div>
  <script type="text/javascript">
    nui.parse();

    var grid = nui.get("datagrid1");
	
    function GetData() {
      	var row = grid.getSelected();
		return row;
    }
	function dictIsTimeOut(e) {
		if(e.value=='N'){
			return "否";
		}else if(e.value=='Y'){
			return "是";
		}
	}
	function dictStatus(e) {//4待领取  12完成 10运行
		if(e.value==4){
			return "待领取";
		}else if(e.value=='12'){
			return "完成";
		}else if(e.value=='10'){
			return "运行";
		}
	}
    function onKeyEnter(e) {
      search();
    }
    //////////////////////////////////
    function CloseWindow(action) {
      window.close();
    }
	function onRowDblClick(e) {
		onOk();
	}
    function onOk() {
      var row = grid.getSelected();
      if (!row) {
        alert("请选中一条记录");
        return;
      }
      CloseWindow("ok");
    }
    function onCancel() {
      CloseWindow("cancel");
    }
    function CloseWindow(action) {
		if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
		else window.close();
	}
	function search(activityInstID) {
		var data  = {activityInstID:activityInstID};
		grid.load(data);
	}
	function selectChanged(){
		var row = grid.getSelected();
    	if(row.currentState == 12){//完成
			alert("该工作项已经完成，不能进行改派！");
			grid.deselect(row);
			return;
		}
	}
  </script>
</body>
</html>
