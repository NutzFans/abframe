<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false" %>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String contextPath=request.getContextPath();
 %>
<html>
<!-- 
  - Author(s): wenyy
  - Date: 2016-06-21 14:06:57
  - Description:
-->
<head>
<title>意见反馈</title>
    <title>反馈信息回复</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<script src="../common/nui/nui.js" type="text/javascript"></script>
	<link rel="stylesheet" href="<%=contextPath%>/common/nui/resource/kindeditor/themes/default/default.css" />
	<link rel="stylesheet" href="<%=contextPath%>/common/nui/resource/kindeditor/plugins/code/prettify.css" />
	<script charset="utf-8" src="<%=contextPath%>/common/nui/resource/kindeditor/kindeditor-all-min.js"></script>
	<script charset="utf-8" src="<%=contextPath%>/common/nui/resource/kindeditor/lang/zh-CN.js"></script>
	<script charset="utf-8" src="<%=contextPath%>/common/nui/resource/kindeditor/plugins/code/prettify.js"></script>
</head>
<body>

<div class="nui-fit" style="border:solid 1px #aaa;padding:0px">
<div style="position:relative"><a style="position:absolute;right:5px;top:9px;z-index:999;" href="<%= request.getContextPath()%>/ame_common/feedback/showMyFeedbackList.jsp">我的意见反馈</a></div>
      <form id="form1" method="post">
      	<input name="ameFeedback.fileids" id="fileids" class="nui-hidden" />
      	<input class="nui-hidden" name="ameFeedback.feedbackid" id="feedbackid"/>
      <fieldset id="field1" style="border:solid 1px #aaa;padding:3px;top:20px">
		<legend>填写反馈信息</legend>  
		  <input class="nui-hidden" name="ameFeedback.state" id="feedbackstate"/>
        <div style="padding-left:11px;padding-bottom:5px;">
            <table style="table-layout:fixed;">
                <tbody><tr>
                    <td align="right" width="120px">反馈类型：</td>
					<td><input name="ameFeedback.feedbacktype" id="ameFeedback.feedbacktype" class="mini-dictradiogroup" value="n" style="width:650px;" required="true" dictTypeId="AME_FEEDTYPE"/></td>
                </tr>
                <tr>
                	<td align="right" width="120px">反馈功能：</td>
					<td><input name="ameFeedback.functionname" id="functionname" class="nui-textbox" required="true" style="width:650px"/></td>
                </tr>
               <tr>
					<td align="right" width="120px">内容说明：</td>
					<td>
						<input name="ameFeedback.contentexplain" id="contentexplain" class="nui-hidden"/>
			   			<textarea id="ke" name="content1" style="width:100%;height:280px;visibility:hidden;"></textarea>
			   		</td>
				</tr>
            </tbody>
            </table>
        </div>
  	</fieldset>
  	</form>
  	<jsp:include page="/ame_common/addFiles.jsp"/>
	<%-- <jsp:include page="/ame_common/inputFile.jsp"/> --%>
</div>
<div style="text-align:center;padding:10px;">               
    <a class="nui-button" onclick="onOk" style="width:60px;margin-right:20px;">确定</a>       
    <a class="nui-button" onclick="onCancel" style="width:60px;">关闭</a>       
</div>  
</body>
<script type="text/javascript">
	nui.parse();
	function onOk(){
		 var filePaths = document.getElementsByName("uploadfile").length;
        	for(var j=0;j<filePaths;j++){
        		var a=document.getElementsByName("remarkList")[j].value;
        		if(a==null||a==""){
        			alert("新增附件不可以为空");
        			return false;
        		}
        	}
        document.getElementById("fileCatalog").value="ame_feedback";
        form2.submit();//nui.get("fileids").setValue(msg);  SaveData();
	}
	
	function SaveData(){
		var text = editor1.html();
		nui.get("contentexplain").setValue(text);
		nui.get("feedbackstate").setValue("0");
		var form  = new nui.Form("#form1");
		form.validate();
		var feedbacktype = nui.get("ameFeedback.feedbacktype").getValue();
		if(form.isValid()&&feedbacktype!='n'){
			var data  = form.getData();
			var json = nui.encode(data);
			nui.ajax({
	                    url: "com.primeton.eos.ame_common.ameFeedback.addFeedback.biz.ext",
						type: 'POST',
						data: json,	
						contentType: 'text/json',
	                    success: function (o) {
	                    	window.location.href="<%=request.getContextPath()%>/ame_common/feedback/showMyFeedbackList.jsp";
	                    }
	         });
		}else if(form.isValid()&&feedbacktype =='n'){
			alert("请选择反馈类型!");
		}else{
			return;
		}
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
 </script>
</html>