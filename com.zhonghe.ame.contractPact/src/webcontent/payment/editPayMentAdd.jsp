<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
	<title>发起付款流程 </title>
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
				<legend>发起付款流程信息</legend>
				<form id="form1" method="post">
					<input name="files" id="fileids" class="nui-hidden"/>
					<input name="implementOrg" id="implementOrg" class="nui-hidden"/>
					<input class="nui-hidden" name="id"/>

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
							<td align="right" style="width: 160px">签约方：</td>
								<td><input id="signatoryname" name="signatoryname"  class="nui-textbox" style="width: 300px" required="true" enabled="false"/>
								<input id="signatory" name="signatory"  class="nui-hidden"/>
								</td>
							</tr>
							<tr>
								<td align="right" style="width: 160px">付款方：</td>
									<td><input id="payer" name="payer"  class="nui-dictcombobox" dictTypeId="ZH_INVOICE_NAME_TYPE" style="width: 300px" required="true" enabled="false"/></td>
								    <!-- <td><input id="payer" name="payer"  class="nui-dictcombobox" dictTypeId="ZH_INVOICE_NAME_TYPE" style="width: 300px"  required="true"/></td> -->
								<td align="right" style="width: 160px">合同名称：</td>
									<td><input id="contractName" name="contractName"  class="nui-textbox" style="width: 300px" required="true" enabled="false"/></td>
								<td align="right" style="width: 160px">合同编号：</td>
									<td><input id="contractId" name="contractId"  class="nui-textbox" style="width: 300px" required="true" enabled="false"/></td>
							</tr>
							<tr>
								<td align="right" style="width: 160px">合同最终金额（元）：</td>
									<td><input id="actContractSum" name="actContractSum"  class="nui-textbox" style="width: 300px" required="true" enabled="false"/></td>
								<td align="right" style="width: 160px">合同最终金额大写：</td>
									<td><input id="actContractSumCapital" name="actContractSumCapital"  class="nui-textbox" style="width: 300px" required="true" enabled="false"/></td>
								<td align="right" style="width: 160px">累计已付金额（元）：</td>
									<td><input id="paidContractSum" name="paidContractSum"  class="nui-textbox" onvaluechanged="editPaidContractSum" style="width: 300px" required="true" enabled="false"/></td>
							</tr>
							<tr>
								<td align="right" style="width: 160px">累计已付金额大写：</td>
									<td><input id="paidContractSumCapital" name="paidContractSumCapital"  class="nui-textbox" style="width: 300px" required="true" enabled="false"/></td>
								<td align="right" style="width: 160px">本次申请支付金额（元）：</td>
									<td><input id="applyPayContractSum" name="applyPayContractSum" onvaluechanged="editApplyPayContractSum" class="nui-textbox" style="width: 300px" required="true"/></td>
								<td align="right" style="width: 160px">本次申请支付金额大写：</td>
									<td><input id="applyPayContractSumCapital" name="applyPayContractSumCapital"  class="nui-textbox" style="width: 300px" required="true"/></td>
							</tr>
							<tr>
								<td align="right" style="width:160px">最晚付款日期：</td>
									<td><input id="endTime" name="endTime"  class="nui-datepicker" style="width: 300px" required="true"/></td>
								<td align="right" style="width: 160px">收款单位开户行名称：</td>
									<td><input id="accountName" name="accountName"  class="nui-textbox" style="width: 300px" required="true"/></td>
								<td align="right" style="width: 160px">开户行账号：</td>
									<td><input id="account" name="account"  class="nui-textbox" style="width: 300px" required="true"/></td>
							</tr>
							<tr>
								<td align="right" style="width: 100px">分公司归口部门经办人：</td>
								<td  style="width: 20%;">
										<input id="countersign0" name="countersign0"  class="nui-buttonedit" 
									onbuttonclick="selectOmEmployee" style="width: 300px" allowInput="false"/>
									</td>
								<td align="right" style="width: 100px">本部归口部门经办人：</td>
								<td  style="width: 20%;">
										<input id="countersign1" name="countersign1"   class="nui-buttonedit" 
									onbuttonclick="selectOmEmployee" style="width: 300px" allowInput="false"/>
								</td>
							</tr>
							<tr>
								<td align="right" >说明：</td>
									<td colspan="8">
										<input id="remark" name="remark"  class="nui-textarea" style="width:100%;height: 50px" required="true"/>
									</td>
							</tr>
						</table>
					</div>
				</form>
			</fieldset>

			<fieldset id="field2" style="border:solid 1px #aaa;padding:3px;">
				<legend>上传附件</legend>
				<jsp:include page="/ame_common/inputFile.jsp"/>
			</fieldset>

		</div>
	</div>
	<div style="text-align: center;padding: 10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk(0)" id="saveFeame" iconCls="icon-save" style="width: 80px;margin-right: 20px;">保存</a>
		<a class="nui-button" onclick="closeCancel" iconCls="icon-close" style="width: 80px;margin-right: 140px;">关闭</a>
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
    	function onOk(e){
			//定义变量接受form表单数据
			var form = new nui.Form("#form1");
		    if(nui.get("actContractSum").getValue()-nui.get("paidContractSum").getValue()<nui.get("applyPayContractSum").getValue()){
		     	showTips("本次申请支付金额不能大于剩余金额");
		     	return;
		    }
		    type=e;
		    if(type==1){form.validate();
				if(form.isValid()==false){
					showTips("请检查必填项");
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
			var data = form.getData(); 
		  	document.getElementById("fileCatalog").value="payMentinfo";
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
			data.files = nui.get("fileids").getValue();
			data.countersign0name = nui.get("countersign0").getText();
			data.countersign1name = nui.get("countersign1").getText();
			var json = nui.encode({'cpData':data});
			if(!confirm(info)){
    				nui.get("saveFeame").enable();
           		 	nui.get("creatFeame").enable();
    				return;
			}else{	
	    		ajaxCommon({
	                url: "com.zhonghe.ame.payment.payMent.addPayMent_history.biz.ext",
	                data: json,
	                success: function (text) {
	               		 if(text.result==1){
		               		 if(type==1){
			               		 showTips("付款流程提交成功")
			               		 closeOk();
		               		 }else{
		               			 showTips("付款流程暂时保存成功")
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
    	
		function setViewData(data){
			var form = new nui.Form("#form1");
		    
			if(null != data.signatoryname){
				nui.get("signatoryname").setValue(data.signatoryname);
				nui.get("signatory").setValue(data.signatory);
			}
			if(null != data.contractName){
				nui.get("contractName").setValue(data.contractName);
			}
			if(null != data.contractNo){
				nui.get("contractId").setValue(data.contractNo);
			}
 			if(null != data.contractSum){
 				//nui.get("actContractSum").setValue(data.actContractSum);
 				//alert(data.actContractSum);
 				nui.get("actContractSum").setValue(data.contractSum);
 				nui.get("actContractSumCapital").setValue(numberParseChina(data.contractSum));
 			}
			if(null != data.id){
				
				var json = nui.encode({'contractId':data.contractNo});
				var payAll = 0.00;
				nui.ajax({
		                url: "com.zhonghe.ame.payment.payMent.queryPaymentByContractId.biz.ext",
		                data: json,
		                type: 'POST',
		                cache: false,
		                contentType: 'text/json',
		                success: function (text) {
		               		 for(var i=0;i<text.data.length;i++){
		               		 	payAll=payAll+parseFloat(text.data[i].applyPayContractSum);
		               		 }
							//alert(payAll.toFixed(2));
							nui.get("paidContractSum").setValue(payAll.toFixed(2));
							nui.get("paidContractSumCapital").setValue(numberParseChina(payAll.toFixed(2)));
							
							//alert(isNaN(payAll.toFixed(2)));
							
							if(isNaN(payAll.toFixed(2))||payAll.toFixed(2)==0.00){
								nui.get("paidContractSum").setValue(0.00);
								nui.get("paidContractSumCapital").setValue("零元整");
							}
							
		                },
		                error: function (jqXHR, textStatus, errorThrown) {
		                    alert(jqXHR.responseText);
		                }
		            });
 			}
 			
 			if(null != data.id){
				var json = nui.encode({'id':data.id});
				nui.ajax({
		                url: "com.zhonghe.ame.payment.payMent.queryPayContractByContractId.biz.ext",
		                data: json,
		                type: 'POST',
		                cache: false,
		                contentType: 'text/json',
		                success: function (text) {
		               		 console.log(text.data[0].payer)
		               		//const payer = nui.getDictText('ZH_INVOICE_NAME_TYPE',text.data[0].payer);
							nui.get("payer").setValue(text.data[0].payer);
							nui.get("implementOrg").setValue(text.data[0].implementOrg);
		                },
		                error: function (jqXHR, textStatus, errorThrown) {
		                    alert(jqXHR.responseText);
		                }
		            });
 			}
		}
		
		
		 function editPaidContractSum(e){
			var money = e.value;
			nui.get("paidContractSumCapital").setValue(numberParseChina(money));
		} 
		
		function editApplyPayContractSum(e){
			var money = e.value;
			nui.get("applyPayContractSumCapital").setValue(numberParseChina(money));
		}
    	 function onCancel(e) {
            CloseWindow("cancel");
        }
        //标准方法接口定义
        function CloseWindow(action) {           
            if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
            else window.close();            
        }
        
        function selectOmEmployee(){
	    	var btnEdit = this;
	        nui.open({
	            url: "/default/machine/SelectEmployee.jsp",
	            title: "选择经办人",
	            width: 530,
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

    </script></body>
</html>
