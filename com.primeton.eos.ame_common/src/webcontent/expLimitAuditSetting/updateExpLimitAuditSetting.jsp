<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): jisx
  - Date: 2017-06-07 13:48:36
  - Description:
-->
<head>
	<title>编辑费用额度审核权限</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
	<div id="form1" method="post">
		<input name="pageType" id="pageType" class="nui-hidden"/> 
		<fieldset style="border:solid 1px #aaa;padding:3px;">
			<legend >费用额度审核权限详情</legend>
			<div style="padding:5px;">
				<table style="width:100%;">
						<tr>
							<td align="right" style="font-size:12px;width:100px;">作用部门:</td>
	                		<td colspan="3">    
	                    		<input id="orgid" name="explimitaudit.orgid" style="width:410px;" class="nui-treeselect" 
	                    		url="com.primeton.eos.ame_common.ame_common.getAllRunOrgs.biz.ext" required="true"
	                    		textField="orgname" valueField="orgid" parentField="omOrganization.orgid" dataField="orgs" 
	                    		 multiSelect="false" checkRecursive = "false" expandOnLoad="0" showFolderCheckBox="true"/>
	                		</td>
	                		</td>
						</tr>
						<tr>
							<td align="right" style="font-size:12px;width:80px;">审批类型:</td>
	                		<td style="width:120px;">    
	                    		<input name="explimitaudit.exptype" class="nui-dictcombobox" dictTypeId="AME_APPROVALCHAIN" required="true" enabled="false"/>
	                		</td>
	                		<td align="right" style="font-size:12px;width:90px;">年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;份:</td>
	                		<td style="width:140px;">    
	                    		<input name="explimitaudit.finyear" class="nui-textbox" required="true" enabled="false"/>
	                		</td>
						</tr>
						<tr>
							<td align="right" style="font-size:12px;width:90px;">审批环节:</td>
	                		<td style="width:140px;">    
	                    		<input  name="explimitaudit.spobject" class="nui-dictcombobox" dictTypeId="AME_SPOBJECT" required="true" onvaluechanged="changeSpObject(e)"  />
	                		</td>
	                		<td align="right" style="font-size:12px;">审批角色:</td>
	                		<td style="width:120px;">    
	                    		<input property="editor" id= "roleids" class="nui-textboxlist" name="explimitaudit.role" allowInput="true" textField="rolename" valueField="roleid" searchField="name" " 
								url="com.primeton.eos.ame_budget.budgetOrgManager.queryRoleidByName.biz.ext"/>
	                		</td>
						</tr>
						<tr>
							<td align="right" style="font-size:12px;width:80px;">审批层级:</td>
	                		<td style="width:120px;">    
	                    		<input name="explimitaudit.splevel" class="nui-textbox" required="true" enabled="false"/>
	                		</td>
	                		<td align="right" style="font-size:12px;width:80px;">审批描述:</td>
							<td style="width:120px;">   
								<input name="explimitaudit.sprole" class="nui-textbox" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="font-size:12px;width:80px;">主管最低审批金额:</td>
	                		<td style="width:120px;">    
	                    		<input name="explimitaudit.limitstartmon" class="nui-textbox"/>
	                		</td>
	                		<td align="right" style="font-size:12px;width:90px;">分管最低审批金额:</td>
	                		<td style="width:140px;">    
	                    		<input name="explimitaudit.limitendmon" class="nui-textbox"/>
	                		</td>
	                		
						</tr>
						
					</table>
				</div>
			<div style="text-align:center;padding:10px;">               
	            <a class="nui-button" onclick="onOk" style="width:60px;margin-right:20px;">确定</a>       
	            <a class="nui-button" onclick="onCancel('cancel')" style="width:60px;">取消</a>       
	        </div>
	        </fieldset>
	</div>
		
		<script type="text/javascript">
			nui.parse();
	    	
	    	var saveURL = "com.primeton.eos.ame_common.expLimitAuditSetting.updateExpLimitAuditSetting.biz.ext";
	    	var form = new nui.Form("form1");
	    	
	    	function SetData(data) {
	    		data = nui.clone(data);
		    	var json = data.record;
                form.setData(json);
                form.setChanged(true);
                nui.get("pageType").setValue(data.pageType);
                nui.get("roleids").setText(data.record.explimitaudit.rolename);
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
	    		var json = nui.encode(o);
	    		if(form.validate()){
		    		nui.ajax({
		    			url: saveURL,
		    			data: json,
		    			type: 'POST',
		    			cache: false,
		    			contentType: 'text/json',
		    			success: function(text){
	    						alert("修改成功");
		    				CloseWindow("save");
		    			},
		    			error: function(jqXHR, textStatus, errorThrown){
		    				alert(jqXHR.responseText);
		    				CloseWindow();
		    			}
		    		});
	    		}else{return;}
	    		
	    	}
	    	
	    	function onCancel(e) {
	    		var form = new nui.Form("#form1");
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