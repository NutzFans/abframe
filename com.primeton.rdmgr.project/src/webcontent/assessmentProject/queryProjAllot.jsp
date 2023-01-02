<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@include file="/nui/common.jsp"%>
<%@ page import="com.eos.data.datacontext.UserObject"%>
<html>
<!-- 
  - Author(s): Administrator
  - Date: 2015-07-10 14:06:49
  - Description:
-->
<head>
	<title>项目考核分配查询</title>
	<link href="../demo.css" rel="stylesheet" type="text/css" />
</head>
<body style="width:100%;height:100%;padding:0px;margin:0px;">
<div class="nui-fix">
	<div class="nui-panel" title="项目考核分配查询" style="width:100%;">
	<div id="form1">
		<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
			<table style="width:100%;">
				  <tr>
				  	  <td class="form_label" align="right" >人员名称</td>
		          	  <td colspan="1">
						<input name="criteria._expr[7]._value" class="nui-textbox" style="width:150px;" id="empname" onenter="onKeyEnter"/>
					    <input class="nui-hidden" name="criteria._expr[7]._property" value="empname"/>
					    <input class="nui-hidden" name="criteria._expr[7]._op" value="like"/>
					    <input class="nui-hidden" name="criteria._expr[7]._likeRule" value="all"/>
					    
					    <input name="criteria._expr[11]._value" class="nui-hidden" id="userid" style="width:150px;"/>
					    <input class="nui-hidden" name="criteria._expr[11]._property" value="userid"/>
		          	  </td>
			          <td class="form_label" align="right" >项目编号</td>
			          <td colspan="1">
			            <input name="criteria._expr[1]._value" class="nui-textbox" style="width:150px;" onenter="onKeyEnter"/>
					    <input class="nui-hidden" name="criteria._expr[1]._property" value="projectno"/>
					    <input class="nui-hidden" name="criteria._expr[1]._op" value="like"/>
					    <input class="nui-hidden" name="criteria._expr[1]._likeRule" value="all"/>
			          </td>
			          <td class="form_label" align="right" >项目名称</td>
			          <td colspan="1" align="left">
			            <input name="criteria._expr[0]._value" class="nui-textbox" style="width:200px;" onenter="onKeyEnter"/>
					    <input class="nui-hidden" name="criteria._expr[0]._property" value="projectname"/>
					    <input class="nui-hidden" name="criteria._expr[0]._op" value="like"/>
					    <input class="nui-hidden" name="criteria._expr[0]._likeRule" value="all"/>
			          </td>
			          <td class="form_label" align="right">奖金发放年月</td>
		          	  <td colspan="1">
						<input class="nui-monthpicker" name="criteria._expr[9]._min" id="costyearmonthmin" style="width:100px" allowInput="true"/>-<input class="nui-monthpicker" name="criteria._expr[9]._max" style="width:100px" id="costyearmonthmax"  allowInput="true"/>
						<input class="nui-hidden" name="criteria._expr[9]._property" value="costyearmonth"/>
					    <input class="nui-hidden" name="criteria._expr[9]._op" value="between"/>
				        <input class="nui-hidden" name="criteria._expr[9]._pattern" value="yyyyMM"/>
		          	  </td>
	    		 </tr>
				 <tr>
					<td align="right" class="form_label">项目经理</td>
	            	<td align="left" colspan="1">
	            		<input name="criteria._expr[3]._value" class="nui-textbox" style="width:150px;" onenter="onKeyEnter"/>
					    <input class="nui-hidden" name="criteria._expr[3]._property" value="managername"/>
					    <input class="nui-hidden" name="criteria._expr[3]._op" value="like"/>
					    <input class="nui-hidden" name="criteria._expr[3]._likeRule" value="all"/>
				    </td>
				    <td class="form_label" align="right">合同编号</td>
			          <td colspan="1" align="left">
			            <input name="criteria._expr[8]._value" class="nui-textbox" style="width:150px;" onenter="onKeyEnter"/>
					    <input class="nui-hidden" name="criteria._expr[8]._property" value="contnum"/>
					    <input class="nui-hidden" name="criteria._expr[8]._op" value="like"/>
					    <input class="nui-hidden" name="criteria._expr[8]._likeRule" value="all"/>
			          </td>
		    		<td class="form_label" align="right">奖金金额</td>
		          	<td colspan="1">
						<input class="nui-spinner" name="criteria._expr[2]._min" value="null" style="width:100px" inputStyle="text-align: right" format="n2" allowLimitValue="false" changeOnMousewheel="false" showbutton="false"/>-<input class="nui-spinner" name="criteria._expr[2]._max" value="null" style="width:100px" inputStyle="text-align: right" format="n2" allowLimitValue="false" changeOnMousewheel="false" showbutton="false"/>
						 <input class="nui-hidden" name="criteria._expr[2]._property" value="sum"/>
						 <input class="nui-hidden" name="criteria._expr[2]._op" value="between"/>
		          	</td>
		          	<td align="right" class="form_label">人天数</td>
	            	<td colspan="1">
	            		<input class="nui-spinner" name="criteria._expr[6]._min" value="null" style="width:100px;" inputStyle="text-align: right" format="#" allowLimitValue="false" changeOnMousewheel="false" showbutton="false"/>-<input class="nui-spinner" value="null" name="criteria._expr[6]._max" style="width:100px;"  inputStyle="text-align: right" format="#" allowLimitValue="false" changeOnMousewheel="false" showbutton="false"/>
					    <input class="nui-hidden" name="criteria._expr[6]._property" value="workdays"/>
					    <input class="nui-hidden" name="criteria._expr[6]._op" value="between"/>
				    </td>
		      	</tr>
		      	<tr>
		      		<td class="form_label" align="right">部门</td>
		          	<td colspan="1">
			           	<input name="criteria._expr[4]._value" class="nui-treeselect" expandOnLoad="0"
							textField="orgname" valueField="orgid" parentField="parentorgid" dataField="orgs" showTreeIcon="true" valueFromSelect="true"
							showNullItem="true" multiSelect="true" checkRecursive = "true" showFolderCheckBox="true" id="syb" shownullItem="true" style="width:150px;"/>
					    <input class="nui-hidden" name="criteria._expr[4]._property" value="orgid"/>
					    <input class="nui-hidden" name="criteria._expr[4]._op" value="in"/>
					    
					    <input class="nui-hidden" name="criteria._expr[10]._value" id="syb1" style="width:120px;" valueFromSelect="true"/>
					    <input class="nui-hidden" name="criteria._expr[10]._property" value="orgid"/>
					    <input class="nui-hidden" name="criteria._expr[10]._op" value="in"/>
		          	</td>
		      		<td class="form_label" align="right">客户</td>
		          	<td colspan="1">
						<input name="criteria._expr[5]._value" class="nui-textbox" style="width:150px;" onenter="onKeyEnter"/>
					    <input class="nui-hidden" name="criteria._expr[5]._property" value="custname"/>
					    <input class="nui-hidden" name="criteria._expr[5]._op" value="like"/>
					    <input class="nui-hidden" name="criteria._expr[5]._likeRule" value="all"/>
		          	 </td>
	    		</tr>
	    		<tr>
	    			<td align="center" colspan="8">
						<a class="nui-button" id="search" iconCls="icon-search" onclick="search">查找</a>
						<a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset">重置</a>
						<a class="nui-button" id="download" iconCls="icon-download" onclick="exportCost">导出</a>
					</td>
				</tr>
	    	</table>
    	</div>
	</div>
	<div style="width:100%;" > <div id="datagrid1" sizeList="[10,20,50,100]" showPager="true"
	dataField="projAllots" ondrawsummarycell="drawSum" 
	showSummaryRow="true"  multiSelect="true"
	allowSortColumn="true" allowCellWrap="true" class="nui-datagrid"
	style="width:100%;height:340px;"
	url="com.primeton.rdmgr.project.assessmentProject.queryProjempAllot.biz.ext">
