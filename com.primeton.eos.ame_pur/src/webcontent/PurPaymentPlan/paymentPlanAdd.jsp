<%@page pageEncoding="UTF-8"%>
<%@include file="/common/common.jsp"%>
<%@include file="/common/skins/skin0/component.jsp" %>
<html>
<!-- 
  - Author(s): weisz
  - Date: 2020-07-14 17:32:43
  - Description:
-->
<head>
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
	</style>
</head>
<body>
<div class="nui-fit">
	<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
	<form id="form1" method="post">
		<input name="id" id="paymentPlanId" class="nui-hidden"/>
		<div style="padding:5px;">
			
			<table style="table-layout:fixed;" id="table_file">
				<tr>
					<td align="right" style="width:120px"><span style="color: red">*</span>采购合同：</td>
					<td style="width:250px"><input name="purContract.purcontid" id="contractId" class="nui-buttonedit" onbuttonclick="showContract"  allowInput="false" style="width:280px" required="true"/></td>
					<td style="width:100px"></td>
					<td align="right" style="width:120px">合同金额：</td>
					<td><input name="purContract.contmoney" id="contmoney" class="nui-textbox" style="width:250px" enabled="false"/></td>
				</tr>
				<tr>
					<td align="right" style="width:120px">付款金额：</td>
					<td><input name="expectedAmount" id="expectedAmount" class="nui-spinner" onvaluechanged="expectedAmountChanged" minValue="0" allowNull="true" format="¥#,0.00" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false"  style="width:250px;" /></td>
					<td style="width:100px"></td>
					<td align="right" style="width:120px">付款比例：</td>
					<td><input name="percentage" id="percentage" class="nui-buttonedit" showButton="false"   style="width:250px" allowNull="true"  enabled="false" /></td>
				</tr>
				<tr>
					<td align="right" style="width:120px">付款次数：</td>
					<td><input name="payCount" id="payCount" class="nui-textbox" style="width:250px" allowNull="true"/></td>
					<td style="width:100px"></td>
					<td align="right" style="width:120px">预计付款年月：</td>
					<td><input name="expectedDate" id="expectedDate" class="nui-monthpicker"  style="width:250px" allowInput="false"/></td>
				</tr>
				<tr>
					<td align="right" style="width:120px">付款依据：</td>
					<td colspan="4"><input name="evidence" id="evidence"  class="nui-textarea" style="width:100%;height:100px" showNullItem="true" nullItemText=""  vtype="maxLength:2000" emptyText="请输入不超过2000个字符"/></td>
				</tr>
				<tr>
					<td align="right" valign="top" style="width:120px;">付款节点备注：</td>
					<td colspan="4"><input name="nodeRemark" id="nodeRemark" class="nui-textarea" style="width:100%;height:150px" vtype="maxLength:4000" emptyText="请输入不超过4000个字符"/></td>
				</tr>
			</table>
		</div>
	</form>
	</fieldset>
</div>
<div style="text-align:center;padding:10px;" class="nui-toolbar">
	<a class="nui-button" onclick="onOk()" id="savePaymentPlan" style="width:60px;margin-right:20px;">保存</a>
	<a class="nui-button" onclick="onCancel('cancel')" style="width:60px;">关闭</a>
</div>

