<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common/common.jsp"%>
<html>
<!-- 
  - Author(s): 张一博
  - Date: 2018-03-14 13:40:07
  - Description:
-->
<head>
<title>机构查询</title>
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>

</head>
<body>
<fieldset style="border: solid 1px #aaa; padding: 3px" id="e2">
<legend>功能角色授权</legend>
<div style="width:100%;">
    <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
        <table style="width:100%;">
            <tr>
                <td style="width:10%;">
                    <a class="nui-button" id="addBtn" iconCls="icon-add" onclick="addRole()">新增</a>
                </td>
            </tr>
        </table>           
    </div>
</div>
<div id="datagrid2" class="nui-datagrid" style="width:500px;height:auto;"  showPager="false" 
	url="org.gocom.abframe.rights.menu.newMenu.queryRoleMenu11.biz.ext" dataField="roles"  allowSortColumn="true" multiSelect="true">
	<div property="columns">
		<div field="rolename" width="150" align="center"  headerAlign="center" allowSort="true" >角色名称</div>
		<div field="roletype" width="80" align="center"  headerAlign="center" allowSort="true" renderer="getIsleaf">类别</div>
		<div name="action" width="60" headerAlign="center" align="center" renderer="onActionRenderer">操作</div>
	</div>
</div>
</fieldset>
<fieldset style="border: solid 1px #aaa; padding: 3px" id="e1">
<legend>数据权限控制</legend>
<div style="width:100%;">
    <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
        <table style="width:100%;">
            <tr>
                <td style="width:10%;">
                    <a class="nui-button" id="addBtn" iconCls="icon-add" onclick="addRow()">新增</a>
                    <a class="nui-button" id="removeBtn" iconCls="icon-remove" onclick="removeRow()">删除</a>
                    <a class="nui-button" id="okbutton" iconCls="icon-ok" onclick="onOk()">保存</a>
                </td>
            </tr>
        </table>           
    </div>
</div>
<div id="datagrid1" class="nui-datagrid" style="width:100%;height: auto"  <%--multiSelect="true"--%>
		dataField="authList" showPager="false" allowAlternating="true" allowCellSelect="true" allowCellEdit="true">
	<div property="columns">
		<!-- <div type="checkcolumn"></div> -->
		<div field="code" width="60px" align="center"  headerAlign="center">功能代码
		</div>
		<div field="orglevel" width="20px" align="center"  headerAlign="center" >层级
			<input property="editor" class="nui-textbox" width="100%"/>
		</div>
		<div field="role" displayField="rolename" width="200px" align="center"  headerAlign="center">角色
			<input property="editor" class="nui-textboxlist" name="roleid" allowInput="true" textField="rolename" valueField="roleid" searchField="name" style="width:100%;" 
				url="com.primeton.eos.ame_budget.budgetOrgManager.queryRoleidByName.biz.ext"/>
		</div>
		<div field="userid" displayField="empname" width="100px" align="center"  headerAlign="center">人员
			<input property="editor" name = "userid" class="nui-textboxlist"  searchField="name" style="width:100%;"
					url="com.primeton.eos.ame_budget.budgetOrgManager.queryEmpByName.biz.ext" 
					textField="EMPNAME" valueField="USERID" />
		</div>
		<div field="org" displayField="orgname" width="100px" align="center"  headerAlign="center">部门
			<input property="editor" class="nui-textboxlist" name="org" allowInput="true" textField="orgname" valueField="orgid" searchField="name" style="width:100%;" 
				url="com.primeton.eos.ame_budget.budgetOrgManager.queryOrgidByName.biz.ext"/>
		</div>
	</div>
</div>
</fieldset>
</body>
<script type="text/javascript">
	nui.parse();
	var grid = nui.get('datagrid1');
	var appid = '<%=request.getParameter("appid") %>';
	var appid1 = '<%=request.getParameter("appid1") %>';
	var funcgroupid = '<%=request.getParameter("funcgroupid") %>';
	
	
	
	var datagrid2=nui.get("datagrid2");
	search();
	datagrid2.load({"appid":appid});
	//查询功能列表
	function search(){
		var json = {appid:appid};
		nui.ajax({
			url:"com.primeton.eos.ame_auth.ame_auth.getAuthConfig.biz.ext",
			data:json,
			type:'POST',
			contentType:'text/json',
			success:function(text){
			if(text.ret==2){
				document.getElementById("e1").style.display="none";
			}else{
				document.getElementById("e1").style.display="";
			   var text = nui.decode(text);
				grid.setData(text.authList);
			}
				
			}
			
		});
	}
	
	//确定保存或更新
	function onOk() {
	   nui.get("okbutton").disable(); 
	   saveData();
	}
	
	function saveData(){
		var authList = grid.getData();
		var obj = {};
		//做效验。
		for(var i = 0 ; i < authList.length ; i++){
			if(obj[authList[i].orglevel]){
		   		nui.alert("层级不能相同。");
		   		nui.get("okbutton").enable(); 
		   		return;
		 	}else{
			   	obj[authList[i].orglevel]=authList[i].orglevel;
		 	}
		}
		var json = {authList:authList};
		nui.ajax({
			url:"com.primeton.eos.ame_auth.ame_auth.saveAppAuthConfig.biz.ext",
			data:json,
			type:'POST',
			contentType:'text/json',
			success:function(text){
				nui.get("okbutton").enable(); 
				if(text.returnCode){
					nui.alert("保存成功。");
				}else{
					nui.alert("保存失败。");
					search();
				}
				
			},
			error: function (jqXHR, textStatus, errorThrown) {
	        }
		});
	}
	
	
	function addRow(){
		var newRow = {code:appid};
		grid.addRow(newRow);
	}
			
	function removeRow(){
		var authList = grid.getSelecteds();
		var json  = {authList:authList[0]};
		if (authList.length > 0) {
		   if(confirm("确定删除该条记录吗？")){
		        nui.ajax({
		        	url:"com.primeton.eos.ame_auth.ame_auth.deleteAppAuthConfig.biz.ext",
					data:json,
					type:'POST',
					success:function(text){
						if(text.returnCode){
							nui.alert("删除成功。");
							grid.removeRows(authList, false);
						}else{
							nui.alert("删除失败。");
						}
						
					},
					error: function (jqXHR, textStatus, errorThrown) {
				    }
		        })
		    }else{
		        return false;
		    }
		}else{
			alert("请选择一条记录！"); 
		}
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
        		json = nui.encode({roleid: roleid,appid:appid});
		    	nui.ajax({
		            url: "org.gocom.abframe.rights.menu.newMenu.deleteRoleMenu11.biz.ext",
					type: 'POST',
					data: json,	
					contentType: 'text/json',
		            success: function (o) {
                    	if(o.result=='1'){
	                		alert("操作成功!");
	                		//刷新
	                	datagrid2.reload({"appid":appid});
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

	 function addRole(){
  		nui.open({
            url: "<%=request.getContextPath() %>/abframe/rights/newApplication/queryRole11.jsp?appid="+appid+"&funcgroupid="+funcgroupid+"&appid1="+appid1,
            title: "新增角色",
           	width: 700,
			height: 430,
			ondestroy: function () {
			datagrid2.reload({"appid":appid});
				}
			});
    }
	//机构等级
	function orgdegree(e){
		return nui.getDictText('ABF_ORGDEGREE',e.value);
	}
	//业务字典
	function getIsleaf(e){
		return nui.getDictText('ABF_ROLETYPE',e.value);
	}
</script>
</html>