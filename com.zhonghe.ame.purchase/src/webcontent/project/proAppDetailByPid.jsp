
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
	<title>采购计划立项申请 </title>
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
				<legend>采购立项</legend>
				<form id="form1" method="post">
					<input name="files" id="fileids" class="nui-hidden"/>
					<input name="files1" id="fileids1" class="nui-hidden"/>
					<input class="nui-hidden" name="id"/>
					<input class="nui-hidden" name="processid"/>
					<div style="padding: 5px;">
						<table style="table-layout: fixed;">
							<tr>
							<td class="form_label" align = "right" >立项名称：</td>
								<td>
									<input name="proAppName" id="proAppName"  class="nui-textbox" style="width: 100%" enabled="false"/>
								</td>
							<td align="right" style="width:100%">立项编号：</td>
								<td><input name="proAppCode"  id="proAppCode" class="nui-textbox" style="width: 100%" enabled="false"/></td>
							<td align="right" style="width: 100%">立项单位：</td>
								<td ><input
									name="proAppOrgId" id="proAppOrgId"
									class="nui-combobox" 
									url="com.primeton.rdmgr.labor.labormgr.getAllOrgs.biz.ext"
									filterType="like" textField="orgname" valueField="orgid"
									dataField="allorgs" valueFromSelect="true" allowInput="true"
									style="width: 300px;" enabled="false" /></td>
<!-- 								<td><input name="implementOrg"  class="nui-textbox" style="width: 300px"/></td> -->
							</tr>
							<tr>
								<td align="right" style="width: 100%">立项单位经办人：</td>
									<td><input name="proAppAgentUserid" id="proAppAgentUserid"  class="nui-buttonedit" 
									onbuttonclick="selectOmEmployee" style="width: 300px" enabled="false" /></td>
								<td align="right" style="width: 130px">立项单位负责人：</td>
									<td><input name="proAppChargeUserid" id="proAppChargeUserid" class="nui-buttonedit" 
									onbuttonclick="selectOmEmployee1" style="width: 300px" enabled="false"/></td>
								<td align="right" style="width: 100px">采购计划编号：</td>
									<td><input name="planId" id="palnId" onbuttonclick="onButtonEdit" class="nui-buttonedit" style="width: 300px" enabled="false"/></td>
							</tr>
							<tr>
								<td align="right" style="width: 120px">采购审核单位：</td>
									<td><input name="approvalOrgId"  id="approvalOrgId" class="nui-combobox" 
									url="com.primeton.rdmgr.labor.labormgr.getAllOrgs.biz.ext"
									filterType="like" textField="orgname" valueField="orgid"
									dataField="allorgs" valueFromSelect="true" allowInput="true"
									style="width: 300px;" enabled="false" /></td>
								<td align="right" style="width: 130px">所属项目名称：</td>
									<td><input name="projectId" id="projectId" class="nui-textbox"  style="width: 300px" enabled="false"/></td>
								<td align="right" style="width: 100px">立项申请金额(万元)：</td>
									<td><input name="proAppApplyPrice" id="proAppApplyPrice"  class="nui-textbox"  style="width: 300px" enabled="false" /></td>
							</tr>
							<tr>
								<td align="right" style="width: 100px">费用来源：</td>
									<td><input name="costFrom" id="costFrom" class="nui-radiobuttonlist"  data="[{id: '1', text: '公司自筹资金'}, {id:'2', text: '中央预算内资金'}]" enabled="false"/></td>
								<td align="right" style="width:160px">立项对象类别：</td>
									<td><input name="proAppObjType" id="proAppObjType" class="nui-radiobuttonlist"  data="[{id: '1', text: '工程'}, {id:'2', text: '物资'}, {id:'3', text: '服务'}]" enabled="false"/></td>
								<td align="right" style="width:160px">项目拟实施日期：</td>
									<td><input name="proAppImplTime" id="proAppImplTime" class="nui-datepicker" style="width: 300px" enabled="false"/></td>
							</tr>
							<tr id="one111">
              		<td class="form_label"  align="right" style="width:120px;">立项范围说明：</td>
                    <td colspan="7">    
                        <input enabled="false" style="width:100%;height: 40px;" id="proAppRange" name="proAppRange" class="nui-textarea"  id="technologyNeed" dictTypeId="ZH_PURCHASE" />
                    </td>
              	</tr>
						</table>
					</div>
				</form>
			</fieldset>

			<fieldset id="field2" style="border:solid 1px #aaa;padding:3px;">
				<legend>费用估算证明附件</legend>
				<jsp:include page="/ame_common/detailFile.jsp"/>
			</fieldset>
			<fieldset id="field3" style="border:solid 1px #aaa;padding:3px;">
				<legend>立项支持材料附件</legend>
				<jsp:include page="/ame_common/detailFile2.jsp"/>
			</fieldset>



		</div>
	</div>
