
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.List"%>
<%@page import="commonj.sdo.DataObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@ page import="java.util.Map" %>
<%
	String contextPath=request.getContextPath();
 %>
<html>
<!-- 
  - Author(s): wanglinqiong
  - Date: 2016-05-12 16:17:56
  - Description:
-->
<head>
	<title> </title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin: 0;padding: 0;border: 0;width: 100%;height: 100%;overflow: hidden;	
	    } 
    </style>
</head>
<body>
	<div class="nui-fit">
		<div class="mini-panel" title="框架协议签订维护" style="width: 100%;">
			<fieldset id="field1" style="border: solid 1px #aaa;padding: 3px;width: 100%;">
				<form id="form1" method="post">
						<input name="files" id="fileids" class="nui-hidden"/>
						<input class="nui-hidden" name="id"/>
<!-- 					<input name="expusername" id="expusername" class="nui-hidden"/> -->
<!-- 					<input name="senderusername" id="senderusername" class="nui-hidden"/> -->
<!-- 					<input id="empid" class="nui-hidden" /> -->
					<div style="padding: 5px;">
						<table style="table-layout: fixed;">
							<tr>
							<td class="form_label" align = "right"> 申请人</td>
								<td>
									<input name="createUserid" id="createUserid" class="nui-hidden" style="width: 300px"/>
									<input id="createUsername" class="nui-textbox" enabled="false" style="width: 300px" required="true"/>
								</td>
							<td align="right" style="width: 120px">协议实施部门：</td>
<!-- 								<td ><input -->
<!-- 									name="implementOrg" id="implementOrg" -->
<!-- 									class="nui-combobox" required="true" -->
<!-- 									url="com.primeton.rdmgr.labor.labormgr.getAllOrgs.biz.ext" -->
<!-- 									filterType="like" textField="orgname" valueField="orgid" -->
<!-- 									dataField="allorgs" valueFromSelect="true" allowInput="true" -->
<!-- 									style="width: 300px;" required="true"/></td> -->
									<td  style="width: 20%;">
							     	<input name="implementOrg" id="implementOrg" shownullItem=ture class="nui-treeselect" textField="orgname" valueField="orgid" parentField="omOrganization.orgid" dataField="orgs" showTreeIcon="true" valueFromSelect="true" style="width:100%;" 
							     	url="com.zhonghe.ame.imptask.keytask.getAllRunOrgsforzdrw.biz.ext" allowInput="true" required="true"
							     	multiSelect="false" checkRecursive = "false" expandOnLoad="0" showFolderCheckBox="true"/>
							     	</td>
							<td align="right" style="width:160px">申请日期：</td>
								<td><input id="createTime" name="createTime" enabled="false" class="nui-datepicker" style="width: 300px" required="true"/></td>
							
							</tr>
							<tr>
								<td align="right" style="width: 120px">协议名称：</td>
									<td><input id="contractName" name="contractName"  class="nui-textbox" style="width: 300px" required="true"/></td>
								<td align="right" style="width: 100px">协议金额（元）：</td>
									<td><input id="contractSum" name="contractSum"  class="nui-textbox" style="width: 300px" /></td>
								<td align="right" style="width: 130px">签约方：</td>
									<td><input
									name="signatory" id="signatory"
									class="nui-combobox" required="true"
									url="com.zhonghe.ame.chargeContract.chargeContract.queryCusts.biz.ext"
									filterType="like" textField="custname" valueField="custid"
									dataField="custs" valueFromSelect="true" allowInput="true" style="width: 300px;" /></td>
								
							</tr>
							<tr>
								<td align="right" style="width: 100px">协议签约主体：</td>
								<td><input id="contractSubject" name="contractSubject"  class="nui-dictcombobox" dictTypeId="ZH_INVOICE_NAME_TYPE" style="width: 300px"  required="true"/></td>
