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
	<title>项目考核记录查询</title>
	<link href="../demo.css" rel="stylesheet" type="text/css" />
</head>
<body style="width:100%;height:100%;padding:0px;margin:0px;">


<div class="nui-fix">
	<div class="nui-panel" title="项目考核记录查询" style="width:100%;">
	<div id="form1">
		<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
			<table style="width:100%;">
				  <tr>
			      	  <td class="form_label" align="right" style="width:100px;">项目名称</td>
			          <td colspan="1" align="left">
			            <input name="criteria._expr[0]._value" class="nui-textbox" style="width:150px;" onenter="onKeyEnter"/>
					    <input class="nui-hidden" name="criteria._expr[0]._property" value="projectname"/>
					    <input class="nui-hidden" name="criteria._expr[0]._op" value="like"/>
					    <input class="nui-hidden" name="criteria._expr[0]._likeRule" value="all"/>
			          </td>
			          <td class="form_label" align="right" style="width:100px;">项目编号</td>
			          <td colspan="1">
			            <input name="criteria._expr[1]._value" class="nui-textbox" style="width:150px;" onenter="onKeyEnter"/>
					    <input class="nui-hidden" name="criteria._expr[1]._property" value="projectno"/>
					    <input class="nui-hidden" name="criteria._expr[1]._op" value="like"/>
					    <input class="nui-hidden" name="criteria._expr[1]._likeRule" value="all"/>
			          </td>
				     <td class="form_label" align="right">方案发起日期</td>
		          	<td colspan="1">
						 <input class="nui-datepicker" name="criteria._expr[7]._min" style="width:100px"/>-<input class="nui-datepicker" name="criteria._expr[7]._max" style="width:100px"/>
						 <input class="nui-hidden" name="criteria._expr[7]._property" value="checkstartdate"/>
						 <input class="nui-hidden" name="criteria._expr[7]._op" value="between"/>
						 <input class="nui-hidden" name="criteria._expr[7]._pattern" value="yyyy-MM-dd"/>
		          	</td>
	    		</tr>
				<tr>
					<td align="right" class="form_label">项目经理</td>
	            	<td align="left" colspan="1">
	            		<input id="emp"  name="criteria._expr[3]._value" class="mini-textboxlist" allowInput="true" textField="EMPNAME" valueField="USERID" searchField="name" style="width:150px;" url="com.primeton.eos.ame_budget.budgetOrgManager.queryAllEmpByName.biz.ext"/>
	            		<input class="nui-hidden" name="criteria._expr[3]._property" value="manager"/>
		                <input class="nui-hidden" name="criteria._expr[3]._op" value="in" id="emp_op"/>
				    </td>
		      		 <td class="form_label" align="right">考核状态</td>
	          		 <td colspan="1">
			           	<input name="criteria._expr[5]._value" class="nui-dictcombobox"  dictTypeId="CHECK_STATUS" shownullItem="true" style="width:150px;"/>
					    <input class="nui-hidden" name="criteria._expr[5]._property" value="checkstatus"/>
					    <input class="nui-hidden" name="criteria._expr[5]._op" value="="/>
		          	 </td>
		    		<td class="form_label" align="right">方案确定日期</td>
		          	<td colspan="1">
						 <input class="nui-datepicker" name="criteria._expr[4]._min" style="width:100px"/>-<input class="nui-datepicker" name="criteria._expr[4]._max" style="width:100px"/>
						 <input class="nui-hidden" name="criteria._expr[4]._property" value="projcheckdate"/>
						 <input class="nui-hidden" name="criteria._expr[4]._op" value="between"/>
						 <input class="nui-hidden" name="criteria._expr[4]._pattern" value="yyyy-MM-dd"/>
		          	</td>
		      	</tr>
		      	<tr>
		      		<td align="right" class="form_label" style="width:100px;">合同编号</td>
	            	 <td colspan="1">
	            		<input name="criteria._expr[2]._value" class="nui-textbox" style="width:150px;" onenter="onKeyEnter"/>
					    <input class="nui-hidden" name="criteria._expr[2]._property" value="contnum"/>
					    <input class="nui-hidden" name="criteria._expr[2]._op" value="like"/>
					    <input class="nui-hidden" name="criteria._expr[2]._likeRule" value="all"/>
				     </td>
				    <td class="form_label" align="right">项目受益部门</td>
		           	<td>
				        <input id="finUnitId"  name="criteria._ref[0]._expr[0]._value"  class="nui-combobox" 
					    textField="orgname" valueField="orgseq" dataField="orgs" showNullItem="true" allowInput="true" style="width:150px;" onvaluechanged="changeusername()"/>
			    		<input class="nui-hidden" name="criteria._expr[9]._property" value="orgid"/>
		                <input class="nui-hidden" name="criteria._expr[9]._op" value="=" id="orgid_op"/>
		                <input class="nui-hidden" name="criteria._expr[9]._ref" value="" id="orgid_ref"/>
		                <input class="nui-hidden" name="criteria._ref[0]._id" value="3"/>
		                <input class="nui-hidden" name="criteria._ref[0]._entity" value="org.gocom.abframe.dataset.organization.OmOrganization"/>
		                <input class="nui-hidden" name="criteria._ref[0]._select._field[0]" value="orgid"/>
		                <input class="nui-hidden" name="criteria._ref[0]._expr[0]._property" value="orgseq"/>
		                <input class="nui-hidden" name="criteria._ref[0]._expr[0]._op" value="like"/>
				        <input class="nui-hidden" name="criteria._ref[0]._expr[0]._likeRule" value="end"/>
				        
				        <input class="nui-hidden" name="criteria._expr[8]._property" value="orgid"/>
				        <input class="nui-hidden" name="criteria._expr[8]._op" value="in"/>
				        <input class="nui-hidden" name="criteria._expr[8]._value" id="orgids"/>
		        	</td>
				    <td class="form_label" align="right" style="width:100px;"><span>考核收入确认年月</span></td>
					<td align="left">
					    <input class="nui-monthpicker" name="criteria._expr[6]._min" style="width:100px;" id="checkincomeymmin" allowInput="true"/>-<input class="nui-monthpicker" name="criteria._expr[6]._max" style="width:100px;" id="checkincomeymmax" allowInput="true"/>
					    <input class="nui-hidden" name="criteria._expr[6]._property" value="checkincomeym"/>
					    <input class="nui-hidden" name="criteria._expr[6]._op" value="between"/>
				        <input class="nui-hidden" name="criteria._expr[6]._pattern" value="yyyyMM"/>
					</td>
	    		</tr>
	    		<tr>
	    			<td align="center" colspan="8">
						<a class="nui-button" id="search" iconCls="icon-search" onclick="search">查找</a>
						<a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset">重置</a>
						<a class="nui-button" id="download" iconCls="icon-download" onclick="exportCost1">导出</a>
					</td>
				</tr>
	    	</table>
    	</div>
	</div>
	<div style="width:100%;" >
		<div class="nui-toolbar" id="toolbars" style="border-bottom:0;padding:0px;">
            <table style="width:100%;">
            	<tr>
                    <td style="width:20%;">
			            <a class="nui-button" id="geto" iconCls="icon-goto" onclick="create()">发起项目考核分配流程</a>
			        </td>
                </tr>
            </table>           
        </div>
	    <div id="datagrid1" frozenStartColumn="0" frozenEndColumn="4" sizeList="[10,20,50,100]" showPager="true" dataField="projchecks" 
        	showSummaryRow="true"  sortMode="client" ondrawsummarycell="drawSum1"
        	class="nui-datagrid" style="width:100%;height:340px;" url="com.primeton.rdmgr.project.examineToProject.queryProjCheck.biz.ext" 
        	multiSelect="true" allowSortColumn=true>
            <div property="columns">
            	<div type="checkcolumn"></div>
            	<div name="action" width="70" headerAlign="center" align="center" renderer="onActionRenderer">操作</div>
                <div field="projectname" width="180" align="left" headerAlign="center" allowSort="true" renderer="getProjectNameDetail">项目名称</div>
                <div field="projectno" width="100" align="center" headerAlign="center" allowSort="true" >项目编号</div>
                <div field="contnum" width="100" align="center" headerAlign="center" allowSort="true" >合同编号</div>
                <div field="custname" width="180" align="center" headerAlign="center" allowSort="true" >客户</div>
                <div field="managername" width="60" align="center" headerAlign="center" allowSort="true" >项目经理</div>
                <div field="checkstatus" width="130" align="center" headerAlign="center" allowSort="true" renderer="dictGetCheckstatus">考核状态</div>
                <div field="totalnum" width="60" align="right" headerAlign="center" allowSort="true" summaryType="sum">考核得分</div>
                <div field="assessmentcost" width="100" align="right" headerAlign="center" allowSort="true" numberFormat="n2" summaryType="sum">项目总成本</div>
                <div field="costsave" width="100" align="right" headerAlign="center" allowSort="true" numberFormat="n2" summaryType="sum">项目实际节省成本</div>
                <div field="projbonus" width="100" align="right" headerAlign="center" allowSort="true" numberFormat="n2" summaryType="sum" renderer="getProjbonusDetail">团队奖金</div>
                <div field="checkincomeym" width="120" align="center" headerAlign="center" allowSort="true">考核收入确认年月</div>
                <div field="costyearmonth" width="100" align="center" headerAlign="center" allowSort="true" >奖金发放年月</div>
                <div field="checkstartdate" width="120" align="center" headerAlign="center" allowSort="true">考核方案发起日期</div>
                <div field="projcheckdate" width="120" align="center" headerAlign="center" allowSort="true">考核方案确定日期</div>
                <div field="completiondate" width="100" align="center" headerAlign="center" allowSort="true">考核完成日期</div>
            </div>
        </div>
	</div>
	</div>