<div property="columns"> <div field="empname" width="55"
	align="center" headerAlign="center" allowSort="true">人员名称</div> <div
	field="projectname" width="180" align="left" headerAlign="center"
	allowSort="true" renderer="getProjectNameDetail">项目名称</div> <div
	field="projectno" width="100" align="center" headerAlign="center"
	allowSort="true">项目编号</div> <div field="contnum" width="100"
	align="center" headerAlign="center" allowSort="true">合同编号</div> <div
	field="custjc" width="100" align="left" headerAlign="center"
	allowSort="true">客户简称</div> <div field="orgname" width="100"
	align="center" headerAlign="center" allowSort="true">部门</div> <div
	field="managername" width="60" align="center" headerAlign="center"
	allowSort="true">项目经理</div> <div field="costyearmonth" width="80"
	align="center" headerAlign="center" allowSort="true">奖金发放年月</div> <div
	field="projrole" width="80" align="center" headerAlign="center"
	allowSort="true">项目职责</div> <div field="workdays" width="60"
	align="right" headerAlign="center" allowSort="true" summaryType="sum">人天数</div>
<div field="sum" width="100" align="right" headerAlign="center" 
	allowSort="true" numberFormat="n2" summaryType="sum">奖金金额</div> <div
	field="num" width="60" align="right" headerAlign="center"
	allowSort="true">考核评分</div> <div field="evaluate" width="120"
	align="left" headerAlign="center" allowSort="true">考核评价</div> <div
	field="remark" width="120" align="left" headerAlign="center"
	allowSort="true">备注</div> </div> </div>
	</div>
	</div>
</div>
	<form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
		<input type="hidden" name="_eosFlowAction" value="action0" filter="false"/>
		<input type="hidden" name="downloadFile" filter="false"/>
		<input type="hidden" name="fileName" filter="false"/>
