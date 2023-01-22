<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common/common.jsp"%>
<%@ page import="com.eos.data.datacontext.UserObject"%>
<html>
<!-- 
  - Author(s): mengyy
  - Date: 2017-08-21 17:51:37
  - Description:
-->
<head>
<title>增加工作组</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;
	    }
    </style>
</head>
<body>
<div class="nui-fix">
    <div style="width:100%;height:100%;padding:0px;margin:0px;" id="form1">
    	<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
    		<input class="nui-hidden" name="stat" value="1" />
    		<input class="nui-hidden" name="roleid" id="roleid" />
            <table align="center" border="0" width="100%" class="form_table">
	    	    <tr>
	    	    	<td class = "form_label" align="right">工作组名称：</td>
			      	<td colspan="1">
					 	<input class="nui-textbox" name="criteria._expr[0]._value" style="width:150px"/>
					 	<input class="nui-hidden" name="criteria._expr[0]._property" value="groupname"/>
					 	<input class="nui-hidden" name="criteria._expr[0]._op" value="like"/>
					    <input class="nui-hidden" name="criteria._expr[0]._likeRule" value="all"/>
				  	</td>
			  		<td class="form_label" align="right">工作组类别：</td>
		           	<td colspan="1">
		          		<input class="nui-dictcombobox"  name="criteria._expr[1]._value" dictTypeId="ABF_GROUPTYPE" showNullItem="true"  style="width: 150px;" multiSelect="true"/>
	            		<input class="nui-hidden" name="criteria._expr[1]._property" value="grouptype"/>
				        <input class="nui-hidden" name="criteria._expr[1]._op" value="="/>
		         	</td>
			  	</tr>
			  	<tr>
			        <td colspan="8" align="center">
			            <a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查询</a>
			            <a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset()">重置</a>
			        </td>
			    </tr>
  			</table>
	  	</div>
	</div>
	<div style="width:100%;">
        <div id="datagrid1" dataField="groups" class="nui-datagrid" style="width:100%;height:280px;"
	    	url="org.gocom.abframe.rights.role.AssignRoleWorkgroup.queryGroupRole.biz.ext" allowResize="true"
	    	sizeList="[10,15,20,30,50]" pageSize="10" allowAlternating="true" multiSelect="true">
		    <div property="columns">
		    	<div type="checkcolumn"></div>
	    		<div field="groupname"  width="120" headerAlign="center" allowSort="true" align="left">工作组名称</div>
		        <div field="grouptype" width="80" headerAlign="center" allowSort="true" align="center" renderer="getgrouptype">工作组类别</div>
		        <div field="groupstatus" width="80"  headerAlign="center" allowSort="true" align="center" renderer="getgroupstatus">工作组状态</div>
		        <div field="orgname" width="100" headerAlign="center" align="right">所属机构</div>
		    </div>
		</div>
	</div>	
</div>
<div class="nui-toolbar" style="text-align:center;padding-top:8px;padding-bottom:8px;" borderStyle="border:0;">
    <a class="nui-button" style="width:60px;" onclick="onOk">确定</a>
    <span style="display:inline-block;width:25px;"></span>
    <a class="nui-button" style="width:60px;" onclick="onCancel">取消</a>
</div>
<script type="text/javascript">
    	nui.parse();
		var form = new nui.Form("#form1");
    	var grid = nui.get("datagrid1");
    	var roleid = '<%=request.getParameter("roleid") %>';
    	if(roleid!=null&&roleid!=""){
    		nui.get("roleid").setValue(roleid);
    	}
    	init();
    	function init(){
			var form = new nui.Form("#form1");
			var data = form.getData(); //获取表单JS对象数据
		  	grid.load(data); //datagrid加载数据
    		grid.sortBy("orgname", "desc");
		}
		
		function getgrouptype(e) {
            return nui.getDictText('ABF_GROUPTYPE',e.value);
        }
        function getgroupstatus(e){
			return nui.getDictText('ABF_GROUPSTATUS',e.value);
		}
		
		function search() {
			var form = new nui.Form("#form1");
			var data = form.getData(); //获取表单JS对象数据
		  	grid.load(data); //datagrid加载数据
		}
		
		function reset(){
			var form = new nui.Form("#form1");
			form.reset();
			grid.load();
		}
		
		//回车触发
		function onKeyEnter(){
			search();
		}
		
		function GetData(){
			var rows = grid.getSelecteds();
			return rows;
		}
		
		function onOk(){
			CloseWindow("ok");
		}
		
		function onCancel(){
			CloseWindow("cancel");
		}
		
		function CloseWindow(action) {
			if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
			else window.close();
		}

</script>
</body>
</html>