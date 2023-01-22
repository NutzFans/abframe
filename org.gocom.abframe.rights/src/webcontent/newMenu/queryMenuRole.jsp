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
<body>
<div id="datagrid1" class="nui-datagrid" style="width:500px;height:auto;"  showPager="false" onrowclick="doView"
	url="org.gocom.abframe.rights.menu.newMenu.queryRoleMenu.biz.ext" dataField="roles"  allowSortColumn="true" multiSelect="true">
	<div property="columns">
		<div field="rolename" width="150" align="center"  headerAlign="center" allowSort="true" >角色名称</div>
		<div field="roletype" width="80" align="center"  headerAlign="center" allowSort="true" renderer="getIsleaf">类别</div>
		<div name="action" width="60" headerAlign="center" align="center" renderer="onActionRenderer">操作</div>
	</div>
</div>
<br/>
<div id="a1">
	<fieldset style="border:solid 1px #aaa;padding:3px;">
		<legend>角色详情</legend>
		<div style="padding:5px;">
			<iframe id="roleemp"   frameborder="0" width="100%" height="400px"></iframe>
		</div>
	</fieldset>
</div>
<script type="text/javascript">
	nui.parse();
	var grid = nui.get("datagrid1");
    var menuid = '<%=request.getParameter("menuid") %>';
    var data = {"menuid":menuid};
    document.getElementById("a1").style.display="none";
    if(data!=null){
		init();
    }
    
	function init(){
	  	grid.load(data); //datagrid加载数据
	}
	
		
	function search(){
	  	grid.load(data); //datagrid加载数据
	}
	
	function getIsleaf(e){
		return nui.getDictText('ABF_ROLETYPE',e.value);
	}
	
	//重置
	function reset(){
		grid.load();
	}
	
	function doView(e){
		var roleid = e.record.roleid;
		document.getElementById("a1").style.display="";
		document.getElementById("roleemp").src="/default/abframe/rights/newRole/queryRoleDetail.jsp?roleid="+roleid;
	}
	
	//取消授权连接
	function onActionRenderer(e) {
        var record = e.record;
    	var roleid=record.roleid;
		if(roleid){
			return '<a  href="javascript:void(0)" onclick="removeRole(\'' + roleid + '\')" >取消授权</a>';
		}
    }
    
    //取消授权操作
    function removeRole(roleid){
    	nui.confirm("是否确认取消角色的授权？","操作提示",function(o){
        	if("ok" == o){
        		json = nui.encode({roleid: roleid,menuid:menuid});
		    	nui.ajax({
		            url: "org.gocom.abframe.rights.menu.newMenu.deleteRoleMenu.biz.ext",
					type: 'POST',
					data: json,	
					contentType: 'text/json',
		            success: function (o) {
                    	if(o.result=='1'){
	                		alert("操作成功!");
	                		search();
                    	}else{
                    		alert("操作失败!");
                    	}
	                },
	                error: function (jqXHR, textStatus, errorThrown) {
	                    alert(jqXHR.responseText);
	                }
	            });
        	}
        });
    }
</script>
</body>
</html>