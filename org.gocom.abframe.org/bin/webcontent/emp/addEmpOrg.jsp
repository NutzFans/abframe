<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/common.jsp"%>
<%@include file="/common/skins/skin0/component.jsp" %>
<html>
<!-- 
  - Author(s): jisx
  - Date: 2017-08-09 18:42:50
  - Description:
-->
<head>
	<title>增加组织归属</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin: 0;padding: 0;border: 0;width: 100%;height: 100%;overflow: hidden;	
	    } 
    </style>
</head>
<body>
	<div class="nui-fit">
		<fieldset id="field1" style="border: solid 1px #aaa;" >
			<legend>组织归属详情</legend>
			<form id="empOrgDetail" method="post">
				<div>
					<table style="table-layout: fixed;" style="width:100%">
						<tr>
							<td align="right" style="width:100px;">组织名称:</td>
	                		<td align="left">    
	                    		<input  inputStyle="text-align: left" class="nui-combobox"  id="orgid" style="width:100%;"
							required="true" url="org.gocom.abframe.org.employee.EmpManager.getSOrgs.biz.ext" filterType="like" 
							textField="orgname" valueField="orgid" dataField="allorgs" valueFromSelect="true" allowInput="true" onblur="getOrgtype"/>
	                		</td>
						</tr>
						<tr>
							<td align="right" style="width:80px;">是主机构:</td>
	                		<td align="left">    
	                    		<input name="ismain" id="ismain" class="nui-dictcombobox" dictTypeId="ABF_YESORNO" shownullItem="true"  style="width:100%;" required="true"/>
	                		</td>
	                		<td align="right" style="width:120px;">机构类型:</td>
	                		<td align="left">    
	                    		<input name="orgtype" id="orgtype" class="nui-dictcombobox" shownullItem="true" dictTypeId="ABF_ORGTYPE" style="width:100%;" readonly="readonly"/>
	                		</td>
						</tr>
						<tr>
							<td align="right" style="width:80px;">占比数:</td>
	                		<td align="left">    
	                    		<input name="empprop" id="empprop" class="nui-textbox" style="width:100%;" required="true" onblur="checkEmpprop"/>
	                		</td>
	                		<td align="right" style="width:120px;">调动日期:</td>
	                		<td align="left">    
	                    		<input name="indate" id="indate" class="nui-datepicker" dateFormat="yyyy-MM-dd" style="width:100%;" required="true"/>
	                		</td>
						</tr>
					</table>
				</div>
			</form>
		</fieldset>
		
	</div>
	<div style="text-align: center;padding: 10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk()" id="sure" style="width: 60px;margin-right: 20px;">确认</a>
		<a class="nui-button" onclick="onCancel('cancel')" style="width: 60px;" id="canelButton">关闭</a>
	</div>
	<script type="text/javascript">
		nui.parse();
		var detail;
		
		function onOk(){
			check();
			var form = new nui.Form("empOrgDetail");
			form.loading("保存中...");
			detail = form.getData();
			form.unmask();
			CloseWindow('ok');
		}
		
		function SetData(){
		
		}
		
		function GetData(){
			var orgname = nui.get("orgid").getText();
			var orgid = nui.get("orgid").getValue();
			var data = {"orgid":orgid,"orgname":orgname,"orgtype":detail.orgtype,"ismain":detail.ismain,"indate":detail.indate,"empprop":detail.empprop};
			return data;
		}
		
		function onCancel(e) {
        	if(e=='cancel'){
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
		
		function CloseWindow(action){
    		if (action == "close" && form.isChanged()){
    			if (confirm("数据被修改了，是否先保存？")){
    				return false;
    			}
    		}
    		if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
    		else window.close();
    	}
    	
    	function check(){
    		var orgid = nui.get("orgid").getValue();
    		var ismain = nui.get("ismain").getValue();
    		var empprop = nui.get("empprop").getValue();
    		var indate = nui.get("indate").getValue();
    		if(orgid==""||orgid==null){
    			alert("组织结构不能为空!");
    			return;
    		}
    		if(ismain==""||ismain==null){
    			alert("是主机构不能为空!");
    			return;
    		}
    		if(empprop==""||empprop==null){
    			alert("占比数不能为空!");
    			return;
    		}
    		if(indate==""||indate==null){
    			alert("调动日期不能为空!");
    			return;
    		}
    	}
    	
    	function getOrgtype(){
    		var orgid = nui.get("orgid").getValue();
    		var json = nui.encode({"orgid":orgid});
        	nui.ajax({
        		url: "org.gocom.abframe.org.employee.EmpManager.getOrgType.biz.ext",
        		data: json,
        		type: 'POST',
    			cache: false,
    			contentType: 'text/json',
    			success: function(text){
    				var org = text.org;
    				nui.get("orgtype").setValue(org.orgtype);
    			},
    			error: function(jqXHR, textStatus, errorThrown){
    			}
        	});
    		
    	}
		
		function  checkEmpprop(){
			var empprop = nui.get("empprop").getValue();
			if(parseFloat(empprop)>1){
				alert("占比数不能大于1！");
				nui.get("empprop").setValue("");
				return;
			}
		}
</script>
</body>
</html>