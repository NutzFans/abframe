<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
	<title>开票申请 </title>
	<style type="text/css">
	    body{
	        margin: 0;padding: 0;border: 0;width: 100%;height: 100%;overflow: hidden;	
	    } 
    </style>
</head>
<body>
 <%long workitemid = (Long)request.getAttribute("workItemID");%> 
	<div class="nui-fit">
			<fieldset id="field1" style="border: solid 1px #aaa;padding: 3px;width: 97%;">
				<legend>开票申请信息</legend>
				<form id="form1" method="post">
					<div style="padding: 5px;">
						<table style="table-layout: fixed;">
							<tr>
							<td class="form_label" align = "right"> 申请人</td>
								<td>
									<input name="createUserid" id="createUserid" class="nui-hidden" style="width: 100%"/>
									<input id="createUsername" class="nui-textbox" enabled="false" style="width: 100%" />
								</td>
							<td align="right" style="width:160px">申请日期：</td>
								<td><input id="createTime" name="createTime" enabled="false" class="nui-datepicker" style="width: 100%"/></td>
							<td align="right" style="width: 160px">申请单位：</td>
								<td >   <input name="implementOrg" id="implementOrg" class="nui-hidden" style="width: 200px;" />
										<input id="implementOrgname" name="implementOrgname" class="nui-textbox" enabled="false" style="width: 100%" />
								</td>
							</tr>
							<tr>
								<td align="right" style="width: 160px">合同名称：</td>
									<td><input id="contractName" name="contractName" enabled="false" class="nui-textbox" style="width: 100%"/></td>
								<td align="right" style="width: 160px">合同编号：</td>
									<td><input id="contractNo" name="contractNo" enabled="false" class="nui-textbox" style="width: 100%"/></td>
								<td align="right" style="width: 160px">集团内外：</td>
									<td><input name="headquarterGroup"  class="nui-dictcombobox" dictTypeId="ZH_GROUP" style="width: 100%"  enabled="false"/></td>
								
							</tr>
							<tr>
								<td align="right" style="width: 160px">工程类别：</td>
									<td><input id="projectType" name="projectType"  class="nui-dictcombobox" dictTypeId="ZH_PROJECT_TYPE" style="width: 100%"  enabled="false"/></td>
								<td align="right" style="width: 100px">专业类别：</td>
									<td><input id="major" name="major"  class="nui-dictcombobox" dictTypeId="ZH_MAJOR_TYPE" style="width: 100%"  enabled="false"/></td>	
								<td align="right" style="width: 160px">增值税发票类型：</td>
									<td><input name="invoiceType" class="nui-dictcombobox" dictTypeId="MIS_MA_INVOICETYPE" style="width: 100%" enabled="false"/></td>
							</tr>
							<tr>
								<td align="right" style="width: 160px">开票金额（小写）：</td>
									<td><input id="invoiceSum" name="invoiceSum" enabled="false" class="nui-textbox" style="width: 100%"/></td>
								<td align="right" style="width:160px">开票金额（大写）：</td>
									<td><input id="invoiceSumCapital" name="invoiceSumCapital" enabled="false" class="nui-textbox" style="width: 100%"/></td>
								<td align="right" style="width: 160px">付款单位：</td>
									<td><input id="payerName" name="payerName"  class="nui-textbox" enabled="false" style="width: 100%" /></td>
							</tr>
							<tr>
								<td align="right" style="width: 160px">纳税人识别号：</td>
									<td><input id="taxpayerNumber" name="taxpayerNumber"  class="nui-textbox" enabled="false" style="width: 100%" /></td>
								<td align="right" style="width: 160px">开户行账号：</td>
									<td><input id="account" name="account"  class="nui-textbox" enabled="false" style="width: 100%" /></td>
								<td align="right" style="width:160px">单位地址：</td>
									<td><input id="unitAddress" name="unitAddress"  class="nui-textbox" enabled="false" style="width: 100%" /></td>
							</tr>
							<tr>
								<td align="right" style="width:160px">单位电话：</td>
									<td><input id="unitPhone" name="unitPhone"  class="nui-textbox" enabled="false" style="width: 100%" /></td>
								<td align="right" style="width: 160px">开票内容：</td>
									<td><input id="content" name="content" enabled="false" class="nui-dictcombobox" dictTypeId="ZH_INVOICE_CONTENT" style="width: 100%" /></td>
								<td align="right" style="width:160px">开票内容情况说明：</td>
									<td><input id="contentInfo" name="contentInfo" enabled="false" class="nui-textbox" style="width: 100%" /></td>
								
							</tr>
							<tr>
								<td align="right" style="width:160px">预计到账时间：</td>
									<td><input id="scheduledTime" name="scheduledTime" enabled="false" class="nui-datepicker" style="width: 100%" /></td>
								<td align="right" style="width: 160px">开票是否邮寄：</td>
									<td><input id="postFlag" name="postFlag"  class="nui-dictcombobox" enabled="false" dictTypeId="ZH_POST" style="width: 100%" /></td>
								<td align="right" style="width: 160px">发票邮寄地址：</td>
									<td><input id="mailingAddress" name="mailingAddress" enabled="false" class="nui-textbox" style="width: 100%" /></td>
								
							</tr>
							<tr>
								<td align="right" style="width:160px">发票领取人：</td>
									<td><input id="invoiceUser" name="invoiceUser" enabled="false" class="nui-textbox" style="width: 100%" /></td>
								<td align="right" style="width:160px">发票邮寄日期：</td>
									<td><input id="invoicePostTime" name="invoicePostTime" enabled="false" class="nui-datepicker" style="width: 100%" /></td>
								<td align="right" style="width: 160px">发票不含税金额：</td>
									<td><input id="invoicePriceExcludingTax" name="invoicePriceExcludingTax" enabled="false" class="nui-textbox"  style="width: 100%" /></td>
								
							</tr>
							<tr>
								<td align="right" style="width: 160px">发票税额：</td>
									<td><input id="invoiceTax" name="invoiceTax" enabled="false" class="nui-textbox"  style="width: 100%" /></td>
								<td align="right" style="width: 160px">发票抬头类别：</td>
									<td><input id="invoiceNameType" name="invoiceNameType"  class="nui-dictcombobox" enabled="false" dictTypeId="ZH_INVOICE_NAME_TYPE" style="width: 100%" /></td>
							</tr>
							<tr>
								<td align="right" style="width:160px">备注：</td>
									<td colspan="8"><input id="invoiceRemark" name="invoiceRemark"  class="nui-textarea" style="width:100%;height: 50px"  enabled="false"/></td>
							</tr>
						</table>
					</div>
				</form>
			</fieldset>
				<fieldset id="field2" style="border:solid 1px #aaa;padding:3px;">
					<!-- <legend>相关附件</legend> -->
					<jsp:include page="/ame_common/detailFile.jsp"/>
					<!-- <fieldset id="fd_list" style="height:200px; border:solid 1px #aaa;padding:3px;">
						<div class="fieldset-body"  style="width:100%; height:100%; margin: 0px auto">
								<div id="invoicesourcing" class="nui-datagrid" style="width:100%; height:180px" showPager="false" allowCellEdit="false" allowCellSelect="true" 
								url="com.zhonghe.ame.invoice.invoice.queryInvoiceIdByinvoiceItem.biz.ext">
						        <div property="columns">
								    <div type="indexcolumn">序号</div>
						            <div field="arrivalAmount" headerAlign="center" >到账金额（元）
						            	<input property="editor"  class="nui-textbox" />
						            </div>  
						            <div field="receivedDate" headerAlign="center"  >到账日期
						            	<input property="editor" class="nui-textbox" />
						            </div>
					           		 <div field="remark" headerAlign="center" >备注
						            	<input property="editor"  class="nui-textbox" />
						            </div>  
						        </div>
							</div>
						</div>
				</fieldset> -->
				<jsp:include page="/ame_common/misOpinion_Freeflow.jsp"/>
			</fieldset>
		</div>
	<div style="text-align: center;padding: 10px;" class="nui-toolbar">
		<a class="nui-button" onclick="submit()" id="creatReimbProcess" iconCls="icon-ok" style="width: 80px;margin-right: 20px;">提交</a>
		<a class="nui-button" onclick="closeCancel" id="saveReimbProcess" iconCls="icon-close" style="width: 80px;">关闭</a>
	</div>
	<script type="text/javascript">
        nui.parse();
    	var form = new nui.Form("form1");
    	var projectid = <%=request.getParameter("projectid")%>;
    	var workItemID = <%=request.getParameter("workItemID")%>;
    	var opioionform = new nui.Form("#opioionform");
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
			            form.setData(o.data)
				        
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
				        
				       /*  //子表赋值
				         var jsonData = {"invoiceId":o.data.id}
			       		 nui.get("invoicesourcing").load(jsonData);
			       		  */
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
    	 ajaxCommon({
  			url: "com.zhonghe.ame.invoice.invoice.invoiceReview.biz.ext",
			data: json,
			success: function (o){
				if(o.result == "success"){
		        	showTips(titleText + "成功","系统提示")
		        	closeOk();
				}else{
					showTips("提交失败，请联系信息技术部人员！")
				}
			}
  		})  
	}
    	
    </script></body>
</html>
