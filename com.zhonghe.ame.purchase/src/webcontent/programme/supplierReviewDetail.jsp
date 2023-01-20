
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

<head>
	<title>供应商评审 </title>
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
			<fieldset id="field1" style="border: solid 1px #aaa;padding: 3px;width: 99%;">
				<legend>供应商评审信息</legend>
				<form id="form1" method="post">
					<input name="files" id="fileids" class="nui-hidden"/>
					<input name="files1" id="fileids1" class="nui-hidden"/>
					<input class="nui-hidden" name="id"/>
					<div style="padding: 5px;">
						<table style="table-layout: fixed;">
							<tr>
							
							<td class="form_label" align = "right">供应商名称：</td>
								<td>
									<input name="supId" id="supId" onbuttonclick="onButtonEdit" class="nui-buttonedit" style="width: 300px" readOnly="readOnly"/>
								</td>
							<td align="right" style="width:160px">合同名称：</td>
								<td><input name="contractId" id="contractId" onbuttonclick="choseContrat" class="nui-buttonedit" style="width: 300px" readOnly="readOnly"/></td>
							<td align="right" style="width: 120px">合同编号：</td>
								<td ><input
									name="contractNo" id="contractNo"
									class="nui-textbox" readOnly="readOnly"
									style="width: 300px;"  readOnly="readOnly"/></td>
							</tr>
							<tr></tr>
							<tr></tr>
							<tr></tr>
							<tr></tr>
							<tr></tr>
							<tr></tr>
							<tr></tr>
				<tr>
              		<td class="form_label"  align="right" style="width:140px;">履约评价：</td>
                    <td colspan="7">    
                        <input style="width:100%;height: 40px;" name="performance" id="performance" class="nui-textarea"  id="technologyNeed"  readOnly="readOnly"/>
                    </td>
              	</tr>
              				<tr></tr>
							<tr></tr>
							<tr></tr>
							<tr></tr>
							<tr></tr>
							<tr></tr>
							<tr></tr>
              	<tr>
              		<td class="form_label"  align="right" style="width:140px;">技术评价：</td>
                    <td colspan="7">    
                        <input style="width:100%;height: 40px;" name="technology" id="technology" class="nui-textarea"  id="technologyNeed"  readOnly="readOnly"/>
                    </td>
              	</tr>
              	
              				<tr></tr>
							<tr></tr>
							<tr></tr>
							<tr></tr>
							<tr></tr>
							<tr></tr>
							<tr></tr>
              	<tr>
              		<td class="form_label"  align="right" style="width:140px;">商务评价：</td>
                    <td colspan="7">    
                        <input style="width:100%;height: 40px;" name="businessaffairs" id="businessaffairs" class="nui-textarea"  id="technologyNeed" readOnly="readOnly" />
                    </td>
                    
              	</tr>
              	
              				<tr></tr>
							<tr></tr>
							<tr></tr>
							<tr></tr>
							<tr></tr>
							<tr></tr>
							<tr></tr>
              	<tr>
              		<td class="form_label"  align="right" style="width:140px;">资质评价：</td>
                    <td colspan="7">    
                        <input style="width:100%;height: 40px;" name="qualifications" id="qualifications" class="nui-textarea"  id="technologyNeed" readOnly="readOnly" />
                    </td>
              	</tr>
              				<tr></tr>
							<tr></tr>
							<tr></tr>
							<tr></tr>
							<tr></tr>
							<tr></tr>
							<tr></tr>
              	<tr>
              		<td class="form_label"  align="right" style="width:140px;">质保能力：</td>
                    <td colspan="7">    
                        <input style="width:100%;height: 40px;" name="warranty" id="warranty" class="nui-textarea"  id="technologyNeed" readOnly="readOnly" />
                    </td>
              	</tr>
              				<tr></tr>
							<tr></tr>
							<tr></tr>
							<tr></tr>
							<tr></tr>
							<tr></tr>
							<tr></tr>
              
              			
              	<tr>
              		<td class="form_label"  align="right" style="width:140px;">产品和服务质量：</td>
                    <td colspan="7">    
                        <input style="width:100%;height: 40px;" name="projectService" id="projectService" class="nui-textarea"  id="technologyNeed" readOnly="readOnly" />
                    </td>
              	</tr>	
						</table>
					</div>
				</form>
			</fieldset>

		</div>
	</div>
	<div style="text-align: center;padding: 10px;" class="nui-toolbar">
		
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
	    %>
		
		var id = <%=request.getParameter("id")%>;
		init();
        function init(){
        	var json = nui.encode({"id":id});
        	
        	nui.ajax({
		                url: "com.zhonghe.ame.purchase.supplierEvaluate.querySupEvaluate.biz.ext",
		                data: json,
		                type: 'POST',
		                cache: false,
		                contentType: 'text/json',
		                success: function (o){
		                	
		                	var result = o.supEvaluate[0];
		                	console.log(result);
		                	nui.get("supId").setValue(result.supId);
		                	nui.get("supId").setText(result.custname);
		                	nui.get("contractId").setValue(result.contractId);
		                	nui.get("contractId").setText(result.contractName);
		                	nui.get("contractNo").setValue(result.contractNo);
		                	nui.get("performance").setValue(result.performance);
		                	nui.get("technology").setValue(result.technology);
		                	nui.get("businessaffairs").setValue(result.businessaffairs);
		                	nui.get("qualifications").setValue(result.qualifications);
		                	nui.get("warranty").setValue(result.warranty);
		                	nui.get("projectService").setValue(result.projectService);
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
                        
                        }
                    }

                }
            });
        }
		
    	function onOk(){
    	
    	
			//定义变量接受form表单数据
			var form = new nui.Form("#form1");
			var data = form.getData();
			
			
		  	document.getElementById("fileCatalog").value="purReviewReport";
		  	/* document.getElementById("fileCatalog1").value="purFile"; */
			
		  	<!--form4.submit();-->
		  	form2.submit();
	    }
    	function SaveData(){

				var form = new nui.Form("#form1");
    			var data = form.getData();
				
    			var json = nui.encode({'supEvaluate':data});
     			console.log(data);
				if(!confirm("是否提交？")){
        				return;
        			}else{	
		    	nui.ajax({
		                url: "com.zhonghe.ame.purchase.supplierEvaluate.addSupEvaluate.biz.ext",
		                data: json,
		                type: 'POST',
		                cache: false,
		                contentType: 'text/json',
		                success: function (text) {
		                console.log(text.result);
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
    	function SaveData1(){
    	}
    	
    	
    	function choseContrat(e) {
            var btnEdit = this;
            mini.open({
                url: "/default/purchase/programme/quotePayContractList.jsp",
                title: "采购立项列表",
                width: '73%',
                height: '75%',
                ondestroy: function (action) {
                    if (action == "ok") {
                   
                        var iframe = this.getIFrameEl();
                        var data = iframe.contentWindow.GetData();
                        data = mini.clone(data);    //必须
                        if (data) {
                            btnEdit.setValue(data.id);
                            btnEdit.setText(data.proAppCode);
                            console.log(data);
                            nui.get("contractNo").setValue(data.contractNo);
                            nui.get("contractId").setValue(data.id);
                            nui.get("contractId").setText(data.contractName); 
                            btnEdit.doValueChanged();
                            
                        }
                    }

                }
            });

        }
    	
        function onButtonEdit(e) {
            var btnEdit = this;
            mini.open({
                url: "/default/purchase/packagemethod/zhPurSup.jsp",
                title: "采购立项列表",
                width: '73%',
                height: '75%',
                ondestroy: function (action) {
                    if (action == "ok") {
                   
                        var iframe = this.getIFrameEl();
                        var data = iframe.contentWindow.GetData();
                        data = mini.clone(data);    //必须
                        if (data) {
                            btnEdit.setValue(data.id);
                            btnEdit.setText(data.proAppCode);
                            console.log(data);
                            nui.get("supId").setValue(data.custid);
                            nui.get("supId").setText(data.custname);
                           /*  nui.get("planId").setValue(data.planId);
                            nui.get("planId").setText(data.purchaseNumber); */
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
