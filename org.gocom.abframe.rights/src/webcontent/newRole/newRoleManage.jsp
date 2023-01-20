	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): yaoyi
  - Date: 2017-02-20 11:06:02
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
	<div class="nui-fit">
	<div class="nui-splitter" style="width:100%;height:100%;">
	 	<!-- 左边 -->
		<div size="190" showCollapseButton="true" style="background-color: ;"> 
			<div class="nui-panel" title="角色管理" width="100%">
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
			<div style="width:100%;" id="exp1">
		        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
		            <table style="width:100%;">
		            	<tr>
		            		<td style="width:20%;">
		            			<a class="nui-button" id="addBtn" iconCls="icon-add" onclick="addRole()">增加</a>
		                        <a class="nui-button" id="updateBtn" iconCls="icon-edit" onclick="updateRole()">修改</a>
		                        <a class="nui-button" id="deleteWXBtn" iconCls="icon-remove" onclick="deleteRole()">删除</a>
		                    </td>
		                </tr>
	                 </table>           
		        </div>
		    </div>
		    <div id="datagrid1" class="nui-datagrid" frozenStartColumn="0" frozenEndColumn="4" allowSortColumn="true"  allowAlternating="true" allowResize="true"
		       style="width:100%;height:350px;"  pageSize="15" sizeList="[10,20,50,100,200]" showPager="true" onrowclick="doView"
		    	url="org.gocom.abframe.rights.role.newRoleManage.queryNewRole.biz.ext" dataField="roleList"    multiSelect="true">
				<div property="columns">
					<div type="checkcolumn" width="30"></div>
					<div field="roleid" width="100" align="center" renderer="getsyb" headerAlign="center" allowSort="true">角色编号</div>
					<div field="rolename" width="100" align="center"  headerAlign="center" allowSort="true">名称</div>
					<div field="roletype" width="60" align="center"  headerAlign="center" allowSort="true" renderer="getRoletype">类别</div>
					<div field="appname" width="80" align="center"  headerAlign="center" allowSort="true">所属应用</div>
					<div field="suittype" width="100" align="center" renderer="roleSuit" headerAlign="center" allowSort="true">角色适用</div>
					<div field="remark" width="100" align="center" renderer="getsyb" headerAlign="center" allowSort="true">备注说明</div>	
					<div field="createtime" width="200" align="center" renderer="getsyb" headerAlign="center" allowSort="true"  dateFormat="yyyy-MM-dd hh:mm:ss" >创建时间</div>
					
				</div>
		   </div>	
		</div>
		</div>
		<!-- 右边 -->
		<div size="160"  id="function1" >
			<div class="nui-toolbar">
				<table>
					<tr>
						<td align="right" style="width: 70px">角色名称：</td><td id="name1" class="asLabel"></td><td align="right" style="width: 100px">角色编号：</td><td id="code1" class="asLabel"></td>
					</tr>
				</table>
			</div> 
			<div id="tabs" class="nui-tabs" activeIndex="0" style="width:auto;height:95%" >
				<div name="manage" id="tab1" url="<%=request.getContextPath() %>/abframe/rights/newRole/newFunTree.jsp" title="功能权限" refreshOnClick="true">
				</div>
				<div name="distribution" id="tab2" url="<%=request.getContextPath() %>/abframe/rights/newRole/queryRoleDetail.jsp" title="权限分配" refreshOnClick="true">
				</div>
			</div>
		</div>
	</div>
