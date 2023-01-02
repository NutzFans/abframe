<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%
	UserObject user = (UserObject) session.getAttribute("userObject");
	String username = user.getUserName();
	String userid = user.getUserId();
	String orgid = user.getUserOrgId();
	String orgname= user.getUserOrgName();
	String contextPath=request.getContextPath();
 %>
<html>
<!-- 
  - Author(s): 李鹏程
  - Date: 2020-04-14 11:02:06
  - Description:
-->
<head>
	<title>我的学员</title>
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body style="width:100%;height:100%;padding:0px;margin:0px;">
	<div id="form1">
		<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
		    <!-- <input class="nui-hidden" name="emptutor._entity" value="org.gocom.abframe.dataset.organization.QueryEmpTutor"/>
			<input class="nui-hidden" name="emptutor._expr[2]._property" value="effectendtime1"/>
			<input class="nui-hidden" name="emptutor._expr[2]._op" value="="/>
			<input class="nui-hidden" name="emptutor._expr[2]._value" id="effectendtime1"/>
			 -->
			<table style="width:100%;">
				<tr>
					<td align="right"><span>员工姓名：</span></td>
	            	<td align="left">
	            		 <input class="nui-textbox" id="empname"/>
	            	
	            		<!-- <input class="nui-hidden" name="emptutor._expr[0]._property" value="empname"/>
				        <input class="nui-hidden" name="emptutor._expr[0]._op" value="like"/>
	            		<input class="nui-textbox" name="emptutor._expr[0]._value" onenter="search" id="empname" /> -->
	            		<!-- <input class="nui-hidden" name="emptutor._expr[0]._likeRule" value="all"/> -->
				    </td>
				    <td align="right"><span>导师登录名：</span></td>
	            	<td align="left">
	            		 <input class="nui-textbox" id="tutorid"/>
	            	<!-- 
	            		<input class="nui-hidden" name="emptutor._expr[1]._property" value="tutorid"/>
				        <input class="nui-hidden" name="emptutor._expr[1]._op" value="="/>
				        <input class="nui-textbox" name="emptutor._expr[1]._value" id="tutorid"  /> -->
				    </td> 
	    		</tr>
	    		<tr>
	    			<td align="center" colspan="8">
						<a class="nui-button" id="search" iconCls="icon-search" onclick="search">查找</a>
						<a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset">重置</a>
					</td>
				</tr>
	    	</table>
    	</div>
	</div>
	<div class="nui-fit">
		<div id="datagrid1"  class="nui-datagrid" style="width:100%;height:270px;"frozenStartColumn="0" frozenEndColumn="4" allowResize="true"
	    dataField="emptutor1" multiSelect="false" pageSize="10" sizeList="[10,20,30,50]" allowAlternating="true" 
	    url='org.gocom.abframe.org.employee.EmpManager.queryTutorReturnStudent.biz.ext'>
	    <div property="columns">
    		<div type="checkcolumn"></div>
	    	<div field="yjbm" width="80" headerAlign="center" align="center" >一级部门</div>
	    	<div field="ejbm" width="80" headerAlign="center" align="center" >二级部门</div>
	    	<div field="bjbm" width="80" headerAlign="center" align="center" >本级部门</div>
	    	<div field="empname" width="80" headerAlign="center" align="center" >员工姓名</div>
	    	<div field="tutorempname" width="70" headerAlign="center" align="center" allowSort="true">导师姓名</div>
	    	<div field="effectstarttime" width="80" headerAlign="center" align="center" allowSort="true">有效开始时间</div>
	    	<div field="effectendtime" width="80" headerAlign="center" align="center" allowSort="true">有效结束时间</div>
	    	<div field="recordwriter" width="80" headerAlign="center" align="center" allowSort="true">记录写入人</div>  
        	<div field="recordtime"  width="80" headerAlign="center"  align="center" allowSort="true" >记录写入时间</div>
        	<div field="lastchanger"  width="80" headerAlign="center"  align="center" allowSort="true" >最后修改用户</div>
	    	<div field="lastchangetime" width="130" headerAlign="center" align="center" allowSort="true">最后修改时间</div>
	    </div>
	</div>
	</div>
	
	<div class="nui-toolbar" style="text-align:center;padding-top:8px;padding-bottom:8px;" borderStyle="border:0;">
        <a class="nui-button" style="width:60px;" onclick="onOk">确定</a>
        <span style="display:inline-block;width:25px;"></span>
        <a class="nui-button" style="width:60px;" onclick="onCancel">取消</a>
    </div>
</body>
<script>
	nui.parse();
	var grid = nui.get("datagrid1");
	var form = new nui.Form("#form1");
	var contextPath = '<%=contextPath %>'
	 
		<% UserObject user1 = (UserObject)session.getAttribute("userObject");
		String nowuserid = user1.getUserId();
		String nowusername = user1.getUserName();%>
		var nowusername="<%=nowusername %>"
		var nowuserid="<%=nowuserid %>"
	
	
	
	function SetData(data){
		if(data){
			if(data.multiSelect){//如果为true那么可以多选，else单选
				grid.setMultiSelect(true);
			}
			 if(data.isPage){//如果为true显示分页，else不显示分页
				grid.setShowPager(true);
			}
			var json = form.getData();
			json.isPage = data.isPage;
			grid.load(json);
		}
	}	
	search();
	
	function search() {
		nui.get("tutorid").setValue(nowuserid);
		nui.get("tutorid").setReadOnly(true);
		var empname =nui.get("empname").getValue();
		var t=new Date();
		var month=nui.formatDate(t,"yyyy-MM")
		//var nowtime=nui.formatDate(t,"yyyy-MM-dd")
		/* var form = new nui.Form("#form1");
		
		var data = form.getData(); */
		var json ={nowdate:month,empname:empname,tutorid:nowuserid}
		grid.load(json);
		
	}
	
	
	
	function GetData() {
		var row = grid.getSelecteds();
		return row;
	}
	 
	function onKeyEnter(e) {
		search();
	}
	
	//重置
	function reset(){
		form.reset();
		var data = form.getData();
		grid.load(data);
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
</script>
</html>