<script type="text/javascript">
 	nui.parse();
  	var form = new nui.Form("form1");
    
 	//选择采购合同弹窗
    function showContract(e) {
        var btnEdit = this;
        nui.open({
    			url:"<%=request.getContextPath()%>/ame_pur/PurContract/SelectContract.jsp",
                title: "选择采购合同",
                width: 600,
                height: 400,
                ondestroy: function (action) {
                	if (action == "ok") {
						var iframe = this.getIFrameEl();
						var data = iframe.contentWindow.GetData();
						data = nui.clone(data);   
						btnEdit.setText(data.purcontname);
						btnEdit.setValue(data.purcontid);
						nui.get("contmoney").setValue(data.contmoney);
						if(data.contmoney && data.contmoney > 0) {
							var expectedAmount = nui.get("expectedAmount").getValue();
							if(expectedAmount || expectedAmount == 0) {
								var p = (Math.round(expectedAmount * 10000 / data.contmoney ) / 100.00);
	        					nui.get("percentage").set({"value": p, "text": p +"%"})
							}
						}
					}
                }
    	 	});
	}
	
	function onCancel(e) {
        CloseWindow("cancel");
    }
    
     //保存
     function onOk() {
    	if(!form.validate()){
	    	alert("表单信息填写不完整，请确认必输项是否填写！！");
	    	return;
	    }
    	
		nui.get("savePaymentPlan").disable();
		
		var paymentPlanId = nui.get("paymentPlanId").getValue();
		var jsonData = {"contractid": nui.get("contractId").getValue()};
		if(paymentPlanId) {
			jsonData["paymentPlanId"] = paymentPlanId;
		}
		//统计已有付款计划的付款金额总和
		nui.ajax({
            url: "com.primeton.eos.ame_pur.purPaymentPlan.paymentPlanSumByContract.biz.ext",
            data: jsonData,
            type: 'POST',
            cache: false,
            async:false,
            contentType: 'text/json',
            success: function (text) {
               var sum = nui.decode(text).sum;
              	if(isNaN(sum)){
                	doSave();
              	}else{
            		var total = parseFloat(sum) + parseFloat(nui.get("expectedAmount").getValue());
            		var contmoney = parseFloat(nui.get("contmoney").getValue());
            		if(total > contmoney) {
            			alert("采购付款计划的预计付款金额汇总要等于合同金额！已存在付款金额汇总:" + parseFloat(sum));
            			nui.get("savePaymentPlan").enable();
            			return;
            		}
            		doSave();
              	}        
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert(jqXHR.responseText);
            }
        });
		
          
    }
    
    function doSave() {
    	var jsonData = nui.encode({"plan":form.getData()});
		var paymentPlanId = nui.get("paymentPlanId").getValue();
    	var saveURL= "";
		if(!paymentPlanId) {
			saveURL  = "com.primeton.eos.ame_pur.purPaymentPlan.paymentPlanAdd.biz.ext";
		} else {
			saveURL  = "com.primeton.eos.ame_pur.purPaymentPlan.paymentPlanEdit.biz.ext";
		}
		
		nui.ajax({
            url: saveURL,
            data: jsonData,
            type: 'POST',
            cache: false,
            async:false,
            contentType: 'text/json',
            success: function (text) {
               var returnJson = nui.decode(text);
              	if(returnJson.exception == null){
                	alert("保存成功！");
                	CloseWindow("saveSuccess");
              	}else{
            		alert("保存失败！");
            		nui.get("savePaymentPlan").enable();
              	}        
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert(jqXHR.responseText);
            }
        });
    }
	        
    function SetData(dataIn){
	    	var data = nui.clone(dataIn);
	    	if(data.action == "edit"){//编辑
	    		nui.get("paymentPlanId").setValue(data.paymentPlanId);
	    		var json = nui.encode({"paymentPlan":{"id": data.paymentPlanId}}); 
	        	nui.ajax({
	        		url: "com.primeton.eos.ame_pur.purPaymentPlan.paymentPlanDetail.biz.ext",
	                data: json,
	                type: 'POST',
	                async:false,
	                cache: false,
	                contentType: 'text/json',
	                success: function (o) {
	                    //加载附件设置参数
	                    form.setData(o.paymentPlan);
	                    form.isChanged(false);	
	                    nui.get("contractId").setText(o.paymentPlan.purContract.purcontname);
	                    var contmoney = o.paymentPlan.purContract.contmoney;
						if(contmoney && contmoney > 0) {
							var expectedAmount = o.paymentPlan.expectedAmount;
							if(expectedAmount || expectedAmount == 0) {
								var p = (Math.round(expectedAmount * 10000 / contmoney ) / 100.00);
								nui.get("percentage").set({"value": p, "text": p +"%"});
							}
						}
	                },
	                error: function (jqXHR, textStatus, errorThrown) {
	                    alert(jqXHR.responseText);
	                    CloseWindow();
	                }
	        	});
    		} else if(data.action == "new"){//新增
           
    		}
    	}
    	
    function CloseWindow(action) {           
        if (action == "close" && form.isChanged()) {
            if (confirm("数据被修改了，是否先保存？")) {
                return false;
            }
        }
        if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
        else window.close();            
    }
    function formatNumber() {
    	if(this.value != null && !isNaN(this.value)) {
    		this.value = (Math.round(this.value*100)/100);
    	}
    }
    function expectedAmountChanged() {
   		if(this.value != null && !isNaN(this.value)) {
    		this.value = (Math.round(this.value*100)/100);
    	}
    	var contmoney = nui.get("contmoney").getValue();
		if(contmoney && contmoney > 0) {
			var p = (Math.round(this.value * 10000 / contmoney ) / 100.00);
			nui.get("percentage").set({"value": p, "text": p +"%"});
		}
    }
</script>
</body>
</html>