</div>
</body>
<script type="text/javascript">
	nui.parse();
	var form = new nui.Form("#form1");
	var grid = nui.get("datagrid1");
	var tab = nui.get("tabs");
    
    init();
	function init(){
		var form = new nui.Form("#form1");
		var data = form.getData(); //获取表单JS对象数据
	  	grid.load(data,function(){
	  		changeMes();
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
    
    function addRole(){
  		nui.open({
            url: "<%=request.getContextPath() %>/abframe/rights/newRole/modifyRole.jsp",
            title: "新增角色",
            width: 550,
            height: 280,
            onload: function () {
				var iframe = this.getIFrameEl();
				var data = {};
				iframe.contentWindow.SetData(data);
			},
			ondestroy: function (action) {
				if(action=="ok"){
					grid.reload();
                }
			}
		});
    }
    
    
    function updateRole(){
    	var row = grid.getSelected();
		if (row) {
      		nui.open({
	            url: "<%=request.getContextPath() %>/abframe/rights/newRole/modifyRole.jsp",
	            title: "修改角色",
	            width: 550,
	            height: 280,
	            onload: function () {
					var iframe = this.getIFrameEl();
					var data = {"roleid": row.roleid };
					iframe.contentWindow.SetData(data);
				},
				ondestroy: function (action) {
					if(action=="ok"){
						grid.reload();
	                }
				}
			});
		} else {
			nui.alert("请选中一条记录","提示");
		}
    }
    
    
    
    
    function deleteRole(){
    	var rows = grid.getSelecteds();
    	if(rows != "" && rows != null){
    		var titleName = "";
    		var roleids="";
			titleName = "确定是否删除？";
    		nui.confirm(titleName,"操作提示",function(action){
    			if(action == "ok"){
    				for(var j = 0;j < rows.length;j ++){
    					if(j==0){
    						roleids = rows[j].roleid;
    					}else{
    						roleids += ","+rows[j].roleid;
    					}
    				}
					nui.get("deleteWXBtn").disable();
	    			var json = nui.encode({"roleids": roleids});
					form.loading("角色数据删除中...");
		    		nui.ajax({
	        			url: "org.gocom.abframe.rights.role.newRoleManage.deleteRoleByCriteria.biz.ext",
	                	data: json,
	                	type: 'POST',
	                	cache: false,
	                	contentType: 'text/json',
	                	success: function (o) {
	                		if(o.result == "0"){
     							alert("数据删除失败！");
     							nui.get("deleteWXBtn").enable();
     							form.unmask();
     							return;
     						}else{
     							alert("数据删除成功！");
     							nui.get("deleteWXBtn").enable();
     							form.unmask();
     							search();
     						}
     					},
 						error: function () {
        					alert("error");
        				}
        			});
    			}
    		});
    	}else{
    		nui.alert("请选择记录！");
		}
    }
    
    function changeMes(){
    	var row = grid.getRow(0);
    	var roleid = row.roleid;
    	var appid = row.appid;
    	document.getElementById("name1").innerHTML = row.rolename;
    	document.getElementById("code1").innerHTML = row.roleid;
  		document.getElementById("function1").style.visibility="";
  		for(var i=0;i<tab.tabs.length;i++){
			var temp_tab = tab.tabs[i];
			if(temp_tab.title=="功能权限"){
				tab.loadTab("<%=request.getContextPath() %>/abframe/rights/newRole/newFunTree.jsp?roleid="+roleid+"&&appid="+appid, temp_tab);
			}else if(temp_tab.title=="权限分配"){
				tab.loadTab("<%=request.getContextPath() %>/abframe/rights/newRole/queryRoleDetail.jsp?roleid="+roleid, temp_tab);
			}
			tab.reloadTab();
		}
    }
    
    function doView(e){
    	var roleid = e.record.roleid;
    	var appid = e.record.appid;
    	var rolename = e.record.rolename;
		if(e){
			document.getElementById("name1").innerHTML = rolename;
			document.getElementById("code1").innerHTML = roleid;
      		document.getElementById("function1").style.visibility="";
      		for(var i=0;i<tab.tabs.length;i++){
				var temp_tab = tab.tabs[i];
				if(temp_tab.title=="功能权限"){
					tab.loadTab("<%=request.getContextPath() %>/abframe/rights/newRole/newFunTree.jsp?roleid="+roleid+"&&appid="+appid, temp_tab);
				}else if(temp_tab.title=="权限分配"){
					tab.loadTab("<%=request.getContextPath() %>/abframe/rights/newRole/queryRoleDetail.jsp?roleid="+roleid, temp_tab);
				}
				tab.reloadTab();
			}
		}else{
			nui.alert("请选中一条记录","提示");
		}
    }
    
    //设置业务字典-角色适用
		function roleSuit(e){
			return nui.getDictText("AME_ROLESUITTYPE",e.value);
  }
</script>
</body>
</html>