<%@page pageEncoding="UTF-8"%>
<%@include file="/common/common.jsp"%>
<%@include file="/common/skins/skin0/component.jsp" %>
<%
	String contextPath=request.getContextPath();
 %>
<html>
<!-- 
  - Author(s): yaoyi
  - Date: 2018-06-05 14:40:02
  - Description:
  - 入参SetData(data)  data中可以赋值 to(收件人,可多人,userid以逗号拼接) cc(抄送人,可多人,userid以逗号拼接) subject(邮件主题) message(邮件内容)  如果不传  则默认为空
  - 返回值 action=success
-->
<head>
<title>发送邮件</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<link id="css_skin" rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/coframe/tools/skins/skin1/style.css" />
	<link href="../demo.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="<%=request.getContextPath()%>/common/nui/resource/kindeditor/themes/default/default.css" />
	<link rel="stylesheet" href="<%=request.getContextPath()%>/common/nui/resource/kindeditor/plugins/code/prettify.css" />
	<script charset="utf-8" src="<%=request.getContextPath()%>/common/nui/resource/kindeditor/kindeditor-all.js"></script>
	<script charset="utf-8" src="<%=request.getContextPath()%>/common/nui/resource/kindeditor/lang/zh-CN.js"></script>
	<script charset="utf-8" src="<%=request.getContextPath() %>/common/nui/resource/kindeditor/plugins/code/prettify.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/common/components/swffileupload/swfupload/swffileupload.js"></script>
</head>
<body>
	<div style="padding:5px;" id="email">
		<table style="table-layout:fixed;">
			<tr>
				<td style="width:80px;" align="right">收件人：</td>
				<td>
					<input id="mailtolist" name="mailinfo.to" class="nui-textboxlist"  searchField="name" style="width:600px"
						url="com.primeton.mis.contract.contractApproval.getEmpByName.biz.ext" onvaluechanged="setsjr(e)" value="" text=""
						textField="EMPNAMES" valueField="OEMAIL"/>
				</td>
			</tr>
			<tr>
				<td style="width:80px;" align="right">抄送人：</td>
				<td>
					<input id="mailcclist"  name="mailinfo.cc" class="nui-textboxlist"  searchField="name" style="width:600px"
						url="com.primeton.mis.contract.contractApproval.getEmpByName.biz.ext" value="" text=""
						textField="EMPNAMES" valueField="OEMAIL"/>
				</td>
			</tr>
			<tr>
				<td style="width:80px;"  align="right" >邮件主题：</td>
				<td><input  name="mailinfo.subject"  id="subject" class="nui-textbox"  style="width:700px"/>
				</td>
			</tr>
			<tr>
				<td style="width:80px;" align="right" valign="top">正文：</td>
				<td><input name="mailinfo.message" id="message" class="nui-hidden"  style="width:750px;"/>
					<textarea id="ke1" name="content2" style="width:100%;height:400px;visibility:hidden;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div style="text-align:center;padding:10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk" style="width: 60px;margin-right:20px;">发送</a>
		<a class="nui-button" onclick="onCancel('cancel')" style="width:60px;">关闭</a>
	</div>
</body>
<script type="text/javascript">
	nui.parse();
	var email = new nui.Form("#email");
	
	//发送邮件
	function onOk(){
		var text = editor2.html();
		nui.get("message").setValue(text);
		var data = email.getData();
		var json = nui.encode({"mailinfo":data.mailinfo});
		nui.ajax({
            url: "com.primeton.eos.common.sendMail.sendMailByTemplate.biz.ext",
            type: "post",
            data: json, 
            cache: false,
            contentType: 'text/json',
            success: function (text) {
            	var result = text.result;
            	if(result=='1'){
            		alert("发送成功！");
            		onCancel('success');
            	}else{
            		alert("发送失败！");
            	}
            },
            error: function () {
            }
       });
	}
	
	//加载数据
	function SetData(data){
		if(data.to!=null){
			getMail(data.to,"to");
		} 	
		if(data.cc!=null){
			getMail(data.cc,"cc");
		}
		if(data.subject!=null){
			nui.get("subject").setValue(data.subject);
		}
		if(data.message!=null){
			editor2.html(data.message);
		}
	}
	
	//关闭
	function onCancel(e) {
        CloseWindow("cancel");
    }
    
    //标准方法接口定义
    function CloseWindow(action) {           
        if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
        else window.close();
    }
    
    function getMail(userId,action){
    	var json = nui.encode({"userId":userId});
    	nui.ajax({
            url: "com.primeton.eos.common.sendMail.getMailName.biz.ext",
            type: "post",
            data: json, 
            cache: false,
            contentType: 'text/json',
            success: function (text) {
            	var data = text.data;
            	var toValue;
            	var toText;
            	if(data!=null){
            		for(var i=0;i<data.length;i++){
            			if(i==0){
            				toValue = data[i].OEMAIL;
            				toText = data[i].EMPNAMES;
            			}else{
            				toValue += "," + data[i].OEMAIL;
            				toText += "," + data[i].EMPNAMES;
            			}
            		}
            		if(action=="to"){
        				nui.get("mailtolist").setValue(toValue);
				   		nui.get("mailtolist").setText(toText);
        			}else if(action=="cc"){
        				nui.get("mailcclist").setValue(toValue);
				   		nui.get("mailcclist").setText(toText);
        			}
            	}
            },
            error: function () {
            }
       });
    }
	
	var editor2 = null;
	 KindEditor.ready(function(K) {
			editor2 = K.create('textarea[name="content2"]', {
			cssPath : '<%=contextPath%>/common/nui/resource/kindeditor/plugins/code/prettify.css',
			uploadJson : '<%=contextPath%>/common/nui/resource/kindeditor/jsp/upload_json.jsp',
			fileManagerJson : '<%=contextPath%>/common/nui/resource/kindeditor/jsp/file_manager_json.jsp',
			allowFileManager : true,
			cssData: '* {font: 12px;line-height:13px}',
			items : [  
			    'source', '|', 'undo', 'redo', '|', 'preview', 'print', 'template', 'code', 'cut', 'copy', 'paste',  
			    'plainpaste', 'wordpaste', '|', 'justifyleft', 'justifycenter', 'justifyright',  
			    'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', 'subscript',  
			    'superscript', 'clearhtml', 'quickformat', 'selectall', '|', 'fullscreen', '/',  
			    'formatblock', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold',  
			    'italic', 'underline', 'strikethrough', 'lineheight', 'removeformat', '|', 'image', 'multiimage',  
			    'flash', 'media', 'insertfile', 'table', 'hr', 'emoticons', 'baidumap', 'pagebreak',  
			    'anchor', 'link', 'unlink', '|', 'about'  
			] ,
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
</script>
</html>