
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
	<title>收费合同签订申请 </title>
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
		<div class="mini-panel" title="" style="width: 100%;">
			<fieldset id="field1" style="border: solid 1px #aaa;padding: 3px;width: 100%;">
				<legend>付费合同签订信息</legend>
				<form id="form1" method="post">
					<input name="files" id="fileids1" class="nui-hidden"/>
					<input name="id" id="id" class="nui-hidden"/>
					<input name="processid" id="processid" class="nui-hidden"/>
					<div style="padding: 5px;">
						<table style="table-layout: fixed;">
							<tr>
								<td class="form_label" align = "right"> 申请人</td>
									<td>
										<input name="createUserid" id="createUserid" class="nui-hidden" style="width: 200px"/>
										<input id="createUsername" name="empname" class="nui-textbox" enabled="false" style="width: 200px" required="true"/>
									</td>
								<td align="right" style="width: 160px">合同实施部门：</td>
									<td >   <input name="implementOrg" id="implementOrg" class="nui-hidden" style="width: 200px;" />
											<input id="implementOrgname" name="orgname" class="nui-textbox" enabled="false" style="width: 200px" required="true"/>
									</td>
								<td align="right" style="width:160px">申请日期：</td>
									<td><input id="createTime" name="createTime" enabled="false" class="nui-datepicker" style="width: 200px"/></td>
							
							</tr>
							<tr>
								<td align="right" style="width: 160px">合同名称：</td>
									<td><input id="contractName" name="contractName" enabled="false" class="nui-textbox" style="width: 200px"/></td>
								<td align="right" style="width: 160px">合同金额（元）：</td>
									<td><input id="contractSum" name="contractSum" enabled="false" class="nui-textbox" style="width: 200px" required="true"/></td>
								<td align="right" style="width: 160px">签约方：</td>
									<td><input id="signatory" name="signatory" enabled="false" class="nui-textbox" style="width: 200px"/></td>
								
							</tr>
							<tr>
								<td align="right" style="width: 160px">合同类型：</td>
									<td><input id="contractType" name="contractType" enabled="false" class="nui-dictcombobox" dictTypeId="ZH_CONTRACT_TYPE" style="width: 200px" required="true"/></td>
								<td align="right" style="width: 160px">采购立项编号：</td>
									<td><input id="purchasePlan" name="purchasePlan" enabled="false" class="nui-textbox" style="width: 200px" required="true"/></td>
								<td align="right" style="width: 160px">合同签约主体：</td>
									<td><input id="contractSubject" name="contractSubject" enabled="false" class="nui-dictcombobox" dictTypeId="ZH_INVOICE_NAME_TYPE" style="width: 200px"  required="true"/></td>
								
							</tr>
							<tr>
								<td align="right" style="width: 160px">实施地点：</td>
									<td><input id="projectLocal" name="projectLocal" enabled="false" class="nui-textbox" style="width: 200px"/></td>
								<td align="right" style="width: 160px">标的规模：</td>
									<td><input id="projectSize" name="projectSize" enabled="false" class="nui-textbox" style="width: 200px"/></td>
								<td align="right" style="width:160px">合同起始日期：</td>
									<td><input id="startTime" name="startTime"  class="nui-datepicker" style="width: 200px" required="true" enabled="false"/></td>
								
							</tr>
							<tr>
								<td align="right" style="width:160px">合同结束日期：</td>
									<td><input id="endTime" name="endTime"  class="nui-datepicker" style="width: 200px" enabled="false"/></td>
									<td align="right" style="width: 160px">合同编号：</td>
									<td><input id="contractNo" name="contractNo"  class="nui-textbox"  style="width: 200px" required="true" enabled="false"/></td>
							
							</tr>
						</table>
					</div>
				<p style="color:red;">补充合同信息:</p>
				<div style="padding: 5px;">
						<table style="table-layout: fixed;">
							<tr>
								
								<td align="right" style="width: 100px">支付节点：</td>
									<td><input id="payMethod" name="payMethod"  class="nui-textbox" style="width: 200px" required="true"/></td>
								<!-- <td align="right" style="width: 100px">执行状态：</td>
									<td><input id="executeStatus" name="executeStatus"  class="nui-dictcombobox" dictTypeId="ZH_EXECUTESTATUS" style="width: 300px"/></td> -->
								<!-- <td align="right" style="width: 100px">建设单位：</td>
									<td><input id="developmentOrg" name="developmentOrg"  class="nui-textbox" style="width: 200px" required="true"/></td> -->
								<!-- <td align="right" style="width: 100px">承办单位：</td>
									<td><input id="organizer" name="organizer"  class="nui-textbox" style="width: 300px"/></td> -->
								<td align="right" style="width: 100px">付款方：</td>
									<td><input id="payer" name="payer"  class="nui-dictcombobox" dictTypeId="ZH_INVOICE_NAME_TYPE" style="width: 200px" required="true"/></td>
								<td align="right" style="width: 100px">合同专用章：</td>
									<td><input id="cachet" name="cachet" class="nui-dictcombobox" dictTypeId="ZH_INVOICE_NAME_TYPE" style="width: 200px" required="true"/></td>
							</tr>
							<tr>
								
								<td align="right" style="width: 100px">签订日期：</td>
									<td><input id="signingDate" name="signingDate"  class="nui-datepicker" style="width: 200px" required="true"/></td>
								<td align="right" style="width: 100px">合同期限：</td>
									<td><input id="contractPeriod" name="contractPeriod"  class="nui-textbox" style="width: 200px" required="true"/></td>
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
					<jsp:include page="/ame_common/addFiles1.jsp"/>
					<div style="color: red;font-size: 14px;">此项为必填项</div>
				</fieldset>
				<jsp:include page="/ame_common/misOpinion.jsp"/>
				<div style="text-align: center;padding: 10px;" class="nui-toolbar">
					<a class="nui-button" onclick="submit()" id="creatReimbProcess" style="width: 80px;margin-right: 20px;">提交</a>
					<a class="nui-button" onclick="onCancel" id="saveReimbProcess" style="width: 80px;margin-right: 140px;">关闭</a>
				</div>
			</fieldset>
		</div>
	</div>
	
	<script type="text/javascript">
        nui.parse();
    	var form = new nui.Form("form1");
    	var projectid = <%=request.getParameter("projectid")%>;
    	var workItemID = <%=request.getParameter("workItemID")%>;
    	var opioionform = new nui.Form("#opioionform");
    	var payContractId = "";
    	isViewDelete=false;
        init();
        function init(){
        	var data = {workItemID:<%=workitemid%>};
			var json = nui.encode(data);
			nui.ajax({
		        url: "com.zhonghe.ame.payContractAlteration.payContractAlteration.getPayContractAlteration.biz.ext",
		        type: "post",
		        data: json ,
		        contentType:'text/json',
		        success: function (o) {
			            form.setData(o.payContract);
			            nui.get("signingDate").setValue("");//签订日期置空
			            nui.get("backTo").setData(o.payContract.backList);
						//查询并加载附件
						var grid_0 = nui.get("grid_0");
        				grid_0.load({"groupid":"CHARGE_CONTRACT","relationid":o.payContract.id});
						grid_0.sortBy("fileTime","desc");
						
						var grid = nui.get("datagrid1");
						grid.load({processInstID:o.payContract.processid});
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
    		
    		var filePaths = document.getElementsByName("uploadfile1").length;
		     for(var j=0;j<filePaths;j++){
		      var a=document.getElementsByName("remarkList1")[j].value;
		     // alert(a);
		      if(a==null||a==""){
		       alert("新增附件不可以为空");
		       return;
		      }
		     }
    		  		
    		
	    	var auditstatus = nui.get("auditstatus").getValue();
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
	    		titleText = "提交";
	    		submitProcess("提交");
	    	}
    	}
    		 // 提交 
    function submitProcess(title){
    	nui.confirm("确定" + title + "流程吗？", "操作提示",function (action) {            
            if (action == "ok") {
            	nui.get("creatReimbProcess").setEnabled(false);
            	document.getElementById("fileCatalog1").value="payContractInfo";
		        form4.submit();
            	
            }
        });
    }
    	function SaveData1(json){
			var fileids1 =nui.get("fileids1").getValue();
			if(fileids1 == null || fileids1 == "null" || fileids1==""){
				nui.alert("请至少添加一个附件后再进行提交！","系统提示");
				nui.get("creatReimbProcess").setEnabled(true);
				return;
			}
			var data = form.getData();
			var misOpinion = opioionform.getData().misOpinion;//审核意见
			var json = {'cpData':data,misOpinion:misOpinion,workItemID: <%=workitemid %>};
			 mini.mask({
		            el: document.body,
		            cls: 'mini-mask-loading',
		            html: titleText+'中...'
		        }); 
		    	  nui.ajax({
		  			url: "com.zhonghe.ame.payContract.payContract.payContractReview.biz.ext",
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
