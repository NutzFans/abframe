<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<%@include file="/nui/common.jsp"%>
<%@include file="/common/common.jsp"%>
<head>
	<title>选择服务器</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <style type="text/css">
    body{
        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
    }
    </style>	
</head>
<body>

	<div class="nui-toolbar" style="text-align:center;line-height:30px;" borderStyle="border:0;" id="form1">
    	<input class="nui-hidden" name="sortField" value="servid"/>
		<input class="nui-hidden" name="sortOrder" value="asc"/>
          <label >服务器名称：</label>
          	<input class="nui-textbox" name="criteria._expr[0].servname" onenter="onKeyEnter"/>
	        <input class="nui-hidden" name="criteria._expr[0]._op" value="like"/>
	        <input class="nui-hidden" name="criteria._expr[0]._likeRule" value="all"/>
          <a class="nui-button" style="width:60px;" onclick="search()">查询</a>
    </div>
    
    <div class="nui-fit">
        <div id="grid1" class="nui-datagrid" style="width:100%;height:100%;"
            idField="servid" allowResize="true" dataField="servers" multiSelect="false"
            borderStyle="border-left:0;border-right:0;" onrowdblclick="onRowDblClick">
            <div property="columns">	    
        		<div type="checkcolumn"></div>
        		<div type="indexcolumn"></div>
                <div field="servid" width="0" headerAlign="center" allowSort="true">服务器ID</div>   
                <div field="servname" width="120" headerAlign="center" allowSort="true">服务器名称</div>                                                             
                <div field="servtype" width="100" headerAlign="center" allowSort="true" renderer="dictServerType">服务器类型</div>                                         
                <div field="servip" width="100" headerAlign="center" allowSort="true">服务器IP</div>                                            
            </div>
        </div>
	</div>  
	              
    <div class="nui-toolbar" style="text-align:center;padding-top:8px;padding-bottom:8px;" borderStyle="border:0;">
        <a class="nui-button" style="width:60px;" onclick="onOk()">确定</a>
        <span style="display:inline-block;width:25px;"></span>
        <a class="nui-button" style="width:60px;" onclick="onCancel()">取消</a>
    </div>

</body>
</html>

<script type="text/javascript">
	nui.parse();
	var url="com.primeton.eos.ame_common.fault.queryServer.biz.ext"
	var grid = nui.get("grid1");
	grid.setUrl(url);
	grid.load();
	grid.sortBy("servname", "asc");
	
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
	
	function dictServerType(e){
		return nui.getDictText("MIS_SERVTYPE",e.value);
	}
</script>