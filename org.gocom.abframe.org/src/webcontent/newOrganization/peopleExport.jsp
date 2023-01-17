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
<title>人员数据导出</title>
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>

</head>
<body>
<div style="width:100%;height:100%;padding:0px;margin:0px;" >
	<div style="width:100%;">
        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
            <table style="width:100%;">
            	<tr>
                    <td style="width:20%;">
                       	人员数据导出
                    </td>
                </tr>
             </table>           
        </div>
    </div>
    <div id="form1" class="nui-toolbar" style="border-bottom:0;padding:0px;">
    	<input class="nui-hidden" name="ctOrgEmpQry._entity" value="org.gocom.abframe.dataset.organization.EmpExport2"/>
    	<table style="width:100%;">
    		<tr>
			 	<td align="right" nowrap="nowrap">人员姓名：</td>
			 	<td>
			 		<input class="nui-textbox" name="ctOrgEmpQry._expr[0]._value" id = "emp"/>
		 		 	<input class="nui-hidden" name="ctOrgEmpQry._expr[0]._property" value="empname"/>
                    <input class="nui-hidden" name="ctOrgEmpQry._expr[0]._op" value="like"/>
			    </td>
				<td align="right">登录名：</td>
            	<td align="left">
				    <input class="nui-textbox" name="ctOrgEmpQry._expr[1]._value"/>
		 		 	<input class="nui-hidden" name="ctOrgEmpQry._expr[1]._property" value="userid"/>
                    <input class="nui-hidden" name="ctOrgEmpQry._expr[1]._op" value="like"/>
				</td>
				<td align="right">员工工号：</td>
            	<td align="left">
				    <input class="nui-textbox" name="ctOrgEmpQry._expr[2]._value" style="width: 200px"/>
		 		 	<input class="nui-hidden" name="ctOrgEmpQry._expr[2]._property" value="empcode"/>
                    <input class="nui-hidden" name="ctOrgEmpQry._expr[2]._op" value="like"/>
				</td>
    		</tr>
    		<tr>
			 	<td align="right" nowrap="nowrap">人员状态：</td>
			 	<td>
			 		<input class="nui-dictcombobox" name="ctOrgEmpQry._expr[3]._value" shownullItem="true" dictTypeId="ABF_EMPSTATUS"/>
		 		 	<input class="nui-hidden" name="ctOrgEmpQry._expr[3]._property" value="empstatus"/>
                    <input class="nui-hidden" name="ctOrgEmpQry._expr[3]._op" value="="/>
			    </td>
				<td align="right" nowrap="nowrap">员工属性：</td>
			 	<td>
			 		<input class="nui-dictcombobox" name="ctOrgEmpQry._expr[4]._value" shownullItem="true" dictTypeId="EMP_TYPE"/>
		 		 	<input class="nui-hidden" name="ctOrgEmpQry._expr[4]._property" value="emptype"/>
                    <input class="nui-hidden" name="ctOrgEmpQry._expr[4]._op" value="="/>
			    </td>
			    <td align="right">所属机构：</td>
            	<td align="left" colspan="3">
				   <input name="ctOrgEmpQry._expr[5]._value" class="nui-combobox" style="width: 200px" id="orgseq" textField="orgname" valueField="orgseq" dataField = "orgs"  shownullItem="true" onenter="onKeyEnter"
					    allowInput="true" />
					<input class="nui-hidden" name="ctOrgEmpQry._expr[5]._property" value="orgseq"/>
		 		 	<input class="nui-hidden" name="ctOrgEmpQry._expr[5]._op" value="like"/>
                    <input class="nui-hidden" name="ctOrgEmpQry._expr[5]._likeRule" value="end"/>
                    
                    <input class="nui-hidden" name="ctOrgEmpQry._expr[6]._property" value="orgid"/>
			        <input class="nui-hidden" name="ctOrgEmpQry._expr[6]._op" value="in"/>
			        <input class="nui-hidden" name="ctOrgEmpQry._expr[6]._value" id="orgids"/>
				</td>
    		</tr>
    		<tr>
    			<td align="center" colspan="8">
    				<a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查找</a>
                    <a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset()">重置</a>
                    <a class="nui-button" id="export" iconCls="icon-download" onclick="exports()">导出</a>
    			</td>
    		</tr>
    	</table>
    </div>
</div>
<div style="width:100%;">

</div>
<div id="datagrid1"  class="nui-datagrid" style="width:100%;height:372px;"
    dataField="oaOrgEmpQry" multiSelect="true" pageSize="20" sizeList="[10,20,30,50]" allowAlternating="true"
    url='org.gocom.abframe.org.employee.EmpManager.queryOrgEmpByCriteria.biz.ext'>
    <div property="columns">
        <div field="empcode" width="50" headerAlign="center" allowSort="true" align="center">工号</div>
        <div field="userid" width="60" headerAlign="center" align="center" >登录名</div>
    	<div field="empname" width="60" headerAlign="center" align="left" allowSort="true">人员姓名</div> 
    	<div field="oemail" width="120" headerAlign="center" align="center">办公邮件</div> 
    	<div field="emptype" width="60" headerAlign="center" align="center" renderer="emptype">员工属性</div> 
    	<div field="leavel" width="80" headerAlign="center" align="center">人员级别</div>   
        <div field="gender" width="40" headerAlign="center" align="center" renderer="gender">性别</div> 
     	<div field="syqname" width="100" headerAlign="center" allowSort="true" align="center">一级部门</div>
    	<div field="sybname" width="100" headerAlign="center" align="center" allowSort="true">二级部门</div>     
     	<div field="ywdxname" width="100" headerAlign="center" allowSort="true" align="center" >三级部门</div> 
     	<div field="ywdyname" width="100" headerAlign="center" allowSort="true" align="center">四级部门</div>
    	<div field="ywdzname" width="100" headerAlign="center" align="center" allowSort="true">五级部门</div>     
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
	var grid = nui.get('datagrid1');
	var appid = '<%=request.getParameter("appid") %>';
	
	<% 
	    		UserObject user = (UserObject)session.getAttribute("userObject");
	    		String nowuserid = user.getUserId();
	    		String nowusername = user.getUserName();
    		%>
	init();
	function init(){
		//机构权限初始化
		//code:对应功能编码，map：对于机构的查询条件
					
		var json = {"code":"organizationManage","map":{"property":"status","op":"=","value":"running"}};
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
						nui.getbyName("ctOrgEmpQry._expr[6]._op").setValue("=");
        				nui.getbyName("ctOrgEmpQry._expr[6]._value").setValue("");
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
	search();
	//查询功能列表
	function search(){
		var form = new nui.Form("#form1");
        var data = form.getData();
		grid.load(data);
		grid.sortBy("indate","desc");
	}
	
	//重置
	function reset(){
		var form = new nui.Form("#form1");
		form.reset();
       	init();
	}
	//导出
	function exports(){
		var form = new nui.Form("#form1");
        var data = form.getData();
        //console.log(data);
		nui.ajax({
        	url: "org.gocom.abframe.org.employee.EmpExport.empExport.biz.ext",
        	type: 'POST',
        	cache: false,
        	data:data,
        	dataType:"json",
        	success: function (o) {
        		//console.log(text);
        		grid.unmask();
	        	var filePath = o.downloadFile;
	        	var fileName = "EMP";
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
					alert(curDateTime);
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
        	}
        });
	}
	
	//人员状态
	function emptype(e){
		return nui.getDictText('EMP_TYPE',e.value);
	}
	
	//性别
	function gender(e){
		return nui.getDictText('ABF_GENDER',e.value);
	}
	
	
</script>
</html>