</div>
	<form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
		<input type="hidden" name="_eosFlowAction" value="action0" filter="false"/>
		<input type="hidden" name="downloadFile" filter="false"/>
		<input type="hidden" name="fileName" filter="false"/>		
</form>
</body>
<script type="text/javascript">
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
	
    	//根据受益部门做数据权限控制
    	var json = {"code":"projCheck","map":{"property":"status","op":"=","value":"running"}};
		nui.ajax({
			url:"com.primeton.eos.ame_auth.ame_auth.getownorg1.biz.ext",
			data:json,
			type:'POST',
			async:false,
			contentType:'text/json',
			success:function(text){
				if(text.orgs && text.orgs.length > 0){
					var isall;//是否拥有全公司的权限
					for(var i=0;i<text.orgs.length;i++){
						if(text.orgs[i].orgid == "1"){
							isall = "1";
							break;
						}
					}
					//如果拥有全公司的权限就取消部门限制
					if(isall == "1"){
						nui.getbyName("criteria._expr[8]._op").setValue("=");
        				nui.getbyName("criteria._expr[8]._value").setValue("");
        				nui.getbyName("criteria._expr[9]._op").setValue("=");
        				nui.getbyName("criteria._expr[9]._ref").setValue("");
					}else{
						nui.get("orgids").setValue(text.orgids);
					}
					nui.get("finUnitId").setData(text.orgs);

					
				} else {
					// 没有有权的机构时只能查项目负责人为自己的数据
					nui.get("emp").setValue('<%=nowuserid %>');
					nui.get("emp").setText('<%=nowusername %>');
					nui.get("emp").setReadOnly(true);
				}
				search();
			}
		});
	}
	
	function search() {
		var form = new nui.Form("#form1");
		if(nui.get("emp").getValue()==""||nui.get("emp").getValue()==null){
			nui.get("emp_op").setValue("=");
		} else {
			nui.get("emp_op").setValue("in");
		}
		var data = form.getData();
		var min = nui.get("checkincomeymmin").getValue();
    	if(min){
	    	minyear = min.getFullYear();
	    	minmonth = min.getMonth();
	    	data.criteria._expr[7]._min = minyear+""+minmonth;
    	}
    	var max = nui.get("checkincomeymmax").getValue();
    	if(max){
	    	maxyear = max.getFullYear();
	    	maxmonth = max.getMonth() + 1;
    		data.criteria._expr[7]._max = maxyear+""+maxmonth;
    	}
		grid.load(data);
	}
	function reset(){
		var form = new nui.Form("#form1");
		form.reset();
		grid.load();
	}
	
	function dictGetCheckstatus(e){
		var record = e.record;
		if(e.value){
			return nui.getDictText('CHECK_STATUS',e.value);
    	}
	}	
	
	//考核方案
    function checkProjectName1(){
    	var selectRow = grid.getSelected();
		var processInstID = selectRow.processinstid;
		var url = "<%=request.getContextPath() %>/bps/wfclient/task/processinstView.jsp";
		var title = "流程图查看";
		var width=1000;
	    nui.open({
			url: url,
			title: title,
			width: width,
			height: 550,
			onload: function () {
				var iframe = this.getIFrameEl();
				if(iframe.contentWindow.initData) {
					iframe.contentWindow.initData({"processInstID": processInstID});
				}
			},
			ondestroy: function (action){
			}
		});
    }
    
    //考核分配
    function checkProjectName2(){
    	var selectRow = grid.getSelected();
		var processInstID = selectRow.processinstid1;
		var url = "<%=request.getContextPath() %>/bps/wfclient/task/processinstView.jsp";
		var title = "流程图查看";
		var width=1000;
	    nui.open({
			url: url,
			title: title,
			width: width,
			height: 550,
			onload: function () {
				var iframe = this.getIFrameEl();
				if(iframe.contentWindow.initData) {
					iframe.contentWindow.initData({"processInstID": processInstID});
				}
			},
			ondestroy: function (action){
			}
		});
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
    
    function getProjbonusDetail(e){
    	if(e.value){
    		return "<a href='javascript:void(0)' onclick='getProjbonus();' title='点击查看'>" + e.value + "</a>";
    	}
    }
    
    function getProjbonus(){
	   var selectRow = grid.getSelected();
		var executeUrl = "<%=request.getContextPath() %>/project/assessmentProject/teamCostDetail.jsp?projcheckid=" + selectRow.projcheckid;
		window.open(executeUrl); 
    }
    
    function create(){
    	var rows = grid.getSelecteds();
    	if(rows.length==1){
    		var row = grid.getSelected();
    		var checkstatus = row.checkstatus;
    		if(checkstatus=='2'){
    			var ismanager = '0';
    			var URL = "<%=request.getContextPath() %>/project/assessmentProject/createAssessmentProject.jsp?ismanager="+ismanager;
    			nui.open({
					url: URL,
					title: "发起项目考核分配流程",
					width: 1000,
					height: 550,
					onload: function () {
						var iframe = this.getIFrameEl();
						if(iframe.contentWindow.initData) {
							iframe.contentWindow.initData({"row":row});
						}
					},
					ondestroy: function (action){
					}
				});
    		}else{
    			alert("请选择状态为'考核方案确认'的数据进行发起！");
    			return;
    		}
    	}else{
    		alert("请选择一条数据后再进行操作！");
    		return;
    	}
    }
    
    function drawSum1(e){
		if (e.field == "teamcost"||e.field == "totalnum"||e.field == "costsave"||e.field == "assessmentcost") {
            e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
        }
	}
	
	
	
	    //导出
    function exportCost1(){
			 
    
		if(!confirm("是否确认导出？")){
			return;
		}
		var form = new nui.Form("#form1");
		var data = form.getData();
		nui.ajax({
			url: "com.primeton.rdmgr.project.assessmentProject.exportProjRecord1.biz.ext",
	        type: "post",
	        data: data,
	        cache: false,
	        contentType: 'text/json',
	        success: function (o) {
	     		nui.unmask();
	     		var filePath = o.downloadFile;
	        	var fileName = "项目考核记录";
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
	
	
	
	function changeusername(e){
		if(!(nui.get("finUnitId").getValue()==""||nui.get("finUnitId").getValue()==null)){
			nui.get("orgid_op").setValue("in");
			nui.get("orgid_ref").setValue("3");
		}else{
			nui.get("orgid_op").setValue("=");
			nui.get("orgid_ref").setValue("");
		}
	}
	
	
	function onActionRenderer(e) {
        var record = e.record;
    	var processinstid1 = record.processinstid1;
		if(processinstid1==null||processinstid1==""){
			var s = " <a  href='javascript:void(0)' onclick='checkProjectName1();' >方案</a>";
		}else{
			var s = " <a  href='javascript:void(0)' onclick='checkProjectName1();' >方案</a>"+" "+" <a  href='javascript:void(0)' onclick='checkProjectName2();' >分配</a>";
		}
        return s;
    }
</script>
</html>