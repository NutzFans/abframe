
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
					<div style="padding: 5px;">
						<table style="table-layout: fixed;">
							<tr>
							<td class="form_label" align = "right">采购方案名称：</td>
								<td>
									<input name="programmeName"  readOnly="readOnly" id="programmeName" class="nui-textbox" style="width: 200px" />
								</td>
							<td align="right" style="width:160px">采购立项编号：</td>
								<td><input name="proappId" id="proappId"  readOnly="readOnly" onbuttonclick="onButtonEdit" class="nui-buttonedit" style="width: 200px" /></td>
							<td align="right" style="width: 120px">采购方案编号：</td>
								<td><input name="code" id="code"  readOnly="readOnly"  class="nui-textbox" style="width: 200px" /></td>
							</tr>
							<tr>
								<td align="right" style="width: 120px">方案审核人：</td>
									<td><input name="examineUesrId" id="examineUesrId"  class="nui-buttonedit" 
									onbuttonclick="selectOmEmployee" style="width: 200px"  readOnly="readOnly" /></td>
								<td align="right" style="width: 130px">方案审批人：</td>
									<td><input name="approvalUserId" id="approvalUserId" class="nui-buttonedit" 
									onbuttonclick="selectOmEmployee1" style="width: 200px" readOnly="readOnly" /></td>
								
							</tr>
							<tr>
			              		<td class="form_label"  align="right" style="width:140px;">采购方案与文件说明：</td>
			                    <td colspan="7">    
		                       		<input style="width:100%;height: 40px;" name="remark" id="remark" class="nui-textarea"   readOnly="readOnly" id="technologyNeed" dictTypeId="ZH_PURCHASE" />
		                    	</td>
		              		</tr>
						</table>
					</div>
				</form>
			</fieldset>

			<fieldset id="field2" style="border:solid 1px #aaa;padding:3px;">
				<legend>采购方案附件</legend>
				<jsp:include page="/ame_common/detailFile.jsp"/>
			</fieldset>
			<fieldset id="field3" style="border:solid 1px #aaa;padding:3px;">
				<legend>采购文件附件</legend>
				<jsp:include page="/ame_common/detailFile2.jsp"/>
			</fieldset>

		</div>
	</div>
<!--	<div style="text-align: center;padding: 10px;" class="nui-toolbar">
		<!-- <a class="nui-button" onclick="onOk()" id="creatReimbProcess" style="width: 80px;margin-right: 20px;">提交</a>
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
		var form = new nui.Form("form1")
		var processid = <%=request.getParameter("processid")%>;
	   	if(processid==null){
	   		processid = <%=request.getParameter("processInstID")%>;
	   	}
		
		init();
        function init(){
        	var json = nui.encode({"processid":processid});
	   		nui.ajax({	
					url: "com.zhonghe.ame.purchase.purchaseProgramme.queryPurProgrammeByPid.biz.ext",
				    type: 'POST',
			        data: json,
			        success: function (o) {
						 var result=o.purProgramme;
						 form.setData(result)
						 nui.get("programmeName").setValue(result.programmeName);
						 nui.get("proappId").setValue(result.proappId);
						 nui.get("proappId").setText(result.proAppCode);


						 nui.get("examineUesrId").setValue(result.examineUesrId);
						 nui.get("examineUesrId").setText(result.examinename);
						 nui.get("approvalUserId").setValue(result.approvalUserId);
						 nui.get("approvalUserId").setText(result.approvalname);
						 nui.get("remark").setValue(result.remark);
						
						 var grid_0 = nui.get("grid_0");
        				 grid_0.load({"groupid":"purProgramme","relationid":id});
						 grid_0.sortBy("fileTime","desc");
						 var grid_1 = nui.get("grid_1");
        				 grid_1.load({"groupid":"purFile","relationid":id});
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
			var data = form.getData();
			
			
		  	document.getElementById("fileCatalog").value="purProgramme";
		  	document.getElementById("fileCatalog1").value="purFile";
			
		  	form4.submit();
		  	form2.submit();
	    }
    	function SaveData(){
			//debugger;
			    var form4 = new nui.Form("#form4");
			    var form4Data = form4.getData();
			    console.log(form4Data);
				var form = new nui.Form("#form1");
    			var data = form.getData();
				data.files = nui.get("fileids").getValue();
				data.files1=nui.get("fileids1").getValue();
    			var json = nui.encode({'purProgramme':data});
     			//console.log(data);
			if(!confirm("是否提交？")){
        				return;
        			}else{	
		    	nui.ajax({
		                url: "com.zhonghe.ame.purchase.purchaseProgramme.addPurProgramme.biz.ext",
		                data: json,
		                type: 'POST',
		                cache: false,
		                contentType: 'text/json',
		                success: function (text) {
		               
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
