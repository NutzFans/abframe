
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
	<title>采购方案 </title>
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
				<legend>评审报告信息</legend>
				<form id="form1" method="post">
					<input name="files" id="fileids" class="nui-hidden"/>
					<input name="files1" id="fileids1" class="nui-hidden"/>
					<input class="nui-hidden" name="id"/>
					<div style="padding: 5px;">
						<table style="table-layout: fixed;">
							<tr>
							
							<td class="form_label" align = "right">评审报告编号：</td>
								<td>
									<input name="reportName" id="reportName" class="nui-textbox" style="width: 300px" />
								</td>
							<td align="right" style="width:160px">采购立项编号：</td>
								<td><input name="proappId" id="proappId" onbuttonclick="onButtonEdit" class="nui-buttonedit" style="width: 300px" /></td>
							<td align="right" style="width: 120px">采购计划编号：</td>
								<td ><input
									name="planId" id="planId"
									class="nui-buttonedit" 
									
									style="width: 300px;"  /></td>
<!-- 								<td><input name="implementOrg"  class="nui-textbox" style="width: 300px"/></td> -->
							</tr>
							<tr></tr>
							<tr></tr>
							<tr></tr>
							<tr></tr>
							<tr></tr>
							<tr></tr>
							<tr></tr>
							<tr>
								<td align="right" style="width: 120px">评审报告审核人：</td>
									<td><input name="examineUserId" id="examineUserId"  class="nui-buttonedit" 
									onbuttonclick="selectOmEmployee" style="width: 300px" /></td>
								<td align="right" style="width: 130px">评审报告审批人：</td>
									<td><input name="approvalUserId" id="approvalUserId" class="nui-buttonedit" 
									onbuttonclick="selectOmEmployee1" style="width: 300px"/></td>
							</tr>
							<tr></tr>
							<tr></tr>
							<tr></tr>
							<tr></tr>
							<tr></tr>
							<tr></tr>
							<tr></tr>
              		<td class="form_label"  align="right" style="width:140px;">评审报告说明：</td>
                    <td colspan="7">    
                        <input style="width:100%;height: 40px;" name="remark" id="remark" class="nui-textarea"  id="technologyNeed" dictTypeId="ZH_PURCHASE" />
                    </td>
              	</tr>
						</table>
					</div>
				</form>
			</fieldset>

			<fieldset id="field2" style="border:solid 1px #aaa;padding:3px;">
				<legend>评审报告附件</legend>
				<jsp:include page="/ame_common/detailFile.jsp"/>
			</fieldset>
			<%-- <fieldset id="field3" style="border:solid 1px #aaa;padding:3px;">
				<legend>采购文件附件</legend>
				<jsp:include page="/ame_common/addFiles1.jsp"/>
			</fieldset> --%>
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
	    
	    var processid = <%=request.getParameter("processid")%>;
	   	if(processid==null){
	   		processid = <%=request.getParameter("processInstID")%>;
	   	}
	    
		init();
        function init(){
        	var json = nui.encode({"processid":processid});
		  	nui.ajax({
		                url: "com.zhonghe.ame.purchase.purchaseReviewReport.getReviewReportByProcessId.biz.ext",
		                data: json,
		                type: 'POST',
		                cache: false,
		                contentType: 'text/json',
		                success: function (o) {
		                console.log(o);
						 var result=o.reviewReport;
						 console.log(result);
						 console.log(result.id);
						 nui.get("reportName").setValue(result.reportName);
						 nui.get("proappId").setValue(result.proappId);
						 nui.get("proappId").setText(result.proAppCode);
						 nui.get("planId").setValue(result.planId);
						 nui.get("planId").setText(result.purchaseNumber);

						 nui.get("examineUserId").setValue(result.examineUesrId);
						 nui.get("examineUserId").setText(result.examinename);
						 nui.get("approvalUserId").setValue(result.approvalUserId);
						 nui.get("approvalUserId").setText(result.approvalname);
						 nui.get("remark").setValue(result.remark);
						
						 var grid_0 = nui.get("grid_0");
        				 grid_0.load({"groupid":"purReviewReport","relationid":result.id});
						 grid_0.sortBy("fileTime","desc");
						 
						 
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
				data.files = nui.get("fileids").getValue();
    			var json = nui.encode({'reviewReport':data});
     			console.log(data);
				if(!confirm("是否提交？")){
        				return;
        			}else{	
		    	nui.ajax({
		                url: "com.zhonghe.ame.purchase.purchaseReviewReport.addReviewReport.biz.ext",
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
    	
        function onButtonEdit(e) {
            var btnEdit = this;
            mini.open({
                url: "/default/purchase/project/procurementProAppList.jsp",
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
                            
                            nui.get("planId").setValue(data.planId);
                            nui.get("planId").setText(data.purchaseNumber);
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