</form>
</body>
<script>
	nui.parse();
	var grid = nui.get("datagrid1");
	var state = false;
	init();
	function init(){
	
	     
	
		<% 
    		UserObject user = (UserObject)session.getAttribute("userObject");
    		String nowuserid = user.getUserId();
    		String nowusername = user.getUserName();
    		String userorgid=user.getUserOrgId();
		%>
		//初始化事业部
		var json = {"code":"queryProjAllots","map":{"property":"status","op":"=","value":"running"}};
		nui.ajax({
            url: "com.primeton.eos.ame_auth.ame_auth.getownorg.biz.ext",
            type: "post",
            cache: false,
            contentType: 'text/json',
            data:json,
            success: function (text) {
            	if(text.orgs){
					if(text.orgs.length==0){
						// 没有有权的机构时只能查销售为自己的数据
						nui.get("userid").setValue('<%=nowuserid %>');
						nui.get("empname").setValue('<%=nowusername %>');
						nui.get("empname").setReadOnly(true);
					}
					nui.get("syb").loadList(text.orgs, "orgid", "parentorgid");
					var isall;
					for(var i=0;i<text.orgs.length;i++){
						if(text.orgs[i].orgid == "1"){
							isall = "1";
							break;
						}
					}
					//如果拥有全公司的权限就取消部门限制
					if(isall == "1"){
						nui.get("syb1").setValue("");
					}else{
						nui.get("syb1").setValue(text.orgids);
					}
				}else{
					// 没有有权的机构时没有权限
					nui.get("syb1").setValue("1");
				}
				search();
    		}
    	}); 
          
	}
	      
	
	function search() {
		var form = new nui.Form("#form1");
		var data = form.getData();
		var min = nui.get("costyearmonthmin").getValue();
    	if(min){
	    	minyear = min.getFullYear();
	    	minmonth = min.getMonth();
	    	data.criteria._expr[9]._min = minyear+""+minmonth;
    	}
    	var max = nui.get("costyearmonthmax").getValue();
    	if(max){
	    	maxyear = max.getFullYear();
	    	maxmonth = max.getMonth() + 1;
    		data.criteria._expr[9]._max = maxyear+""+maxmonth;
    	}
    	grid.sortBy("projectno","desc")
		grid.load(data);
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
	
	function getProjectNameDetail(e){
    	if(e.value){
    		return "<a href='javascript:void(0)' onclick='checkProjectName();' title='点击查看'>" + e.value + "</a>";
    	}
    }
    function checkProjectName(){
    	var selectRow = grid.getSelected();
		var executeUrl = "<%=request.getContextPath() %>/project/examineToProject/newProjcheckDetail.jsp?projcheckid=" + selectRow.projcheckid;
		window.open(executeUrl);
    }
    
    //导出
    function exportCost(){
		if(!confirm("是否确认导出？")){
			return;
		}
		var form = new nui.Form("#form1");
		var data = form.getData();
		nui.ajax({
			url: "com.primeton.rdmgr.project.assessmentProject.exportProjAllots.biz.ext",
	        type: "post",
	        data: data,
	        cache: false,
	        contentType: 'text/json',
	        success: function (o) {
	     		nui.unmask();
	     		var filePath = o.downloadFile;
	        	var fileName = "项目考核分配";
	        	var myDate = new Date();
	        	var year = myDate.getFullYear();
	        	var month = myDate.getMonth()+1;
	        	var day = myDate.getDate();
	        	var hours = myDate.getHours();
	        	var minutes = myDate.getMinutes();
	        	var seconds = myDate.getSeconds();
	        	var curDateTime = year;
	        	if(month>9){
					curDateTime = curDateTime + "" + month;
				}else{
					curDateTime = curDateTime + "0" + month;
					}
	        	if(day>9){
					curDateTime = curDateTime + day;
				}else{
					curDateTime = curDateTime + "0" + day;
					}
				if(hours>9){
					curDateTime = curDateTime + hours;
				}else{
					curDateTime = curDateTime + "0" + hours;
					}
				if(minutes>9){
					curDateTime = curDateTime + minutes;
				}else{
					curDateTime = curDateTime + "0" + minutes;
					}
				if(seconds>9){
					curDateTime = curDateTime + seconds;
				}else{
					curDateTime = curDateTime + "0" + seconds;
				}
				fileName = fileName + "_" + curDateTime + ".xls";
				var frm = document.getElementById("viewlist1");
	        	frm.elements["downloadFile"].value = filePath;
	        	frm.elements["fileName"].value = fileName;
			    frm.submit();
	        },
	        error: function () {
	        	alert("error");
	        }
		});
	}
	
	function drawSum(e){
		if (e.field == "workdays"||e.field == "sum") {
            e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
        }
	}
</script>
</html>