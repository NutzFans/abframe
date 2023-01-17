<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
	<title>开具发票信息 </title>
	<style type="text/css">
	    body{
	        margin: 0;padding: 0;border: 0;width: 100%;height: 100%;overflow: hidden;	
	    } 
    </style>
</head>
<body>
	<div class="nui-fit">
			<fieldset id="field1" style="border: solid 1px #aaa;padding: 1px;width: 97%;">
				<legend>开具发票信息</legend>
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
										<input id="createUsername" name="createUsername" class="nui-textbox" enabled="false" style="width: 300px" required="true"/>
									</td>
								<td align="right" style="width:160px">申请日期：</td>
									<td><input id="createTime" name="createTime"  class="nui-datepicker" style="width: 300px" required="true"/></td>
								<td align="right" style="width: 120px">申请单位：</td>
										<td  style="width: 20%;">
											<input name="implementOrg" id="implementOrg" class="nui-combobox" valueField="orgid" textField="orgname" 
											style="width: 300px" shownullitem="false" allowinput="true" required="true" readonly="readonly"/>
						     				<input name="implementOrgname" id="implementOrgname" class="nui-hidden">
						     	</td>
							</tr>
							<tr>
								<td align="right" style="width: 160px">合同名称：</td>
									<td><input id="contractName" name="contractName"  class="nui-textbox" style="width: 300px" required="true" enabled="false"/></td>
								<td align="right" style="width: 160px">合同编号：</td>
									<td><input id="contractNo" name="contractNo"  class="nui-textbox" style="width: 300px" required="true" enabled="false"/></td>
								<td align="right" style="width: 160px">集团内外：</td>
									<td><input id="headquarterGroup" name="headquarterGroup"  class="nui-dictcombobox" dictTypeId="ZH_GROUP" style="width: 300px" required="true" enabled="false"/></td>
								
							</tr>
							<tr>
								<td align="right" style="width: 160px">工程类别：</td>
									<td><input id="projectType" name="projectType"  class="nui-dictcombobox" dictTypeId="ZH_PROJECT_TYPE" style="width: 300px" required="true" enabled="false"/></td>
								<td align="right" style="width: 100px">专业类别：</td>
									<td><input id="major" name="major"  class="nui-dictcombobox" dictTypeId="ZH_MAJOR_TYPE" style="width: 300px" required="true" enabled="false"/></td>	
								<td align="right" style="width: 160px">增值税发票类型：</td>
									<td><input name="invoiceType" class="nui-dictcombobox" dictTypeId="MIS_MA_INVOICETYPE" style="width: 300px" required="true"/></td>
							</tr>
							<tr>
								<td align="right" style="width: 160px">开票金额（小写）：</td>
									<td><input id="invoiceSum" name="invoiceSum"  class="nui-textbox" style="width: 300px" required="true" onvaluechanged="editContractSum"/></td>
								<td align="right" style="width: 160px">开票金额（大写）：</td>
									<td><input id="invoiceSumCapital" name="invoiceSumCapital"  class="nui-textbox" style="width: 300px" required="true"/></td>
								<td align="right" style="width: 160px">付款单位：</td>
									<td><input name="payerName" id="payerName" class="nui-textbox" style="width: 300px" required="true" enabled="false"/></td>
								
							</tr>
							<tr>
								<td align="right" style="width: 160px">纳税人识别号：</td>
									<td><input name="taxpayerNumber"  class="nui-textbox" style="width: 300px" required="true"/></td>
								<td align="right" style="width: 160px">开户行账号：</td>
									<td><input name="account"  class="nui-textbox" style="width: 300px" required="true"/></td>
								<td align="right" style="width:160px">单位地址：</td>
									<td><input name="unitAddress"  class="nui-textbox" style="width: 300px" required="true"/></td>
							</tr>
							<tr>
								<td align="right" style="width:160px">单位电话：</td>
									<td><input name="unitPhone"  class="nui-textbox" style="width: 300px" required="true"/></td>
								<td align="right" style="width: 160px">开票内容：</td>
									<td><input name="content"  class="nui-dictcombobox" dictTypeId="ZH_INVOICE_CONTENT" style="width: 300px" required="true"/></td>
									<!-- <td><input name="projectType"  class="nui-dictcombobox" dictTypeId="ZH_PROJECT_TYPE" style="width: 300px" required="true"/></td> -->
								<td align="right" style="width:160px">开票内容情况说明：</td>
									<td><input name="contentInfo"  class="nui-textbox" style="width: 300px" required="true"/></td>
								
							</tr>
							<tr>
								<td align="right" style="width:160px">预计到账时间：</td>
									<td><input name="scheduledTime"  class="nui-datepicker" style="width: 300px" /></td>
									<td align="right" style="width: 160px">开票是否邮寄：</td>
									<td><input id="postFlag" name="postFlag"  class="nui-dictcombobox" onvaluechanged="setAttribute" dictTypeId="ZH_POST" style="width: 300px" required="true"/></td>
								<td align="right" style="width: 160px">发票邮寄地址：</td>
									<td><input name="mailingAddress" id="mailingAddress" class="nui-textbox" enabled="true" style="width: 300px" required="false"/></td>
							</tr>
							<tr>
								<td align="right" style="width:160px">发票领取人：</td>
									<td><input name="invoiceUser" id="invoiceUser" class="nui-textbox" style="width: 300px" /></td>
								<td align="right" style="width:160px">发票邮寄日期：</td>
									<td><input id="invoicePostTime" name="invoicePostTime"  class="nui-datepicker" style="width: 300px" /></td>
								<td align="right" style="width: 160px">发票不含税金额：</td>
									<td><input name="invoicePriceExcludingTax"  class="nui-textbox"  style="width: 300px" required="true"/></td>
								
							</tr>
							<tr>
								<td align="right" style="width: 160px">发票税额：</td>
									<td><input name="invoiceTax"  class="nui-textbox" style="width: 300px" required="true"/></td>
									<!-- <td><input id="major" name="major"  class="nui-dictcombobox" dictTypeId="ZH_MAJOR_TYPE" style="width: 300px" required="true"/></td> -->
								<td align="right" style="width: 160px">发票抬头类别：</td>
									<td><input name="invoiceNameType"  class="nui-dictcombobox" dictTypeId="ZH_INVOICE_NAME_TYPE" style="width: 300px" required="true"/></td>
							</tr>
							<tr>
								<td align="right" style="width:160px">备注：</td>
									<td colspan="8"><input name="invoiceRemark"  class="nui-textarea" style="width:100%;height: 50px" required="false"/></td>
							</tr>
						</table>
					</div>
				</form>
				<jsp:include page="/ame_common/inputFile.jsp"/>
			</fieldset>
		</div>
	<div style="text-align: center;padding: 5px;" class="nui-toolbar">
		 <a class="nui-button" onclick="onOk(0)" id="saveFeame" iconCls="icon-save" style="width: 80px;margin-right: 20px;">暂存</a>
		<a class="nui-button" onclick="closeCancel" id="saveReimbProcess" iconCls="icon-close" style="width: 80px;margin-right: 0px;">关闭</a>
	</div>
	<script type="text/javascript">
        nui.parse();
		var form = new nui.Form("form1");
		var type;
        init();
        function init(){
		  	nui.get("createUserid").setValue(userId);
		  	nui.get("createUsername").setValue(userName);
			nui.get("createTime").setValue(new Date());
        }
        
        function setAttribute(){
        	if (nui.get("postFlag").getValue()==1){
        		nui.get("mailingAddress").disable();
        		nui.get("mailingAddress").setRequired(false);
        		nui.get("invoiceUser").enable();
        		nui.get("invoiceUser").setRequired(true);
        		
        		nui.get("invoicePostTime").disable();
        		nui.get("invoicePostTime").setRequired(false);
        		
        	}else{
        		nui.get("mailingAddress").setRequired(true);
        		nui.get("mailingAddress").enable();
        		nui.get("invoiceUser").setRequired(false);
        		nui.get("invoiceUser").disable();
        		nui.get("invoicePostTime").setRequired(true);
        		nui.get("invoicePostTime").enable();
        	}
        }
        
    	function onOk(e){
		    type=e;
		    if(type==1){
		    	form.validate();
				if(form.isValid()==false){
					nui.alert("请检查必填项");
					return;
				}
			}	
		  	var filePaths = document.getElementsByName("uploadfile").length;
		     for(var j=0;j<filePaths;j++){
		      var a=document.getElementsByName("remarkList")[j].value;
			      if(a==null||a==""){
			       showTips("新增附件不可以为空");
			       return;
			      }
		     }
			nui.get("saveFeame").disable();
			nui.get("creatFeame").disable();
			var data = form.getData(); 
		  	document.getElementById("fileCatalog").value="invoiceinfo";
			form2.submit();
	    }
    	function SaveData(){
			var form = new nui.Form("#form1");
			var data = form.getData();
			var info="";
			data.type = type;
			if(type==1){
				info="是否提交？"
			}else{
				info="是否暂时保存？"
			}
			data.implementOrgName = nui.get("implementOrg").getText();
			data.files = nui.get("fileids").getValue();
			var json = nui.encode({'cpData':data});
			if(!confirm(info)){
				nui.get("saveFeame").enable();
       		 	nui.get("creatFeame").enable();
				return;
			}else{	
	    	ajaxCommon({
                url: "com.zhonghe.ame.invoice.invoice.bc_Addinvoice.biz.ext",
                data: json,
                success: function (text) {
               		if(text.result==1){
	               		 if(type==1){
		               		 showTips("开票申请流程提交成功");
		               		 closeOk();
	               		 }else{
	               			 showTips("开票申请流程暂时保存成功");
	               			 closeOk();
	               		 }
               		 }else{
               		 	showTips("提交失败！");
               		 	nui.get("saveFeame").enable();
               		 	nui.get("creatFeame").enable();
               		 }
                }
            }); 
            }
    	}
    	
         function getOrgs(){
			var a2=[];
		  	for(var p in orglist){
		  		a2[p] = orglist[p];
		  	}
		  	nui.get("implementOrg").setData(a2);
        }
    	
		function editContractSum(e){
			var money = e.value;
			nui.get("invoiceSumCapital").setValue(numberParseChina(money));
		}
		
		function setEditData(data){
			form.setData(data);
			if(null != data.signatoryname){
				nui.get("payerName").setValue(data.signatoryname);
			}
			nui.get("implementOrg").setValue(data.implementOrg);
			nui.get("implementOrg").setText(data.implementOrgname);
		}
    </script></body>
</html>
