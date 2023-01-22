<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<script src="../common/nui/nui.js" type="text/javascript"></script>
<%@include file="/common/common.jsp"%>
<!-- 
  - Author(s): zhx
  - Date: 2015-07-01 17:23:03
  - Description:
-->
<head>
<title>选择资产信息记录</title>
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
    	<input class="nui-hidden" name="sortField" value="id"/>
		<input class="nui-hidden" name="sortOrder" value="desc"/>
          <label >资产编号：</label>
          	<input class="nui-textbox" name="criteria._expr[0].assetnum" onenter="onKeyEnter"/>
	        <input class="nui-hidden" name="criteria._expr[0]._op" value="like"/>
	        <input class="nui-hidden" name="criteria._expr[0]._likeRule" value="all"/>
          <a class="nui-button" style="width:60px;" onclick="search()">查询</a>
    </div>
    
    <div class="nui-fit">
        <div id="grid1" class="nui-datagrid" style="width:100%;height:100%;"
            idField="id" allowResize="true" dataField="assetnums" multiSelect="false"
            borderStyle="border-left:0;border-right:0;" onrowdblclick="onRowDblClick">
            <div property="columns">	    
        		<div type="checkcolumn"></div>
        		<div type="indexcolumn"></div>
                <div field="assetnum" width="80" headerAlign="center" allowSort="true">资产编号</div>                                            
                <div field="buytime"width="80" headerAlign="center" dateFormat="yyyy-MM-dd" allowSort="true">购买日期</div>
	        	<div field="assetAmount" width="100" headerAlign="center" dataType="currency" currencyUnit="￥" allowSort="true" summaryType="sum">资产原值(元)</div>
	        	<div field="type"width="80" renderer="dictType" headerAlign="center" allowSort="true">资产父类型</div>
	        	<div field="secType"width="80" renderer="dictSecType" headerAlign="center" allowSort="true">资产子类型</div>
	        	<div field="status"width="60" renderer="dictStatus" headerAlign="center" allowSort="true">状态</div>
	        	<div field="area" renderer="dictArea" width="60" headerAlign="center" allowSort="true">区域</div>
	        	<div field="storageType"width="60" renderer="dictStorageType" headerAlign="center" allowSort="true">管理类型</div>
	        	<div field="username"width="60" headerAlign="center">负责人</div>
	        	<div field="orgname" width="120" headerAlign="center">所属部门</div>
	        	<div field="brand"width="100" headerAlign="center" allowSort="true">品牌</div>
	        	<div field="configuration"width="120" headerAlign="center" allowSort="true">配置</div>                                        
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
	var url="com.primeton.eos.server.servercomponent.queryAssetnum.biz.ext"
	var grid = nui.get("grid1");
	grid.setUrl(url);
	grid.load();
	grid.sortBy("id", "desc");
	
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
	function dictType(e){
		return nui.getDictText("MIS_MA_TYPE",e.value);
	}
	function dictSecType(e){
		return nui.getDictText("MIS_MA_SECTYPE",e.value);
	}
	function dictStatus(e){
		return nui.getDictText("MIS_MA_STATUS",e.value);
	}
	function dictArea(e){
		return nui.getDictText("EXP_REGION",e.value);
	}
	function dictStorageType(e){
		return nui.getDictText("MIS_MA_STORAGE",e.value);
	}
</script>