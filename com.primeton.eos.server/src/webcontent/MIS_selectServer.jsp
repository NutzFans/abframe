<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<script src="../common/nui/nui.js" type="text/javascript"></script>
<%@include file="/common/common.jsp"%>
<html>
<!-- 
  - Author(s): zhx
  - Date: 2015-07-08 17:20:51
  - Description:
-->
<head>
<title>选择对应服务器</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <link href="../demo.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
    body{
        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
    }
    </style>
</head>
<body>
	<div class="nui-toolbar" style="text-align:center;line-height:30px;" borderStyle="border:0;" id="form1">
    	<input class="nui-hidden" name="sortField" value="servid"/>
		<input class="nui-hidden" name="sortOrder" value="desc"/>
          <label >服务器名称：</label>
          	<input class="nui-textbox" name="criteria._expr[1].servname" onenter="onKeyEnter"/>
	        <input class="nui-hidden" name="criteria._expr[1]._op" value="like"/>
	        <input class="nui-hidden" name="criteria._expr[1]._likeRule" value="all"/>
          <a class="nui-button" style="width:60px;" onclick="search()">查询</a>
    </div>  
    <div class="nui-fit">
        <div id="grid1" class="nui-datagrid" style="width:100%;height:100%;"
            idField="servid" allowResize="true" dataField="servapps" multiSelect="false"
            borderStyle="border-left:0;border-right:0;" onrowdblclick="onRowDblClick">
            <div property="columns">	    
        		<div type="checkcolumn"></div>
        		<div type="indexcolumn"></div>
        		<div field="servname"width="200" headerAlign="center"allowSort="true">服务器名称</div>  
                <div field="assetnum" width="80" headerAlign="center"  allowSort="true">对应资产编号</div>
				<div field="servtype" width="70" renderer="dictServtype" align="center" headerAlign="center" allowSort="true">服务器类型</div>
				<div field="servip"width="60" headerAlign="center"allowSort="true">服务器IP</div>
				<div field="servuse" width="100"headerAlign="center"allowSort="true">服务器主要用途</div>
				<div field="servmemory" width="70"headerAlign="center" allowSort="true">服务器内存</div>
				<div field="servcpu" width="65"headerAlign="center" allowSort="true">服务器CPU</div>
				<div field="servhardware"width="65" headerAlign="center"allowSort="true">服务器硬盘</div>
				<div field="servos"width="90" headerAlign="center"allowSort="true">服务器操作系统</div>	                          
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
	var url="com.primeton.eos.server.servercomponent.queryDyserver.biz.ext"
	var grid = nui.get("grid1");
	grid.setUrl(url);
	search();
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
	function dictServtype(e){
		return nui.getDictText("MIS_SERVTYPE",e.value);
	}
	
</script>
</body>
</html>