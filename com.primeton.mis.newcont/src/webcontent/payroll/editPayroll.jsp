<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common/common.jsp"%>
<%@include file="/common/skins/skin0/component.jsp" %>
<html>
<!-- 
  - Author(s): mengyy
  - Date: 2018-04-12 14:48:58
  - Description:
-->
<head>
<title>编辑薪酬福利明细</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;
	    }
    </style>
</head>
<body>
	<div id="form1" >
		<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
			<legend>编辑薪酬福利明细</legend>
			<div style="padding:5px;">
				<input name="amePayroll.payrollid" id="payrollid" class="nui-hidden">
				<table style="width:100%;">
					<tr>
						<td align="right" style="width:100px;">公司：</td>
	                	<td style="width:100px;">    
	                    	<input name="amePayroll.company" id="company" class="nui-dictcombobox" dictTypeId="company" required="true"/>
	                	</td>
	                	<td align="right" style="width:100px;">成本类型：</td>
	                	<td style="width:100px;">    
	                    	<input name="amePayroll.costtype" id="costtype" class="nui-dictcombobox" dictTypeId="AME_U8_SUBJECT" required="true"/>
	                	</td>
	                	<td align="right" style="width:100px;">是否高管：</td>
	                	<td style="width:100px;">    
	                    	<input name="amePayroll.issenior" id="issenior" class="nui-dictcombobox" dictTypeId="MIS_YN" required="true"/>
	                	</td>
	                	<td align="right" style="width:100px;">状态：</td>
	                	<td style="width:100px;">    
	                    	<input name="amePayroll.status" id="status" class="nui-dictcombobox" dictTypeId="AME_PAYROLLSTATUS" required="true"/>
	                	</td>
					</tr>
					<tr>
						<td align="right" style="width:100px;">部门：</td>
	                	<td style="width:100px;">    
	                    	<input name="amePayroll.orgname"  id="orgname" class="nui-textbox" required="true"/>
	                	</td>
	                	<td align="right" style="width:100px;">年份：</td>
	                	<td style="width:100px;">    
	                    	<input name="amePayroll.year"  id="year" class="nui-textbox" required="true"/>
	                	</td>
	                	<td align="right" style="width:100px;">月份：</td>
	                	<td style="width:100px;">    
	                    	<input name="amePayroll.month"  id="month" class="nui-textbox" required="true"/>
	                	</td>
						<td align="right" style="width:100px;">费用类型：</td>
	                	<td style="width:100px;">    
	                    	<input name="amePayroll.expFeetype.feetypename"  id="feetypename" class="nui-textbox" required="fasel" readOnly="true"/>
	                    	<input name="amePayroll.expFeetype.feetypecode"  id="feetypecode" class="nui-hidden" required="fasel" readOnly="true"/>
	                	</td>
					</tr>
					<tr>
						<td align="right" style="width:100px;">本月基薪：</td>
	                	<td style="width:100px;">    
	                    	<input name="amePayroll.basicpay" id="basicpay" class="nui-spinner"  format="n2" allowLimitValue="false"/>
	                	</td>
					</tr>
				</table>
			</div>
			<div style="text-align:center;padding:10px;">               
	            <a class="nui-button" onclick="onOk"  id="okbutton" style="width:60px;margin-right:20px;">保存</a>       
	            <a class="nui-button" onclick="onCancel('cancel')" style="width:60px;">取消</a>       
	        </div>
		</fieldset>
	</div>
	<script type="text/javascript">
		nui.parse();
	    	
    	var form = new nui.Form("form1");
    	
    	function SetData(data) {
    		data = nui.clone(data);
    		var payrollid = data.payrollid;
    		nui.get("payrollid").setValue(payrollid);
    		var data1={payrollid:payrollid};
			var json=nui.encode(data1);
			nui.ajax({
	        		url: "com.primeton.mis.newcont.payroll.getPayroolById.biz.ext",
	                data: json,
	                type: 'POST',
	                cache: false,
	                contentType: 'text/json',
	                success: function (o) {
	                	form.setData(o);
	                },
	                error: function (jqXHR, textStatus, errorThrown) {
	                    alert(jqXHR.responseText);
	                    CloseWindow();
	                }
	        	});
    	}
    	
    	function CloseWindow(action){
    		if (action == "close" && form.isChanged()){
    			if (confirm("数据被修改了，是否先保存？")){
    				return false;
    			}
    		}
    		if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
    		else window.close();
    	}
    	
    	function onOk(e){
    		save();
    	}
    	
    	function save(){
    		var o = form.getData();
	    	form.validate();
	    	if(form.validate()){
	    		var json = nui.encode(o);
	    		nui.ajax({
		    			url: "com.primeton.mis.newcont.payroll.updatePayroll.biz.ext",
		    			data: json,
		    			type: 'POST',
		    			cache: false,
		    			contentType: 'text/json',
		    			success: function(text){
		    			var returnJson = nui.decode(text);
		    				if(returnJson.result=="success"){
		    					alert("修改成功");
		    					CloseWindow("ok");
		    				}else{
		    					nui.alert("修改失败");
			            		nui.get("okbutton").enable();
		    				}
		    				
		    			},
		    			error: function(jqXHR, textStatus, errorThrown){
		    				alert(jqXHR.responseText);
		    				CloseWindow();
		    			}
		    		});
	    	}else{
		    	return;
		    }
    	}
    	
    	
    	function onCancel(e) {
        	var data = form.getData();
        	if(data){
	        	nui.showMessageBox({
		            title: "关闭提示",
		            iconCls: "nui-messagebox-question",
		            buttons: ["yes", "no"],
		            message: "是否关闭？",
		            callback: function (action) {
		                if(action=="yes"){
		                	CloseWindow("cancel");
		                }
		            }
		        });
			}else{
				CloseWindow("cancel");
			}
	    }
	</script> 
</body>
</html>