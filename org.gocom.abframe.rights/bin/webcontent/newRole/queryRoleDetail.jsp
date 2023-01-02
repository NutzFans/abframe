	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): yaoyi
  - Date: 2017-02-20 11:06:02
  - Description:
-->
<head>
	<title>授权详情</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body style="width:100%;height:100%;padding:0px;margin:0px;">
<div class="nui-fit">
	 <form id="form1" method="post" style="width:100%">
	 	<input name="criteria._expr[0]._value" class="nui-hidden" id="roleid"/>
		<input class="nui-hidden" name="criteria._expr[0]._property" value="roleid"/>
		<input class="nui-hidden" name="criteria._expr[0]._op" value="="/>
	 </form>
     <div class="mini-tabs" activeIndex="0" style="width:100%">
    	<div title="操作员">
            <div style="width:100%;">
		        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
		            <table style="width:100%;">
		                <tr>
		                    <td style="width:100%;">
		                        <a class="nui-button" iconCls="icon-add" onclick="addRecord('emp_grid')" plain="true">增加</a>
		                        <a class="nui-button" iconCls="icon-remove" onclick="deleteRecord('emp_grid')" plain="true">删除</a>
		                    </td>
		                </tr>
		            </table>           
		        </div>
		    </div>
            <div id="emp_grid" class="nui-datagrid" style="width:100%;height:auto;" dataField="operList" multiSelect="true"
            	pageSize="10" sizeList="[10,20,50,100,200]" showPager="true" 
            	url="org.gocom.abframe.rights.role.AssignRoleOperator.queryNewOperator.biz.ext">			            
	            <div property="columns">
	            	<div type="checkcolumn"></div>
	            	<div field="empcode" width="30" headerAlign="center" align="center" allowSort="true">工号</div>
	                <div field="userid" width="60" headerAlign="center" align="center" >登录名称</div>
	                <div field="operatorname" width="60" headerAlign="center" align="center">操作员名称</div>
	                <div field="status" width="50" headerAlign="center" renderer="getOpStatus">操作员状态</div>
	                <div field="orgname" width="80" headerAlign="center" align="center">所属机构</div>
	            </div>
	        </div>
     	</div>
     	<div title="机构">
            <div style="width:100%;">
		        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
		            <table style="width:100%;">
		                <tr>
		                    <td style="width:100%;">
		                        <a class="nui-button" iconCls="icon-add" onclick="addRecord('org_grid')" plain="true">增加</a>
		                        <a class="nui-button" iconCls="icon-remove" onclick="deleteRecord('org_grid')" plain="true">删除</a>
		                    </td>
		                </tr>
		            </table>           
		        </div>
		    </div>
	        <div id="org_grid" class="nui-datagrid" style="width:100%;height:auto;" dataField="orgList"
	        	 url="org.gocom.abframe.rights.role.AssignRoleOrgan.queryOrg.biz.ext" showPager="true" multiSelect="true" >			        
		        <div property="columns">
		        	<div type="checkcolumn"></div>            
		            <div field="orgname" width="45" headerAlign="center">机构名称</div>
		            <div field="orgtype" width="45" headerAlign="center" renderer="getOrgType">机构类别</div>
		            <div field="status" width="65" headerAlign="center" renderer="getStatus">机构状态</div>
		            <div field="area" width="65" headerAlign="center">所属地域</div>
		        </div>
		    </div>
    	</div>
    	<div title="工作组">
            <div style="width:100%;">
		        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
		            <table style="width:100%;">
		                <tr>
		                    <td style="width:100%;">
		                        <a class="nui-button" iconCls="icon-add" onclick="addRecord('group_grid')" plain="true">增加</a>
		                        <a class="nui-button" iconCls="icon-remove" onclick="deleteRecord('group_grid')" plain="true">删除</a>
		                    </td>
		                </tr>
		            </table>           
		        </div>
		    </div>
	        <div id="group_grid" class="nui-datagrid" style="width:100%;height:auto;" dataField="groups"
	        	 url="org.gocom.abframe.rights.role.AssignRoleWorkgroup.queryGroupRole.biz.ext" showPager="true" multiSelect="true" >			        
		        <div property="columns">
		        	<div type="checkcolumn"></div>            
		            <div field="groupname" width="45" headerAlign="center">工作组名称</div>
		            <div field="grouptype" width="45" headerAlign="center" renderer="getgrouptype">工作组类别</div>
		            <div field="groupstatus" width="65" headerAlign="center" renderer="getgroupstatus">工作组状态</div>
		            <div field="orgname" width="65" headerAlign="center">所属机构</div>
		        </div>
		    </div>
    	</div>
    	<div title="岗位">
            <div style="width:100%;">
		        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
		            <table style="width:100%;">
		                <tr>
		                    <td style="width:100%;">
		                        <a class="nui-button" iconCls="icon-add" onclick="addRecord('position_grid')" plain="true">增加</a>
		                        <a class="nui-button" iconCls="icon-remove" onclick="deleteRecord('position_grid')" plain="true">删除</a>
		                    </td>
		                </tr>
		            </table>           
		        </div>
		    </div>
	        <div id="position_grid" class="nui-datagrid" style="width:100%;height:auto;" dataField="positionList"
	        	 url="org.gocom.abframe.rights.role.AssignRolePosition.queryNewPosition.biz.ext" showPager="true" multiSelect="true" >			        
		        <div property="columns">
		        	<div type="checkcolumn"></div>            
		            <div field="posiname" width="45" headerAlign="center">岗位名称</div>
		            <div field="positype" width="45" headerAlign="center" renderer="getpositype">岗位类别</div>
		            <div field="status" width="65" headerAlign="center" renderer="getpositstatus">岗位状态</div>
		            <div field="orgname" width="65" headerAlign="center">所属机构</div>
		        </div>
		    </div>
    	</div>
    	<div title="职务">
            <div style="width:100%;">
		        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
		            <table style="width:100%;">
		                <tr>
		                    <td style="width:100%;">
		                        <a class="nui-button" iconCls="icon-add" onclick="addRecord('duty_grid')" plain="true">增加</a>
		                        <a class="nui-button" iconCls="icon-remove" onclick="deleteRecord('duty_grid')" plain="true">删除</a>
		                    </td>
		                </tr>
		            </table>           
		        </div>
		    </div>
	        <div id="duty_grid" class="nui-datagrid" style="width:100%;height:auto;" dataField="dutyList"
	        	 url="org.gocom.abframe.rights.role.AssignRoleDuty.queryNewDuty.biz.ext" showPager="true" multiSelect="true" >			        
		        <div property="columns">
		        	<div type="checkcolumn"></div>            
		            <div field="dutyname" width="45" headerAlign="center">职务名称</div>
		            <div field="dutycode" width="45" headerAlign="center" >职务代码</div>
		            <div field="dutytype" width="65" headerAlign="center" renderer="getdutytype">职务套别</div>
		        </div>
		    </div>
    	</div>
	</div>
