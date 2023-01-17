
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
	<title>月度计划填报编辑 </title>
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
		<div class="mini-panel" title="" style="width: 100%;">
			<fieldset id="field1" style="border: solid 1px #aaa;padding: 3px;width: 100%;">
				<legend></legend>
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
							<td align="right" style="width:160px">年份：</td>
								<td><input id="createTime" name="createTime"  class="nui-dictcombobox" dictTypeId="YEAR_TYPE" style="width: 300px" required="true"/></td>
<!-- 							<td align="right" style="width: 120px">合同实施部门：</td> -->
<!-- 								<td ><input -->
<!-- 									name="implementOrg" id="implementOrg" -->
<!-- 									class="nui-combobox" required="true" -->
<!-- 									url="com.primeton.rdmgr.labor.labormgr.getAllOrgs.biz.ext" -->
<!-- 									filterType="like" textField="orgname" valueField="orgid" -->
<!-- 									dataField="allorgs" valueFromSelect="true" allowInput="true" -->
<!-- 									style="width: 300px;" required="true"/></td> -->
								<td align="right" style="width: 120px">填报单位：</td>
									<td><input id="title" name="title" class="nui-dictcombobox" dictTypeId="ZH_INVOICE_NAME_TYPE" style="width: 300px" required="true"/></td>
								<td align="right" style="width: 120px">单位：万元</td>
							</tr>
						</table>
					</div>
				</form>
			</fieldset>

			<fieldset id="fd_list" style=" border:solid 1px #aaa;padding:3px;">
					<div class="fieldset-body"  style="width:100%; height:100%; margin: 0px auto">
