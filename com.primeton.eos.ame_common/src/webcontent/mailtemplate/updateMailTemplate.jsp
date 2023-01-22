<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String contextPath=request.getContextPath();
 %>
<html>
<!-- 
  - Author(s): JYW
  - Date: 2019-10-23 19:24:32
  - Description:
-->
<head>
    <title>修改邮件模板 </title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= contextPath %>/common/nui/nui.js" type="text/javascript"></script>
	<link rel="stylesheet" href="<%=contextPath%>/common/nui/resource/kindeditor/themes/default/default.css" />
	<link rel="stylesheet" href="<%=contextPath%>/common/nui/resource/kindeditor/plugins/code/prettify.css" />
	<script charset="utf-8" src="<%=contextPath%>/common/nui/resource/kindeditor/kindeditor-all-min.js"></script>
	<script charset="utf-8" src="<%=contextPath%>/common/nui/resource/kindeditor/lang/zh-CN.js"></script>
	<script charset="utf-8" src="<%=contextPath%>/common/nui/resource/kindeditor/plugins/code/prettify.js"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    };
	    .ke-container .ke-container-default{
	    	width:99%  !important;
	    	height:362px  !important;
	    }
	    .ke-edit{
	    	height: 312px !important;
	    }
	    .ke-edit-iframe{
	    	height: 312px !important;
	    }
    </style>
</head>
<body>
<div class="nui-fit" style="border:solid 1px #aaa;padding:0px;width:auto">
	<div style="width:auto;height:500px;" id="form1">
    	<input name="mailTemplate.templateid" id="templateid" class="nui-hidden"/>
		<input name="mailTemplate.fileids" id="fileids"  class="nui-hidden"/>
    	<table  style="width:100%">
             <tr>
				<td align="right" width="100px" style="height: 35px;">邮件模板名称：</td>
				<td align="left" style="height: 35px;" colspan="3">
					<input name="mailTemplate.templatename" id="templatename" class="nui-textbox" required="true" width="99%"/>
				</td>
            </tr>
            <tr>
            	<td align="right" width="100px" style="height: 35px;">邮件主题：</td>
				<td align="left" style="height: 35px;" colspan="3">
					<input name="mailTemplate.mailtitle" id="mailtitle" class="nui-textbox" required="true" width="99%"/>
				</td>
            </tr>
            <tr>
           		<td align="right" width="100px" style="height: 35px;">邮件类型：</td>
				<td align="left" style="height: 35px;">
			     	<input name="mailTemplate.mailtype"  id="mailtype" class="nui-dictcombobox" dictTypeId="MAIL_TYPE" width="49.5%" required="true"/>
				</td>
           		<td align="right" width="100px">是否默认模板：</td>
				<td align="left" >
			     	<input name="mailTemplate.defaultflag" id="defaultflag" class="nui-dictcombobox" dictTypeId="MIS_YN" width="49.5%" required="true"/>
				</td>
		   </tr>
		   <tr>
		   		<td align="right" width="100px" style="height: 35px;">邮件正文：</td>
		   		<td align="left" colspan="3">
		   			<input name="mailTemplate.mailContent" id="mailContent" class="nui-hidden"/>
		   			<textarea id="ke" name="content1" style="width:100%;height:280px;visibility:hidden;"></textarea>
		   		</td>
		   </tr>
        </table>
    </div>
	<fieldset id="field1" style="width:auto;border:solid 1px #aaa;padding:3px;margin-left:104px;margin-right: 11px;">
		<jsp:include page="/ame_common/inputFileWithOriginalFileName.jsp"/>
	</fieldset>
</div> 
<div style="text-align:center;padding:10px;" class="nui-toolbar">               
    <a class="nui-button" onclick="onOk" id="okButon" style="width:60px;margin-right:20px;">确定</a>       
    <a class="nui-button" onclick="onCancel" style="width:60px;">关闭</a>       
</div> 
</body>
<script type="text/javascript">
   nui.parse();
    var form = new nui.Form("form1");
    //-------------------------------------------------------------
    //初始化附件新增按钮的名称
	document.getElementById("fileButton").value ="添加邮件附件";
	document.getElementById("fileTd").innerText ="邮件附件";
    var editor1 = null;
	 KindEditor.ready(function(K) {
			editor1 = K.create('textarea[name="content1"]', {
			cssPath : '<%=contextPath%>/common/nui/resource/kindeditor/plugins/code/prettify.css',
			uploadJson : '<%=contextPath%>/common/nui/resource/kindeditor/jsp/upload_json.jsp',
			fileManagerJson : '<%=contextPath%>/common/nui/resource/kindeditor/jsp/file_manager_json.jsp',
			allowFileManager : true,
			afterCreate : function() {
				var self = this;
				K.ctrl(document, 13, function() {
					self.sync();
					document.forms['example'].submit();
				});
				K.ctrl(self.edit.doc, 13, function() {
					self.sync();
					document.forms['example'].submit();
				});
			}
		});
		prettyPrint();
	});
	
	function SetData(data){
    	data = nui.clone(data);
		var json = nui.encode({"mailTemplate":data}); 
    	nui.ajax({
    		url: "com.primeton.eos.ame_common.mailtemplate.queryMailTemplate.biz.ext",
            data: json,
            type: 'POST',
            cache: false,
            contentType: 'text/json',
            success: function (o) {
            	var retValue = o.retValue;
            	if(retValue == 'sucess'){
            		var mailTemplateRes = o.mailTemplate;
	            	<!-- 附件需要 v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v -->
	            	//加载附件设置参数
	         		nui.get("grid_0").load({"groupid":"mailAttach","relationid":mailTemplateRes.templateid});
	                <!-- 附件需要 ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ -->
	                form.setData(o);
	                editor1.html(mailTemplateRes.mailContent);
	                form.isChanged(false);
            	}else{
            		nui.get("okButon").disable();
            		nui.alert("加载当前邮件模板失败","信息提示");
            	}
            },
            error: function (jqXHR, textStatus, errorThrown) {
                nui.alert(jqXHR.responseText);
                CloseWindow();
            }
    	});
    }
    
 	function onOk(){
        document.getElementById("fileCatalog").value="mailAttach";
        form2.submit();
 	}
 	
 	function SaveData(){
	 	var text = editor1.html();
        nui.get("mailContent").setValue(text);
        form.validate();
        var data = form.getData();
        var json = nui.encode(data);
        nui.get("okButon").disable();
        if(form.isValid()){
        	nui.ajax({
                url: "com.primeton.eos.ame_common.mailtemplate.updateMailTemplate.biz.ext",
				type: 'POST',
				data: json,	
				contentType: 'text/json',
                success: function (o) {
                	var retValue = o.retValue;
            		if(retValue == 'sucess'){
                		CloseWindow("saveSuccess");
                	}else{
                		nui.get("okButon").enable();
                		nui.alert("邮件模板修改失败！","操作提示");
                	}
                }
	         });
        }else{
        	nui.alert("请您检查表单的完整性！","操作提示");
        	return false;
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
</html>