<!-- 									<td ><input -->
<!-- 									name="contractSubject" id="contractSubject" -->
<!-- 									class="nui-combobox" required="true" -->
<!-- 									url="com.primeton.rdmgr.labor.labormgr.getAllOrgs.biz.ext" -->
<!-- 									filterType="like" textField="orgname" valueField="orgname" -->
<!-- 									dataField="allorgs" valueFromSelect="true" allowInput="true" -->
<!-- 									style="width: 300px;" required="true" /></td> -->
								<td align="right" style="width: 100px">实施地点：</td>
									<td><input id="projectLocal" name="projectLocal"  class="nui-textbox" style="width: 300px" required="true"/></td>
								<td align="right" style="width: 100px">标的规模：</td>
									<td><input id="projectSize" name="projectSize"  class="nui-textbox" style="width: 300px" required="true"/></td>
								
							</tr>
							
							<tr>
								<td align="right" style="width: 160px">备注：</td>
								<td  colspan="5"><input id="remark" name="remark"  class="nui-textarea" style="width: 100%" required="false"/></td>
							</tr>
						</table>
					</div>
				
				
				<p style="color:red;">补充合同信息:</p>
			
					<div style="padding: 5px;">
						<table style="table-layout: fixed;">
							<tr>
								
								<td align="right" style="width: 100px">协议编号：</td>
									<td><input id="contractNo" name="contractNo"  class="nui-textbox" style="width: 300px"/></td>
								<td align="right" style="width:160px">签订日期：</td>
									<td><input id="signingDate" name="signingDate"  class="nui-datepicker" style="width: 300px"/></td>
							<td align="right" style="width: 100px">协议期限：</td>
									<td><input id="contractPeriod" name="contractPeriod"  class="nui-textbox" style="width: 300px"/></td>
							</tr>
							<tr>
								<td align="right" style="width:160px">协议起始日期：</td>
									<td><input id="startTime" name="startTime"  class="nui-datepicker" style="width: 200px" required="true"></td>
								<td align="right" style="width:160px">协议结束日期：</td>
									<td><input id="endTime" name="endTime"  class="nui-datepicker" style="width: 200px" required="true" /></td>
							</tr>
							<tr>
								<td align="right" style="width: 160px">备注：</td>
								<td  colspan="5"><input id="remark1"  name="remark1"  class="nui-textarea" style="width: 100%" required="false"/></td>
							</tr>
						</table>
					</div>
				</form>	
			</fieldset>

			<fieldset id="field2" style="border:solid 1px #aaa;padding:3px;">
				<legend>上传附件</legend>
				<jsp:include page="/ame_common/inputFile.jsp"/>
			</fieldset>
		</div>
	</div>
	<div style="text-align: center;padding: 10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk()" id="creatReimbProcess" style="width: 80px;margin-right: 20px;" iconCls="icon-save" >保存</a>
		<a class="nui-button" onclick="onCancel" id="saveReimbProcess" style="width: 80px;margin-right: 140px;" iconCls="icon-close" >关闭</a>
	</div>
	<script type="text/javascript">
        nui.parse();
        <%
	   		UserObject user = (UserObject) session.getAttribute("userObject");
	   		String username = user.getUserName();
	   		String userno = user.getUserId();
	   		String userOrgName = user.getUserOrgName();
	   		String userOrgId = user.getUserOrgId();
	   		Map<String,Object> a = user.getAttributes();
	   		String empid = (String) a.get("empid");
	   		DataObject[] roles = (DataObject[])a.get("roles");
// 	   		Boolean isAdmin = false;//是否行政
// 			for(int i=0;i < roles.length;i++){
// 				if(roles[i].getString("roleid").equals("admin") || roles[i].getString("roleid").equals("finance")){
// 					isAdmin = true;
// 				}
// 			}
	    %>