<!--	<div style="text-align: center;padding: 10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onCancel" id="saveReimbProcess" style="width: 80px;margin-right: 140px;">关闭</a>
	</div>-->
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

	    %>
	    var id = <%=request.getParameter("id")%>;
		isViewDelete=false;
		
		var processid = <%=request.getParameter("processid")%>;
	   	if(processid==null){
	   		processid = <%=request.getParameter("processInstID")%>;
	   	}
		
		init();
        function init(){
        	var json = nui.encode({"processid":processid});
        	console.log(json);
	   		nui.ajax({	
					url: "com.zhonghe.ame.purchase.purchaseItems.queryProAppByPid.biz.ext",
				    type: 'POST',
			        data: json,
			        success: function (o) {
						 //var result=o.proApp[0];
						 var result=o.proApp;
						 //alert(nui.encode({"result":result}));
						 //alert(nui.encode({"o":o}));
						 nui.get("proAppName").setValue(result.proAppName);
						 nui.get("proAppCode").setValue(result.proAppCode);
						 nui.get("proAppOrgId").setValue(result.proAppOrgId);
						 nui.get("proAppAgentUserid").setText(result.agentempname);
						 nui.get("proAppChargeUserid").setText(result.chargeempname);
						 nui.get("palnId").setText(result.purchaseNumber);
						 nui.get("approvalOrgId").setValue(result.approvalOrgId);
						 nui.get("proAppApplyPrice").setValue(result.proAppApplyPrice);
						 nui.get("costFrom").setValue(result.costFrom);
						 nui.get("proAppObjType").setValue(result.proAppObjType);
						 nui.get("proAppImplTime").setValue(result.proAppImplTime);
						 nui.get("proAppRange").setValue(result.proAppRange);
						 var grid_0 = nui.get("grid_0");
        				 grid_0.load({"groupid":"proAppCost","relationid":result.id});
						 grid_0.sortBy("fileTime","desc");
						 var grid_1 = nui.get("grid_1");
        				 grid_1.load({"groupid":"proAppSup","relationid":result.id});
						 grid_1.sortBy("fileTime","desc");
			        },
				    error: function (jqXHR, textStatus, errorThrown) {
				        alert(jqXHR.responseText);
				    }
			    }); 
		}
		
	    function selectProjectList(){
        	//var allpurProj = purProjOutper_grid.getData();
        	var btnEdit = this;
        	nui.open({
                url:"<%=request.getContextPath() %>/ame_common/SelectProject.jsp",
                title: "选择项目",
                width: 850,
                height: 420,
                allowResize: false,
                ondestroy: function (action) {
                    if (action == "ok") {
                        var iframe = this.getIFrameEl();
                        var data = iframe.contentWindow.GetData();
                        data = nui.clone(data);    //必须
                        if (data) {
                            btnEdit.setValue(data.projectId);
                            btnEdit.setText(data.projectName);
                            //连带出项目服务客户
                           /*  var row = purProjOutper_grid.getSelected();
                            var rowData = {custid: data.custid,custname: data.custname,manager: data.userid,managername: data.manager};
                            purProjOutper_grid.updateRow(row,rowData);  */
                        }
                    }
                }
            });
        }
		
		
		 function selectOmEmployee(){
    	var btnEdit = this;
        nui.open({
            url: "<%=request.getContextPath() %>/machine/SelectEmployee.jsp",
            title: "选择报销人",
            width: 430,
            height: 400,
            ondestroy: function (action) {
                if (action == "ok") {
                    var iframe = this.getIFrameEl();
                    var data = iframe.contentWindow.GetData();
                    data = nui.clone(data);    //必须
                    if (data) {
                        btnEdit.setValue(data.userid);
                        btnEdit.setText(data.empname);
                        console.log(data);
                        nui.get("proAppAgentUserid").setValue(data.userid);
                        nui.get("proAppAgentUserid").setText(data.empname);
                       
                        }
                    }

                }
            });
        }
        
        
        function selectOmEmployee1(){
    	var btnEdit = this;
        nui.open({
            url: "<%=request.getContextPath() %>/machine/SelectEmployee.jsp",
            title: "选择报销人",
            width: 430,
            height: 400,
            ondestroy: function (action) {
                if (action == "ok") {
                    var iframe = this.getIFrameEl();
                    var data = iframe.contentWindow.GetData();
                    data = nui.clone(data);    //必须
                    if (data) {
                        btnEdit.setValue(data.userid);
                        btnEdit.setText(data.empname);
                        console.log(data);
                        /* nui.get("proAppChargeUserid").setValue(data.userid);
                        nui.get("proAppChargeUserid").setText(data.empname); */
                       
                        }
                    }

                }
            });
        }
		
    	function onOk(){
    	
    	
			//定义变量接受form表单数据
			var form = new nui.Form("#form1");
			/* form.validate();
    			if(form.isValid()==false){
    				nui.alert("请检查必填项");
    				return;
    			}	 */
			var data = form.getData(); 
		  	document.getElementById("fileCatalog").value="proAppCost";
		  	document.getElementById("fileCatalog1").value="proAppSup";
			form2.submit();
		  	form4.submit();
	    }
    	function SaveData(){
			//debugger;
				var form = new nui.Form("#form1");
    			var data = form.getData();
				data.files = nui.get("fileids").getValue();
				data.files1=nui.get("fileids1").getValue();
    			var json = nui.encode({'proApp':data});
    			console.log(data);
				if(!confirm("是否提交？")){
        				return;
        			}else{	
		    	nui.ajax({
		                url: "com.zhonghe.ame.purchase.purchaseProApp.addProApp.biz.ext",
		                data: json,
		                type: 'POST',
		                cache: false,
		                contentType: 'text/json',
		                success: function (text) {
		                debugger;
		                if(text.result == "1"){
		               		 nui.alert("提交成功",null,function(){

		               		 window.CloseOwnerWindow("save");
		               		 });
		                }else{
		                	nui.alert("提交失败",null,function(){
		               		 window.CloseOwnerWindow("save");
		               		 });
		                }
		                },
		                error: function (jqXHR, textStatus, errorThrown) {
		                    alert(jqXHR.responseText);
		                }
		            }); 
		            }
    	}

    	
        function onButtonEdit(e) {
            var btnEdit = this;
            mini.open({
                url: "/default/contractPact/payContract/procurementPlanList.jsp",
                title: "采购计划列表",
                width: '90%',
                height: '90%',
                ondestroy: function (action) {
                    if (action == "ok") {
                    debugger;
                        var iframe = this.getIFrameEl();
                        var data = iframe.contentWindow.GetData();
                        data = mini.clone(data);    //必须
                        if (data) {
                            btnEdit.setValue(data.id);
                            btnEdit.setText(data.purchaseNumber);
                            btnEdit.doValueChanged();
                            
                        }
                    }

                }
            });

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
