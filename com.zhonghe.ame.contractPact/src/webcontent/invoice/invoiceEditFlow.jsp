
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
	<title>开票申请 </title>
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
				<legend>开票申请信息</legend>
				<form id="form1" method="post">
<!-- 						<input name="files" id="fileids" class="nui-hidden"/> -->
<!-- 						<input class="nui-hidden" name="id"/> -->
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
							<td align="right" style="width:160px">申请日期：</td>
								<td><input id="createTime" name="createTime" enabled="false" class="nui-datepicker" style="width: 200px"/></td>
							<td align="right" style="width: 160px">申请单位：</td>
								<td >   <input name="implementOrg" id="implementOrg" class="nui-hidden" style="width: 200px;" />
										<input id="implementOrgname" name="implementOrgname" class="nui-textbox" enabled="false" style="width: 200px" required="true"/>
								</td>
							</tr>
							<tr>
								<td align="right" style="width: 160px">合同名称：</td>
									<td><input id="contractName" name="contractName" enabled="false" class="nui-textbox" style="width: 200px"/></td>
								<td align="right" style="width: 160px">合同编号：</td>
									<td><input id="contractNo" name="contractNo" enabled="false" class="nui-textbox" style="width: 200px"/></td>
								<td align="right" style="width: 160px">集团内外：</td>
									<td><input id="headquarterGroup" name="headquarterGroup" enabled="false" class="nui-textbox" style="width: 200px"/></td>
								
							</tr>
							<tr>
								<td align="right" style="width: 160px">工程类别：</td>
									<td><input id="projectType" name="projectType" enabled="false" class="nui-textbox" style="width: 200px"/></td>
								<td align="right" style="width: 160px">专业类别：</td>
									<td><input id="major" name="major" enabled="false" class="nui-textbox" style="width: 200px"/></td>
								<td align="right" style="width: 160px">增值税发票类型：</td>
									<td><input id="invoiceType" name="invoiceType" enabled="false" class="nui-dictcombobox" dictTypeId="MIS_MA_INVOICETYPE" style="width: 200px"/></td>
								
							</tr>
							<tr>
								<td align="right" style="width: 160px">开票金额（小写）：</td>
									<td><input id="invoiceSum" name="invoiceSum" enabled="false" class="nui-textbox" style="width: 200px"/></td>
								<td align="right" style="width:160px">开票金额（大写）：</td>
									<td><input id="invoiceSumCapital" name="invoiceSumCapital" enabled="false" class="nui-textbox" style="width: 200px"/></td>
								<td align="right" style="width: 160px">付款单位：</td>
									<td><input id="payerName" name="payerName"  class="nui-textbox" enabled="false" style="width: 200px" required="true"/></td>
								
							</tr>
							<tr>
								<td align="right" style="width: 160px">纳税人识别号：</td>
									<td><input id="taxpayerNumber" name="taxpayerNumber"  class="nui-textbox" enabled="false" style="width: 200px" required="true"/></td>
								<td align="right" style="width: 160px">开户行账号：</td>
									<td><input id="account" name="account"  class="nui-textbox" enabled="false" style="width: 200px" required="true"/></td>
								<td align="right" style="width:160px">单位地址：</td>
									<td><input id="unitAddress" name="unitAddress"  class="nui-textbox" enabled="false" style="width: 200px" required="true"/></td>
								
							</tr>
							<tr>
								<td align="right" style="width:160px">单位电话：</td>
									<td><input id="unitPhone" name="unitPhone"  class="nui-textbox" enabled="false" style="width: 200px" required="true"/></td>
								<td align="right" style="width: 160px">开票内容：</td>
									<td><input id="content" name="content" enabled="false" class="nui-dictcombobox" dictTypeId="ZH_INVOICE_CONTENT" style="width: 200px" required="true"/></td>
								<td align="right" style="width:160px">开票内容情况说明：</td>
									<td><input id="contentInfo" name="contentInfo" enabled="false" class="nui-textbox" style="width: 200px" required="true"/></td>
								
								
								
							</tr>
							<tr>
								<td align="right" style="width:160px">预计到账时间：</td>
									<td><input id="scheduledTime" name="scheduledTime" enabled="false" class="nui-datepicker" style="width: 200px" required="true"/></td>
								<td align="right" style="width: 160px">开票是否邮寄：</td>
									<td><input id="postFlag" name="postFlag"  class="nui-dictcombobox" enabled="false" dictTypeId="ZH_POST" style="width: 200px" required="true"/></td>
								<td align="right" style="width: 160px">发票邮寄地址：</td>
									<td><input id="mailingAddress" name="mailingAddress" enabled="false" class="nui-textbox" style="width: 200px" required="true"/></td>
								
							</tr>
							<tr>
								<td align="right" style="width:160px">发票领取人：</td>
									<td><input id="invoiceUser" name="invoiceUser" enabled="false" class="nui-textbox" style="width: 200px" required="true"/></td>
								<td align="right" style="width:160px">发票邮寄日期：</td>
									<td><input id="invoicePostTime" name="invoicePostTime" enabled="false" class="nui-datepicker" style="width: 200px" required="true"/></td>
								<td align="right" style="width: 160px">发票不含税金额：</td>
									<td><input id="invoicePriceExcludingTax" name="invoicePriceExcludingTax" enabled="false" class="nui-textbox"  style="width: 200px" required="true"/></td>
								
							</tr>
							<tr>
								<td align="right" style="width: 160px">发票税额：</td>
									<td><input id="invoiceTax" name="invoiceTax" enabled="false" class="nui-textbox"  style="width: 200px" required="true"/></td>
								<td align="right" style="width: 160px">发票抬头类别：</td>
									<td><input id="invoiceNameType" name="invoiceNameType"  class="nui-dictcombobox" enabled="false" dictTypeId="ZH_INVOICE_NAME_TYPE" style="width: 200px" required="true"/></td>
							</tr>
							<tr>
								<td align="right" style="width:160px">备注：</td>
									<td colspan="8"><input id="invoiceRemark" name="invoiceRemark"  class="nui-textarea" style="width:100%;height: 50px" required="true" enabled="false"/></td>
							</tr>
						</table>
					</div>
				</form>

			<fieldset id="field2" style="border:solid 1px #aaa;padding:3px;">
				<legend>相关附件</legend>
				<jsp:include page="/ame_common/detailFile.jsp"/>
			</fieldset>
			<jsp:include page="/ame_common/misOpinion.jsp"/>
			<fieldset id="fd_list" style="height:200px; border:solid 1px #aaa;padding:3px;">
					<div class="fieldset-body"  style="width:100%; height:100%; margin: 0px auto">
					<a  class="nui-button" id="invoicesourcing_add" onclick="addRow()" plain="true" style="float: left;" iconCls="icon-add" >新增</a>
 					<a  class="nui-button" id="invoicesourcing_del" onclick="removeTicket()" plain="true" style="float: left;" iconCls="icon-remove" >删除</a>
					<!-- <a  class="nui-button" id="invoicesourcing_save" onclick="saveRow()" plain="true" style="float: left;" iconCls="icon-add" >提交到账信息</a> -->
							<div id="invoicesourcing" class="nui-datagrid" style="width:100%; height:180px" showPager="false" allowCellEdit="true" allowCellSelect="true" 
							url="com.zhonghe.ame.invoice.invoice.queryInvoiceIdByinvoiceItem.biz.ext"
							>
					        <div property="columns">
					        	<div type="checkcolumn" width="10"></div>
							    <div type="indexcolumn" headerAlign="center">序号</div>
					            <div field="arrivalAmount" headerAlign="center" >到账金额（元）
					            	<input property="editor"  class="nui-textbox" />
					            </div>
					            <div field="receivedDate" headerAlign="center"  dateFormat="yyyy-MM-dd " >到账日期
					            	<input property="editor" class="nui-datepicker" showTime="true" showTodayButton="true" showOkButton="true" showClearButton="false"/>
					            </div>
				           		 <div field="remark" headerAlign="center" >备注
					            	<input property="editor"  class="nui-textbox" />
					            </div>  
					        </div>
						</div>
						</div>
			</fieldset>
			<%-- <jsp:include page="/ame_common/misOpinion.jsp"/> --%>
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
    	var invoiceId ="";
    	var grid = nui.get("invoicesourcing");
        init();
        function init(){
        	var data = {workitemid:<%=workitemid%>};
			var json = nui.encode(data);
			nui.ajax({
		        url: "com.zhonghe.ame.invoice.invoice.queryInvoiceInfo.biz.ext",
		        type: "post",
		        data: json ,
		        contentType:'text/json',
		        success: function (o) {
		        
			            form.setData(o);
			            
			            nui.get("createUserid").setValue(o.data.createUserid);
			            nui.get("createTime").setValue(o.data.createTime);
				        nui.get("implementOrg").setValue(o.data.implementOrg);
				        nui.get("contractName").setValue(o.data.contractName);
				        nui.get("contractNo").setValue(o.data.contractNo);
				        nui.get("invoiceSum").setValue(o.data.invoiceSum);
				        nui.get("invoiceType").setValue(o.data.invoiceType);
				        nui.get("headquarterGroup").setValue(o.data.headquarterGroup);
				        nui.get("invoiceSumCapital").setValue(o.data.invoiceSumCapital);
				        nui.get("payerName").setValue(o.data.payerName);
				        nui.get("taxpayerNumber").setValue(o.data.taxpayerNumber);
				        nui.get("account").setValue(o.data.account);
				        nui.get("unitAddress").setValue(o.data.unitAddress);
				        nui.get("unitPhone").setValue(o.data.unitPhone);
				        nui.get("postFlag").setValue(o.data.postFlag);
				        nui.get("content").setValue(o.data.content);
				        nui.get("projectType").setValue(o.data.projectType);
				        nui.get("major").setValue(o.data.major);
				        nui.get("contentInfo").setValue(o.data.contentInfo);
				        nui.get("scheduledTime").setValue(o.data.scheduledTime);
				        nui.get("mailingAddress").setValue(o.data.mailingAddress);
				        nui.get("invoiceUser").setValue(o.data.invoiceUser);
				        nui.get("invoicePostTime").setValue(o.data.invoicePostTime);
				        nui.get("invoicePriceExcludingTax").setValue(o.data.invoicePriceExcludingTax);
				        nui.get("invoiceTax").setValue(o.data.invoiceTax);
				        nui.get("invoiceNameType").setValue(o.data.invoiceNameType);
				        nui.get("invoiceRemark").setValue(o.data.invoiceRemark);
				        invoiceId = o.data.id;
				        nui.ajax({
		       				url: "com.zhonghe.ame.invoice.invoice.queryInvoiceById.biz.ext",
					        type: "post",
					        data: nui.encode({'id':o.data.id}) ,
					        contentType:'text/json',
					        success: function (o) {
					        nui.get("createUsername").setValue(o.data.empname);
					        nui.get("implementOrgname").setValue(o.data.orgname);
					        }
				        });
				        
				        //子表赋值
				         var jsonData = {"invoiceId":o.data.id}
			       		 nui.get("invoicesourcing").load(jsonData);
			            
			            nui.get("backTo").setData(o.data.backList);
						//查询并加载附件
						var grid_0 = nui.get("grid_0");
        				grid_0.load({"groupid":"INVOICE","relationid":o.data.id});
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
	    	var auditstatus = nui.get("auditstatus").getValue();
			var row = grid.getData();
    		if (row.length==0){
				nui.alert("请添加到账信息");
				return;
			}
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
				var misOpinion = opioionform.getData().misOpinion;//审核意见
            	nui.get("creatReimbProcess").setEnabled(false);
            	var json = {misOpinion:misOpinion,workItemID: <%=workitemid %>};
            	saveData(json);
            }
        });
    }
    	function saveData(json){
			//console.log(json);
			 mini.mask({
		            el: document.body,
		            cls: 'mini-mask-loading',
		            html: titleText+'中...'
		        }); 
		        
		        
		        
		        
		        var invoiceObject = nui.get("invoicesourcing").data;
				    	if(invoiceObject){
					    	for(var i=0; i<invoiceObject.length; i++){
					    		nui.get("invoicesourcing").data[i].invoiceId=invoiceId;
					    	}
				    	}
				    		nui.ajax({
						  			url: "com.zhonghe.ame.invoice.invoice.addInvoiceItem.biz.ext",
									type: "post",
									data: nui.encode({'data':invoiceObject}),
									success: function (o){
										if(o.result=="1"){
											//nui.alert("提交成功");
										}else{
											//nui.alert("提交失败");
										}
									}
								});
		        
		        
		        
		        
		    	  nui.ajax({
		  			url: "com.zhonghe.ame.invoice.invoice.invoiceReview.biz.ext",
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
    	
    	
    	
    	
	    	var row = grid.getData();
    		if (row.length==0){
				nui.alert("请添加到账信息");
				return;
			}else{
				var flag = 0;
				for(var i=0;i<row.length;i++){
					if(row[i]._state=="add"&&row[i].arrivalAmount>0){
						flag=1;
					}
				}
				/* if(flag==0){
					nui.alert("请添加到账信息");	
					return;
				} */
			}
			
			
			
    	var invoiceObject = nui.get("invoicesourcing").data;
    	if(invoiceObject){
	    	for(var i=0; i<invoiceObject.length; i++){
	    		nui.get("invoicesourcing").data[i].invoiceId=invoiceId;
	    	}
    	}
    		nui.ajax({
		  			url: "com.zhonghe.ame.invoice.invoice.addInvoiceItem.biz.ext",
					type: "post",
					data: nui.encode({'data':invoiceObject}),
					success: function (o){
						if(o.result=="1"){
							nui.alert("提交成功");
						}else{
							nui.alert("提交失败");
						}
					}
				});
    	}
    	
    	
		function addRow(){
			 //获取表格对象
			 var grid=nui.get("invoicesourcing");
			 var row = {};
		     grid.addRow(row);
		     grid.cancelEdit();
		     grid.beginEditRow(row);
		}
		
	    function removeTicket(){
		    var grid=nui.get("invoicesourcing");
			var rows = grid.getSelecteds();
	        if (rows.length>0) {
	            grid.removeRows(rows, true);
	        }else{
	        	nui.alert("请至少选中一条记录！");
	        }
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
