<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): zhuyl
  - Date: 2016-08-12 11:54:41
  - Description:
-->
<head>
	<title>新增/编辑银行信息</title>
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
    </style>
</head>
<body>
	<div class="nui-fit">
		<form id="form1" method="post">
			<input name="omemployeeacct.empid" id="empid" class="nui-hidden" style="width: 150px" />
			<input name="omemployeeacct.empidacct" id="empidacct" class="nui-hidden" style="width: 150px" />
			<input name="omemployeeacct.isdefault" id="isdefault" class="nui-hidden" style="width: 150px" />
			<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
				<legend>银行信息</legend>
				<div style="padding:5px;">
					<table style="table-layout:fixed;">
						<tr>
							<td align="right" width="100px">银行名称：</td>
							<td><input name="omemployeeacct.banknamedict" id="bankname" class="nui-dictcombobox" required="true" style="width:120px" dictTypeId="BANKNAME"/></td>
							<td align="right" style="width:100px;">银行帐号：</td>
							<td><input name="omemployeeacct.bankacct" id="bankacct" class="nui-textbox" required="true" style="width:200px" /></td>
						</tr>
						
						<tr>
							<td class="form_label" align="right">
								银行账户类型：</td>
							<td colspan="1" align="left"><input class="nui-dictcombobox"
								name="omemployeeacct.banktype" required="true" width="120px" dictTypeId="BANKACCTTYPE" multiSelect="true"/></td>
							<td class="form_label" align="right">账户开户行：</td>
							<td colspan="1" align="left"><input class="nui-textbox"
								name="omemployeeacct.bankname" required="true" width="200px"/></td>
						</tr>
						
						<tr>
							<td align="right" style="width:100px;">单位/个人名称：</td>
							<td colspan="3"><input name="omemployeeacct.username" id="username" class="nui-textbox" required="false" style="width:250px" /></td>
						</tr>
					</table>
				</div>
			</fieldset>
		</form>
	</div>
	<div style="text-align:center;padding:10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk" style="width:60px;margin-right:20px;" id="sureButton">保存</a>
		<a class="nui-button" onclick="onCancel('cancel')" style="width:60px;" id="canelButton">关闭</a>
	</div>
	
	<script type="text/javascript">
        nui.parse();
	  	var form = new nui.Form("form1");
     	var updateURL = "com.primeton.eos.common.omemployeeacctbiz.updateOmEmployeeAcct.biz.ext";
        //新增保存逻辑流路径
    	var addURL = "com.primeton.eos.common.omemployeeacctbiz.addOmEmployeeAcct.biz.ext";
    	//保存人员并保存订单人员关系表
    	var saveURL = "";
    	var formdata;
    	var action;
    	function getUrlParam(name) { 
		var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); 
		var r = window.location.search.substr(1).match(reg); 
		if (r != null) 
		return unescape(r[2]); 
		return null; 
	}
     var empidacct = getUrlParam("empid");
    	init();
    	function init(){
        console.log(empidacct);
    	}
    	
	    function SetData(data){
	    	data = nui.clone(data);
	    	action =data.action;
	    	if(data.action == "edit"){
		    	nui.get("bankacct").setAllowInput(false);
		    	var json = nui.encode({omemployeeacct: {empid: data.empid,bankacct: data.bankacct}}); 
		    	form.loading("数据加载中..."); 
	        	nui.ajax({
	        		url: "com.primeton.eos.common.omemployeeacctbiz.getOmEmployeeAcct.biz.ext",
	                data: json,
	                type: 'POST',
	                cache: false,
	                contentType: 'text/json',
	                success: function (o) {
	                	nui.parse();
	                	form.unmask();
	                	o = nui.clone(o);
	                	form.setData(o);
	                },
	                error: function (jqXHR, textStatus, errorThrown) {
	                    alert(jqXHR.responseText);
	                    CloseWindow();
	                }
	        	});
    		} else{   		    
    			nui.get("empid").setValue(empidacct);
    		} 
    	}
    	
    	
    	function SaveData() {
            if(form.validate()){
	        	var saveURL = "";
	        	var o = form.getData();
	            form.loading("数据操作中...");
	            //console.log(empidacct);
				if(action=="edit"){
					saveURL = updateURL;
				}else{
			        saveURL = addURL;
			        o.omemployeeacct.isdefault = 0;//赋值账户为非默认账户
				}
				var json = nui.encode(o);
	            nui.ajax({
	                url: saveURL,
	                data: json,
	                type: 'POST',
	                cache: false,
	                contentType: 'text/json',
	                success: function (text) {
	                	form.unmask();
						var returnJson = nui.decode(text);
						if(returnJson.exception == null){
							nui.alert("保存成功",null,function(){
			              		CloseWindow("saveSuccess");
							});
		              	}else{
		                	nui.alert("保存失败", "系统提示", function(action){
		                		nui.get("sureButton").enable();
			                  	if(action == "ok" || action == "close"){
			                  	}
		                  	});
		                }    
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
    /* 	 
        function SaveData() {
            if(form.validate()){
	        	var empid = nui.get("empid").getValue();
	        	var saveURL = "";
	        	var o = form.getData();
	            form.loading("数据操作中...");
				if(empid){
					saveURL = updateURL;
				} else{
					saveURL = addURL;
					o.omemployeeacct.isdefault = 0;//赋值账户为非默认账户
				}
				var json = nui.encode(o);
	            nui.ajax({
	                url: saveURL,
	                data: json,
	                type: 'POST',
	                cache: false,
	                contentType: 'text/json',
	                success: function (text) {
	                	form.unmask();
						var returnJson = nui.decode(text);
						if(returnJson.exception == null){
							nui.alert("保存成功",null,function(){
			              		CloseWindow("saveSuccess");
							});
		              	}else{
		                	nui.alert("保存失败", "系统提示", function(action){
		                		nui.get("sureButton").enable();
			                  	if(action == "ok" || action == "close"){
			                  	}
		                  	});
		                }    
					},
	                error: function (jqXHR, textStatus, errorThrown) {
	                    alert(jqXHR.responseText);
	                    CloseWindow();
	                }
	               
	            });
	        }else{
	        	return;
	        }
	    }  */
	
		function onOk(){
        	if(form.validate()){
        		nui.confirm("确认保存吗？", "确定？",
	            function (action) {            
	                if (action == "ok") {
	                	nui.get("sureButton").disable();
	                	SaveData();
			        }
			    });
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
        
    </script>
</body>
</html>