</div>
<script type="text/javascript">
    nui.parse();
    var form = new nui.Form("#form1");
	var roleid = '<%=request.getParameter("roleid") %>';
	nui.get("roleid").setValue(roleid);
	//操作员
	var emp_grid = nui.get("emp_grid");
	//机构
	var org_grid = nui.get("org_grid");
	//工作住
	var group_grid = nui.get("group_grid");
	//岗位
	var position_grid = nui.get("position_grid");
	//职务
	var duty_grid = nui.get("duty_grid");
	
	init();
	function init(){
		var form = new nui.Form("#form1");
		var data = form.getData();
		emp_grid.load(data);
		emp_grid.sortBy("operatorname","asc");
		org_grid.load({"org":data.criteria});
		group_grid.load({"roleid":roleid});
		position_grid.load({"roleid":roleid});
		duty_grid.load({"roleid":roleid});
	}
	
	function getStatus(e) {
        return nui.getDictText('ABF_ORGSTATUS',e.value);
    }
    function getOpStatus(e) {
        return nui.getDictText('ABF_OPERSTATUS',e.value);
    }
    
    function getOrgType(e){
		return nui.getDictText('ABF_ORGTYPE',e.value);
	}
	
	function getgrouptype(e){
		return nui.getDictText('ABF_GROUPTYPE',e.value);
	}
	
	function getgroupstatus(e){
		return nui.getDictText('ABF_GROUPSTATUS',e.value);
	}
    
    function getpositype(e){
		return nui.getDictText('ABF_POSITYPE',e.value);
	}
	
	function getpositstatus(e){
		return nui.getDictText('ABF_STATUS',e.value);
	}
	
	function getdutytype(e){
		return nui.getDictText('ABF_DUTYTYPE',e.value);
	}
    
    function addRecord(gaidid){
    	if(gaidid=='emp_grid'){
    		nui.open({
				url:"<%=request.getContextPath() %>/abframe/rights/newRole/queryOperatror.jsp?roleid="+roleid,
				title: "增加操作员",
				width: 700,
				height: 410,
				ondestroy: function () {
				init();
				}
			});
    	}else if(gaidid=='org_grid'){
    		nui.open({
				url:"<%=request.getContextPath() %>/abframe/rights/newRole/queryOperatorOrg.jsp?roleid="+roleid,
				title: "增加机构",
				width: 700,
				height: 410,
				ondestroy: function (action) {
					if (action == "ok") {
						var iframe = this.getIFrameEl();
						var data = iframe.contentWindow.GetData();
						data = nui.clone(data);    //必须
						if (data) {
							var json = nui.encode({"orgs":data,"roleid":roleid});
			                form.loading("保存数据中...");
				    		nui.ajax({
			        			url: "org.gocom.abframe.rights.role.AssignRolePosition.addOperatorOrg.biz.ext",
			                	data: json,
			                	type: 'POST',
			                	cache: false,
			                	contentType: 'text/json',
			                	success: function (o) {
			                		if(o.retCode == "0"){
		     							alert("保存失败！");
		     							form.unmask();
		     							return;
		     						}else{
		     							alert("保存成功！");
		     							form.unmask();
		     							init();
		     						}
		     					},
		 						error: function () {
		        					alert("error");
		        				}
		        			});
						}
					}
				}
			});
    	}else if(gaidid=='group_grid'){
    		nui.open({
				url:"<%=request.getContextPath() %>/abframe/rights/newRole/queryNewGroup.jsp?roleid="+roleid,
				title: "增加工作组",
				width: 700,
				height: 410,
				ondestroy: function (action) {
					if (action == "ok") {
						var iframe = this.getIFrameEl();
						var data = iframe.contentWindow.GetData();
						data = nui.clone(data);    //必须
						if (data) {
							var json = nui.encode({"groups":data,"roleid":roleid});
			                form.loading("保存数据中...");
				    		nui.ajax({
			        			url: "org.gocom.abframe.rights.role.AssignRoleWorkgroup.addNewGroup.biz.ext",
			                	data: json,
			                	type: 'POST',
			                	cache: false,
			                	contentType: 'text/json',
			                	success: function (o) {
			                		if(o.retCode == "0"){
		     							alert("保存失败！");
		     							form.unmask();
		     							return;
		     						}else{
		     							alert("保存成功！");
		     							form.unmask();
		     							init();
		     						}
		     					},
		 						error: function () {
		        					alert("error");
		        				}
		        			});
						}
					}
				}
			});
    	}else if(gaidid=='position_grid'){
    		nui.open({
				url:"<%=request.getContextPath() %>/abframe/rights/newRole/queryNewPosition.jsp?roleid="+roleid,
				title: "增加岗位",
				width: 700,
				height: 410,
				ondestroy: function (action) {
					if (action == "ok") {
						var iframe = this.getIFrameEl();
						var data = iframe.contentWindow.GetData();
						data = nui.clone(data);    //必须
						if (data) {
							var json = nui.encode({"positionList":data,"roleid":roleid});
			                form.loading("保存数据中...");
				    		nui.ajax({
			        			url: "org.gocom.abframe.rights.role.AssignRolePosition.addNewPosition.biz.ext",
			                	data: json,
			                	type: 'POST',
			                	cache: false,
			                	contentType: 'text/json',
			                	success: function (o) {
			                		if(o.retCode == "0"){
		     							alert("保存失败！");
		     							form.unmask();
		     							return;
		     						}else{
		     							alert("保存成功！");
		     							form.unmask();
		     							init();
		     						}
		     					},
		 						error: function () {
		        					alert("error");
		        				}
		        			});
						}
					}
				}
			});
    	}else if(gaidid=='duty_grid'){
    		nui.open({
				url:"<%=request.getContextPath() %>/abframe/rights/newRole/queryNewDuty.jsp?roleid="+roleid,
				title: "增加职务",
				width: 700,
				height: 410,
				ondestroy: function (action) {
					if (action == "ok") {
						var iframe = this.getIFrameEl();
						var data = iframe.contentWindow.GetData();
						data = nui.clone(data);    //必须
						if (data) {
							var json = nui.encode({"dutyList":data,"roleid":roleid});
			                form.loading("保存数据中...");
				    		nui.ajax({
			        			url: "org.gocom.abframe.rights.role.AssignRoleDuty.addNewDuty.biz.ext",
			                	data: json,
			                	type: 'POST',
			                	cache: false,
			                	contentType: 'text/json',
			                	success: function (o) {
			                		if(o.retCode == "0"){
		     							alert("保存失败！");
		     							form.unmask();
		     							return;
		     						}else{
		     							alert("保存成功！");
		     							form.unmask();
		     							init();
		     						}
		     					},
		 						error: function () {
		        					alert("error");
		        				}
		        			});
						}
					}
				}
			});
    	}
    }
    
    function deleteRecord(gaidid){
    	if(gaidid=='emp_grid'){
    		var rows = emp_grid.getSelecteds();
    		if(rows.length>0){
    			var json = nui.encode({"roleOps":rows});
    			form.loading("删除数据中...");
    			nui.ajax({
					url: "org.gocom.abframe.rights.role.AssignRoleOperator.deleteOperatorRole.biz.ext",
	            	data: json,
		            type: 'POST',
		            cache: false,
		            contentType: 'text/json',
	            	success: function (o) {
	            		if(o.retCode == "0"){
	 						alert("删除失败！");
	     					form.unmask();
	     					return;
	     				}else{
	     					alert("删除成功！");
	     					form.unmask();
	     					init();
	     				}
	     			},
	 				error: function () {
	        			alert("error");
	        		}
	        	});
    		}else{
    			alert("至少选中一条数据，在进行该操作！");
    			return;
    		}
    	}else if(gaidid=='org_grid'){
    		var rows = org_grid.getSelecteds();
    		if(rows.length>0){
    			var json = nui.encode({"deletOrgs":rows,"roleid":roleid});
    			form.loading("删除数据中...");
    			nui.ajax({
					url: "org.gocom.abframe.rights.role.AssignRoleOrgan.deleteOperatorOrg.biz.ext",
	            	data: json,
		            type: 'POST',
		            cache: false,
		            contentType: 'text/json',
	            	success: function (o) {
	            		if(o.retCode == "0"){
	 						alert("删除失败！");
	     					form.unmask();
	     					return;
	     				}else{
	     					alert("删除成功！");
	     					form.unmask();
	     					init();
	     				}
	     			},
	 				error: function () {
	        			alert("error");
	        		}
	        	});
    		}else{
    			alert("至少选中一条数据，在进行该操作！");
    			return;
    		}
    	}else if(gaidid=='group_grid'){
    		var rows = group_grid.getSelecteds();
    		if(rows.length>0){
    			var json = nui.encode({"deletGroups":rows,"roleid":roleid});
    			form.loading("删除数据中...");
    			nui.ajax({
					url: "org.gocom.abframe.rights.role.AssignRoleOrgan.deleteGroupRole.biz.ext",
	            	data: json,
		            type: 'POST',
		            cache: false,
		            contentType: 'text/json',
	            	success: function (o) {
	            		if(o.retCode == "0"){
	 						alert("删除失败！");
	     					form.unmask();
	     					return;
	     				}else{
	     					alert("删除成功！");
	     					form.unmask();
	     					init();
	     				}
	     			},
	 				error: function () {
	        			alert("error");
	        		}
	        	});
    		}else{
    			alert("至少选中一条数据，在进行该操作！");
    			return;
    		}
    	}else if(gaidid=='position_grid'){
    		var rows = position_grid.getSelecteds();
    		if(rows.length>0){
    			var json = nui.encode({"deletPositions":rows,"roleid":roleid});
    			form.loading("删除数据中...");
    			nui.ajax({
					url: "org.gocom.abframe.rights.role.AssignRolePosition.deletePositionRole.biz.ext",
	            	data: json,
		            type: 'POST',
		            cache: false,
		            contentType: 'text/json',
	            	success: function (o) {
	            		if(o.retCode == "0"){
	 						alert("删除失败！");
	     					form.unmask();
	     					return;
	     				}else{
	     					alert("删除成功！");
	     					form.unmask();
	     					init();
	     				}
	     			},
	 				error: function () {
	        			alert("error");
	        		}
	        	});
    		}else{
    			alert("至少选中一条数据，在进行该操作！");
    			return;
    		}
    	}else if(gaidid=='duty_grid'){
    		var rows = duty_grid.getSelecteds();
    		if(rows.length>0){
    			var json = nui.encode({"deletDutys":rows,"roleid":roleid});
    			form.loading("删除数据中...");
    			nui.ajax({
					url: "org.gocom.abframe.rights.role.AssignRoleDuty.deleteDutyRole.biz.ext",
	            	data: json,
		            type: 'POST',
		            cache: false,
		            contentType: 'text/json',
	            	success: function (o) {
	            		if(o.retCode == "0"){
	 						alert("删除失败！");
	     					form.unmask();
	     					return;
	     				}else{
	     					alert("删除成功！");
	     					form.unmask();
	     					init();
	     				}
	     			},
	 				error: function () {
	        			alert("error");
	        		}
	        	});
    		}else{
    			alert("至少选中一条数据，在进行该操作！");
    			return;
    		}
    	}
    }
</script>
</body>
</html>