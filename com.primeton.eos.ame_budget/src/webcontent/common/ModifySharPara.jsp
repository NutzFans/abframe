<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): zhuhx
  - Date: 2018-11-29 17:23:19
  - Description:
-->
<head>
<title>新增/修改预算分摊设置</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<style>
	body{overflow: hidden;width: 100%;height: 100%;}
</style>
</head>
<body>
	<div class = "nui-fit">
		<div id="form1" style="width:auto;height:auto;" >
			<fieldset id="field2" style="border:solid 1px #aaa;padding:3px;"> 
	        <legend>预算分摊设置基本信息</legend>
	        	<input class="nui-hidden" id="sharParaid" name="sharPara.sharparaid"/>
				<table style="width:100%;font-size:12px;">
					<tr>
						<td align="right" style = "width:60px;">预算年份:</td>
						<td colspan="3" ><input name="sharPara.year" id="year" class="nui-textbox" style="width:160px;" required="true"/></td>
					</tr>
					<tr>
						<td align="right" style = "width:60px;">预算机构:</td>
						<td align="left" colspan="3"><input name="sharPara.orgids" id = "orgid" class="nui-treeselect" checkRecursive = "false"
							textField="orgname" valueField="orgid" parentField="parentorgid" dataField="orgs" showTreeIcon="true" valueFromSelect="true"
							showNullItem="true" multiSelect="true" checkRecursive = "true" expandOnLoad="true" showFolderCheckBox="true" style="width:390px;" onclick="setOrgList()" required="true"/></td>
					</tr>
					<tr>
						<td align="right">计算项:</td>
						<td align="left"><input name="sharPara.sharterm" id = "sharterm" class="nui-dictcombobox"  dictTypeId="AME_SHARTERM" style="width:160px;" required="true"/></td>
						<td align="right">计算模式:</td>
						<td align="left"><input class="nui-dictcombobox" id="caltype" name="sharPara.caltype" dictTypeId="AME_SHARCALTYPE" onvaluechanged = "changeTerm(e)" required="true"/></td>
					</tr>
					<tr>
						<td align="right">计算指标:</td>
						<td align="left"><input name="sharPara.shartarget" id = "shartarget" class="nui-dictcombobox" dictTypeId="AME_SHARTARGET" style="width:160px;" readonly="readonly"/></td>
						<td align="right">参数值:</td>
						<td align="left"><input name="sharPara.parameters" class="nui-spinner" id = "parameters"allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" readonly="readonly"/></td>
					</tr>
					<tr>
						<td align="right">计算说明:</td>
						<td align="left" colspan="3"><input name="sharPara.sharmemo" id = "sharmemo" class="nui-textarea" style="width:390px;" maxLength="50" readonly="readonly"/></td>
					</tr>
				</table> 
			</fieldset>
		</div>
	</div>	
	<div style="text-align:center;padding:10px;" class="nui-toolbar" >
			<a class="nui-button" onclick="onOk()" id="okbutton" style="width:80px;">保存</a>
			<a class="nui-button" onclick="onCancel('cancel')" style="width:80px;">关闭</a>      
		</div>
	<script type="text/javascript">
		nui.parse();
		var grid = nui.get("datagrid1");
		var form = new nui.Form("form1");
		var tree = nui.get("orgid");
		
    	function setData(data) {
    		var data = nui.clone(data);
    		if(data.action == "add"){//新增
	    		/* var myDate = new Date();
				nui.get("year").setValue(myDate.getFullYear()); */
    		}else{
    			form.setData(data)
    			nui.get("orgid").setText(data.sharPara.orgname);
    			if(data.sharPara.caltype == "2"){
    				nui.get("parameters").setReadOnly(false);
	    			nui.get("shartarget").setReadOnly(false);
	    			nui.get("sharmemo").setReadOnly(false);
	    			nui.get("parameters").setRequired(true);
	    			nui.get("shartarget").setRequired(true);
    			}
    		}
    	}
    	
    	//设置预算机构列表
    	function setOrgList(){
    		var year = nui.get("year").getValue();
    		if(year){
				var json = nui.encode({year:year,orgdegree:"2"});
				nui.ajax({
	    		 	 url: "com.primeton.eos.ame_budget.budgetOrgManager.getBudgetOrgTree.biz.ext",
	    		 	 data: json,
	                 type: 'POST',
	                 cache: false,
	                 contentType: 'text/json',
	                 success: function (o) {
	                 	var data = o.orgs;
	                 	tree.loadList(data, "orgid", "parentorgid");
	                 },
	                 error: function (jqXHR, textStatus, errorThrown) {
	                 	alert(jqXHR.responseText);
	                 }
    			});
    		}else{
    		}
    	}
    	
    	//分摊项改变时判断参数值及分摊指标是否填写
    	function changeTerm(e){
    		if(e.value=="2"){
    			nui.get("parameters").setReadOnly(false);
    			nui.get("shartarget").setReadOnly(false);
    			nui.get("sharmemo").setReadOnly(false);
    			nui.get("parameters").setRequired(true);
    			nui.get("shartarget").setRequired(true);
    		}else{
    			nui.get("parameters").setValue("");
    			nui.get("shartarget").setValue("");
    			nui.get("sharmemo").setValue("");
    			nui.get("parameters").setReadOnly(true);
    			nui.get("shartarget").setReadOnly(true);
    			nui.get("sharmemo").setReadOnly(true);
    			nui.get("parameters").setRequired(false);
    			nui.get("shartarget").setRequired(false);
    		} 
    	}
    	
    	//保存
        function onOk(e){
    		form.validate();//验证必填
    		if(form.isValid()){
	    		var data = form.getData();
	    		data.orgname = nui.get("orgid").getText();
	    		data.shartermname = nui.get("sharterm").getText();
	    		var json = data;
	        	nui.ajax({
	    		 	 url: "com.primeton.eos.ame_budget.common.saveBudSharParaBatcth.biz.ext",
	    		 	 data: json,
	                 type: 'POST',
	                 cache: false,
	                 contentType: 'text/json',
	                 success: function (o) {
	                 	if(o.result==1){
	                 		nui.alert("已存在对应设置，请检查！");
	                 		return;
	                 	}else if(o.result==2){
	                 		var returnJson = nui.decode(o);
							if(returnJson.exception == null){
								nui.alert("保存成功", "系统提示",function(){
				              		CloseWindow("saveSuccess");
								});
			              	}else{
			                	nui.alert("保存失败，请联系信息技术部！", "系统提示");
			                } 
	                 	}else{
	                 		nui.alert("保存失败，请联系信息技术部！", "系统提示");
	                 	}
	                 },
	                 error: function (jqXHR, textStatus, errorThrown) {
	                 	alert(jqXHR.responseText);
	                 }
	    		 });
    		}
        }
        
        //标准方法接口定义
    function CloseWindow(action) {
        if (action == "close" && form.isChanged()) {
            if (confirm("数据被修改了，是否先保存？")) {
                return false;
            }
        }
        if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
        else window.close();            
    }
 	function onCancel(e){
 		CloseWindow("cancel");
 	}
	</script>
</body>

</html>