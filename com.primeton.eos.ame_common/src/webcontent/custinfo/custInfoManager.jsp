<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): 张一博
  - Date: 2017-09-12 16:02:04
  - Description:
-->
<head>
<title>大客户经理</title>
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<style type="text/css">
	body{
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
	<div class="nui-toolbar" style="text-align:center;line-height:30px;" borderStyle="border:0;" id="form1">
    	<input class="nui-hidden" name="sortField" value="empid"/>
		<input class="nui-hidden" name="sortOrder" value="asc"/>
          <label >员工姓名：</label>
          	<input class="nui-textbox" name="criteria._expr[0].empname" onenter="onKeyEnter" style = "width :80px;"/>
	        <input class="nui-hidden" name="criteria._expr[0]._op" value="like"/>
	        <input class="nui-hidden" name="criteria._expr[0]._likeRule" value="all"/>
	        <label >人员状态：</label>
          	<input class="nui-dictcombobox" name="criteria._expr[1].empstatus" dictTypeId="ABF_EMPSTATUS" shownullItem="true" value="on" onenter="onKeyEnter" style = "width :80px;"/>
	        <input class="nui-hidden" name="criteria._expr[1]._op" value="="/>
          <a class="nui-button" style="width:60px;" onclick="search()">查询</a>
    </div>
    
    <div class="nui-fit">
        <div id="grid1" class="nui-datagrid" style="width:100%;height:100%;"
            idField="empid" allowResize="true" dataField="omEmployees" multiSelect="false"
            borderStyle="border-left:0;border-right:0;" onrowdblclick="onRowDblClick">
            <div property="columns">	    
        		<div type="checkcolumn"></div>
                <div field="empname" width="80" headerAlign="center" align='center' allowSort="true">姓名</div>                                            
                <div field="gender" width="80" headerAlign="center" align='center' renderer="dictGetGender" allowSort="true">性别</div>
               	<div field="mobileno" width="100" headerAlign="center" align='center' allowSort="true">手机</div>   
               	<div field="oemail" width="100" headerAlign="center" align='center' allowSort="true">邮箱</div>                                    
                <div field="orgname" width="100" headerAlign="center" align='center' allowSort="true">部门名称</div>
                <div field="omOrganization.orgseq" width="0">部门seq</div> 
                <div field="orgid" width="0">部门id</div>                                             
            </div>
        </div>
	</div>  
	              
    <div class="nui-toolbar" style="text-align:center;padding-top:8px;padding-bottom:8px;" borderStyle="border:0;">
        <a class="nui-button" style="width:60px;" onclick="onOk()">确定</a>
        <span style="display:inline-block;width:25px;"></span>
        <a class="nui-button" style="width:60px;" onclick="onCancel()">取消</a>
    </div>
</body>
<script type="text/javascript">
	nui.parse();
	var url="com.primeton.eos.machine.machine.queryEmployee.biz.ext"
	var grid = nui.get("grid1");
	grid.setUrl(url);
	var form = new nui.Form("#form1");
	var data = form.getData();
	grid.load(data);
	grid.sortBy("empname", "asc");
	
	function search() {
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
	//设置业务字典值-性别
	function dictGetGender(e) {
		return nui.getDictText('ABF_GENDER',e.value);
	}
</script>
</html>