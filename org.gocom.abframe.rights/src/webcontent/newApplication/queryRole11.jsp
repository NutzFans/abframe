<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): 李鹏程
  - Date: 2020-01-14 10:50:03
  - Description:
-->
<head>
	<title>角色管理</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
		.asLabel
	    {
	        border:0;background-color:#F5F5F5;cursor:default;    
	    }
	</style>
</head>
<body>
<body style="margin: 0px;padding: 0px;width: 100%;height: 100%;">
	<div class="nui-fit" style="height: auto">
			   <form id="form1" method="post" style="width:100%">
				<div class="nui-toolbar" >
					<table style="width:100%;">
						<tr>
							<td align="right">角色编号：</td>
							<td>
								<input name="criteria._expr[0]._value" class="nui-textbox" style="width:100px;" />
							    <input class="nui-hidden" name="criteria._expr[0]._property" value="roleid"/>
							    <input class="nui-hidden" name="criteria._expr[0]._op" value="="/>
							</td>
							<td align="right">角色名称：</td>
							<td>
								<input name="criteria._expr[1]._value" class="nui-textbox" style="width:100px;" />
							    <input class="nui-hidden" name="criteria._expr[1]._property" value="rolename"/>
							    <input class="nui-hidden" name="criteria._expr[1]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[1]._likeRule" value="all"/>
							</td>
							<td align="right">类别：</td>
							<td>
								<input class="nui-dictcombobox" name="criteria._expr[2]._value" dictTypeId="ABF_ROLETYPE" showNullItem="true" style="width: 100px;"/>
		            			<input class="nui-hidden" name="criteria._expr[2]._property" value="roletype"/>
		            			<input class="nui-hidden" name="criteria._expr[2]._op" value="="/>
							</td>
						</tr>
						<tr>
							<td align="right">角色适用：</td>
							<td>
								<input class="nui-dictcombobox" name="criteria._expr[4]._value" dictTypeId="AME_ROLESUITTYPE" showNullItem="true"  multiSelect="true" style="width: 100px;"/>
		            			<input class="nui-hidden" name="criteria._expr[4]._property" value="suittype"/>
		            			<input class="nui-hidden" name="criteria._expr[4]._op" value="="/>
							</td>
							<td align="right"  >创建时间：</td>
							<td colspan="3">
								 <input class="nui-datepicker" name="criteria._expr[3]._min" style="width:100px"/>-<input class="nui-datepicker" name="criteria._expr[3]._max" style="width:100px"/>
								 <input class="nui-hidden" name="criteria._expr[3]._property" value="createtime"/>
								 <input class="nui-hidden" name="criteria._expr[3]._op" value="between"/>
								 <input class="nui-hidden" name="criteria._expr[3]._pattern" value="yyyy-MM-dd"/>
		                    </td>
						</tr>
		            </table> 
		             <table style="width:90%;">
			            <tr>
			                <td align="center" style="width:100%;">
			                    <a class="nui-button" iconCls="icon-search" id="search" onclick="search()" >查询</a>
								<a class="nui-button" iconCls="icon-reload" id="reset" onclick="reset()" >重置</a>
			                </td>
			            </tr>
		        	</table>          
		        </div>
		    </form>
		    <div id="datagrid1" class="nui-datagrid" frozenStartColumn="0" frozenEndColumn="4" allowSortColumn="true"  allowAlternating="true" allowResize="true"
		       style="width:100%;height:270px;"  pageSize="10" sizeList="[10,20,50,100,200]" showPager="true" 
		    	url="org.gocom.abframe.rights.role.newRoleManage.queryNewRole.biz.ext" dataField="roleList"   multiSelect="false" >
				<div property="columns">
					<div type="checkcolumn" width="30"></div>
					<div field="roleid" width="100" align="center" renderer="getsyb" headerAlign="center" allowSort="true">角色编号</div>
					<div field="rolename" width="100" align="center"  headerAlign="center" allowSort="true">名称</div>
					<div field="roletype" width="60" align="center"  headerAlign="center" allowSort="true" renderer="getRoletype">类别</div>
					<div field="appname" width="80" align="center"  headerAlign="center" allowSort="true">所属应用</div>
					<div field="createtime" width="150" align="center" renderer="getsyb" headerAlign="center" allowSort="true" dateFormat="yyyy-MM-dd hh:mm:ss">创建时间</div>
					<div field="suittype" width="120" align="center" renderer="roleSuit" headerAlign="center" allowSort="true">角色适用</div>
					<div field="remark" width="100" align="center" renderer="getsyb" headerAlign="center" allowSort="true">备注说明</div>	
				</div>
		   </div>	
		 <div style="text-align:center;padding:10px;" class="nui-toolbar">
	   		<a class="nui-button" onclick="saveFunc" id="a" style="width:60px;margin-right:20px;">确定</a>
		</div>
		</div>
</body>
<script type="text/javascript">
	nui.parse();
	var form = new nui.Form("#form1");
	var grid = nui.get("datagrid1");
    var appid = '<%=request.getParameter("appid") %>';
    var appid1 = '<%=request.getParameter("appid1") %>';
    var funcgroupid = '<%=request.getParameter("funcgroupid") %>';
    
    
    init();
	function init(){
		var form = new nui.Form("#form1");
		var data = form.getData(); //获取表单JS对象数据
	  	grid.load(data,function(){
	  	}); //datagrid加载数据
	}
	
		
	function search(){
		var form = new nui.Form("#form1");
		var data = form.getData(); //获取表单JS对象数据
	  	grid.load(data); //datagrid加载数据
	}
	
	//重置
	function reset(){
		form.reset();
		grid.load();
	}
    
    function getRoletype(e){
    	return nui.getDictText('ABF_ROLETYPE',e.value);
    }
    
   
    
      function saveFunc(){
			var row = grid.getSelected();
			var roleid=row.roleid;
        	var acRole = {"roleid":roleid};
        	var json = nui.encode({"acRole":acRole,"appid":appid,"funcgroupid":funcgroupid,"appid1":appid1});
        	nui.ajax({
            	url: "org.gocom.abframe.rights.role.newRoleManage.addRoleFunc11.biz.ext",
            	data: json,
            	type: 'POST',
            	cache: false,
            	contentType: 'text/json',
            	success: function (text) {					 
            		var retCode = text.retCode;
            		if(retCode=='1'){
            			alert("保存成功！");
            			search();
            		}else{
            			alert("保存失败！");
            		}
            	},
            	error: function (jqXHR, textStatus, errorThrown) {
    				CloseWindow();
                }
            });
        }
    
    //设置业务字典-角色适用
		function roleSuit(e){
			return nui.getDictText("AME_ROLESUITTYPE",e.value);
  }
</script>
</body>
</html>