<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String contextPath=request.getContextPath();
 %>
<html>
<!-- 
  - Author(s): wyy
  - Date: 2016-07-21 17:07:11
  - Description:
-->
<head>
	<title>添加流程提示信息</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
    <script src="../common/nui/nui.js" type="text/javascript"></script>
	<link rel="stylesheet" href="<%=contextPath%>/common/nui/resource/kindeditor/themes/default/default.css" />
	<link rel="stylesheet" href="<%=contextPath%>/common/nui/resource/kindeditor/plugins/code/prettify.css" />
	<script charset="utf-8" src="<%=contextPath%>/common/nui/resource/kindeditor/kindeditor-all-min.js"></script>
	<script charset="utf-8" src="<%=contextPath%>/common/nui/resource/kindeditor/lang/zh-CN.js"></script>
	<script charset="utf-8" src="<%=contextPath%>/common/nui/resource/kindeditor/plugins/code/prettify.js"></script>
	<script src="../common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
    </style>
</head>
<body>
<div class="nui-fit" style="border:solid 1px #aaa;padding:0px;width:auto">
<div style="padding-left:0px;padding-bottom:0px;width:auto">
	<form id="form1" method="post">
		<table style="width:auto">
			<tr>
				<td width="120px" align="right">流程定义名称：</td>
				<td align="left"><input name="AmeFlowOperTips.processdefname"  class="nui-combobox" id="processdefname" onvaluechanged="onActivitydefname(this.value)" url="com.primeton.eos.ame_common.processPrompt.queryProcessDefName.biz.ext" textField="processChName" valueField="processDefName" dataField = "processDefines"
					allowInput="true" style="width:200px;" emptyText="请选择流程定义名称" required="true"/></td>
				<td width="120px" align="right">活动定义名称：</td>
				<td align="left"><input name="AmeFlowOperTips.activitydefname" class="nui-combobox" id="activitydefname" textField="name" valueField="id" dataField = "wfActivityDefines"
					allowInput="true" style="width:200px;" emptyText="请选择活动定义名称" required="true"/></td>
			</tr>
			<tr>
				<td width="120px" align="left" colspan="4">流程提示信息：</td>
			</tr>
			<tr>
				<td align="left" colspan="4">
					<input name="AmeFlowOperTips.processinfo" id="processinfo" class="nui-hidden" required="true"/>
					<textarea  name="content1" style="width:780px;height:280px;visibility:hidden;"></textarea>
				</td>
			</tr>
			<tr>
				<td  width="120" align="left">提示是否可用:</td>
				<td align="left" colspan="3" width="520px"><input name="AmeFlowOperTips.prostatus" id="prostatus" class="nui-dictcombobox" required="true" dictTypeId="MIS_YN" style="width:50px;"/></td>
			</tr>
		</table>
	</form>
</div>
</div>
<div style="text-align:center;padding:10px;">               
    <a class="nui-button" onclick="onOk" style="width:60px;margin-right:20px;">确定</a>       
    <a class="nui-button" onclick="onCancel" style="width:60px;">关闭</a>       
</div> 
<script type="text/javascript">
nui.parse();
var form  = new nui.Form("#form1");
var editURL = "com.primeton.eos.ame_common.processPrompt.ameFlowOperTipsEdit.biz.ext";
var addURL = "com.primeton.eos.ame_common.processPrompt.ameFlowOperTipsAdd.biz.ext";
var saveURL = "";
function onActivitydefname(e){
	var json =  nui.encode({processDefName:e});
	nui.ajax({
            url: "com.primeton.eos.ame_common.processPrompt.queryActivityDefName.biz.ext",
			type: 'POST',
			data: json,	
			contentType: 'text/json',
            success: function (o) {
            	o.wfActivityDefines.splice(0,2);
            	nui.get("activitydefname").setData(o.wfActivityDefines);
            }
         });
}
function SetData(data){
    	data = nui.clone(data);
    	if(data.action == "edit"){
    		var json = nui.encode({AmeFlowOperTips:data});     			        		
        	nui.ajax({
        		url: "com.primeton.eos.ame_common.processPrompt.expandAmeFlowOperTips.biz.ext",
                data: json,
                type: 'POST',
                cache: false,
                contentType: 'text/json',
                success: function (o) {
                	<!-- 附件需要 v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v -->
                	//加载附件设置参数
             		//nui.get("grid_0").load({"groupid":"ameFeedback","relationid":o.ameFeedback.feedbackid});
                    <!-- 附件需要 ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ -->
                    form.setData(o);
                    nui.get("processdefname").setValue(o.AmeFlowOperTips.processdefname);
                    nui.get("processdefname").setText(o.AmeFlowOperTips.processDefName);
                    nui.get("activitydefname").setValue(o.AmeFlowOperTips.activitydefname);
                    nui.get("activitydefname").setText(o.AmeFlowOperTips.activityDefName);
                    editor1.html(o.AmeFlowOperTips.processinfo);
                    form.isChanged(false);	
                    saveURL=editURL;	 
                }
        	});
		}else{
			nui.get("prostatus").setValue(1);
			saveURL=addURL;
		}
	}
function onOk(){
	var text = editor1.html();
	if(text.length<=5000){
		nui.get("processinfo").setValue(text);
	    form = new nui.Form("#form1");
		if(form.validate()&&form.isValid()){ 
				var data  = form.getData();
				var json = nui.encode(data);
				nui.ajax({
		                    url: saveURL,
							type: 'POST',
							data: json,	
							contentType: 'text/json',
		                    success: function (o) {
		                    	CloseWindow("saveSuccess");
		                    }
		         });
		}else{
			return;
		}
	}else{
		alert("流程操作提示信息过长,请修改后重新提交!")
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
function onCancel(e) {
    	CloseWindow("cancel");
}
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
</script>
	
</body>
</html>