<%-- 	    var isAdmin = <%=isAdmin %>; --%>
		var form = new nui.Form("form1");
		var id = "";
        init();
        function init(){
        	
		  	nui.get("createUserid").setValue("<%=userno %>");
		  	nui.get("createUsername").setValue("<%=username %>");
<%-- 		  	nui.get("senderusername").setValue("<%=username %>"); --%>
<%-- 		  	nui.get("expusername").setValue("<%=username %>"); --%>
<%-- 		  	//nui.get("exporgid").setValue("<%=userOrgId %>"); --%>
<%-- 		  	//nui.get("exporgid").setText("<%=userOrgName %>"); --%>
<%-- 		  	nui.get("orgId").setValue("<%=userOrgId %>"); --%>
<%-- 		  	nui.get("orgId").setText("<%=userOrgName %>"); --%>
<%-- 		  	var datas = {value : "<%=userOrgId %>"};    --%>
        }
    	function onOk(){
			//定义变量接受form表单数据
			var form = new nui.Form("#form1");
			form.validate();
    			if(form.isValid()==false){
    				nui.alert("请检查必填项");
    				return;
    			}	
			var data = form.getData(); 
		  	document.getElementById("fileCatalog").value="feameAgreementinfo";
			form2.submit();
	    }
    	function SaveData(){
				var form = new nui.Form("#form1");
    			var data = form.getData();
    			data.id = id;
//     			opinion(data);
				data.files = nui.get("fileids").getValue();
    			var json = nui.encode({'cpData':data});
				if(!confirm("是否保存？")){
        				return;
        			}else{	
		    	nui.ajax({
		                url: "com.zhonghe.ame.contractPact.frameAgreement.updateFrameAgreement.biz.ext",
		                data: json,
		                type: 'POST',
		                cache: false,
		                contentType: 'text/json',
		                success: function (text) {
		                if(text.result==1){
		               		 nui.alert("编辑框架协议信息成功",null,function(){
		               		 window.CloseOwnerWindow("save");
            					
            				});
            			} else{
            				nui.alert("编辑框架协议信息失败")
            			}
		                
		                },
		                error: function (jqXHR, textStatus, errorThrown) {
		                    alert(jqXHR.responseText);
		                }
		            }); 
		            }
    	}
    	
		function opinion(data){
			//合同承办部门
			$('#undertakeOrg').val();
			var undertakeOrg = nui.get("undertakeOrg").value;
			if(undertakeOrg){
				data.undertakeOrg=undertakeOrg;
			}
			//会签部门
			$('#countersignOrg').val();
			var countersignOrg = nui.get("countersignOrg").value;
			if(countersignOrg){
				data.countersignOrg=countersignOrg;
			}
			//经营计划部
			$('#manageOrg').val();
			var manageOrg = nui.get("manageOrg").value;
			if(manageOrg){
				data.manageOrg=manageOrg;
			}
			//审计法务部
			$('#auditOrg').val();
			var auditOrg = nui.get("auditOrg").value;
			if(auditOrg){
				data.auditOrg=auditOrg;
			}
			//总经理
			$('#generalManager').val();
			var generalManager = nui.get("generalManager").value;
			if(generalManager){
				data.generalManager=generalManager;
			}
			//法人
			$('#legalPerson').val();
			var legalPerson = nui.get("legalPerson").value;
			if(legalPerson){
				data.legalPerson=legalPerson;
			}
		}
		
		function setEditData(data){
			console.log("09999",data);
			if(null != data.createUserid){
				nui.get("createUserid").setValue(data.createUserid);
			}
			if(null != data.empname){
				nui.get("createUsername").setValue(data.empname);
			}
			if(null != data.createTime){
				nui.get("createTime").setValue(data.createTime);
			}
			if(null != data.implementOrg){
				nui.get("implementOrg").setValue(data.implementOrg);
				nui.get("implementOrg").setText(data.orgname);
			}
			if(null != data.contractName){
				nui.get("contractName").setValue(data.contractName);
			}
			if(null != data.signatory){
				nui.get("signatory").setValue(data.signatory);
			}
			if(null != data.projectSize){
				nui.get("projectSize").setValue(data.projectSize);
			}
			if(null != data.projectLocal){
				nui.get("projectLocal").setValue(data.projectLocal);
			}
			if(null != data.contractSum){
				nui.get("contractSum").setValue(data.contractSum);
			}
			if(null != data.contractSubject){
				nui.get("contractSubject").setValue(data.contractSubject);
			}
			if(null != data.signingDate){
				nui.get("signingDate").setValue(data.signingDate);
			}
			if(null != data.id){
				id=data.id;
			}
			if(null != data.contractNo){
				nui.get("contractNo").setValue(data.contractNo);
			}
			if(null != data.contractPeriod){
				nui.get("contractPeriod").setValue(data.contractPeriod);
			}
			if(null != data.startTime){
				nui.get("startTime").setValue(data.startTime);
			}
			if(null != data.endTime){
				nui.get("endTime").setValue(data.endTime);
			}
			if(null != data.remark){
				nui.get("remark").setValue(data.remark);
			}
			if(null != data.remark1){
				nui.get("remark1").setValue(data.remark1);
			}
			var form = new nui.Form("#form1");
			var grid_0 = nui.get("grid_0");
        	grid_0.load({"groupid":"ZH_CONTRACTFEAME","relationid":data.id});
			grid_0.sortBy("fileTime","desc");
		}
		
    	 function onCancel(e) {
            CloseWindow("cancel");
        }
        //标准方法接口定义
        function CloseWindow(action) {           
            if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
            else window.close();            
        }
        

    </script></body>
</html>
