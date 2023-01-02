
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
	<title></title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin: 0;padding: 0;border: 0;width: 100%;height: 100%;overflow: hidden;	
	    } 
    </style>
</head>
<body>
 <%long workitemid = (Long)request.getAttribute("workItemID");%> 
	<div class="nui-fit">
		<div class="mini-panel" title="框架协议签订申请" style="width: 100%;">
			<fieldset id="field1" style="border: solid 1px #aaa;padding: 3px;width: 97%;">
				<form id="form1" method="post">
 						<input name="files" id="fileids" class="nui-hidden"/>
 						<input class="nui-hidden" id="id" name="id"/> 
 						<input name="processid" id="processid" class="nui-hidden"/>
<!-- 					<input name="expusername" id="expusername" class="nui-hidden"/> -->
<!-- 					<input name="senderusername" id="senderusername" class="nui-hidden"/> -->
<!-- 					<input id="empid" class="nui-hidden" /> -->
					<div style="padding: 5px;">
						<table style="table-layout: fixed;">
							<tr>
							<td class="form_label" align = "right"> 申请人</td>
								<td>
									<input name="createUserid" id="createUserid" class="nui-hidden" style="width: 200px"/>
									<input id="createUsername" class="nui-textbox" enabled="false" style="width: 200px" required="true"/>
								</td>
							<td align="right" style="width: 160px">协议实施部门：</td>
								<td >   <input name="implementOrg" id="implementOrg" class="nui-hidden" style="width: 200px;" />
										<input id="implementOrgname" name="implementOrgname" class="nui-textbox" enabled="false" style="width: 200px" required="true"/>
								</td>
							<td align="right" style="width:160px">申请日期：</td>
								<td><input id="createTime" name="createTime"  class="nui-datepicker" enabled="false" style="width: 200px"/></td>
							
							</tr>
							<tr>
								<td align="right" style="width: 160px">协议名称：</td>
									<td><input id="contractName" name="contractName" enabled="false" class="nui-textbox" style="width: 200px"/></td>
								<td align="right" style="width: 100px">协议金额（元）：</td>
									<td><input id="contractSum" name="contractSum" enabled="false" class="nui-textbox" style="width: 200px" /></td>
								<td align="right" style="width: 160px">签约方：</td>
									<td><input id="signatoryname" name="signatoryname" enabled="false" class="nui-textbox" style="width: 200px"/></td>
									<!-- <td><input id="signatory" name="signatory" enabled="false" class="nui-textbox" style="width: 200px"/></td> -->
								
							</tr>
							<tr>
								<td align="right" style="width: 160px">协议签约主体：</td>
								<td > 
									<input name="contractSubject" id="contractSubject" class="nui-dictcombobox" dictTypeId="ZH_INVOICE_NAME_TYPE" enabled="false" style="width: 200px;" />
								</td>
								<td align="right" style="width: 160px">实施地点：</td>
									<td><input id="projectLocal" name="projectLocal" enabled="false" class="nui-textbox" style="width: 200px"/></td>
								<td align="right" style="width: 160px">标的规模：</td>
									<td><input id="projectSize" name="projectSize" enabled="false" class="nui-textbox" style="width: 200px"/></td>
								
							</tr>
							<tr>
								<td align="right" style="width: 160px">备注：</td>
								<td  colspan="5"><input name="remark"  class="nui-textarea" style="width: 100%" required="false"/></td>
							</tr>
						</table>
					</div>
				</form>
					
				<p style="color:red;">补充合同信息:</p>
			<form id="form3" method="post">
				<div style="padding: 5px;">
						<table style="table-layout: fixed;">
							<tr>
								<td align="right" style="width: 160px">协议编号：</td>
									<td><input id="contractNo" name="contractNo"  class="nui-textbox"  style="width: 200px" required="true"/></td>
								<td align="right" style="width:160px">签订日期：</td>
										<td><input id="signingDate" name="signingDate"  class="nui-datepicker" style="width: 200px" required="true"/></td>
								<td align="right" style="width: 100px">协议期限：</td>
										<td><input id="contractPeriod" name="contractPeriod"  class="nui-textbox" style="width: 200px" required="true"/></td>
							</tr>
							<tr>
								<td align="right" style="width:160px">协议起始日期：</td>
									<td><input name="startTime"  class="nui-datepicker" style="width: 200px" required="true"></td>
								<td align="right" style="width:160px">协议结束日期：</td>
									<td><input name="endTime"  class="nui-datepicker" style="width: 200px" required="true" /></td>
							</tr>
							<tr>
								<td align="right" style="width: 160px">备注：</td>
								<td  colspan="5"><input name="remark1"  class="nui-textarea" style="width: 100%" required="false"/></td>
							</tr>
						</table>
				</div>
			</form>	
				
				<fieldset id="field2" style="border:solid 1px #aaa;padding:3px;">
					<legend>相关附件</legend>
					<jsp:include page="/ame_common/detailFile.jsp"/>
				</fieldset>
				<fieldset id="field3" style="border:solid 1px #aaa;padding:3px;">
					<legend>上传签字盖章版合同</legend>
					<jsp:include page="/ame_common/addFiles.jsp"/>
					<div style="color: red;font-size: 14px;">此项为必填项</div>
				</fieldset>
				<jsp:include page="/ame_common/misOpinion.jsp"/>
			</fieldset>
		</div>
	</div>
	<div style="text-align: center;padding: 10px;" class="nui-toolbar">
		<a class="nui-button" onclick="submit()" id="creatReimbProcess" style="width: 80px;margin-right: 20px;">提交</a>
		<a class="nui-button" onclick="onCancel" id="saveReimbProcess" style="width: 80px;margin-right: 140px;">关闭</a>
	</div>
	
	<script type="text/javascript">
        nui.parse();
    	var form = new nui.Form("form1");
    	var form3 = new nui.Form("form3");
    	var projectid = <%=request.getParameter("projectid")%>;
    	var workItemID = <%=request.getParameter("workItemID")%>;
    	var opioionform = new nui.Form("#opioionform");
    	var payContractId = "";
    	isViewDelete=false;
        init();
        function init(){
        	var data = {workitemid:<%=workitemid%>};
			var json = nui.encode(data);
			nui.ajax({
		        url: "com.zhonghe.ame.contractPact.frameAgreement.queryFrameAgreementInfo.biz.ext",
		        type: "post",
		        data: json ,
		        contentType:'text/json',
		        success: function (o) {
			            form.setData(o.data);
			            form3.setData(o.data);
				        payContractId = o.data.id;
				        
				        nui.ajax({
		       				url: "com.zhonghe.ame.contractPact.frameAgreement.queryframeAgreementById.biz.ext",
					        type: "post",
					        data: nui.encode({'id':o.data.id}) ,
					        contentType:'text/json',
					        success: function (o) {
					        nui.get("createUsername").setValue(o.data.empname);
					        nui.get("implementOrgname").setValue(o.data.orgname);
					        }
				        });
			            nui.get("backTo").setData(o.data.backList);
// 						grid.load({id:o.data.id});
						
			            //流程提示信息
<%-- 			            promptInit({"workItemID": <%=workitemid%>}); --%>
			            //审核意见
			        	//var processinstid = nui.get("processinstid").getValue();
						//查询并加载附件
						var grid_0 = nui.get("grid_0");
        				grid_0.load({"groupid":"ZH_CONTRACTFEAME","relationid":o.data.id});
						grid_0.sortBy("fileTime","desc");
						
			       		 var grid = nui.get("datagrid1");
						 grid.load({processInstID:o.data.processid});
						 grid.sortBy("time", "desc");
						setTimeout(function(){
							//注销掉删除操作
							$(".Delete_Button").hide();
						},300);
						//初始化处理意见
						initMisOpinion({auditstatus:"1"});

			        }
			    });
        }
		function submit(){
		form = new nui.Form("#form1");
			form.validate();
			if(form.isValid()==false){
				nui.alert("请检查必填项");
				return;
			}
			var tb = document.getElementById("filetable0");
    		var rows = tb.rows;
    		if(rows.length<2||rows.length == null){
		 		nui.alert("请至少添加一个附件后再进行提交!");
    			return;
		 	}	
	    	var auditstatus = nui.get("auditstatus").getValue();
	    	console.log(auditstatus);
	    	if(auditstatus == "2"){	//终止流程
	    		titleText = "终止";
	    		submitProcess("终止");
	    	}else if(auditstatus == "0"){	//退回流程
	    		if(!nui.get("backTo").getValue()){
	    			nui.alert("退回环节不能为空！");
	    			return;
	    		}
	    		titleText = "退回";
	    		submitProcess("退回");
	    	}else if(auditstatus == "1"){	//提交流程
	    		document.getElementById("fileCatalog").value="frameAgreementInfo";
		        form2.submit();
	    		titleText = "提交";
	    		submitProcess("提交");
	    	}
    	}
    		 // 提交 
    function submitProcess(title){
    	nui.confirm("确定" + title + "流程吗？", "操作提示",function (action) {            
            if (action == "ok") {
            	//saveRow();
            	var form3 = new nui.Form("form3");
            	var data = form3.getData();
            	data.id=nui.get("id").getValue();
            	data.files = nui.get("fileids").getValue();
				var misOpinion = opioionform.getData().misOpinion;//审核意见
            	nui.get("creatReimbProcess").setEnabled(false);
            	var json = {'cpData':data,misOpinion:misOpinion,workItemID: <%=workitemid %>};
            	saveData(json); 
            }
        });
    }
    	function saveData(json){
			console.log(json);
			  mini.mask({
		            el: document.body,
		            cls: 'mini-mask-loading',
		            html: titleText+'中...'
		        }); 
		    	  nui.ajax({
		  			url: "com.zhonghe.ame.contractPact.frameAgreement.AgreementReview.biz.ext",
					type: "post",
					data: json,
					contentType: "text/json",
					success: function (o){
						nui.unmask(document.body);
						if(o.result == "success"){
				        	nui.alert(titleText + "成功","系统提示",function(){
				        		//nui.get("sureButton").setEnabled(true);
				        		CloseWindow("ok");
				        	});
						}else{
							nui.alert("提交失败，请联系信息技术部人员！","系统提示", function(action){
								//nui.get("sureButton").setEnabled(true);
							    CloseWindow("ok");
								
							});
						}
					},
					error: function(jqXHR, textStatus, errorThrown){
						alert(jqXHR.responseText);
					}
		  		})   
		}
    	
		function saveRow(){
    	var contractNo = nui.get("contractNo").value;
    	var contractPeriod = nui.get("contractPeriod").value;
    	var signingDate = nui.get("signingDate").value;
    	if(contractNo == undefined || contractPeriod == undefined || signingDate == undefined){
    		nui.alert("请填写基本信息");
    		return;
    	}
    	var form1 = new nui.Form("form1");
    	var json = form1.getData();
    	var payMentObject = {'id':payContractId,'contractNo':contractNo,'contractPeriod':contractPeriod,'signingDate':signingDate}
    		nui.ajax({
		  			url: "com.zhonghe.ame.contractPact.frameAgreement.updateFrameAgreementById.biz.ext",
					type: "post",
					data: nui.encode({'data':payMentObject}),
					success: function (o){
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
