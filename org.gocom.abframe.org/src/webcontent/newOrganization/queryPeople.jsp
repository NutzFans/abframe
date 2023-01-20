<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common/common.jsp"%>
<%@ page import="com.eos.data.datacontext.UserObject"%>
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
<div style="width:100%;height:100%;padding:0px;margin:0px;" >
	<div style="width:100%;">
        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
            <table style="width:100%;">
            	<tr>
                    <td style="width:20%;">
                       	人员查询
                    </td>
                </tr>
             </table>           
        </div>
    </div>
    <div id="form1" class="nui-toolbar" style="border-bottom:0;padding:0px;">
    	<input class="nui-hidden" name="ctOrgEmpQry._entity" value="org.gocom.abframe.dataset.organization.OmOrgPosiEmp"/>
    	<table style="width:100%;">
    		<tr>
			 	<td align="right" nowrap="nowrap" style="width: 75px">人员姓名：</td>
			 	<td>
			 		<input class="nui-textbox" name="ctOrgEmpQry._expr[0]._value" style="width: 100px" id = "emp" onenter="onKeyEnter"/>
		 		 	<input class="nui-hidden" name="ctOrgEmpQry._expr[0]._property" value="empname"/>
                    <input class="nui-hidden" name="ctOrgEmpQry._expr[0]._op" value="like"/>
			    </td>
				<td align="right" style="width: 60px">员工工号：</td>
            	<td align="left">
				    <input class="nui-textbox" name="ctOrgEmpQry._expr[1]._value" style="width: 100px" onenter="onKeyEnter"/>
		 		 	<input class="nui-hidden" name="ctOrgEmpQry._expr[1]._property" value="empcode"/>
                    <input class="nui-hidden" name="ctOrgEmpQry._expr[1]._op" value="like"/>
				</td>
				<td align="right" >登录名：</td>
            	<td align="left">
				    <input class="nui-textbox" name="ctOrgEmpQry._expr[2]._value" style="width: 105px" onenter="onKeyEnter"/>
		 		 	<input class="nui-hidden" name="ctOrgEmpQry._expr[2]._property" value="userid"/>
                    <input class="nui-hidden" name="ctOrgEmpQry._expr[2]._op" value="like"/>
				</td>
				<td align="right" >出生日期：</td>
            	<td align="left">
            		<input class="nui-datepicker" id="min1" name="ctOrgEmpQry._expr[3]._min" style="width:95px" onenter="onKeyEnter"/>-<input class="nui-datepicker" name="ctOrgEmpQry._expr[3]._max" style="width:95px" onenter="onKeyEnter"/>
		 		 	<input class="nui-hidden" name="ctOrgEmpQry._expr[3]._property" value="birthdate"/>
                    <input class="nui-hidden" name="ctOrgEmpQry._expr[3]._op" value="between"/> 
				</td>
    		</tr>
    		<tr>
			 	<td align="right" nowrap="nowrap">员工状态：</td>
			 	<td>
			 		<input class="nui-dictcombobox" name="ctOrgEmpQry._expr[4]._value" style="width: 100px" value="on" dictTypeId="ABF_EMPSTATUS" shownullItem="true" onenter="onKeyEnter" multiSelect="true"/>
		 		 	<input class="nui-hidden" name="ctOrgEmpQry._expr[4]._property" value="empstatus"/>
                    <input class="nui-hidden" name="ctOrgEmpQry._expr[4]._op" value="in"/>
			    </td>
				<td align="right">办公邮件：</td>
            	<td align="left" >
				    <input class="nui-textbox" name="ctOrgEmpQry._expr[5]._value" style="width: 100px" onenter="onKeyEnter"/>
		 		 	<input class="nui-hidden" name="ctOrgEmpQry._expr[5]._property" value="oemail"/>
                    <input class="nui-hidden" name="ctOrgEmpQry._expr[5]._op" value="like"/>
				</td>
				<td align="right" style="width: 100px">人员成本属性：</td>
			 	<td>
			 		<input class="nui-dictcombobox"  name="ctOrgEmpQry._expr[8]._value"  style="width: 105px" dictTypeId="AME_EMPTYPE2" onenter="onKeyEnter" multiSelect="true" shownullItem="true"/>
		 		 	<input class="nui-hidden" name="ctOrgEmpQry._expr[8]._property" value="degree"/>
                    <input class="nui-hidden" name="ctOrgEmpQry._expr[8]._op" value="in"/>
			    </td>
				<td align="right">入职日期：</td>
            	<td align="left">
				    <input class="nui-datepicker" id="min1" name="ctOrgEmpQry._expr[7]._min" style="width:95px" onenter="onKeyEnter"/>-<input class="nui-datepicker" id="max1" name="ctOrgEmpQry._expr[7]._max" onenter="onKeyEnter" style="width:95px"/>
		 		 	<input class="nui-hidden" name="ctOrgEmpQry._expr[7]._property" value="indate"/>
                    <input class="nui-hidden" name="ctOrgEmpQry._expr[7]._op" value="between"/>
				</td>
    		</tr>
    		<tr>
			 	<td align="right">所属公司：</td>
            	<td align="left" >
				   	<input class="nui-dictcombobox"  name="ctOrgEmpQry._expr[12]._value"  style="width: 100px" dictTypeId="company" onenter="onKeyEnter"/>
		 		 	<input class="nui-hidden" name="ctOrgEmpQry._expr[12]._property" value="company"/>
                    <input class="nui-hidden" name="ctOrgEmpQry._expr[12]._op" value="="/>
				</td>
            	<td align="right">职位级别：</td>
            	<td align="left" >
                    <input class="nui-dictcombobox"  name="ctOrgEmpQry._expr[13]._value"  style="width: 100px" dictTypeId="AME_TECH" onenter="onKeyEnter" multiSelect="true" shownullItem="true"/>
		 		 	<input class="nui-hidden" name="ctOrgEmpQry._expr[13]._property" value="joblevel"/>
                    <input class="nui-hidden" name="ctOrgEmpQry._expr[13]._op" value="in"/>
				</td>
				<td align="right">人员性质：</td>
            	<td align="left" >
                    <input class="nui-dictcombobox"  name="ctOrgEmpQry._expr[14]._value"  style="width: 105px" dictTypeId="AME_EMPTYPE2" onenter="onKeyEnter" multiSelect="true" shownullItem="true"/>
		 		 	<input class="nui-hidden" name="ctOrgEmpQry._expr[14]._property" value="nature"/>
                    <input class="nui-hidden" name="ctOrgEmpQry._expr[14]._op" value="in"/>
				</td>
				<td align="right">离职日期：</td>
            	<td align="left">
				    <input class="nui-datepicker" id="min1" name="ctOrgEmpQry._expr[9]._min" style="width:95px" onenter="onKeyEnter"/>-<input class="nui-datepicker" id="max1" name="ctOrgEmpQry._expr[9]._max" style="width:95px" onenter="onKeyEnter"/>
		 		 	<input class="nui-hidden" name="ctOrgEmpQry._expr[9]._property" value="outdate"/>
                    <input class="nui-hidden" name="ctOrgEmpQry._expr[9]._op" value="between"/>
				</td>
    		</tr>
    		<tr>
    		    <td align="right" nowrap="nowrap">直属上级：</td>
			 	<td>
                    <input class="nui-hidden" name="ctOrgEmpQry._expr[17]._property" value="empid"/>
			        <input class="nui-hidden" name="ctOrgEmpQry._expr[17]._op" value="in" id="tempcond1"/>
			        <input class="nui-hidden" name="ctOrgEmpQry._expr[17]._ref" value="" id="tempcond2"/>
			        <input class="nui-hidden" name="ctOrgEmpQry._ref[0]._id" value="1"/>					        
			        <input class="nui-hidden" name="ctOrgEmpQry._ref[0]._entity" value="org.gocom.abframe.dataset.organization.Querymanager"/>
			        <input class="nui-hidden" name="ctOrgEmpQry._ref[0]._select._field[0]" value="empid"/>
			        <input class="nui-hidden" name="ctOrgEmpQry._ref[0]._expr[0]._property" value="managerid"/>
			        <input class="nui-hidden" name="ctOrgEmpQry._ref[0]._expr[0]._op" value="="/>
			        <input name="ctOrgEmpQry._ref[0]._expr[0]._value"  style="width:100px;" class="nui-textboxlist" url="com.primeton.eos.ame_budget.budgetOrgManager.queryEmpByName.biz.ext" 
					 searchField="name" textField="EMPNAME" valueField="EMPID"  showNullItem="true" allowInput="true"  onvaluechanged="changeOrg" onenter="onKeyEnter" />
			    </td>
				<td align="right">员工属性：</td>
            	<td align="left" >
                    <input class="nui-dictcombobox"  name="ctOrgEmpQry._expr[15]._value"  style="width: 100px" dictTypeId="EMP_TYPE" onenter="onKeyEnter" multiSelect="true" shownullItem="true"/>
		 		 	<input class="nui-hidden" name="ctOrgEmpQry._expr[15]._property" value="emptype"/>
                    <input class="nui-hidden" name="ctOrgEmpQry._expr[15]._op" value="in"/>
				</td>
            	<td align="right">手机号：</td>
            	<td align="left" >
				    <input class="nui-textbox" name="ctOrgEmpQry._expr[10]._value" style="width: 105px" onenter="onKeyEnter"/>
		 		 	<input class="nui-hidden" name="ctOrgEmpQry._expr[10]._property" value="mobileno"/>
                    <input class="nui-hidden" name="ctOrgEmpQry._expr[10]._op" value="like"/>
				</td>
				<td align="right" >应转正日期：</td>
            	<td align="left" >
				    <input class="nui-datepicker" id="min1" name="ctOrgEmpQry._expr[18]._min" style="width:95px" onenter="onKeyEnter"/>-<input class="nui-datepicker" id="max1" name="ctOrgEmpQry._expr[18]._max" style="width:95px" onenter="onKeyEnter"/>
		 		 	<input class="nui-hidden" name="ctOrgEmpQry._expr[18]._property" value="shoulddate"/>
                    <input class="nui-hidden" name="ctOrgEmpQry._expr[18]._op" value="between"/>
				</td>
    		</tr>
    		<tr>
    		<td align="right">所属机构：</td>
            	<td align="left"  colspan="2">
				   <input name="ctOrgEmpQry._expr[6]._value" class="nui-combobox" style="width: 210px" id="orgseq" textField="orgname" valueField="orgseq" dataField = "orgs"  shownullItem="true" onenter="onKeyEnter"
					    allowInput="true" />
					<input class="nui-hidden" name="ctOrgEmpQry._expr[6]._property" value="orgseq"/>
		 		 	<input class="nui-hidden" name="ctOrgEmpQry._expr[6]._op" value="like"/>
                    <input class="nui-hidden" name="ctOrgEmpQry._expr[6]._likeRule" value="end"/>
                    
                    <input class="nui-hidden" name="ctOrgEmpQry._expr[11]._property" value="inorgid"/>
			        <input class="nui-hidden" name="ctOrgEmpQry._expr[11]._op" value="in"/>
			        <input class="nui-hidden" name="ctOrgEmpQry._expr[11]._value" id="orgids"/>
				</td>
		   <td align="right" style="width:100px;" colspan="2">直属主管：</td>
    		    <td align="left" >
			 		<input class="nui-hidden" name="ctOrgEmpQry._expr[21]._property" value="majorname" />
			        <input class="nui-hidden" name="ctOrgEmpQry._expr[21]._op" value="like"/>
			        <input class="nui-textbox" name="ctOrgEmpQry._expr[21]._value" style="width:105px;" id="major" onenter="onKeyEnter"/>
					<input class="nui-hidden" name="ctOrgEmpQry._expr[21]._likeRule" value="all"/>
			    </td> 
			<td align="right">实际转正日期：</td>
        	<td align="left">
			    <input class="nui-datepicker" id="min1" name="ctOrgEmpQry._expr[19]._min" style="width:95px" onenter="onKeyEnter"/>-<input class="nui-datepicker" id="max1" name="ctOrgEmpQry._expr[19]._max" style="width:95px" onenter="onKeyEnter"/>
	 		 	<input class="nui-hidden" name="ctOrgEmpQry._expr[19]._property" value="realdate"/>
                <input class="nui-hidden" name="ctOrgEmpQry._expr[19]._op" value="between"/>
			</td>	
			</tr>
			<tr>
			    <td align="right">调动日期：</td>
            	<td align="left" colspan="2">
				    <input class="nui-datepicker" id="min1" name="ctOrgEmpQry._expr[16]._min" style="width:105px" onenter="onKeyEnter"/>-<input class="nui-datepicker" id="max1" name="ctOrgEmpQry._expr[16]._max" style="width:100px" onenter="onKeyEnter"/>
		 		 	<input class="nui-hidden" name="ctOrgEmpQry._expr[16]._property" value="movetime"/>
                    <input class="nui-hidden" name="ctOrgEmpQry._expr[16]._op" value="between"/>
				</td>
				<td align="right" colspan="2">工作地：</td>
            	<td align="left" >
                    <input class="nui-dictcombobox"  name="ctOrgEmpQry._expr[20]._value"  style="width: 105px" dictTypeId="AREA4CLRY" onenter="onKeyEnter" multiSelect="true" shownullItem="true"/>
		 		 	<input class="nui-hidden" name="ctOrgEmpQry._expr[20]._property" value="workplace"/>
                    <input class="nui-hidden" name="ctOrgEmpQry._expr[20]._op" value="in"/>
				</td>
				
			</tr>
    		<tr>
    			<td align="center" colspan="8">
    				<a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查找</a>
                    <a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset()">重置</a>
                    <a class="nui-button" id="export" iconCls="icon-download" onclick="exportPeople()">导出员工信息</a>
                    <a class="nui-button" id="queryPeople_remove" iconCls="icon-remove" onclick="remove()">删除</a>
                    <a class="nui-button" id="import" iconCls="icon-upload" onclick="importPeople()">导入员工信息</a>
    			</td>
    		</tr>
    	</table>
    </div>
