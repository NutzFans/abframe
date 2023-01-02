<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<html>
<!-- 
  - Author(s): 许青倩
  - Date: 2019-11-11 13:46:42
  - Description:
-->
<head>
<title>简历选择</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
    body{
        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
    }
    </style>
</head>
<body>
	<div class="nui-toolbar" style="text-align:center;line-height:30px;" borderStyle="border:0;" id="form1">
		<table style="width:100%;">
			<tr>
				<td align="right"style="width: 80px;">姓名:</td>
				<td align="left" style="width: 100px;" >
			       	<input name="criteria._expr[0]._value" class="nui-textbox"  style="width:100px;" onenter="onKeyEnter"/>
			      	<input class="nui-hidden" name="criteria._expr[0]._property" value="empname" />
			        <input class="nui-hidden" name="criteria._expr[0]._op" value="like"/>
			        <input class="nui-hidden" name="criteria._expr[0]._likeRule" value="all"/>
			        <input class="nui-hidden" name="criteria._expr[1]._property" value="interviewstatus" />
			        <input class="nui-hidden" name="criteria._expr[1]._op" value="in"/>
			        <input class="nui-hidden" name="criteria._expr[1]._value" value="0,1,3,5,7,9,10"/>
		        </td>
		        <td align="right"style="width: 80px;">学历:</td>
				<td align="left" style="width: 100px;" >
					<input class="nui-dictcombobox" name="criteria._expr[2]._value" style="width:125px" id="degree" showNullItem="true"  dictTypeId="DEGREE" multiselect="true">
					<input class="nui-hidden" name="criteria._expr[2]._property" value="education">
					<input class="nui-hidden" name="criteria._expr[2]._op" id="tempCond41" value="in">
				</td>
		        <td align="right"style="width: 100px;">工作年限:</td>
				<td align="left" style="width: 80px;" >
					<input class="nui-textbox" name="criteria._expr[3]._min" style="width:30px"/>-<input class="nui-textbox" name="criteria._expr[3]._max" style="width:30px"/>
					<input class="nui-hidden" name="criteria._expr[3]._property" value="workingyear1">
					<input class="nui-hidden" name="criteria._expr[3]._op" id="tempCond41" value="between">
				</td>
			</tr>
			<tr>
		        <td align="right"style="width: 100px;">招聘专员:</td>
				<td align="left" style="width: 80px;" >
					<input class="mini-textboxlist" name="criteria._expr[4]._value" id="operatorid" textField="EMPNAME" valueField="USERID" searchField="name" url="com.primeton.eos.ame_common.ame_common.queryAllEmpByName.biz.ext">
					<input class="nui-hidden" name="criteria._expr[4]._property" value="operatoruserid">
					<input class="nui-hidden" name="criteria._expr[4]._op"  value="in">
				</td>
				<td colspan="4">
        			<a class="nui-button" style="width:60px;" onclick="search()">查询</a>
        		</td>
			<tr>
		</table>
	</div>
	<div class="nui-fit">
    	<div id="datagrid1" class="nui-datagrid" style="width:100%;height:100%;" allowResize="true" onrowdblclick="onRowDblClick" dataField="queryResume" url="com.primeton.eos.ame_resume.resumeManage.queryResume.biz.ext" sizeList="[10,20,50,100]" pageSize="15"  multiSelect="true">
			<div property="columns">
				<div type="checkcolumn" width="20px"></div>
				<div field="empname" headerAlign="center" align="center" renderer="getDetail" allowSort="true" width="60">姓名</div>
				<div field="applyoccupation" headerAlign="center" align="center" allowSort="true" width="80">应聘职位</div>
				<div field="gender" headerAlign="center" align="center" allowSort="true" width="35" renderer="ongender">性别</div>
				<div field="workingyear1" headerAlign="center" align="center" allowSort="true" width="80">工作年限(年)</div>
				<div field="education" headerAlign="center" align="center" allowSort="true" width="40" renderer="onDegreeRenderer">学历</div>
				<div field="tel" headerAlign="center" align="left" allowSort="true" width="100">联系电话</div>
				<div field="selfemail" headerAlign="center" align="left" allowSort="true" width="150">电子邮件</div>
				<div field="currentincome" headerAlign="center" align="right" allowSort="true" width="75">目前收入(千元)</div>
				<div field="expectincome" headerAlign="center" align="right" allowSort="true" width="75">期望薪资(千元)</div>
				<div field="applystatus" headerAlign="center" align="center" allowSort="true" width="100" renderer="ongenderApplyStatus">求职状态</div>
				<div field="interviewstatus" headerAlign="center" align="center" allowSort="true" width="100" renderer="ongenderinterviewStatus">简历状态</div>
				<div field="recruitername" headerAlign="center" align="center" allowSort="true" width="60">招聘专员</div>
			</div>
		</div>
	</div>
    <div class="nui-toolbar" style="text-align:center;padding-top:8px;padding-bottom:8px;" borderStyle="border:0;">
        <a class="nui-button" style="width:60px;" onclick="onOk()">确定</a>
        <span style="display:inline-block;width:25px;"></span>
        <a class="nui-button" style="width:60px;" onclick="onCancel()">关闭</a><br/>
    </div>
</body>
<script type="text/javascript">
	nui.parse();
	var grid = nui.get("datagrid1");
	<% 
		UserObject user = (UserObject)session.getAttribute("userObject");
		String nowuserid = user.getUserId();
		String nowusername = user.getUserName();
	%>
	
	var nowuserid='<%=nowuserid %>';
	var nowusername='<%=nowusername%>';
	
	init();
	function init(){
	 	nui.get("operatorid").setValue(nowuserid);
	 	nui.get("operatorid").setText(nowusername);
		var form = new nui.Form("#form1");
		var json = form.getData();
		grid.load(json,function(){
			alert("1");
		});
		grid.sortBy("lastupdate", "desc");
	}
	
	function search() {
		var form = new nui.Form("#form1");
		var data = form.getData();
		grid.load(data,function(a){
			if(a.total==0){
				//alert("没有符合条件的简历！");
			}
		});
	}
	
	function GetData() {
		var row = grid.getSelecteds();
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
		var row = grid.getSelecteds();
		<%--if(row.status!=1){
			alert("供应商无效或审核中！");
			return;
		}--%>
		CloseWindow("ok");
	}
	
	function onCancel() {
		CloseWindow("cancel");
	} 
	
	//业务字典
  	function ongender(e){
		return nui.getDictText('ABF_GENDER',e.value);//设置业务字典值
	}
	function onDegreeRenderer(e){
		return nui.getDictText('DEGREE',e.value);//设置业务字典值
	}
	function ongenderApplyStatus(e){
		return nui.getDictText('AME_APPLYSTATUS',e.value);//设置业务字典值
	}
	function ongenderinterviewStatus(e){
		return nui.getDictText('INTERVIEW_STATUS_OUT',e.value);//设置业务字典值
	}
</script>
</html>