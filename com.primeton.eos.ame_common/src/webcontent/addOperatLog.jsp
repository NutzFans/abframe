<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page pageEncoding="UTF-8"%>
<%@include file="/common/common.jsp"%>
<%@include file="/common/skins/skin0/component.jsp" %>
<%
	String contextPath=request.getContextPath();
 %>
<html>
<!-- 
  - Author(s): jisx
  - Date: 2017-05-25 11:41:55
  - Description:
-->
<head>
	<title>新增业务日志</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
   	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/common/nui/resource/kindeditor/themes/default/default.css" />
	<link rel="stylesheet" href="<%=request.getContextPath()%>/common/nui/resource/kindeditor/plugins/code/prettify.css" />
	<script charset="utf-8" src="<%=request.getContextPath()%>/common/nui/resource/kindeditor/kindeditor-all-min.js"></script>
	<script charset="utf-8" src="<%=request.getContextPath()%>/common/nui/resource/kindeditor/lang/zh-CN.js"></script>
	<script charset="utf-8" src="<%=request.getContextPath() %>/common/nui/resource/kindeditor/plugins/code/prettify.js"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;
	    }
    </style>
</head>
<body>
	<div id="form1" method="post">
		<input name="log.groupId" id="groupId" class="nui-hidden" />
		<input name="log.relationId" id="relationId" class="nui-hidden" />
			<div style="padding:5px;">
				<table style="width:100%;">
					   <tr>
							<td align="left" width="90px">内容：</td>
					   </tr>
					   <tr>
				   		<td >
				   			<input name="log.loginfo" id="loginfo" class="nui-hidden"/>
				   			<textarea id="ke" name="content1" style="width:100%;height:200px;visibility:hidden;"></textarea>
				   		</td>
				   	</tr>
				   	<tr>
				   		<td >
						<span class="word_surplus"></span>
				   		</td>
				   	</tr>
					</table>
				</div>
			<div style="text-align:center;padding:10px;">               
	            <a class="nui-button" onclick="onOk" style="width:60px;margin-right:20px;" id="sure">确定</a>       
	            <a class="nui-button" onclick="onCancel('cancel')" style="width:60px;" id="cancel">取消</a>       
	        </div>
	</div>	
	
		<script type="text/javascript">
			nui.parse();
	    	var relationid = <%=request.getParameter("relationid")%>;
	    	var groupid = '<%=request.getParameter("groupid")%>';
	    	if(relationid ==null || relationid ==''){}else{nui.get("relationId").setValue(relationid);}
	    	if(groupid ==null || groupid ==''){}else{nui.get("groupId").setValue(groupid);}
	    	
	    	var saveURL = "com.primeton.eos.ame_common.operatLog.addlog.biz.ext";
	    	
	    	var form = new nui.Form("form1");
	    	
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
	    	
	    	function SetData(){
	    	}
	    	
	    	
	    	function save(){
	    		var text = editor1.html();
				nui.get("loginfo").setValue(text);
	    		var o = form.getData();
	    		var json = nui.encode({"logs":o.log});
	    		nui.get("sure").disable();
	    		nui.ajax({
	    			url: saveURL,
	    			data: json,
	    			type: 'POST',
	    			cache: false,
	    			contentType: 'text/json',
	    			success: function(text){
	    				if(text.result=='1'){
	    					CloseWindow("save");
	    					alert("增加成功");
	    				}else{
	    					nui.get("sure").enable();
	    					alert("增加失败");
	    				}
	    			},
	    			error: function(jqXHR, textStatus, errorThrown){
	    				alert(jqXHR.responseText);
	    				CloseWindow();
	    			}
	    		});
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
				},
				 afterChange : function() {
			     $('.word_count1').html(this.count()); //字数统计包含HTML代码
			     $('.word_count2').html(this.count('text'));  //字数统计包含纯文本、IMG、EMBED，不包含换行符，IMG和EMBED算一个文字
			     var a = this.count();
		         var a1 = this.count('text');
			     var limitNum = 2048;  //设定限制字数
			     var pattern = "您当前输入了<span style='color:red'>"+a1+"</span>个文字（<span style='color:red'>"+a+"</span>个字符），大约还可以输入<span style='color:red'>"+limitNum+"</span>字。（字数统计包含纯文本、HTML代码）"; 
			     $('.word_surplus').html(pattern); //输入显示
			     //alert(this.count('text'));
			     //alert(this.count('text') > limitNum);
			     if(a > limitNum) {
			      pattern = ('字数超过限制，请适当删除部分内容');
			      //超过字数限制自动截取
			      var strValue = editor1.text();
			      strValue = strValue.substring(0,limitNum);
			      editor1.text(strValue);      
			     } else {
			      //计算剩余字数
			      var result = limitNum - this.count(); 
			      pattern = "您当前输入了<span style='color:red'>"+a1+"</span>个文字（<span style='color:red'>"+a+"</span>个字符），大约还可以输入<span style='color:red'>"+result+"</span>字。（字数统计包含纯文本、HTML代码）"; 
			      }
			      $('.word_surplus').html(pattern); //输入显示
			     ////////
	    		} 
			});
			prettyPrint();
		});
	    </script>
</body>
</html>