<!-- 					<a  class="nui-button" id="monthlyPlan_add" onclick="addRow()" plain="true" style="float: left;" iconCls="icon-add" >新增</a> -->
<!-- 					<a  class="nui-button" id="monthlyPlan_del" onclick="removeTicket()" plain="true" style="float: left;" iconCls="icon-remove" >删除</a> -->
<!-- 					<a  class="nui-button" id="invoicesourcing_save" onclick="saveRow()" plain="true" style="float: left;" iconCls="icon-add" >提交到账信息</a> -->
							<div id="monthlyPlanSourcing" class="nui-datagrid" style="width:100%; height:320px" showPager="false" allowCellEdit="true" allowCellSelect="true" 
							url="com.zhonghe.ame.monthlyPlan.monthlyPlan.queryMonthlyPlanById.biz.ext" oncellendedit="calsum"
							>
					        <div property="columns">
							    <div type="indexcolumn">序号</div>
					            <div field="contractNo" headerAlign="center" >合同编号
					            	<input property="editor"  class="nui-textbox" />
					            </div>
					            <div field="projectName" headerAlign="center" >项监部（内设机构）名称
					            	<input property="editor"  class="nui-textbox" />
					            </div>
					            <div field="customerName" headerAlign="center" >客户名称
					            	<input property="editor"  class="nui-textbox" />
					            </div>
					            <div field="contractName" headerAlign="center" >合同名称
					            	<input property="editor"  class="nui-textbox" />
					            </div>
					            <div field="contractSum" headerAlign="center" >合同金额（含税）
					            	<input property="editor"  class="nui-textbox" />
					            </div>
					            <div field="plannedIncome" headerAlign="center" >计划收入（不含税）</div>
					            <div field="january" headerAlign="center" >1月
					            	<input property="editor"  class="nui-textbox" />
					            </div>
					            <div field="february" headerAlign="center" >2月
					            	<input property="editor"  class="nui-textbox" />
					            </div>
					            <div field="march" headerAlign="center" >3月
					            	<input property="editor"  class="nui-textbox" />
					            </div>
					            <div field="april" headerAlign="center" >4月
					            	<input property="editor"  class="nui-textbox" />
					            </div>
					            <div field="may" headerAlign="center" >5月
					            	<input property="editor"  class="nui-textbox" />
					            </div>
					            <div field="june" headerAlign="center" >6月
					            	<input property="editor"  class="nui-textbox" />
					            </div>
					            <div field="july" headerAlign="center" >7月
					            	<input property="editor"  class="nui-textbox" />
					            </div>
					            <div field="august" headerAlign="center" >8月
					            	<input property="editor"  class="nui-textbox" />
					            </div>
					            <div field="september" headerAlign="center" >9月
					            	<input property="editor"  class="nui-textbox" />
					            </div>
					            <div field="october" headerAlign="center" >10月
					            	<input property="editor"  class="nui-textbox" />
					            </div>
					            <div field="november" headerAlign="center" >11月
					            	<input property="editor"  class="nui-textbox" />
					            </div>
					            <div field="december" headerAlign="center" >12月
					            	<input property="editor"  class="nui-textbox" />
					            </div>
					            <div field="projectType" headerAlign="center" >工程类别
					            	<input property="editor"  class="nui-textbox" />
					            </div>
					            <div field="headquarterGroup" headerAlign="center" >集团内/外
					            	<input property="editor"  class="nui-textbox" />
					            </div>
					            <div field="remark" headerAlign="center" >边界条件及说明
					            	<input property="editor"  class="nui-textbox" />
					            </div>
					        </div>
						</div>
						</div>
			</fieldset>
			
			
		</div>
	</div>
	<div style="text-align: center;padding: 10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onSaveOk()" id="creatReimbProcess" style="width: 80px;margin-right: 20px;">保存</a>
		<a class="nui-button" onclick="onCancel" id="saveReimbProcess" style="width: 80px;margin-right: 140px;">关闭</a>
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
		var monthlyPlanId = "";
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
        
        
        
        function onSaveOk(){
        var form1 = new nui.Form("form1").getData();
        var monthlyPlanObject = nui.get("monthlyPlanSourcing").data;
        if(monthlyPlanObject){
	    	for(var i=0; i<monthlyPlanObject.length; i++){
	    		nui.get("monthlyPlanSourcing").data[i].createUserid=form1.createUserid;
				nui.get("monthlyPlanSourcing").data[i].createTime=form1.createTime;
				nui.get("monthlyPlanSourcing").data[i].title=form1.title;
	    	}
    	}
	        nui.ajax({
			  			url: "com.zhonghe.ame.monthlyPlan.monthlyPlan.addMonthPlan.biz.ext",
						type: "post",
						data: nui.encode({'data':monthlyPlanObject}),
						success: function (o){
							if(o.result=="1"){
								 nui.alert("提交成功",null,function(){
		               		 window.CloseOwnerWindow("save");
		               		 });
							}else{
								 nui.alert("提交失败",null,function(){
		               		 window.CloseOwnerWindow("save");
		               		 });
							}
						}
					});
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
//     			opinion(data);
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
		               		 nui.alert("编辑成功",null,function(){
		               		 window.CloseOwnerWindow("save");
            					
            				});
		                
		                },
		                error: function (jqXHR, textStatus, errorThrown) {
		                    alert(jqXHR.responseText);
		                }
		            }); 
		            }
    	}
    	
		function setEditData(data){
			if(null != data.createUserid){
				nui.get("createUserid").setValue(data.createUserid);
			}
			if(null != data.createTime){
				nui.get("createTime").setValue(data.createTime);
			}
			if(null != data.title){
				nui.get("title").setValue(data.title);
			}
			if(null != data.id){
				monthlyPlanId = data.id;
			}
			var jsonData = {"id":monthlyPlanId}
			nui.get("monthlyPlanSourcing").load(jsonData);
		}
		
    	 function onCancel(e) {
            CloseWindow("cancel");
        }
        //标准方法接口定义
        function CloseWindow(action) {           
            if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
            else window.close();            
        }
        
         function calsum(e){
        	var grid=nui.get("monthlyPlanSourcing");
        	if(e.field=="january"||e.field=="february"||e.field=="march"||e.field=="april"||e.field=="may"||e.field=="june"||e.field=="july"||e.field=="august"||e.field=="september"||e.field=="october"||e.field=="november"||e.field=="december"){
        		var record = e.record;
        		var january=record.january==null?0:record.january;
        		var february=record.february==null?0:record.february;
        		var march=record.march==null?0:record.march;
        		var april=record.april==null?0:record.april;
        		var may=record.may==null?0:record.may;
        		var june=record.june==null?0:record.june;
        		var july=record.july==null?0:record.july;
        		var august=record.august==null?0:record.august;
        		var september=record.september==null?0:record.september;
        		var october=record.october==null?0:record.october;
        		var november=record.november==null?0:record.november;
        		var december=record.december==null?0:record.december;
        		var plannedIncome = parseFloat(january)+parseFloat(february)+parseFloat(march)+parseFloat(april)+parseFloat(may)+parseFloat(june)+parseFloat(july)+parseFloat(august)+parseFloat(september)+parseFloat(october)+parseFloat(november)+parseFloat(december);
        		var row = e.row;
        		var rowData = {"plannedIncome":plannedIncome};
        		grid.updateRow(row,rowData);
        	}
        }
        

    </script></body>
</html>
