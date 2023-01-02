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
	<title>新增上线日志</title>
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
	        margin:0;padding:0;border:0;width:100%;height:100%;
	    }
    </style>
</head>
<body>
	<div id="form1" method="post">
		<input name="onlinelog.logid" id="logId" class="nui-hidden" />
		<fieldset style="border:solid 1px #aaa;padding:3px;">
			<legend >上线日志详情</legend>
			<div style="padding:5px;">
				<table style="width:100%;">
						<tr>
							<td align="right" style="width:100px;">操作人员:</td>
	                		<td style="width:120px;">    
	                    		<input name="onlinelog.operator" class="nui-textbox" required="true"/>
	                		</td>
	                		<td align="right">上线日期:</td>
	                		<td style="width:140px;">    
	                    		<input name="onlinelog.onlinedate" class="nui-datepicker" required="true"/>
	                		</td>
						</tr>
						<tr>
							<td align="right" style="width:100px;">上线开始时间:</td>
							<td style="width:120px;">   
								<input name="onlinelog.starttime" class="mini-timespinner" id="startdate" format="HH:mm" />
							</td>
							<td align="right" >上线结束时间:</td>
							<td style="width:140px;">   
								<input name="onlinelog.endtime" class="mini-timespinner" id="maxdatepicker" format="HH:mm" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width:100px;">上线类型:</td>
	                		<td style="width:120px;">    
	                    		<input name="onlinelog.onlinetype" class="nui-dictcombobox" dictTypeId="AME_ONLINETYPE" required="true"/>
	                		</td>
	                		<td align="right">是否重启:</td>
	                		<td style="width:140px;">    
	                    		<input name="onlinelog.restart" class="nui-dictcombobox"  dictTypeId="ABF_YESORNO" required="true"/>
	                		</td>
						</tr>
						<tr>
							<td align="right" style="width:100px;">版本:</td>
	                		<td style="width:120px;">    
	                    		<input name="onlinelog.version" class="nui-textbox"/>
	                		</td>
						</tr>
						<tr>
							<td align="right" >上线内容概述:</td>
	                		<td  style="width:200px	;" colspan="3">    
	                    		<input name="onlinelog.onlinecontent" style="width:590px"  class="nui-textarea"/>
	                		</td>
						</tr>
						<tr>
							<td align="left" width="90px">上线内容说明：</td>
					   </tr>
					   <tr>
					   		<td colspan="4">
					   			<input name="onlinelog.onlinecontentdetail" id="onlinecontentdetail" class="nui-hidden"/>
					   			<textarea id="ke" name="content1" style="width:100%;height:200px;visibility:hidden;"></textarea>
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
	    	
	    	var saveURL = "com.primeton.eos.ame_common.onlineLog.addOnlineLog.biz.ext";
	    	var form = new nui.Form("form1");
	    	
	    	function SetData() {
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
	    		var text = editor1.html();
				nui.get("onlinecontentdetail").setValue(text);
	    		
	    		var o = form.getData();
	    		form.validate();
	    		if(form.validate()){
		    		var startdate = nui.get("startdate").getValue();
		    		o.onlinelog.starttime = nui.formatDate(nui.parseDate(startdate),"HH:mm");
		    		var maxdatepicker = nui.get("maxdatepicker").getValue();
		    		o.onlinelog.endtime = nui.formatDate(nui.parseDate(maxdatepicker),"HH:mm");
		    		if(startdate>maxdatepicker){
		    			alert("上线时间段设置有误！");
		    			return;
		    		}
		    		
		    		var date =new Date();
		    		o.onlinelog.operatetime=nui.formatDate(nui.parseDate(date),"yyyy-MM-dd HH:mm:ss");
		    		var json = nui.encode(o);
		    		
		    		nui.ajax({
		    			url: saveURL,
		    			data: json,
		    			type: 'POST',
		    			cache: false,
		    			contentType: 'text/json',
		    			success: function(text){
		    				alert("增加成功");
		    				CloseWindow("save");
		    			},
		    			error: function(jqXHR, textStatus, errorThrown){
		    				alert(jqXHR.responseText);
		    				CloseWindow();
		    			}
		    		});
		    	}else{
		    		return;
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