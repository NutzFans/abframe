<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page pageEncoding="UTF-8"%>
<%@include file="/nui/common.jsp"%>
<link id="css_skin" rel="stylesheet" type="text/css" 
	  href="<%=contextPath%>/coframe/tools/skins/skin1/style.css" />
<html>
<!-- 
  - Author(s): JFree
  - Date: 2013-03-11 16:40:23
  - Description:
-->
<head>
    <title></title>
    <link href="../demo.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
    body{
        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
    }
    </style>
</head>
<body>
    <div class="nui-toolbar" style="text-align:center;line-height:30px;" borderStyle="border:0;" id="form1">
    	<input class="nui-hidden" name="sortField" value="empname"/>
		<input class="nui-hidden" name="sortOrder" value="asc"/>
          <label >销售名称：</label>
          	<input class="nui-textbox" name="criteria._expr[0].empname" onenter="onKeyEnter"/>
	        <input class="nui-hidden" name="criteria._expr[0]._op" value="like"/>
	        <input class="nui-hidden" name="criteria._expr[0]._likeRule" value="all"/>
          <a class="nui-button" style="width:60px;" onclick="search()">查询</a>
    </div>
    <div class="nui-fit">

        <div id="grid1" class="nui-datagrid" style="width:100%;height:100%;" 
            idField="id" allowResize="true" dataField="sales" multiSelect="false"
            borderStyle="border-left:0;border-right:0;" onrowdblclick="onRowDblClick"
        >
            <div property="columns">
        		<div type="checkcolumn"></div>
                <div type="indexcolumn" ></div>
                <div field="empname" width="120" headerAlign="center" allowSort="true">销售姓名</div>
                <div field="empcode" width="100" headerAlign="center" allowSort="true">工号</div>
                <div field="userid" width="100" headerAlign="center" allowSort="true">登录名</div>
                <div field="mobileno" width="100" headerAlign="center" allowSort="true">手机</div>                                           
                <div field="oemail" width="100" headerAlign="center" allowSort="true">邮箱</div>                                            
                <div field="orgname" width="100" headerAlign="center" allowSort="true">部门</div>                 
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
	
	    var grid = nui.get("grid1");
	
	    //动态设置URL
	    var url="com.primeton.mis.contract.contract.querySales.biz.ext";
	    grid.setUrl(url);
	    //也可以动态设置列 grid.setColumns([]);
	    grid.load();
        grid.sortBy("empname", "asc");
	
	    function GetData() {
	        var row = grid.getSelected();
	        return row;
	    }
	    function search() {
	        var form = new nui.Form("#form1");
			var data = form.getData();
            grid.load(data);
	    }
	    function onKeyEnter(e) {
	        search();
	    }
	    function onRowDblClick(e) {
	        onOk();
	    }
	    //////////////////////////////////
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
