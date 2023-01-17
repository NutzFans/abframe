<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<html>
<!-- 
  - Author(s): zhuhx
  - Date: 2016-07-04 11:26:45
  - Description:
-->
<head>
<title>Title</title>
 <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
    
</head>
<body>
	<form id="form1" method="post" >
		<input name="budget.pbid" id="pbid" class="nui-hidden" />
		<input name="budget.projectid" id="projectid" class="nui-hidden" />
		<input name="budget.projectName" id="projectName" class="nui-hidden" />
		<input name="budget.pcostsum" id="pcostsum" class="nui-hidden" />
        <fieldset style="border:solid 1px #aaa;padding:3px;">
			<legend>基本信息</legend>
        	<div style="padding:5px;">
            	<table>
	                <tr>
	                    <td>预算版本号：</td>
	                    <td style="width:120px;">    
	                       <input name="budget.versionid" id="versionid" class="nui-textbox" style="width:100%" allowInput="false">
	                    </td>
	                    <td>预算状态：</td>
	                    <td style="width:120px;">    
	                       <input name="budget.budstatus" class="nui-dictcombobox" style="width:100%" dictTypeId="MIS_BUDSTATUS" required="true">
	                    </td>
	                    <td>预算制定人：</td>
	                    <td style="width:120px;">    
	                       <input name="budget.budgetmaker" class="nui-textbox" style="width:100%"  required="true">
	                    </td>
                    </tr>
                    <tr>
	                    <td>预算评估日期：</td>
						<td style="width:120px;">
							<input name="budget.budgetdate"class="nui-datepicker" id="budgetdate" required="true" style="width:100%"/>
						</td>
	                    <td>实施开始日期：</td>
						<td style="width:120px;">
							<input name="budget.startdate"class="nui-datepicker" id="startdate" style="width:100%" required="true"/>
						</td>
						<td>项目成本统计开始时间：</td>
						<td style="width:120px;">
							<input name="budget.pcoststartdate"class="nui-datepicker" id="pcoststartdate" style="width:100%"/>
						</td>
					</tr>
					
					  <tr>
	                    <td>审核时间：</td>
						<td style="width:120px;">
							<input name="budget.appyjdate"class="nui-datepicker" id="appyjdate" style="width:100%"/>
						</td>
	                    <td>预计完成日期：</td>
						<td style="width:120px;">
							<input name="budget.enddate"class="nui-datepicker" id="enddate" style="width:100%" required="true"/>
						</td>
						<td>项目成本统计截止时间：</td>
						<td style="width:120px;">
							<input name="budget.pcostclosedate"class="nui-datepicker" id="pcostclosedate" style="width:100%"/>
						</td>
					</tr>
					<tr>
						<td>审核人：</td>
	                    <td style="width:120px;" colspan="3">    
	                       <input name="budget.sprname" class="nui-textbox" style="width:335px">
	                    </td>
	                    <td>是否有效版本：</td>
	                    <td style="width:120px;">    
	                       <input name="budget.iscversion" class="nui-dictcombobox" style="width:100%" dictTypeId="MIS_YN" required="true">
	                    </td>
					</tr>
					<tr>
						<td>免费维护期成本说明：</td>
	                    <td style="width:120px;" colspan="6">    
	                       <input name="budget.fmainexpain" class="nui-textarea" style="width:600px">
	                    </td>
					</tr>
					<tr>
						<td>第三方分摊成本说明：</td>
	                    <td style="width:120px;" colspan="6">    
	                       <input name="budget.tpexplain" class="nui-textarea" style="width:600px">
	                    </td>
					</tr>		
				</table>
			</div>
		</fieldset>
		<div style="text-align:center;padding:10px;">
			<a class="nui-button"onclick="onOk"style="width:60px;margin-right:20px;">确定</a>
			<a class="nui-button"onclick="onCancel"style="width:60px;">取消</a>
		</div>
    </form>
	<script type="text/javascript">
        var updateURL = "com.primeton.eos.ame_budget.ame_budget.updateBudget.biz.ext";
    	var addURL = "com.primeton.eos.ame_budget.ame_budget.addBudget.biz.ext";
    	var saveURL = "";        
        nui.parse();
        var form = new nui.Form("form1");        
        function SetData(data){
        	data = nui.clone(data);
        	if(data.action=="new"){
        		nui.get("projectid").setValue(data.projectid);
        		nui.get("versionid").setValue(data.versionid);
        		nui.get("projectName").setValue(data.projectName);
        		nui.get("startdate").setValue(data.startdate);
        		nui.get("enddate").setValue(data.expenddate);
        	}else if(data.action == "edit"){
        		var json = {budget: {pbid: data.pbid}};
	        	nui.ajax({
	        		url: "com.primeton.eos.ame_budget.ame_budget.getBudget.biz.ext",
	                data: json,
	                type: 'POST',
	                cache: false,
	                contentType: 'text/json',
	                success: function (o) {
	                    form.setData(o);
	                    form.isChanged(false);
	                },
	                error: function (jqXHR, textStatus, errorThrown) {
	                    alert(jqXHR.responseText);
	                    CloseWindow();
	                }
	        	});
        	}
        }
        function SaveData() {
            var o = form.getData();            
            if(form.validate()){
            	var pbid = nui.get("pbid").getValue();
				if(pbid){
					saveURL = updateURL;
				} else{
					saveURL = addURL;
				}
	            var json = nui.encode(o);
	            nui.ajax({
	                url: saveURL,
	                data: json,
	                type: 'POST',
	                cache: false,
	                contentType: 'text/json',
	                success: function (text) {
	                    	CloseWindow("save");
	                },
	                error: function (jqXHR, textStatus, errorThrown) {
	                    alert(jqXHR.responseText);
	                    CloseWindow();
	                }
	            });
	        }else{
	        	return;
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
        function onOk(e) {
        	var a=nui.get("startdate").getValue();
        	var b=nui.get("enddate").getValue();
        	if(b<a){
        		alert("预计完成日期不能小于项目开始日期!");
        		return false;
        	}
            SaveData();
        }
        function onCancel(e) {
            CloseWindow("cancel");
        }
    </script>
</body>
</html>