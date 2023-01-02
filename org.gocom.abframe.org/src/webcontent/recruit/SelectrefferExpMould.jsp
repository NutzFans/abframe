<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): xupc
  - Date: 2020-04-14
  - Description:
-->
<head>
<title>内推费用管理模板</title>
<%@include file="/common/common.jsp"%>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<style type="text/css">
    body{
        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
    }
    </style>
</head>
<body>
    <div class="nui-fit">
	    <div id="grid_refferexpmould" class="nui-datagrid" style="width:100%;height:100%;" dataField="refferexpMould"   multiSelect="flase" borderStyle="border-left:0;border-right:0;"
		  url="com.primeton.eos.ame_resume.resumeManage.queryRefferexpMould.biz.ext" showPager="false" onrowdblclick="onRowDblClick">
		</div>
    </div> 
</body>
<div style="text-align: center;padding: 10px;" class="nui-toolbar">
	        <a class="nui-button" style="width:60px;" onclick="onOk()" iconCls="icon-ok">确定</a>
	        <span style="display:inline-block;width:25px;"></span>
	        <a class="nui-button" style="width:60px;" onclick="onCancel()" iconCls="icon-cancel">取消</a>
</div>
<script type="text/javascript">
	nui.parse();
	var grid_refferexpmould = nui.get("grid_refferexpmould");
	var eventtypes;
	var refferexpmouldno;
	var frozenendindex;
	refferExpMould();
	function refferExpMould(){
	    var grid = getColumns();
        grid_refferexpmould.set({columns:grid});
        grid_refferexpmould.load();
        /* var frozenendindex = eventtypes.length +3;
        grid_refferexpmould.frozenColumns (0,frozenendindex); */
        console.log(grid_refferexpmould.getColumns());
	}
    //动态获取列
    function getColumns() {
        var flag = true;
    	var result = [];
    	result.push({type:'checkcolumn',width:"25px"});
		result.push({field:'refferexpmouldno',width:"40px",align:'center',headerAlign:'center',header:'编号'});
		var result_eventtype =[];
    	nui.ajax({
            url: "com.primeton.eos.ame_resume.resumeManage.getRefferEventtype.biz.ext",
			type: 'POST',
			async:false,
			contentType: 'text/json',
            success: function (o) {
            	eventtypes = o.eventtypes;
            	if(eventtypes.length==0){//没有数值
            		flag=false;
            	}
				for(var i = 0 ; i< eventtypes.length; i++){
		    		result_eventtype.push({field:eventtypes[i].dictid,width:"90px",align:'right',headerAlign:'center',summaryType:'sum',header:eventtypes[i].dictname});
				}
            }
        });
        if(flag){
    	        result_eventtype.push({field:'xj',width:"70px",align:'right',headerAlign:'center',header:'小计',summaryType:'sum'});
        }
        result.push({headerAlign:'center',header:'事件类型',columns:result_eventtype});
        result.push({field:'status',width:"45px",align:'center',headerAlign:'center',header:'状态',renderer:"getStatus"});
        result.push({field:'mouldremark',width:"300px",align:'left',headerAlign:'center',header:'备注'});
        return result;
	}
	function GetData() {
		var row = grid_refferexpmould.getSelected();
		return row;
	}
	function onOk() {
	    CloseWindow("ok");
	}
	function onCancel() {
		CloseWindow("cancel");
	}
	function getStatus(e){
		return nui.getDictText('ABF_STATUS',e.value);
	}
	function onRowDblClick(e) {
		onOk();
	}
	function CloseWindow(action) {
		if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
		else window.close();
	}
 </script>   
</html>   