</div>
<div style="width:100%;">

</div>
<div id="datagrid1"  class="nui-datagrid" style="width:100%;height:372px;" allowResize="true" frozenStartColumn="0" frozenEndColumn="4" 
    dataField="oaOrgEmpQry" multiSelect="false" pageSize="20" sizeList="[10,20,30,50]" allowAlternating="true"
    url='org.gocom.abframe.org.employee.EmpManager.queryOrgEmpByCriteria.biz.ext' onrowclick="jumpA" onrowdblclick="jumpB">
    <div property="columns">
    	<div type="checkcolumn"></div>
    	<div field="empcode" width="60" headerAlign="center" align="left" allowSort="true">员工工号</div>
    	<div field="empname" width="60" headerAlign="center" align="left" allowSort="true">人员姓名</div>
        <div field="emptype" width="60" headerAlign="center" align="center" renderer="emptype" allowSort="true">员工属性</div> 
    	<div field="indate" width="75" headerAlign="center" align="center" allowSort="true">入职日期</div>  
    	<div field="empstatus" width="60" headerAlign="center" align="center" renderer="empstatus" allowSort="true">人员状态</div>   
        <div field="userid" width="60" headerAlign="center" align="center" allowSort="true">用户登录</div>
        <div field="gender" width="40" headerAlign="center" align="center" renderer="gender" allowSort="true">性别</div>
     	<!-- <div field="joblevel" width="60" headerAlign="center" align="center" renderer="joblevel" allowSort="true">职位级别</div> -->
    	<div field="syqname" width="130" headerAlign="center" align="center" allowSort="true">一级部门</div>
    	<div field="sybname" width="130" headerAlign="center" align="center" allowSort="true">二级部门</div>
    	<div field="ywdyname" width="130" headerAlign="center" align="center" allowSort="true">三级部门</div>
    	<div field="ywdzname" width="130" headerAlign="center" align="center" allowSort="true">四级部门</div>
    	<div field="positionname" width="120" headerAlign="center" align="center" allowSort="true" renderer="getPosition">职位分类</div>
    	<div field="positioncall" width="120" headerAlign="center" align="center" allowSort="true" >职位名称</div> 
    	<!-- <div field="managername" width="60" align="center" headerAlign="center" >直属上级</div> -->
    	<div field="majorname" width="60" align="center" headerAlign="center" >直属主管</div>
    	<div field="workplace" width="60" headerAlign="center" align="center" renderer="workplace" allowSort="true">工作地</div>
    	<div field="degree" width="80" headerAlign="center" align="center" renderer="degree" allowSort="true">人员成本属性</div>
    	<div field="nature" width="60" headerAlign="center" align="center" renderer="degree" allowSort="true">人员性质</div>
    	<!-- <div field="inorgname" width="130" headerAlign="center" align="center" allowSort="true">所属机构</div> -->
        <div field="mobileno" width="100" headerAlign="center" align="center" renderer="status" allowSort="true">手机号码</div> 
        <div field="oemail" width="150" headerAlign="center" align="center" renderer="orgtype" allowSort="true">办公邮件</div>
     	<div field="birthdate" width="75" headerAlign="center" align="center" renderer="orgdegree" allowSort="true">出生日期</div> 
     	<div field="shoulddate" width="80" headerAlign="center" align="center" allowSort="true" >应转正日期</div>
     	<div field="realdate" width="80" headerAlign="center" align="center" allowSort="true">实际转正日期</div>
    	<div field="outdate" width="75" headerAlign="center" align="center" allowSort="true">离职日期</div>
    	<div field="movetime" width="75" headerAlign="center" align="center" allowSort="true">调动日期</div>  
    	<div field="mentorname" width="60" align="center" headerAlign="center" >导师</div>  
    	<div field="company" width="100" headerAlign="center" align="center" renderer="company" allowSort="true">所属公司</div>     
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
	var form = new nui.Form("#form1");
	var grid = nui.get('datagrid1');
	var appid = '<%=request.getParameter("appid") %>';
	var isflag = '<%=request.getParameter("isflag") %>';
	<% 
		UserObject user = (UserObject)session.getAttribute("userObject");
		String nowuserid = user.getUserId();
		String nowusername = user.getUserName();
	%>
	if(isflag=='1'){
		document.getElementById("import").style.display='none';
	}
	init();
	function init(){
		//机构权限初始化
		//code:对应功能编码，map：对于机构的查询条件
		getOpeatorButtonAuth("queryPeople_remove");//操作按钮权限初始化 
		var json;
		if(isflag=='1'){
			json = {"code":"queryEmp","map":{"property":"status","op":"=","value":"running"}};
		}else{
			json = {"code":"organizationManage","map":{"property":"status","op":"=","value":"running"}};
		}
		nui.ajax({
			url:"com.primeton.eos.ame_auth.ame_auth.getownorg1.biz.ext",
			data:json,
			type:'POST',
			contentType:'text/json',
			success:function(text){
				if(text.orgs){
					if(text.orgs.length==0){
						// 没有有权的机构时只能查项目负责人为自己的数据
						nui.get("emp").setValue('<%=nowusername %>');
						nui.get("emp").setReadOnly(true);
					}
					var isall;//是否拥有全公司的权限
					for(var i=0;i<text.orgs.length;i++){
						if(text.orgs[i].orgid == "1"){
							isall = "1";
							break;
						}
					}
					//如果拥有全公司的权限就取消部门限制
					if(isall == "1"){
						nui.getbyName("ctOrgEmpQry._expr[11]._op").setValue("=");
        				nui.getbyName("ctOrgEmpQry._expr[11]._value").setValue("");
					}else{
						nui.get("orgids").setValue(text.orgids);
					}
					nui.get("orgseq").setData(text.orgs);
				}else{
					// 没有有权的机构时只能查项目负责人为自己的数据
						nui.get("emp").setValue('<%=nowusername %>');
						nui.get("emp").setReadOnly(true);
				}
				search();
			}
		});
	}
	//查询功能列表
	function search(){
        var data = form.getData();
		grid.load(data);
		grid.sortBy("indate","desc");
	}
	
	function exportPeople(){
		if(!confirm("是否确认根据查询条件导出？")){
			return;
		}
		var data = form.getData();
		var json =  nui.encode(data);
		nui.ajax({
			url: "org.gocom.abframe.org.employee.EmpManager.exportEmpByCriteria.biz.ext",
	        type: "post",
	        data: json,
	        cache: false,
	        contentType: 'text/json',
	        success: function (o) {
	     		nui.unmask();
	     		var filePath = o.downloadFile;
	        	var fileName = "emp";
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
	
	function importPeople(){
		nui.open({
            url: "<%=request.getContextPath() %>/abframe/org/emp/importPerson.jsp",
            title: "批量导入人员信息", 
			width: 700,
            height: 170,
            onload: function () {
            },
            ondestroy: function (action) {
            	if(action == "ok"){
            		search();
            		top["win"].reload();
            	}
            }
        })
	}
	//点击该行，树节点展开
	function jumpA(e){
		if(isflag!='1'){
			if(e.row.empstatus != "leave"){
				top["win"].returnMsg(e);
			}
		}
	}
	//双击改行，展示人员信息
	function jumpB(e){
		if(isflag!='1'){
			if(e.row.empstatus != "leave"){
				top["win"].returnMsgB(e);
			}else{
				nui.alert("该员工已经离职，无法查看该人员信息。");
			}
		}
	}
	
	//人员详情展示
	function getEmpDetail(e){
		return "<a href='javascript:void(0)' onclick='checkDetail();' title='点击查看'>" + e.value + "</a>";
	}
	
    function checkDetail(){
    	var selectRow = grid.getSelected();
		var executeUrl = "<%=request.getContextPath() %>/abframe/org/newOrganization/empDetail.jsp?empid=" + selectRow.empid + "&empname=" + selectRow.empname;
		window.open(executeUrl);
    }
   /*  function FormatDate(e) { 
            var strTime =e.record.shoulddate;
		    var date = new Date(strTime); 
		    var year = date.getFullYear();
		    var month = date.getMonth()+1;
		    var day = date.getDate();
		    if(month<10){
		    	month = "0"+month;
		    }
		    if(day<10){
		    	day = "0"+day;
		    }
		    return year+"/"+month+"/"+day; 
	}  */
	
	//重置
	function reset(){
		var form = new nui.Form("#form1");
		form.reset();
        init();
	}
	
	//回车触发事件
    function onKeyEnter(){
    	search();
    }
	
	//人员状态
	function empstatus(e){
		return nui.getDictText('ABF_EMPSTATUS',e.value);
	}
	
	//类型，人员性质
	function degree(e){
		return nui.getDictText('AME_EMPTYPE2',e.value);
	}
	
	//类型，人员性质
	function emptype(e){
		return nui.getDictText('EMP_TYPE',e.value);
	}
	
	//性别
	function gender(e){
		return nui.getDictText('ABF_GENDER',e.value);
	}
	
	//所属公司
	function company(e){
		return nui.getDictText('company',e.value);
	}
	
	//职位级别
	function joblevel(e){
		return nui.getDictText('AME_TECH',e.value);
	}
	//工作地点
	function workplace(e){
		return nui.getDictText('AREA4CLRY',e.value);
	}
	//职位类型
	function getPosition(e){
		return nui.getDictText('AME_POSITION_MEMO',e.value);
	}
	function changeOrg(e){
		if(e.value==null || e.value==""){
			nui.get("tempcond1").setValue("=");
			nui.get("tempcond2").setValue("");
		}else{
			nui.get("tempcond1").setValue("in");
			nui.get("tempcond2").setValue("1");
		}
	}
	
	
	//删除该人员
    function remove() {
        var rows = grid.getSelecteds();
        var json = {data:rows};
        console.log(json);
        if (rows.length > 0) {
            if (confirm("确定删除选中记录？")) {
                grid.loading("操作中，请稍后......");
                nui.ajax({
                    url: "org.gocom.abframe.org.employee.EmpManager.deleteEmployee.biz.ext",
                    type: "post",
                    data: json, 
                    success: function (text) {
                    	grid.unmask();
                    	if(text.ret == '0'){
                    		nui.alert("删除成功。","提示",function(e){
		            			grid.reload();
		            		})
                    	}
                    	else if(text.ret=='-2'){
		            		nui.alert("此员工存在工时记录不予删除。","提示",function(e){
		            			grid.reload();
		            			})
		            		}
		            	else if(text.ret=='-3'){
		            		nui.alert("此员工为资产负责人不予删除。","提示",function(e){
		            			grid.reload();
		            			})
		            		}
                    	 else{
                    		nui.alert("删除失败，请联系信息技术部。");
                    	}
                        
                    },
                    error: function () {
                    	
                    }
                });
            }
        } else {
        	nui.alert("请选中一条记录。");
        }
    }	
	
</script>
</html>