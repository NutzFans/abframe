<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): zhang-yb
  - Date: 2018-05-28 16:42:11
  - Description:
-->
<head>
	<title>新增角色人员</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
		body{margin: 0;padding: 0;width: 100%;height: 100%;}
	</style>
</head>
<body>
	<div class="nui-fit">
		<div class="nui-splitter" style="width:100%;height:100%;">
			<div size="40" showCollapseButton="true">
				<div id="form1" class="nui-toolbar" >
					<table style="width:100%;">
						<tr>
							<td align="right">角色名称：</td>
							<td>
								<input name="criteria._expr[0]._value" class="nui-textbox" style="width:100px;" onenter="search()" />
							    <input class="nui-hidden" name="criteria._expr[0]._property" value="rolename"/>
							    <input class="nui-hidden" name="criteria._expr[0]._op" value="like"/>
						    	<input class="nui-hidden" name="criteria._expr[0]._likeRule" value="all"/>
							</td>
							<td align="left">
			                    <a class="nui-button" iconCls="icon-search" id="search" onclick="search()" >查询</a>
			                </td>
						</tr>
		            </table> 
		        </div>
				<div id="datagrid1" class="nui-datagrid" style="width:100%;height:422px;"  pageSize="15" multiSelect="false" selectOnLoad="true" onselectionchanged="onSelectionChanged" 
					url="org.gocom.abframe.rights.role.newRoleManage.queryNewRole.biz.ext" dataField="roleList" onrowdblclick="rowdblclick()">
					<div property="columns">
						<div type="checkcolumn" width="0"></div>
						<div field="roleid" width="0" align="center" renderer="getsyb" headerAlign="center" allowSort="true">角色编号</div>
						<div field="rolename" width="100" align="center"  headerAlign="center" allowSort="true">名称</div>
						<div field="roletype" width="0" align="center"  headerAlign="center" allowSort="true" renderer="getRoletype">类别</div>
						<div field="appname" width="100" align="center"  headerAlign="center" allowSort="true">所属应用</div>
					</div>
				</div>
			</div>
			<div size="60" showCollapseButton="true"> 
				<div class="nui-toolbar" id="form2" >
					<table style="width:100%;">
						<tr>
							<td id="tagname">
								&nbsp;
							</td>
						</tr>
		            </table> 
		        </div>
				<div id="employee_grid" class="nui-datagrid" style="width:100%;height:422px;" dataField="operList" allowAlternating="true" pageSize="false"
		        url="com.primeton.eos.ame_common.wxTagManage.queryRoleUser.biz.ext" showPager="false"  multiSelect="true" ondrawcell="isIn">
			        <div property="columns">
			        	<div type="checkcolumn"></div>
			        	<div field="empcode" width="0" headerAlign="center" align="center">工号</div>
			            <div field="userid" width="60" headerAlign="center" align="center">登录名称</div>
			            <div field="operatorname" width="60" headerAlign="center" align="center">操作员名称</div>
			            <div field="orgname" width="80" headerAlign="center" align="center">所属机构</div>
			        </div>
			    </div>  	
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
	
	var tagid = null;//tagid
	
	var form = new nui.Form("#form1");
	var grid = nui.get("datagrid1");
	var employee_grid = nui.get("employee_grid");
	var tagUserList = [];//
	var type = 0;//判断是点击角色还是多选人员
	
	function SetData(data){
		tagid = data.tagid;
		viewTagUsers();
	}
	
	search();
	function search(){
		var form = new nui.Form("#form1");
		var data = form.getData(); //获取表单JS对象数据
	  	grid.load(data); //datagrid加载数据
	}
	
	//查看该标签成员列表
	function viewTagUsers(){
		var json = {tagid:tagid};
		nui.ajax({
			url: "com.primeton.eos.ame_common.wxTagManage.queryTagUsers.biz.ext",
            type: "post",
            cache: false,
            data:json,
            async:false,
            success: function (o) {
            	//将用户名拼成数组
            	var userList = eval('(' + o.userlist + ')');
            	for(var i = 0 ; i < userList.length ; i++){
            		tagUserList.push(userList[i].userid);
            	}
            }
		})
	}
	
    function onSelectionChanged(e) {
        var grid = e.sender;
        var record = grid.getSelected();
        var json =  {"criteria":{"_expr":[{"_value":record.roleid,"_property":"roleid","_op":"="}]}};
        if (record) {
            employee_grid.load(json);
        }
    }
    
    function isIn(e){
    	if(e.field == "userid"){
			if(contains(tagUserList,e.record.userid)){
				e.rowStyle = "display:none";
			}
		}
    }
    
    //判断是否在数组中已经存在
 	function contains(arr, obj) { 
    	if(obj=='0'){
    		return true;
    	} 
	    var i = arr.length;  
	    while (i--){  
	        if (arr[i] === obj) {  
	            return true;  
	        }  
	    }  
	    return false;  
	}
	
	//重置
	function reset(){
		form.reset();
		grid.load();
	}
	
	//为母页面做返回数据使用
	function GetData() {
		var row = employee_grid.getSelecteds();
		return row;
	}
	
	//确认按钮
	function onOk(){
		CloseWindow("ok");
	}
	
	//取消按钮
	function onCancel(){
		CloseWindow("cancel");
	}
	
	//关闭窗口
	function CloseWindow(action) {
		if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
		else window.close();
	}
</script>
</html>